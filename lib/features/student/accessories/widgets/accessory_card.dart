import 'package:flutter/material.dart';

import 'package:global_school/components/images/cached_image.dart';
import 'package:global_school/core/enums/accessorie_content_type.dart';
import 'package:global_school/core/utils/snackbars.dart';
import 'package:global_school/features/student/accessories/utils/accessory_utils.dart';

import '../model/accessorie_model.dart';

class AccessoryCard extends StatelessWidget {
  const AccessoryCard({
    super.key,
    required this.accessory,
    required this.contentType,
  });
  final Accessorie accessory;
  final ContentType contentType;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      elevation: 3,
      shadowColor: Colors.deepPurple.withOpacity(0.2),
      child: InkWell(
        borderRadius: BorderRadius.circular(20),
        onTap: () => {},
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: CachedImage(
                  imageUrl: accessory.images ?? '',
                  width: 80,
                  height: 80,
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(accessory.topic ?? 'Not found topic',
                        style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            color: Colors.deepPurple)),
                    const SizedBox(height: 8),
                    buildContent(accessory, contentType),
                  ],
                ),
              ),
              buildActionButton(context, accessory, contentType),
            ],
          ),
        ),
      ),
    );
  }
}
