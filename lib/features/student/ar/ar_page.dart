// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:global_school/components/main/main_appbar.dart';
import 'package:global_school/core/constants/images.dart';
import 'package:global_school/core/router/app_routes.dart';
import 'package:global_school/core/themes/app_colors.dart';

class ArPage extends StatelessWidget {
  const ArPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MainAppBar(title: 'Ar'),
      body: ListView(
        children: [
          const ArItem(
            assets: AppImages.modelsHumanbodyPlantCell,
            title: 'Plant Cell',
          ),
          const ArItem(
            assets: AppImages.modelsHumanbodyAnimalCell,
            title: 'Animal Cell',
          ),
          const ArItem(
            assets: AppImages.modelsHumanbodyDna,
            title: 'DNA',
          ),
          const ArItem(
            assets: AppImages.modelsHumanbodyHumanBrain,
            title: 'Human Brain',
          ),
          const ArItem(
            assets: AppImages.modelsHumanbodyHumanFullBrain,
            title: 'Human Full Brain',
          ),
          const ArItem(
            assets: AppImages.modelsHumanbodyHumanEye,
            title: 'Human Eye',
          ),
          const ArItem(
            assets: AppImages.modelsHumanbodyHumanHeart,
            title: 'Human Heart',
          ),
          const ArItem(
            assets: AppImages.modelsHumanbodyHumanSkeleton,
            title: 'Skeleton',
          ),
        ],
      ),
    );
  }
}

class ArItem extends StatelessWidget {
  const ArItem({
    super.key,
    required this.title,
    required this.assets,
  });

  final String title;
  final String assets;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.pushNamed(
        'assets',
        pathParameters: {
          'assets': assets,
        },
      ),
      child: Container(
        padding: const EdgeInsets.all(16),
        margin: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: AppColors.gray100,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Text(
          title,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
