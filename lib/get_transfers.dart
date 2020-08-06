import 'get_transactions.dart';
import 'transaction.dart';

Future<List<List<Transaction>>> getTransfers() async {
  List<Transaction> positiveTransactions = [];
  List<Transaction> negativeTransactions = [];

  List<Transaction> transactions = await getTransactions();

  transactions.forEach((value) {
    if (value.category == 'transfer') {
      if (value.amount < 0) {
        negativeTransactions.add(value);
      } else if (value.amount > 0) {
        positiveTransactions.add(value);
      } else {
        null;
      }
    }
  });
  return [positiveTransactions, negativeTransactions];
}
