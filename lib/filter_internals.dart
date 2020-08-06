import 'transaction.dart';

// take to list of transactions, compare and return the internals
List<List<Transaction>> filterInternals(List<Transaction> positiveTransactions,
    List<Transaction> negativeTransactions) {
  List<List<Transaction>> internalTransaction = [];

  positiveTransactions.forEach((positiveTransaction) {
    negativeTransactions.forEach((negativeTransaction) {
      // if the amounts and the dates are the same and they are both unmtahced, they are internals
      if (positiveTransaction.amount == positiveTransaction.amount &&
          positiveTransaction.date == negativeTransaction.date &&
          positiveTransaction.isMatched == false &&
          negativeTransaction.isMatched == false) {
        // add them to the list
        internalTransaction.add([positiveTransaction, negativeTransaction]);

        // they are matched chang ethe property to true
        positiveTransaction.isMatched = true;
        negativeTransaction.isMatched = true;
      }
    });
  });

  return internalTransaction;
}
