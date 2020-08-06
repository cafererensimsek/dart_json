import 'package:cash_coach/filter_internals.dart';
import 'package:cash_coach/get_transfers.dart';
import 'package:cash_coach/transaction.dart';

void main() async {
  List<List<Transaction>> results = await getTransfers();
  Map<String, List<Transaction>> internals =
      filterInternals(results[0], results[1]);

  internals.forEach((key, value) {
    print('$key : ${value[0].id}, ${value[1].id}');
  });
}
