import 'transaction.dart';

Map<String, List<Transaction>> filterInternals(
    List<Transaction> positiveTransactions,
    List<Transaction> negativeTransactions) {
  Map<String, List<Transaction>> internalTransaction = {};
  var i = 1;

  positiveTransactions.forEach((positiveTransaction) {
    negativeTransactions.forEach((negativeTransaction) {
      if (positiveTransaction.amount == positiveTransaction.amount &&
          positiveTransaction.date == negativeTransaction.date) {
        internalTransaction[i.toString()] = [
          positiveTransaction,
          negativeTransaction
        ];
        positiveTransaction.amount = 0;
        negativeTransaction.amount = 0;
        i++;
      }
    });
  });

  return internalTransaction;
}
