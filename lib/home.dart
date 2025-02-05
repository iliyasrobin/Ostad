import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Employee"),
        centerTitle: true,
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Text("Add Employee"),
            TextFormField(
              decoration: InputDecoration(
                border: UnderlineInputBorder(),
                hintText: "Name",

              ),
            ),
            TextFormField(
              decoration: InputDecoration(
                border: UnderlineInputBorder(),
                hintText: "Age",

              ),
            ),
            TextFormField(
              decoration: InputDecoration(
                border: UnderlineInputBorder(),
                hintText: "Salary",

              ),
            ),
            SizedBox(height: 20,),
            ElevatedButton(onPressed: (){}, child: Text("Add Employee")),
          ],
        ),
      ),
    );
  }
}
