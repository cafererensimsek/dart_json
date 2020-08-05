import 'dart:convert';
import 'dart:io';
import 'transaction.dart';

Future<List<Transaction>> getTransactions() async {
  List<Transaction> transactions = [];

  List<String> paths = [
    'json/ex1-account1.json',
    'json/ex1-account2.json',
    'json/ex1-account3.json',
  ];

  paths.forEach((element) async {
    await File(element).readAsString().then((fileContents) {
      var parsed = json.decode(fileContents).cast<Map<String, dynamic>>();

      transactions.addAll(parsed
          .map<Transaction>((json) => Transaction.fromJson(json))
          .toList());
    });
  });
  return transactions;
}
