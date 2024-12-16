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
    this.isSucsess = false,
    this.lineItems = const [],
    this.showSnackBar = false,
    this.snackBarMessage = '',
  });

  CreateQuotationState.initial()
      : images = [],
        lineItems = [],
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
  final bool isSucsess;
  final bool showSnackBar;
  final List<String> images;
  final String snackBarMessage;
  List<LineItemData> lineItems;
  final TextEditingController? email;
  final TextEditingController? title;
  final TextEditingController? vatNr;
  final TextEditingController? totalPrice;
  final TextEditingController? companyName;
  final TextEditingController? companyAddress;

  CreateQuotationState copyWith({
    bool? isEnabled,
    bool? isSucsess,
    String? imagePath,
    bool? showSnackBar,
    int? lineItemCount,
    List<String>? images,
    List<Uint8List>? imgs,
    String? snackBarMessage,
    TextEditingController? email,
    TextEditingController? title,
    TextEditingController? vatNr,
    List<LineItemData>? lineItems,
    TextEditingController? totalPrice,
    TextEditingController? companyName,
    TextEditingController? companyAddress,
  }) {
    return CreateQuotationState(
      email: email ?? this.email,
      title: title ?? this.title,
      vatNr: vatNr ?? this.vatNr,
      images: images ?? this.images,
      isSucsess: isSucsess ?? this.isSucsess,
      isEnabled: isEnabled ?? this.isEnabled,
      lineItems: lineItems ?? this.lineItems,
      totalPrice: totalPrice ?? this.totalPrice,
      companyName: companyName ?? this.companyName,
      showSnackBar: showSnackBar ?? this.showSnackBar,
      companyAddress: companyAddress ?? this.companyAddress,
      snackBarMessage: snackBarMessage ?? this.snackBarMessage,
    );
  }
}
