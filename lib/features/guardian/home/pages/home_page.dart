import 'package:flutter/material.dart';
import 'package:global_school/components/main/main_appbar.dart';
import 'package:global_school/core/router/app_routes.dart';

class GuardianHomePage extends StatelessWidget {
  const GuardianHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MainAppBar(
        title: 'Home Page',
      ),
      // body: ChildrenSection(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('Welcome Guardian!'),
          const SizedBox(
            height: 16,
            width: double.infinity,
          ),
          ElevatedButton(
            child: const Text('guardian Child'),
            onPressed: () {
              context.pushNamed(
                AppRoutes.guardianChild.name,
                pathParameters: {
                  'childId': '123', // Replace with actual child ID.
                },
              );
            },
          ),
          ElevatedButton(
            child: const Text('Child Results'),
            onPressed: () {
              context.pushNamed(
                AppRoutes.guardianSubjectsResults.name,
                pathParameters: {
                  'childId': '123', // Replace with actual child ID.
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
                  'childId': '123', // Replace with actual child ID.
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
                  'childId': '123', // Replace with actual child ID.
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
                  'childId': '123', // Replace with actual child ID.
                },
              );
            },
          ),
        ],
      ),
    );
  }
}

class ChildrenSection extends StatelessWidget {
  const ChildrenSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
      ),
      itemCount: 20, // Replace with actual data count.
      itemBuilder: (context, index) {
        return const ChildCard();
      },
    );
  }
}

class ChildCard extends StatelessWidget {
  const ChildCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const GridTile(child: Text('Child'));
  }
}
