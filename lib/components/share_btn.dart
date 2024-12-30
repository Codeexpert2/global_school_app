import 'package:flutter/material.dart';

import 'package:share_plus/share_plus.dart';

import 'package:template/core/themes/app_colors.dart';

class ShareBtn extends StatelessWidget {
  const ShareBtn({
    super.key,
    required this.text,
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(50),
        boxShadow: const [
          BoxShadow(
            color: AppColors.shadowColor,
            offset: Offset(1, 1),
            blurRadius: 10,
          )
        ],
      ),
      child: IconButton(
        onPressed: () {
          final box = context.findRenderObject() as RenderBox?;

          Share.share(
            text,
            sharePositionOrigin: box!.localToGlobal(Offset.zero) & box.size,
          );
        },
        icon: Icon(
          Icons.ios_share_rounded,
          color: Theme.of(context).iconTheme.color,
        ),
      ),
    );
  }
}
