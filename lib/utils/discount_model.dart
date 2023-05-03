part of 'package:discount/utils/imports.dart';

class DiscountModel {
  int? id;
  String? product;
  double? unitPrice;
  double? discount;
  DateTime? created_at;

  DiscountModel({
    this.id,
    this.product,
    this.unitPrice,
    this.discount,
    this.created_at,
  });

  Map<String, dynamic> toMap() => {
    'id': id,
    'name': product,
    'email': unitPrice,
    'company': discount,
    'created_at': created_at,
  };

  Map<String, dynamic> toTableMap() => {
    'id': id,
    'name': product,
    'email': unitPrice,
    'company': discount,
    'created_at': created_at,
  };

  DiscountModel.fromMap(Map<String?, dynamic> map)
      : id = map['id'],
        product = map['product'],
        unitPrice = map['unitPrice'],
        discount = map['discount'],
        created_at = map['created_at'];
}

class DiscountSchema extends DataAccessObject<DiscountModel>{
  DiscountSchema(): super(
    '''
          CREATE TABLE discounts (
            id              INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
            product         TEXT NOT NULL,
            unitPrice       REAL     default '0',
            discount        REAL     default '0',
            created_at      datetime,
          )
          ''',
    converter: Converter(
      encode: (discount) => DiscountModel.fromMap(discount),
      decode: (discount) => discount!.toMap(),
      decodeTable: (discount) => discount!.toTableMap(),
    ),
  );
}