part of 'package:discount/utils/imports.dart';

class CustomersModel {
  int? id;
  String? name;
  String? email;
  String? company;
  String? status;
  DateTime? created_at;

  CustomersModel({
    this.id,
    this.name,
    this.email,
    this.company,
    this.status,
    this.created_at,
  });

  Map<String, dynamic> toMap() => {
        'id': id,
        'name': name,
        'email': email,
        'company': company,
        'status': status,
        'created_at': created_at,
      };

  Map<String, dynamic> toTableMap() => {
        'id': id,
        'name': name,
        'email': email,
        'company': company,
        'status': status,
        'created_at': created_at,
      };

  CustomersModel.fromMap(Map<String?, dynamic> map)
      : id = map['id'],
        name = map['name'],
        email = map['email'],
        company = map['company'],
        status = map['status'],
        created_at = map['created_at'];
}

class CustomerSchema extends DataAccessObject<CustomersModel> {
  CustomerSchema()
      : super(
          '''
          CREATE TABLE customers (
            id              INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
            name            TEXT NOT NULL,
            email           TEXT NOT NULL,
            company         TEXT NOT NULL,
            status          TEXT NOT NULL,
            created_at      datetime
          )
          ''',
          converter: Converter(
            encode: (customer) => CustomersModel.fromMap(customer),
            decode: (customer) => customer!.toMap(),
            decodeTable: (customer) => customer!.toTableMap(),
          ),
        );
}
