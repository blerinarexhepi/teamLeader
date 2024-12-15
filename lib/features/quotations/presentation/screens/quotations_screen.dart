import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:teamleader/core/core.dart';
import 'package:teamleader/core/navigation/routes.dart';
import 'package:teamleader/features/common/common.dart';
import 'package:teamleader/features/quotations/presentation/presentation.dart';

class QuotationsScreen extends ConsumerWidget {
  const QuotationsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(50.0.h(context.screenSize)),
          child: const CustomAppBar(
            pageTitle: 'TeamLeader',
            showBackButton: false,
          ),
        ),
        backgroundColor: AppColors.solitude,
        body: SingleChildScrollView(
          child: Padding(
            padding: CustomEdgeInsets.all(size: context.screenSize, all: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                QuotationsCount(
                  total: ref
                      .watch(quotationsNotifer)
                      .quotations!
                      .length
                      .toString(),
                  title: 'Quotations',
                  description: 'projects',
                  onTap: () => context.push(AppRoutes.createQuotation),
                ),
                const CustomSizedBox(height: 8),
                if (ref.watch(quotationsNotifer).quotations!.isNotEmpty)
                  ListView.builder(
                    itemCount: ref.watch(quotationsNotifer).quotations!.length,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) => Padding(
                      padding: CustomEdgeInsets.only(
                          size: context.screenSize, top: 8),
                      child: QuotationsInfoCard(
                        onTap: () async {
                          ref
                              .read(singleQuotationNotifier.notifier)
                              .getQuotation(
                                id: ref
                                    .watch(quotationsNotifer)
                                    .quotations![index]
                                    .id!,
                                vatNr: ref
                                    .watch(quotationsNotifer)
                                    .quotations![index]
                                    .customer!
                                    .vatNr,
                              );
                          context.push(AppRoutes.singleQuotation);
                        },
                        name: ref
                            .watch(quotationsNotifer)
                            .quotations![index]
                            .title!,
                        price: ref
                            .watch(quotationsNotifer)
                            .quotations![index]
                            .totalPrice
                            .toString(),
                        company: ref
                            .watch(quotationsNotifer)
                            .quotations![index]
                            .customer!
                            .company,
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ));
  }
}
