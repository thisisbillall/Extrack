import './transactions.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';

void main() => runApp(myApp());
final List<transactions> transactionLists = [
  transactions('t1', 'Shoes', 5000, DateTime.now()),
  transactions('t2', 't-shirts', 500, DateTime.now()),
  transactions('t3', 'Watch', 1500, DateTime.now()),
  // transactions('t4', 'Glasses', 800, DateTime.now()),
  // transactions('t5', 'Potatoes', 100, DateTime.now()),
];
final titleController = TextEditingController();
final priceController = TextEditingController();

class myApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Extrack",
      home: Scaffold(
        appBar: AppBar(
          title: Text("Extrack"),
        ),
        body: Column(
          children: [
            Container(
              width: double.infinity,
              child: Card(
                color: Colors.deepOrangeAccent,
                child: Text("CHART"),
                elevation: 7,
              ),
            ),
            Card(
              child: Container(
                padding: EdgeInsets.all(15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    TextField(
                      decoration: InputDecoration(labelText: 'Title'),
                      controller: titleController,
                    ),
                    TextField(
                      decoration: InputDecoration(labelText: 'Price'),
                      controller: priceController,
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(0, 15, 0, 0),
                      child: OutlineButton(
                        child: Text("Add"),
                        onPressed: () {
                          print(titleController.text);
                          print(priceController.text);
                        },
                        textColor: Colors.purple,
                        borderSide: BorderSide(color: Colors.purple),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Column(
              children: transactionLists.map((e) {
                return Card(
                  child: Row(
                    children: [
                      Container(
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(width: 2, color: Colors.purple),
                        ),
                        margin:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                        child: Text(
                          '\???${e.amount}',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Colors.purple),
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            e.title,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                color: Colors.black),
                          ),
                          Text(DateFormat.yMMMd().format(e.date),
                              style: TextStyle(color: Colors.grey)),
                        ],
                      )
                    ],
                  ),
                );
              }).toList(),
            )
          ],
        ),
      ),
    );
  }
}
