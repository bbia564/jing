import 'package:intl/intl.dart';

class MenstrualCycle {
  final DateTime startDate;
  final int cycleLength;
  final int periodDuration;

  MenstrualCycle({
    required this.startDate,
    this.cycleLength = 28,
    this.periodDuration = 6,
  });

  DateTime get nextPeriodStart => startDate.add(Duration(days: cycleLength));
  DateTime get nextPeriodEnd => nextPeriodStart.add(Duration(days: periodDuration - 1));

  DateTime get ovulationDate => nextPeriodStart.subtract(const Duration(days: 14));


  DateTime get fertileWindowStart => ovulationDate.subtract(const Duration(days: 5));
  DateTime get fertileWindowEnd => ovulationDate.add(const Duration(days: 4));


  String formatDate(DateTime date) => DateFormat('yyyy-MM-dd').format(date);

}