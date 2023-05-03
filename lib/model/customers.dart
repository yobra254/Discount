import 'package:quickeydb/configs/converter.dart';
import 'package:quickeydb/configs/data_access_object.dart';
//import 'package:quickeydb/quickeydb.dart';

class Customers {
  int? id;
  String? fname;
  String? lname;
  //String? email;
  String? company;
  //String? status;
  DateTime? created_at;

  Customers({
    this.id,
    this.fname,
    this.lname,
    //this.email,
    this.company,
    // this.status,
    this.created_at,
  });

  Map<String, dynamic> toMap() => {
        'id': id,
        'fname': fname,
        'lname': lname,
        // 'email': email,
        'company': company,
        // 'status': status,
        'created_at': created_at,
      };

  Map<String, dynamic> toTableMap() => {
        'id': id,
        'fname': fname,
        'lname': lname,
        // 'email': email,
        'company': company,
        // 'status': status,
        'created_at': created_at,
      };

  Customers.fromMap(Map<String?, dynamic> map)
      : id = map['id'],
        fname = map['fname'],
        lname = map['lname'],
        // email = map['email'],
        company = map['company'],
        // status = map['status'],
        created_at = map['created_at'];
}

class CustomersSchema extends DataAccessObject<Customers> {
  CustomersSchema()
      : super(
          '''
          CREATE TABLE customers (
            id              INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
            fname            TEXT NOT NULL,
            lname            TEXT NOT NULL,
            company          TEXT NOT NULL,
            created_at      datetime,
          )
          ''',
          converter: Converter(
            encode: (customer) => Customers.fromMap(customer),
            decode: (customer) => customer!.toMap(),
            decodeTable: (customer) => customer!.toTableMap(),
          ),
        );
}

//Discount

class Discounts {
  int? id;
  String? product;
  double? unitPrice;
  double? discount;
  DateTime? created_at;

  Discounts({
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

  Discounts.fromMap(Map<String?, dynamic> map)
      : id = map['id'],
        product = map['product'],
        unitPrice = map['unitPrice'],
        discount = map['discount'],
        created_at = map['created_at'];
}

class DiscountsSchema extends DataAccessObject<Discounts> {
  DiscountsSchema()
      : super(
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
            encode: (discount) => Discounts.fromMap(discount),
            decode: (discount) => discount!.toMap(),
            decodeTable: (discount) => discount!.toTableMap(),
          ),
        );
}
