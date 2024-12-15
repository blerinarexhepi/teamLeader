import 'package:teamleader/features/quotations/domain/models/models.dart';

class QuotationsState {
  QuotationsState({this.quotations});

  QuotationsState.initial() : quotations = [];

  final List<QuotationModel>? quotations;

  QuotationsState copyWith({
    List<QuotationModel>? quotations,
  }) {
    return QuotationsState(
      quotations: quotations ?? this.quotations,
    );
  }
}
