import 'package:flutter/material.dart';
import 'package:global_school/components/errors/no_content_indicator.dart';
import 'package:global_school/components/loading/loading_widget.dart';
import 'package:global_school/components/main/app_divider.dart';
import 'package:global_school/components/main/main_appbar.dart';
import 'package:global_school/core/router/app_routes.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../data/models/children_model.dart';
import '../providers/children_provider.dart';

class GuardianHomePage extends StatelessWidget {
  const GuardianHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: MainAppBar(
        title: 'Home Page',
      ),
      body: ChildrenSection(),
    );
  }
}

class ChildrenSection extends ConsumerWidget {
  const ChildrenSection({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final childrenState = ref.watch(childrenProvider);

    return childrenState.when(
      data: (children) {
        return GridView.builder(
          padding: const EdgeInsets.all(16),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
            childAspectRatio: 1.0,
            crossAxisCount: 2,
          ),
          itemCount: children.length, // Replace with actual data count.
          itemBuilder: (context, index) {
            final child = children[index]; // Replace with actual data.
            return ChildCard(
              childData: child,
            );
          },
        );
      },
      error: (error, stackTrace) {
        return NoContentIndicator(message: error.toString());
      },
      loading: LoadingWidget.new,
    );
  }
}

class ChildCard extends StatelessWidget {
  const ChildCard({
    super.key,
    required this.childData,
  });

  final ChildrenModel childData;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.pushNamed(
          AppRoutes.guardianChild.name,
          pathParameters: {
            'childId': '${childData.child?.id}',
          },
        );
      },
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Colors.grey.shade100),
          color: Colors.blueGrey.shade50,
        ),
        child: GridTile(
          header: Center(
            child: Text(
              childData.child?.name ?? '',
              textAlign: TextAlign.center,
            ),
          ),
          footer: Center(
            child: Text(
              childData.section?.name ?? '',
              textAlign: TextAlign.center,
            ),
          ),
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
                childData.child?.email ?? '',
                textAlign: TextAlign.center,
              ),
              const AppDivider(),
              Text(
                childData.section?.code ?? '',
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
