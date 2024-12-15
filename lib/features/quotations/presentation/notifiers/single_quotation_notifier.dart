import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:teamleader/features/quotations/presentation/presentation.dart';
import 'package:teamleader/features/quotations/services/database_service.dart';

final singleQuotationNotifier =
    NotifierProvider<SingleQuotationNotifier, SingleQuotationState>(
  () => SingleQuotationNotifier(),
);

class SingleQuotationNotifier extends Notifier<SingleQuotationState> {
  @override
  SingleQuotationState build() {
    state = SingleQuotationState.initial();

    return state;
  }

  final DatabaseService _databaseService = DatabaseService.instance;

  Future<void> getQuotation({required int id, required int vatNr}) async {
    final result = await _databaseService.getQuotation(id: id, vatNr: vatNr);

    state = state.copyWith(quotationModel: result);
  }
}
