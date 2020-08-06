import 'transaction.dart';

List<List<Transaction>> filterInternals(List<Transaction> positiveTransactions,
    List<Transaction> negativeTransactions) {
  List<List<Transaction>> internalTransaction = [];
  var i = 1;

  positiveTransactions.forEach((positiveTransaction) {
    negativeTransactions.forEach((negativeTransaction) {
      if (positiveTransaction.amount == positiveTransaction.amount &&
          positiveTransaction.date == negativeTransaction.date &&
          positiveTransaction.isMatched == false &&
          negativeTransaction.isMatched == false) {
        internalTransaction.add([positiveTransaction, negativeTransaction]);
        positiveTransaction.isMatched = true;
        negativeTransaction.isMatched = true;
        i++;
      }
    });
  });

  return internalTransaction;
}
