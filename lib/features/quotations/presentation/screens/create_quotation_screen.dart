import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:teamleader/core/core.dart';
import 'package:teamleader/features/common/common.dart';
import 'package:teamleader/features/quotations/presentation/presentation.dart';

class CreateQuotationScreen extends ConsumerWidget {
  const CreateQuotationScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(
      createQuotationNotifier,
      ((prev, next) {
        if (next.showSnackBar) {
          ScaffoldMessenger.of(context).showSnackBar(
            CustomSnackBar(
              message: next.snackBarMessage.toString(),
              onTap: () {
                ScaffoldMessenger.of(context).hideCurrentSnackBar();
                ref.read(createQuotationNotifier.notifier).clearSnackBar();
              },
            ),
          );

          ref.read(createQuotationNotifier.notifier).clearSnackBar();
        }
      }),
    );
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50.0.h(context.screenSize)),
        child: CustomAppBar(
          pageTitle: 'TeamLeader',
          showBackButton: true,
          onBack: () async {
            ref.read(createQuotationNotifier.notifier).cleanState();
            await ref.read(quotationsNotifer.notifier).fetchQuotations();

            context.pop();
          },
        ),
      ),
      backgroundColor: AppColors.solitude,
      body: SingleChildScrollView(
        child: GestureDetector(
          behavior: HitTestBehavior.translucent,
          onTap: () => FocusScope.of(context).unfocus(),
          child: Padding(
            padding: CustomEdgeInsets.all(size: context.screenSize, all: 24),
            child: RadiusContainer(
              widget: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Customer info',
                    style: context.textTheme.labelMedium,
                  ),
                  const CustomSizedBox(height: 16),
                  AppTextField(
                    label: 'Company Name',
                    textController:
                        ref.watch(createQuotationNotifier).companyName,
                    onChanged: (_) => ref
                        .read(createQuotationNotifier.notifier)
                        .isButtonEnabled(),
                  ),
                  const CustomSizedBox(height: 16),
                  AppTextField(
                    label: 'Company address',
                    textController:
                        ref.watch(createQuotationNotifier).companyAddress,
                    onChanged: (_) => ref
                        .read(createQuotationNotifier.notifier)
                        .isButtonEnabled(),
                  ),
                  const CustomSizedBox(height: 16),
                  AppTextField(
                    label: 'Email address',
                    textController: ref.watch(createQuotationNotifier).email,
                    onChanged: (_) => ref
                        .read(createQuotationNotifier.notifier)
                        .isButtonEnabled(),
                  ),
                  const CustomSizedBox(height: 16),
                  AppTextField(
                    label: 'VAT number',
                    textController: ref.watch(createQuotationNotifier).vatNr,
                    onChanged: (_) => ref
                        .read(createQuotationNotifier.notifier)
                        .isButtonEnabled(),
                  ),
                  const CustomSizedBox(height: 16),
                  AppTextField(
                    label: 'Quotation Title',
                    textController: ref.watch(createQuotationNotifier).title,
                    onChanged: (_) => ref
                        .read(createQuotationNotifier.notifier)
                        .isButtonEnabled(),
                  ),
                  const CustomSizedBox(height: 16),
                  LinkButton(
                    title: 'Add New Line Item',
                    onTap: () => ref
                        .watch(createQuotationNotifier.notifier)
                        .addLineItem(),
                  ),
                  const CustomSizedBox(height: 16),
                  ListView.builder(
                    shrinkWrap: true,
                    padding: EdgeInsets.zero,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount:
                        ref.watch(createQuotationNotifier).lineItems.length,
                    itemBuilder: (context, index) => Padding(
                      padding: CustomEdgeInsets.only(
                        size: context.screenSize,
                        bottom: 0,
                      ),
                      child: Column(
                        children: [
                          NewLineItemCard(
                            title: ref
                                .watch(createQuotationNotifier)
                                .lineItems[index]
                                .title,
                            price: ref
                                .watch(createQuotationNotifier)
                                .lineItems[index]
                                .price,
                            quantity: ref
                                .watch(createQuotationNotifier)
                                .lineItems[index]
                                .quantity,
                            totalPrice: ref
                                .watch(createQuotationNotifier)
                                .lineItems[index]
                                .totalPrice,
                            onChanged: (_) {
                              ref.read(createQuotationNotifier.notifier)
                                ..calculatePrice(index: index)
                                ..calculateTotalPrice();
                            },
                            removeFunction: () => ref
                                .read(createQuotationNotifier.notifier)
                                .removeLineItem(index),
                          ),
                          if (index <
                              ref
                                      .watch(createQuotationNotifier)
                                      .lineItems
                                      .length -
                                  1)
                            Divider(
                              height: 30.0.h(context.screenSize),
                              thickness: 0.2,
                            )
                        ],
                      ),
                    ),
                  ),
                  const CustomSizedBox(height: 16),
                  AppTextField(
                    readOnly: true,
                    label: 'Total price',
                    textController:
                        ref.watch(createQuotationNotifier).totalPrice,
                  ),
                  const CustomSizedBox(height: 16),
                  Row(
                    children: [
                      CustomSizedBox(
                        width: 135,
                        child: BorderIconTextButton(
                          title: 'Upload Pictures',
                          onTap: () => ref
                              .read(createQuotationNotifier.notifier)
                              .imgPicker('gallery'),
                        ),
                      ),
                      const Spacer(),
                      CustomSizedBox(
                        width: 135,
                        child: BorderIconTextButton(
                          title: 'Take a Picture',
                          onTap: () => ref
                              .read(createQuotationNotifier.notifier)
                              .imgPicker('camera'),
                        ),
                      ),
                    ],
                  ),
                  const CustomSizedBox(height: 16),
                  if (ref.watch(createQuotationNotifier).images.isNotEmpty)
                    ImagesCard(
                      images: ref.watch(createQuotationNotifier).images,
                      showRemoveButton: true,
                      removeImage: (image) => ref
                          .read(createQuotationNotifier.notifier)
                          .removeImage(image: image),
                    ),
                  AppTextButton(
                    title: 'Save',
                    isEnabled: ref.watch(createQuotationNotifier).isEnabled,
                    onPressed: () {
                      ref
                          .read(createQuotationNotifier.notifier)
                          .createQuotation();
                    },
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
