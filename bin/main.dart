import 'dart:convert';
import 'dart:io';

void main() {
  List result = readJson();
  /* var internalTransactions = getInternalTransaction(result[0], result[1]);
  print(internalTransactions); */
  print(result);
}

/* class Transaction {
  String id;
  int amount;
  String date;
  String description;

  Transaction.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    description = json['description'];
    amount = json['amount'];
    date = json['made_on'];
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'description': description,
        'amount': amount,
        'date': date,
      };
} */

List<Map> readJson() {
  Map positiveTransaction;
  Map negativeTransaction;

  var paths = [
    'json/ex1-account1.json',
    'json/ex1-account2.json',
    'json/ex1-account3.json'
  ];

  paths.forEach((element) async {
    await File(element)
        .readAsString()
        .then((contents) => jsonDecode(contents))
        .then((jsonData) {
      jsonData.forEach((value) {
        if (value['category'] == 'transfer') {
          if (value['amount'] < 0) {
            negativeTransaction[value['id'] = {
              'amount': value['amount'],
              'date': value['made_on'],
              'description': value['description'],
            }];
          } else if (value['amount'] > 0) {
            positiveTransaction[value['id'] = {
              'amount': value['amount'],
              'date': value['made_on'],
              'description': value['description'],
            }];
          }
        }
      });
    });
  });

  return [positiveTransaction, negativeTransaction];
}

/* Map getInternalTransaction(positiveTransaction, negativeTransaction) {
  Map internalTransaction;
  var i = 1;

  positiveTransaction.forEach((posKey, posValue) {
    negativeTransaction.forEach((negKey, negValue) {
      if (posValue['amount'] == negValue['amount'] &&
          posValue['date'] == negValue['date']) {
        internalTransaction[i] = {posKey: posValue, negKey: negValue};
        i++;
      }
    });
  });

  return internalTransaction;
} */
