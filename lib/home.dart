import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _numberController = TextEditingController();

  List<String> names = [];
  List<String> numbers = [];

  void _addNumber() {
    setState(() {
      if (_nameController.text.isNotEmpty &&
          _numberController.text.isNotEmpty) {

        names.add(_nameController.text);
        numbers.add(_numberController.text);
        _nameController.clear();
        _numberController.clear();

      } else {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text("Please enter both name and number."),
        ));
      }
    });
  }

  void _removeNumber(int index) {
    setState(() {
      names.removeAt(index);
      numbers.removeAt(index);
    });
  }

  void _popUp(int index) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Confirm Delete"),
          content: Text("Are you sure you want to delete this contact?"),
          actions: <Widget>[
            IconButton(
                onPressed: () => Navigator.of(context).pop(),
                icon: Icon(Icons.cancel)),
            IconButton(
                onPressed: () {
                  _removeNumber(index);
                  Navigator.of(context).pop();
                },
                icon: Icon(Icons.delete)),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Contact List"),
        backgroundColor: Colors.blueGrey,
        foregroundColor: Colors.white,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [

            //name input
            TextField(
              controller: _nameController,
              decoration: const InputDecoration(
                labelText: "Name: ",
                hintText: "Enter a name: ",
                helperText: "Please enter a name ",
                border: OutlineInputBorder(),
              ),
            ),
            //space
            SizedBox(
                height: 10),
            //number input
            TextField(
              keyboardType: TextInputType.phone,
              controller: _numberController,
              decoration: const InputDecoration(
                labelText: "Number: ",
                hintText: "Enter a number: ",
                helperText: "Please enter a number ",
                border: OutlineInputBorder(),
              ),
            ),
            //space
            SizedBox(
                height: 20),
            //button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blueGrey,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
                onPressed: _addNumber,
                child: const Text("Add"),
              ),
            ),
            //space
            SizedBox(
                height: 20),
            //View
            Expanded(
              child: ListView.builder(
                itemCount: names.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: InkWell(

                      onLongPress: () => _popUp(
                          index),
                      child: ListTile(
                          leading: Icon(Icons.person),
                          title: Text(names[index]),
                          subtitle: Text(numbers[index]),
                          trailing: Icon(Icons.call)),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
