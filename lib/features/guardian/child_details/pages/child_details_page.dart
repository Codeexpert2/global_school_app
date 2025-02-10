import 'package:flutter/material.dart';
import 'package:global_school/components/errors/no_content_indicator.dart';
import 'package:global_school/components/loading/loading_widget.dart';
import 'package:global_school/components/main/app_divider.dart';
import 'package:global_school/components/main/main_appbar.dart';
import 'package:global_school/core/router/app_routes.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../providers/child_details_provider.dart';

class ChildDetailsPage extends ConsumerWidget {
  const ChildDetailsPage({
    super.key,
    required this.childId,
  });

  final String childId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final childDetailsState = ref.watch(childDetailsProvider(childId));
    return Scaffold(
      appBar: MainAppBar(
        title: 'Child Details #$childId',
      ),
      body: childDetailsState.when(
        data: (childData) {
          return Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  childData.child?.serialNumber ?? '',
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 4),
                Text(
                  childData.child?.name ?? '',
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 4),
                Text(
                  childData.child?.phone ?? '',
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 4),
                Text(
                  childData.child?.address ?? '',
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 4),
                Text(
                  childData.child?.email ?? '',
                  textAlign: TextAlign.center,
                ),
                const AppDivider(),
                Text(
                  childData.section?.code ?? '',
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 4),
                Text(
                  childData.section?.description ?? '',
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 4),
                Text(
                  childData.section?.name ?? '',
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 4),
                ElevatedButton(
                  child: const Text('Child Results'),
                  onPressed: () {
                    context.pushNamed(
                      AppRoutes.guardianSubjectsResults.name,
                      pathParameters: {
                        'childId': childId, // Replace with actual child ID.
                      },
                    );
                  },
                ),
                ElevatedButton(
                  child: const Text('Online Exam Results'),
                  onPressed: () {
                    context.pushNamed(
                      AppRoutes.guardianChildOnlineExamResults.name,
                      pathParameters: {
                        'childId': childId, // Replace with actual child ID.
                      },
                    );
                  },
                ),
                ElevatedButton(
                  child: const Text('Child Weekly Report'),
                  onPressed: () {
                    context.pushNamed(
                      AppRoutes.guardianWeeklyReport.name,
                      pathParameters: {
                        'childId': childId, // Replace with actual child ID.
                      },
                    );
                  },
                ),
                ElevatedButton(
                  child: const Text('Child Monthly Report'),
                  onPressed: () {
                    context.pushNamed(
                      AppRoutes.guardianMonthlyReport.name,
                      pathParameters: {
                        'childId': childId, // Replace with actual child ID.
                      },
                    );
                  },
                ),
              ],
            ),
          );
        },
        error: (error, stackTrace) {
          return NoContentIndicator(message: error.toString());
        },
        loading: () {
          return const LoadingWidget();
        },
      ),
    );
  }
}
