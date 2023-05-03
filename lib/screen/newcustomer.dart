part of 'package:discount/utils/imports.dart';

class NewCustomer extends StatefulWidget {
  const NewCustomer({super.key});

  @override
  State<NewCustomer> createState() => _NewCustomerState();
}

class _NewCustomerState extends State<NewCustomer> {
  String? fname, lname, company;

  Future<void> createData(String fname, String lname, String company, DateTime createdAt) async {
    QuickeyDB.getInstance!<CustomersSchema>()!.create(
      Customers(
        id: 1,
        fname: '',
        lname: '',
        company: '',
        created_at: DateTime.now(),
      ),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
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
                decoration: const InputDecoration(hintText: "Enter Customer Company"),
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
                  createData("", "", "", DateTime.now());
                },
                child: const Text("Save"))
          ],
        )),
      ),
    );
  }
}
