import 'package:flutter/material.dart';

class LinearLoadingWidget extends StatelessWidget {
  const LinearLoadingWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return LinearProgressIndicator(
      color: Theme.of(context).scaffoldBackgroundColor,
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      valueColor: AlwaysStoppedAnimation(Theme.of(context).primaryColor),
    );
  }
}
