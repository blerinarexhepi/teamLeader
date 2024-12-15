import 'package:teamleader/features/quotations/domain/models/quotation_model.dart';

class SingleQuotationState {
  SingleQuotationState({this.quotationModel});

  SingleQuotationState.initial() : quotationModel = QuotationModel();

  final QuotationModel? quotationModel;

  SingleQuotationState copyWith({
    QuotationModel? quotationModel,
  }) {
    return SingleQuotationState(
      quotationModel: quotationModel ?? this.quotationModel,
    );
  }
}
