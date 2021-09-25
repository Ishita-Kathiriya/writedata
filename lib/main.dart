import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root
  // of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AddData(),
    );
  }
}

class AddData extends StatelessWidget {
  TextEditingController name = new TextEditingController();
  TextEditingController city = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlue,
        title: Text("demo"),
      ),
      body:Container(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Center(
            child: Column(
            children: [
              TextFormField(
                controller: name,
                decoration: InputDecoration(
                hintText: "Enter name",
                labelText: 'Name',
                 ),
              ),
              SizedBox(
                height: 10.0,
              ),
              TextFormField(
                controller: city,
                decoration: InputDecoration(
                  hintText: "Enter City",
                  labelText: 'City',
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              FlatButton(
                onPressed: (){
                    Map<String, dynamic> data= {"name": name.text,"city": city.text};
                    FirebaseFirestore.instance.collection("test").add(data);
              },
                  child: Text("Submit"),
              color: Colors.lightBlue,
              ),
            ],
            ),
     ),
        ),
      ),
    );
  }
}