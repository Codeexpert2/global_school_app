import 'package:flutter/material.dart';

import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:global_school/components/loading/loading_widget.dart';
import 'package:global_school/core/locale/generated/l10n.dart';
import 'package:global_school/core/router/app_routes.dart';

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
      appBar: AppBar(
        title: Text(S.of(context).childDetails),
        centerTitle: true,
      ),
      body: childDetailsState.when(
        data: (childData) {
          final child = childData.child;
          final section = childData.section;

          return SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                // 🏅 Profile Section
                Card(
                  elevation: 3,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        CircleAvatar(
                          radius: 40,
                          backgroundColor: Theme.of(context).primaryColor,
                          child: const Icon(
                            Icons.person,
                            size: 40,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(height: 12),
                        Text(
                          child?.name ?? 'N/A',
                          style:
                              Theme.of(context).textTheme.titleLarge?.copyWith(
                                    fontWeight: FontWeight.bold,
                                  ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          child?.serialNumber ?? 'N/A',
                          style:
                              Theme.of(context).textTheme.bodySmall?.copyWith(
                                    fontWeight: FontWeight.w300,
                                    fontSize: 14,
                                  ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                // 🏡 Contact & Address
                _InfoCard(
                  title: S.of(context).contactInformation,
                  children: [
                    _InfoRow(
                        icon: Icons.phone,
                        label: S.of(context).phone,
                        value: child?.phone),
                    _InfoRow(
                        icon: Icons.email,
                        label: S.of(context).email,
                        value: child?.email),
                    _InfoRow(
                        icon: Icons.location_on,
                        label: S.of(context).address,
                        value: child?.address),
                  ],
                ),
                const SizedBox(height: 16),
                // 📚 Section Details
                _InfoCard(
                  title: S.of(context).sectionDetails,
                  children: [
                    _InfoRow(
                        icon: Icons.school,
                        label: S.of(context).sectionCode,
                        value: section?.code),
                    _InfoRow(
                        icon: Icons.book,
                        label: S.of(context).description,
                        value: section?.description),
                    _InfoRow(
                        icon: Icons.group,
                        label: S.of(context).sectionName,
                        value: section?.name),
                  ],
                ),

                const SizedBox(height: 16),

                // 📊 Action Buttons
                _ActionButtons(childId: childId),
              ],
            ),
          );
        },
        error: (error, stackTrace) {
          return Center(
            child: Text(
              'Error: ${error.toString()}',
              style: const TextStyle(color: Colors.red),
            ),
          );
        },
        loading: LoadingWidget.new,
      ),
    );
  }
}

/// 📝 Card Widget to Show Child Information
class _InfoCard extends StatelessWidget {
  const _InfoCard({
    required this.title,
    required this.children,
  });

  final String title;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
            const SizedBox(height: 8),
            ...children,
          ],
        ),
      ),
    );
  }
}

/// 📌 Row for Information Display
class _InfoRow extends StatelessWidget {
  const _InfoRow({
    required this.icon,
    required this.label,
    required this.value,
  });

  final IconData icon;
  final String label;
  final String? value;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          Icon(icon, size: 20, color: Colors.blueGrey),
          const SizedBox(width: 8),
          Expanded(
            flex: 2,
            child: Text(
              label,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            flex: 3,
            child: Text(
              value ?? 'N/A',
              style: const TextStyle(color: Colors.black87),
            ),
          ),
        ],
      ),
    );
  }
}

/// 📊 Grid-Based Action Buttons
class _ActionButtons extends StatelessWidget {
  const _ActionButtons({
    required this.childId,
  });

  final String childId;

  @override
  Widget build(BuildContext context) {
    return GridView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
        childAspectRatio: 2.5,
      ),
      children: [
        _ActionButton(
          label: S.of(context).subjectResults,
          icon: Icons.assignment,
          onPressed: () => context.pushNamed(
            AppRoutes.guardianSubjectsResults.name,
            pathParameters: {'childId': childId},
          ),
        ),
        _ActionButton(
          label: S.of(context).onlineExamResults,
          icon: Icons.online_prediction,
          onPressed: () => context.pushNamed(
            AppRoutes.guardianChildOnlineExamResults.name,
            pathParameters: {'childId': childId},
          ),
        ),
        _ActionButton(
          label: S.of(context).weeklyReport,
          icon: Icons.calendar_view_week,
          onPressed: () => context.pushNamed(
            AppRoutes.guardianWeeklyReport.name,
            pathParameters: {'childId': childId},
          ),
        ),
        _ActionButton(
          label: S.of(context).monthlyReport,
          icon: Icons.calendar_today,
          onPressed: () => context.pushNamed(
            AppRoutes.guardianMonthlyReport.name,
            pathParameters: {'childId': childId},
          ),
        ),
      ],
    );
  }
}

/// 🎯 Individual Action Button
class _ActionButton extends StatelessWidget {
  const _ActionButton({
    required this.label,
    required this.icon,
    required this.onPressed,
  });

  final String label;
  final IconData icon;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(vertical: 12),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      icon: Icon(icon, size: 18),
      label: Text(
        label,
        style: const TextStyle(fontSize: 14),
      ),
      onPressed: onPressed,
    );
  }
}
