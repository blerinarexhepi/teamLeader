import 'dart:io';

import 'package:flutter/material.dart';
import 'package:teamleader/core/core.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:teamleader/features/quotations/quotations.dart';

final createQuotationNotifier =
    NotifierProvider<CreateQuotationNotifier, CreateQuotationState>(
        () => CreateQuotationNotifier());

class CreateQuotationNotifier extends Notifier<CreateQuotationState> {
  @override
  CreateQuotationState build() {
    state = CreateQuotationState.initial();

    return state;
  }

  final DatabaseService _databaseService = DatabaseService.instance;
  ImagePickerService get _imagePickerService => ref.read(imagePickerService);

  void addLineItem() {
    final updatedLineItems = [...state.lineItems, LineItemData()];

    state = state.copyWith(lineItems: updatedLineItems);
  }

  void removeLineItem(int index) {
    if (index >= 0 && index < state.lineItems.length) {
      final updatedLineItems = [...state.lineItems]..removeAt(index);

      state = state.copyWith(lineItems: updatedLineItems);
    }
  }

  void calculatePrice({required int index}) {
    double totalPrice = 0;
    LineItemData item = state.lineItems[index];

    double price = item.price.text != '' ? double.parse(item.price.text) : 0;
    double quantity = item.quantity.text != ''
        ? double.parse(item.quantity.text)
        : price != 0
            ? 1
            : 0;

    totalPrice = quantity * price;
    item.totalPrice = TextEditingController(text: '$totalPrice');

    List<LineItemData> updatedLineItems = List.from(state.lineItems);
    updatedLineItems[index] = item;

    state = state.copyWith(lineItems: updatedLineItems);
  }

  void calculateTotalPrice() {
    double totalPrice = 0;

    for (final item in state.lineItems) {
      if (item.totalPrice.text != '') {
        totalPrice += double.parse(item.totalPrice.text);
      }
    }

    state = state.copyWith(
      totalPrice: TextEditingController(text: '$totalPrice €'),
    );
  }

  Future<void> imgPicker(String option) async {
    List<String> list = state.images;
    final image = await _imagePickerService.imgPicker(option);

    final directory = await getApplicationDocumentsDirectory();

    if (image != null) {
      final path = '${directory.path}/${image.name}';
      final File originalFile = File(image.path);

      await originalFile.copy(path);

      list.add(path);
      state = state.copyWith(
        images: list,
      );
    }
  }

  Future<void> removeImage({required String image}) async {
    final list = state.images;

    final int index = list.indexWhere((img) => img == image);

    if (index != -1) {
      list.removeAt(index);
    }

    state = state.copyWith(images: list);
  }

  void isButtonEnabled() {
    state = state.copyWith(
      isEnabled: state.companyName!.text.isNotEmpty &&
          state.companyAddress!.text.isNotEmpty &&
          (state.email!.text.isNotEmpty && emailIsValid(state.email!.text)) &&
          state.vatNr!.text.isNotEmpty &&
          state.title!.text.isNotEmpty,
    );
  }

  bool emailIsValid(String value) {
    return RegExp(
            r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
        .hasMatch(value);
  }

  void cleanState() {
    state = CreateQuotationState.initial();
  }

  void clearSnackBar() {
    state = state.copyWith(
      isSucsess: false,
      showSnackBar: false,
      snackBarMessage: '',
    );
  }

  double parseStringToDouble(String value) {
    String formatValue = value.split(' ')[0];
    double val = double.tryParse(formatValue)!;

    return val;
  }

  Future<void> createQuotation() async {
    try {
      await _databaseService.addQuotation(
        quotation: QuotationModel(
          images: state.images,
          title: state.title!.text,
          totalPrice: parseStringToDouble(state.totalPrice!.text),
          customer: CustomerModel(
            email: state.email!.text,
            company: state.companyName!.text,
            vatNr: int.tryParse(state.vatNr!.text)!,
            companyAddress: state.companyAddress!.text,
          ),
          lineItems: state.lineItems.map((item) {
            return LineItemModel(
              title: item.title.text,
              price: double.tryParse(item.price.text),
              quantity: int.tryParse(item.quantity.text),
              totalPrice: double.tryParse(item.totalPrice.text),
            );
          }).toList(),
        ),
      );

      cleanState();
      state = state.copyWith(
        isSucsess: true,
        showSnackBar: true,
        snackBarMessage: 'Quotation is created successfully!',
      );
    } catch (e) {
      state = state.copyWith(
        isSucsess: false,
        showSnackBar: true,
        snackBarMessage: 'Something went wrong, please try again!',
      );
    }
  }
}
