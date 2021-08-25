import 'package:flutter/cupertino.dart';

//Class File to store transactin objects

class transactions {
  final String id;
  final String title;
  final double amount;
  final DateTime date;

  transactions(@required this.id, @required this.title, @required this.amount,
      @required this.date);
}
