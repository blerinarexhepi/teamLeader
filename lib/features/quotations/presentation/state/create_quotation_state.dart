import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:teamleader/features/quotations/presentation/widgets/new_line_item_card.dart';

class CreateQuotationState {
  CreateQuotationState({
    this.email,
    this.title,
    this.vatNr,
    this.totalPrice,
    this.companyName,
    this.companyAddress,
    this.isEnabled = false,
    this.images = const [],
    this.lineItems = const [],
    this.isSucsess = false,
    this.showSnackBar = false,
    this.snackBarMessage = '',
  });

  CreateQuotationState.initial()
      : lineItems = [],
        images = [],
        isEnabled = false,
        isSucsess = false,
        showSnackBar = false,
        snackBarMessage = '',
        email = TextEditingController(),
        title = TextEditingController(),
        vatNr = TextEditingController(),
        totalPrice = TextEditingController(),
        companyName = TextEditingController(),
        companyAddress = TextEditingController();

  final bool isEnabled;
  final bool showSnackBar;
  final bool isSucsess;
  final String snackBarMessage;
  final List<String> images;
  List<LineItemData> lineItems;
  final TextEditingController? email;
  final TextEditingController? title;
  final TextEditingController? vatNr;
  final TextEditingController? totalPrice;
  final TextEditingController? companyName;
  final TextEditingController? companyAddress;

  CreateQuotationState copyWith({
    bool? isEnabled,
    int? lineItemCount,
    bool? showSnackBar,
    bool? isSucsess,
    String? snackBarMessage,
    List<String>? images,
    TextEditingController? email,
    TextEditingController? title,
    TextEditingController? vatNr,
    TextEditingController? totalPrice,
    TextEditingController? companyName,
    TextEditingController? companyAddress,
    List<LineItemData>? lineItems,
    List<Uint8List>? imgs,
    String? imagePath,
  }) {
    return CreateQuotationState(
      showSnackBar: showSnackBar ?? this.showSnackBar,
      isSucsess: isSucsess ?? this.isSucsess,
      snackBarMessage: snackBarMessage ?? this.snackBarMessage,
      email: email ?? this.email,
      title: title ?? this.title,
      vatNr: vatNr ?? this.vatNr,
      images: images ?? this.images,
      isEnabled: isEnabled ?? this.isEnabled,
      lineItems: lineItems ?? this.lineItems,
      totalPrice: totalPrice ?? this.totalPrice,
      companyName: companyName ?? this.companyName,
      companyAddress: companyAddress ?? this.companyAddress,
    );
  }
}
