import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:teamleader/features/quotations/quotations.dart';

final quotationsNotifer = NotifierProvider<QuotationsNotifier, QuotationsState>(
  () => QuotationsNotifier(),
);

class QuotationsNotifier extends Notifier<QuotationsState> {
  @override
  QuotationsState build() {
    state = QuotationsState.initial();
    fetchQuotations();

    return state;
  }

  final DatabaseService _databaseService = DatabaseService.instance;

  Future<void> fetchQuotations() async {
    final result = await _databaseService.getQuotations();

    if (result != null) {
      state = state.copyWith(quotations: result);
    }
  }
}
