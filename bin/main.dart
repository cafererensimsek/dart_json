import 'dart:io';

import 'package:cash_coach/filter_internals.dart';
import 'package:cash_coach/get_transfers.dart';
import 'package:cash_coach/transaction.dart';

void main() async {
  List<List<Transaction>> results = await getTransfers();
  Map<String, List<Transaction>> internals =
      filterInternals(results[0], results[1]);

  print(internals);
}
