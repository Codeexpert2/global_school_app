import 'package:flutter/material.dart';
import 'package:global_school/core/themes/app_colors.dart';
import 'package:model_viewer_plus/model_viewer_plus.dart';

class ModelViewerPage extends StatefulWidget {
  const ModelViewerPage({
    super.key,
    required this.assets,
  });

  final String assets;

  @override
  State<ModelViewerPage> createState() => _ModelViewerPageState();
}

class _ModelViewerPageState extends State<ModelViewerPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Model Viewer'),
      ),
      body: ModelViewer(
        src: widget.assets,
        alt: 'A 3D model of an Earth',
        ar: true,
        autoRotate: true,
        cameraControls: true,
        backgroundColor: AppColors.backgroundColor,
        animationCrossfadeDuration: 1,
        // backgroundColor: Colors.red,
      ),
    );
  }
}
