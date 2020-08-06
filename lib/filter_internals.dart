import 'transaction.dart';

// take to list of transactions, compare and return the internals
List filterInternals(List<Transaction> positiveTransactions,
    List<Transaction> negativeTransactions) {
  List<List<Transaction>> internalTransaction = [];
  List<Transaction> nonMatch = [];

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

  positiveTransactions.forEach((element) {
    if (element.isMatched == false) {
      nonMatch.add(element);
    }
  });
  negativeTransactions.forEach((element) {
    if (element.isMatched == false) {
      nonMatch.add(element);
    }
  });

  return [internalTransaction, nonMatch];
}
