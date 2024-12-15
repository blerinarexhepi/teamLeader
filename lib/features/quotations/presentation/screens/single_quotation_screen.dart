import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:teamleader/core/core.dart';
import 'package:teamleader/features/common/common.dart';
import 'package:teamleader/features/quotations/presentation/presentation.dart';

class SingleQuotationScreen extends ConsumerWidget {
  const SingleQuotationScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(50.0.h(context.screenSize)),
          child: const CustomAppBar(
            pageTitle: 'TeamLeader',
            showBackButton: true,
          ),
        ),
        backgroundColor: AppColors.solitude,
        body: SingleChildScrollView(
          child: Padding(
            padding: CustomEdgeInsets.all(size: context.screenSize, all: 24),
            child: Column(
              children: [
                if (ref
                        .watch(singleQuotationNotifier)
                        .quotationModel!
                        .customer !=
                    null)
                  RadiusContainer(
                    width: context.screenSize.width,
                    widget: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Customer info',
                          style: context.textTheme.titleMedium!
                              .copyWith(color: AppColors.charcoal),
                        ),
                        const CustomSizedBox(height: 16),
                        TitleDescriptionRow(
                          title: 'Company name',
                          description: ref
                              .watch(singleQuotationNotifier)
                              .quotationModel!
                              .customer!
                              .company,
                        ),
                        const CustomSizedBox(height: 16),
                        TitleDescriptionRow(
                          title: 'Company address',
                          description: ref
                              .watch(singleQuotationNotifier)
                              .quotationModel!
                              .customer!
                              .companyAddress,
                        ),
                        const CustomSizedBox(height: 16),
                        TitleDescriptionRow(
                          title: 'Email address',
                          description: ref
                              .watch(singleQuotationNotifier)
                              .quotationModel!
                              .customer!
                              .email,
                        ),
                        const CustomSizedBox(height: 16),
                        TitleDescriptionRow(
                          title: 'VAT number',
                          description: ref
                              .watch(singleQuotationNotifier)
                              .quotationModel!
                              .customer!
                              .vatNr
                              .toString(),
                        ),
                      ],
                    ),
                  ),
                const CustomSizedBox(height: 24),
                RadiusContainer(
                  width: context.screenSize.width,
                  widget: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Quotation info',
                        style: context.textTheme.titleMedium!
                            .copyWith(color: AppColors.charcoal),
                      ),
                      const CustomSizedBox(height: 16),
                      TitleDescriptionRow(
                        title: 'Title/Description',
                        description: ref
                                .watch(singleQuotationNotifier)
                                .quotationModel!
                                .title ??
                            '',
                      ),
                      const CustomSizedBox(height: 16),
                      Text(
                        'Line items',
                        style: context.textTheme.titleSmall!
                            .copyWith(color: AppColors.grey),
                      ),
                      const CustomSizedBox(height: 4),
                      if (ref
                              .watch(singleQuotationNotifier)
                              .quotationModel!
                              .lineItems !=
                          null)
                        for (final lineItem in ref
                            .watch(singleQuotationNotifier)
                            .quotationModel!
                            .lineItems!)
                          OpenCloseItem(
                            title: lineItem.title.toString(),
                            price: lineItem.price.toString(),
                            quantity: lineItem.quantity.toString(),
                            totalPrice: lineItem.totalPrice.toString(),
                          ),
                      const CustomSizedBox(height: 16),
                      TitleDescriptionRow(
                        title: 'Total Price',
                        description:
                            '${ref.watch(singleQuotationNotifier).quotationModel!.totalPrice ?? '-'}',
                      ),
                    ],
                  ),
                ),
                const CustomSizedBox(height: 24),
                if (ref.watch(singleQuotationNotifier).quotationModel!.images !=
                    null)
                  RadiusContainer(
                    padding: CustomEdgeInsets.only(
                        size: context.screenSize, top: 16, left: 16, right: 16),
                    widget: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'Images',
                          style: context.textTheme.titleMedium!
                              .copyWith(color: AppColors.charcoal),
                        ),
                        const CustomSizedBox(
                          height: 16,
                        ),
                        ImagesCard(
                          images: ref
                              .watch(singleQuotationNotifier)
                              .quotationModel!
                              .images!,
                        ),
                      ],
                    ),
                  ),
              ],
            ),
          ),
        ));
  }
}
