import '../lib/filter_internals.dart';
import '../lib/get_transfers.dart';
import '../lib/transaction.dart';

void main() async {
  List<List<Transaction>> results = await getTransfers();
  List<List<Transaction>> internals =
      filterInternals(results[0], results[1])[0];
  List<Transaction> nonMatchTransfer =
      filterInternals(results[0], results[1])[1];

  internals.forEach((value) {
    print('${value[0].id}, ${value[1].id}');
  });
  print('${results[0].length}, ${results[1].length}');
  nonMatchTransfer.forEach((element) {
    print('${element.id}, ${element.amount}');
  });
}
