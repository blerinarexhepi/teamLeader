import 'dart:convert';

class LineItemModel {
  LineItemModel({
    this.title,
    this.price,
    this.quantity,
    this.totalPrice,
  });

  final String? title;
  final double? price;
  final int? quantity;
  final double? totalPrice;

  factory LineItemModel.fromJson(String source) =>
      LineItemModel.fromMap(json.decode(source) as Map<String, dynamic>);

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': title,
      'price': price,
      'quantity': quantity,
      'total_price': totalPrice,
    };
  }

  factory LineItemModel.fromMap(Map<String, dynamic> map) {
    return LineItemModel(
      title: map['title'] != null ? map['title'] as String : null,
      price: map['price'] != null ? map['price'] as double : null,
      quantity: map['quantity'] != null ? map['quantity'] as int : null,
      totalPrice:
          map['total_price'] != null ? map['total_price'] as double : null,
    );
  }

  // double get totalPricee => price! * quantity!;

  String toJson() => json.encode(toMap());
}

List<LineItemModel> mapLineItemsFromList(List<dynamic> data) {
  List<LineItemModel> list = [];

  for (final element in data) {
    list.add(LineItemModel.fromMap(element));
  }

  return list;
}
