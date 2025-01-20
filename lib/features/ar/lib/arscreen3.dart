// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';


// class AugmentedImages extends StatefulWidget {
//   const AugmentedImages({super.key});

//   @override
//   State<AugmentedImages> createState() => _AugmentedImagesState();
// }

// class _AugmentedImagesState extends State<AugmentedImages> {
//   late ArCoreController arCoreController;
//   Map<int, ArCoreAugmentedImage> augmentedImagesMap = {};

//   whenArCoreViewCreated(ArCoreController coreController) {
//     arCoreController = coreController;
//     arCoreController.onTrackingImage = controlOnTrackingImage;
//     //load the single image
//     loadSingleImage();
//   }

//   loadSingleImage() async {
//     final ByteData bytes = await rootBundle.load('assets/earthaug.jpg');

//     arCoreController.loadAugmentedImagesDatabase(
//       bytes: bytes.buffer.asUint8List(),
//     );
//   }

//   controlOnTrackingImage(ArCoreAugmentedImage augmentedImage) {
//     if (!augmentedImagesMap.containsKey(augmentedImage.index)) {
//       augmentedImagesMap[augmentedImage.index] = augmentedImage;

//       //addsphere
//       addSphere(augmentedImage);
//     }
//   }

//   Future addSphere(ArCoreAugmentedImage arCoreAugmentedImage) async {
//     final ByteData textureBytes =
//         await rootBundle.load('assets/earthaugmentedimage.jpg');

//     final material = ArCoreMaterial(
//       color: const Color.fromARGB(120, 66, 134, 244),
//       textureBytes: textureBytes.buffer.asUint8List(),
//     );

//     final sphere = ArCoreSphere(
//       materials: [material],
//       radius: arCoreAugmentedImage.extentX / 2,
//     );

//     final node = ArCoreNode(
//       shape: sphere,
//     );

//     arCoreController.addArCoreNodeToAugmentedImage(
//         node, arCoreAugmentedImage.index);
//   }

//   @override
//   void dispose() {
//     // TODO: implement dispose
//     super.dispose();

//     arCoreController.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Earth 3d'),
//         centerTitle: true,
//       ),
//       body: ArCoreView(
//         onArCoreViewCreated: whenArCoreViewCreated,
//         type: ArCoreViewType.AUGMENTEDIMAGES,
//       ),
//     );
//   }
// }
