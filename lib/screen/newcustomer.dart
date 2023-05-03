import 'package:discount/model/customers.dart';
import 'package:flutter/material.dart';
import 'package:discount/utils/imports.dart';
import 'package:quickeydb/quickeydb.dart';
import 'package:discount/screen/home_screen.dart';

class NewCustomer extends StatefulWidget {
  const NewCustomer({super.key});

  @override
  State<NewCustomer> createState() => _NewCustomerState();
}

class _NewCustomerState extends State<NewCustomer> {
  String? fname, lname, company;
  //int? hours;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("New Customer"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Form(
            child: Column(
          children: <Widget>[
            TextFormField(
                decoration: const InputDecoration(hintText: "Enter First Name"),
                onChanged: (String value) {
                  setState(() {
                    fname = value;
                  });
                }),
            const SizedBox(
              height: 20,
            ),
            TextFormField(
                decoration: const InputDecoration(hintText: "Enter Last Name"),
                onChanged: (String value) {
                  setState(() {
                    lname = value;
                  });
                }),
            const SizedBox(
              height: 20,
            ),
            TextFormField(
                decoration:
                    const InputDecoration(hintText: "Enter Customer Company"),
                onChanged: (String value) {
                  setState(() {
                    company = value;
                  });
                }),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: () {
                  createData();
                },
                child: const Text("Save"))
          ],
        )),
      ),
    );
  }
}
