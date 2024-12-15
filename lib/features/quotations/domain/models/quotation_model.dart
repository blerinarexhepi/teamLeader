import 'dart:convert';

import 'package:teamleader/features/quotations/domain/domain.dart';

class QuotationModel {
  QuotationModel({
    this.id,
    this.title,
    this.images,
    this.customer,
    this.lineItems,
    this.totalPrice,
  });

  final int? id;
  final String? title;
  final double? totalPrice;
  final List<String>? images;
  final CustomerModel? customer;
  final List<LineItemModel>? lineItems;

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'images': images,
      'total_price': totalPrice,
      'customer': customer?.toMap(),
      'title': title,
      'lineItems': lineItems?.map((x) => x.toMap()).toList(),
    };
  }

  factory QuotationModel.fromMap(Map<String, dynamic> map) {
    return QuotationModel(
      id: map['id'] != null ? map['id'] as int : null,
      images: map['images'] != null
          ? List<String>.from((map['images'] as List<String>))
          : null,
      customer: map['customer'] != null
          ? CustomerModel.fromMap(map['customer'] as Map<String, dynamic>)
          : null,
      totalPrice:
          map['total_price'] != null ? map['total_price'] as double : null,
      title: map['title'] != null ? map['title'] as String : null,
      lineItems: map['lineItems'] != null
          ? mapLineItemsFromList(map['lineItems'])
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory QuotationModel.fromJson(String source) =>
      QuotationModel.fromMap(json.decode(source) as Map<String, dynamic>);
}

List<QuotationModel> mapQuotationFromList(List<dynamic> data) {
  List<QuotationModel> list = [];

  for (final element in data) {
    list.add(QuotationModel.fromMap(element));
  }

  return list;
}

//Mock Data

class QuotationsExample {
  List<QuotationModel> quotations = [
    QuotationModel(
      customer: CustomerModel(
        vatNr: 124333422,
        email: 'test@gmail.com',
        company: 'Test',
        companyAddress: 'Prishtina',
      ),
      title: 'Test Project',
      lineItems: [LineItemModel(title: 'title', price: 2000.0, quantity: 2)],
      totalPrice: 4000,
      images: [],
    ),
    QuotationModel(
      customer: CustomerModel(
        vatNr: 124333422,
        email: 'john.doe@company.com',
        company: 'Doe Enterprises',
        companyAddress: '123 Main Street, New York, NY 10001',
      ),
      title: 'Website Redesign for Doe Enterprises',
      lineItems: [
        LineItemModel(title: 'Website Design', price: 3500.0, quantity: 1),
        LineItemModel(title: 'SEO Optimization', price: 800.0, quantity: 1),
        LineItemModel(title: 'Content Creation', price: 1200.0, quantity: 5),
      ],
      totalPrice: 9500.0,
      images: [],
    ),
    QuotationModel(
      customer: CustomerModel(
        vatNr: 987654321,
        email: 'support@techsols.com',
        company: 'Tech Solutions Inc.',
        companyAddress: '45 Tech Avenue, San Francisco, CA 94107',
      ),
      title: 'Cloud Hosting and Migration Services',
      lineItems: [
        LineItemModel(
            title: 'Cloud Hosting (1 Year)', price: 1500.0, quantity: 1),
        LineItemModel(title: 'Data Migration', price: 2000.0, quantity: 1),
        LineItemModel(
            title: '24/7 Support (1 Year)', price: 1200.0, quantity: 1),
      ],
      totalPrice: 4700.0,
      images: [],
    ),
    // QuotationModel(
    //   customer: CustomerModel(
    //     VATNr: 112233445,
    //     email: 'info@buildco.com',
    //     company: 'BuildCo Construction',
    //     companyAddress: '78 Construction Blvd, Los Angeles, CA 90021',
    //   ),
    //   quotationInfo: QuotationInfoModel(
    //     title: 'Office Building Renovation',
    //     lineItems: [
    //       LineItemModel(title: 'Demolition Work', price: 8000.0, quantity: 1),
    //       LineItemModel(
    //           title: 'Plumbing Installation', price: 5000.0, quantity: 1),
    //       LineItemModel(
    //           title: 'Electrical Systems Upgrade', price: 4000.0, quantity: 1),
    //       LineItemModel(title: 'Interior Design', price: 6000.0, quantity: 1),
    //     ],
    //   ),
    //   totalPrice: 23000.0,
    //   images: [],
    // ),
    // QuotationModel(
    //   customer: CustomerModel(
    //     VATNr: 556677889,
    //     email: 'marketing@fashionhub.com',
    //     company: 'FashionHub',
    //     companyAddress: '101 Fashion Street, Paris, France 75001',
    //   ),
    //   quotationInfo: QuotationInfoModel(
    //     title: 'E-commerce Website Development',
    //     lineItems: [
    //       LineItemModel(
    //           title: 'E-commerce Platform Setup', price: 4000.0, quantity: 1),
    //       LineItemModel(
    //           title: 'Product Photography', price: 1500.0, quantity: 1),
    //       LineItemModel(
    //           title: 'Payment Gateway Integration', price: 800.0, quantity: 1),
    //       LineItemModel(
    //           title: 'Mobile App Development', price: 5000.0, quantity: 1),
    //     ],
    //   ),
    //   totalPrice: 11300.0,
    //   images: [],
    // ),
    // QuotationModel(
    //   customer: CustomerModel(
    //     VATNr: 998877665,
    //     email: 'sales@greenenergy.com',
    //     company: 'Green Energy Solutions',
    //     companyAddress: '9 Eco Park Road, Toronto, Canada M5B 2H1',
    //   ),
    //   quotationInfo: QuotationInfoModel(
    //     title: 'Solar Panel Installation',
    //     lineItems: [
    //       LineItemModel(
    //           title: 'Solar Panel Setup (10 Panels)',
    //           price: 12000.0,
    //           quantity: 1),
    //       LineItemModel(
    //           title: 'Battery Storage System', price: 5000.0, quantity: 1),
    //       LineItemModel(
    //           title: 'Installation Labor', price: 2500.0, quantity: 1),
    //       LineItemModel(
    //           title: 'System Maintenance (1 Year)', price: 1200.0, quantity: 1),
    //     ],
    //   ),
    //   totalPrice: 20700.0,
    //   images: [],
    // ),
    // QuotationModel(
    //   customer: CustomerModel(
    //     VATNr: 223344556,
    //     email: 'contact@retailgenius.com',
    //     company: 'Retail Genius Ltd.',
    //     companyAddress: '55 Market Street, London, UK EC1A 1BB',
    //   ),
    //   quotationInfo: QuotationInfoModel(
    //     title: 'POS System Installation and Training',
    //     lineItems: [
    //       LineItemModel(
    //           title: 'POS Hardware (5 Units)', price: 1500.0, quantity: 5),
    //       LineItemModel(
    //           title: 'Software License (1 Year)', price: 3000.0, quantity: 1),
    //       LineItemModel(title: 'On-Site Training', price: 1000.0, quantity: 1),
    //       LineItemModel(
    //           title: 'System Setup and Configuration',
    //           price: 1200.0,
    //           quantity: 1),
    //     ],
    //   ),
    //   totalPrice: 12000.0,
    //   images: [],
    // ),
    // QuotationModel(
    //   customer: CustomerModel(
    //     VATNr: 667788990,
    //     email: 'info@financemaster.com',
    //     company: 'FinanceMaster LLC',
    //     companyAddress: '180 Wall Street, New York, NY 10005',
    //   ),
    //   quotationInfo: QuotationInfoModel(
    //     title: 'Accounting Software Implementation',
    //     lineItems: [
    //       LineItemModel(title: 'Software Setup', price: 3000.0, quantity: 1),
    //       LineItemModel(title: 'Data Import', price: 1000.0, quantity: 1),
    //       LineItemModel(
    //           title: 'Training and Support (3 Months)',
    //           price: 1500.0,
    //           quantity: 1),
    //     ],
    //   ),
    //   totalPrice: 5500.0,
    //   images: [],
    // ),
    // QuotationModel(
    //   customer: CustomerModel(
    //     VATNr: 778899112,
    //     email: 'services@avionicscorp.com',
    //     company: 'Avionics Corporation',
    //     companyAddress: '500 Aviation Parkway, Seattle, WA 98188',
    //   ),
    //   quotationInfo: QuotationInfoModel(
    //     title: 'Aircraft Maintenance Services',
    //     lineItems: [
    //       LineItemModel(
    //           title: 'Routine Inspection', price: 3500.0, quantity: 1),
    //       LineItemModel(title: 'Parts Replacement', price: 2000.0, quantity: 2),
    //       LineItemModel(title: 'Engine Overhaul', price: 8000.0, quantity: 1),
    //     ],
    //   ),
    //   totalPrice: 16500.0,
    //   images: [],
    // ),
  ];
}
