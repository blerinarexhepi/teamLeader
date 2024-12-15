import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:teamleader/features/quotations/domain/models/models.dart';

class DatabaseService {
  static Database? db;
  static final DatabaseService instance = DatabaseService._constructer();

  DatabaseService._constructer();

  Future<Database> get database async {
    if (db != null) return db!;

    db = await getDatabase();

    return db!;
  }

  Future<Database> getDatabase() async {
    final databaseDirPath = await getDatabasesPath();
    final databasePath = join(databaseDirPath, "quotation_db.db");

    final database = await openDatabase(
      databasePath,
      version: 1,
      onCreate: (db, version) {
        db.execute('''
          CREATE TABLE Customer (
              vat_nr INTEGER PRIMARY KEY,
              email TEXT NOT NULL,
              company TEXT NOT NULL,
              company_address TEXT NOT NULL
          );
           ''');
        db.execute('''
          CREATE TABLE Quotation (
              id INTEGER PRIMARY KEY AUTOINCREMENT,
              total_price REAL,
              customer_vat_nr INTEGER,
              title TEXT,
              FOREIGN KEY (customer_vat_nr) REFERENCES Customer(vat_nr)
          );''');
        db.execute('''
          CREATE TABLE LineItem (
              id INTEGER PRIMARY KEY AUTOINCREMENT,
              quotation_id INTEGER NOT NULL,
              title TEXT,
              price REAL,
              quantity INTEGER,
              total_price REAL,
              FOREIGN KEY (quotation_id) REFERENCES Quotation(id)
          );
''');
        db.execute('''
          CREATE TABLE QuotationImages (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            quotation_id INTEGER NOT NULL,
            image_path TEXT NOT NULL,
            FOREIGN KEY (quotation_id) REFERENCES Quotation(id)
          );
        ''');
      },
    );

    return database;
  }

  Future<List<QuotationModel>?> getQuotations() async {
    final db = await database;
    final customers = await db.query('Customer');
    final quotations = await db.query('Quotation');

    final customerMap = {
      for (var customer in customers)
        customer['vat_nr']: CustomerModel.fromMap(customer)
    };

    final quotationModels = quotations.map((quotation) {
      final customerVatNr = quotation['customer_vat_nr'];
      final associatedCustomer = customerMap[customerVatNr];

      return QuotationModel(
        id: quotation['id'] as int?,
        customer: associatedCustomer,
        title: quotation['title'] as String?,
        totalPrice: quotation['total_price'] as double?,
      );
    }).toList();

    return quotationModels;
  }

  Future<QuotationModel> getQuotation({required int id, required vatNr}) async {
    final db = await database;
    final quotation =
        await db.query('Quotation', where: 'id = ?', whereArgs: [id]);
    final customerQuery =
        await db.query('Customer', where: 'vat_nr = ?', whereArgs: [vatNr]);
    final lineItemsQuery =
        await db.query('LineItem', where: 'quotation_id = ?', whereArgs: [id]);
    final imagesQuery = await db
        .query('QuotationImages', where: 'quotation_id = ?', whereArgs: [id]);

    final customer = customerQuery.isNotEmpty
        ? CustomerModel.fromMap(customerQuery.first)
        : null;

    final lineItems = lineItemsQuery
        .map((lineItem) => LineItemModel.fromMap(lineItem))
        .toList();

    final images =
        imagesQuery.map((image) => image['image_path'] as String).toList();

    final responseDecoded = QuotationModel(
      id: quotation.first['id'] as int?,
      title: quotation.first['title'] as String?,
      totalPrice: quotation.first['total_price'] as double?,
      images: images,
      customer: customer,
      lineItems: lineItems,
    );

    return responseDecoded;
  }

  Future<void> deleteDatabaseFile() async {
    await deleteDatabase('quotation_db.db');
  }

  Future<void> addQuotation({required QuotationModel quotation}) async {
    final db = await database;
    try {
      await db.transaction((txn) async {
        final batch = txn.batch();

        await txn.insert(
          'Customer',
          quotation.customer!.toMap(),
          conflictAlgorithm: ConflictAlgorithm.replace,
        );

        final quotationId = await txn.insert(
          'Quotation',
          {
            'total_price': quotation.totalPrice,
            'customer_vat_nr': quotation.customer?.vatNr,
            'title': quotation.title,
          },
          conflictAlgorithm: ConflictAlgorithm.replace,
        );

        for (final item in quotation.lineItems!) {
          batch.insert(
            'LineItem',
            {
              'quotation_id': quotationId,
              'title': item.title,
              'price': item.price,
              'quantity': item.quantity,
              'total_price': item.totalPrice,
            },
            conflictAlgorithm: ConflictAlgorithm.replace,
          );
        }

        for (final image in quotation.images!) {
          batch.insert(
            'QuotationImages',
            {
              'quotation_id': quotationId,
              'image_path': image,
            },
            conflictAlgorithm: ConflictAlgorithm.replace,
          );
        }
        await batch.commit();
      });
    } catch (e) {
      print('Error adding quotation: $e');
    }
  }
}
