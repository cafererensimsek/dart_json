import 'dart:convert';
import 'dart:io';
import 'transaction.dart';

/* Future<List<Transaction>> getTransactions() async {
  List<Transaction> transactions = [];

  List<String> paths = [
    'json/ex1-account1.json',
    'json/ex1-account2.json',
    'json/ex1-account3.json',
  ];

  paths.forEach((element) async {
    String fileContents = await File(element).readAsString();

    var parsed = json.decode(fileContents).cast<Map<String, dynamic>>();

    transactions.addAll(
        parsed.map<Transaction>((json) => Transaction.fromJson(json)).toList());
  });
  return transactions;
}
 */

Future<List<Transaction>> getTransactions() async {
  List<Transaction> transactions = [];

  String fileContents1 = await File('json/ex1-account1.json').readAsString();
  String fileContents2 = await File('json/ex1-account2.json').readAsString();
  String fileContents3 = await File('json/ex1-account3.json').readAsString();

  var parsed = json.decode(fileContents1).cast<Map<String, dynamic>>();
  var parsed2 = json.decode(fileContents2).cast<Map<String, dynamic>>();
  var parsed3 = json.decode(fileContents3).cast<Map<String, dynamic>>();

  transactions.addAll(
      parsed.map<Transaction>((json) => Transaction.fromJson(json)).toList());
  transactions.addAll(
      parsed2.map<Transaction>((json) => Transaction.fromJson(json)).toList());
  transactions.addAll(
      parsed3.map<Transaction>((json) => Transaction.fromJson(json)).toList());

  return transactions;
}
