part of 'package:discount/utils/imports.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Future<void> createData() async {
    QuickeyDB.getInstance!<CustomersSchema>()!.create(
      Customers(
          id: 1, fname: '', lname: '', company: '', created_at: DateTime.now()),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    createData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
            hexStringToColor("CB2B93"),
            hexStringToColor("9546C4"),
            hexStringToColor("5E61F4"),
          ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.fromLTRB(
                210, MediaQuery.of(context).size.height * 0.2, 80, 490),
            child: Column(
              children: <Widget>[
                ElevatedButton(
                  onPressed: () {
                    FirebaseAuth.instance.signOut().then((value) {
                      print("Signed Out");
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SignInScreen(),
                          ));
                    });
                  },
                  child: const Text("Logoutt"),
                ),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => CustomersList(),
                          ));
                    },
                    child: const Text("Customers"))
              ],
            ),
          ),
        ),
      ),
    );
  }
}


// return Scaffold(
//         body: Center(
//       child: ElevatedButton(
//         child: Text("Logout"),
//         onPressed: () {
//           FirebaseAuth.instance.signOut().then((value) {
//             print("Signed Out");
//             Navigator.push(context,
//                 MaterialPageRoute(builder: (context) => SignInScreen()));
//           });
//         },
//       ),
//     ));