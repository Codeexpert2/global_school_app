import 'dart:io';

import 'package:ar_flutter_plugin_updated/datatypes/config_planedetection.dart';
import 'package:ar_flutter_plugin_updated/managers/ar_anchor_manager.dart';
import 'package:ar_flutter_plugin_updated/managers/ar_location_manager.dart';
import 'package:ar_flutter_plugin_updated/managers/ar_object_manager.dart';
import 'package:ar_flutter_plugin_updated/managers/ar_session_manager.dart';
import 'package:ar_flutter_plugin_updated/models/ar_node.dart';
import 'package:ar_flutter_plugin_updated/widgets/ar_view.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:vector_math/vector_math_64.dart';
import 'dart:math';
import 'package:path_provider/path_provider.dart';

class LocalAndWebObjectsWidget extends StatefulWidget {
  const LocalAndWebObjectsWidget({super.key});
  @override
  State<LocalAndWebObjectsWidget> createState() =>
      _LocalAndWebObjectsWidgetState();
}

class _LocalAndWebObjectsWidgetState extends State<LocalAndWebObjectsWidget> {
  late ARSessionManager arSessionManager;
  late ARObjectManager arObjectManager;
  //String localObjectReference;
  ARNode? localObjectNode;
  //String webObjectReference;
  ARNode? webObjectNode;
  ARNode? fileSystemNode;
  late HttpClient httpClient;

  @override
  void dispose() {
    super.dispose();
    arSessionManager.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Local & Web Objects'),
        ),
        body: Stack(children: [
          ARView(
            onARViewCreated: onARViewCreated,
            planeDetectionConfig: PlaneDetectionConfig.horizontalAndVertical,
          ),
          Align(
              alignment: FractionalOffset.bottomCenter,
              child:
                  Column(mainAxisAlignment: MainAxisAlignment.end, children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      onPressed: onFileSystemObjectAtOriginButtonPressed,
                      child:
                          const Text('Add/Remove Filesystem\nObject at Origin'),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      onPressed: onLocalObjectAtOriginButtonPressed,
                      child: const Text('Add/Remove Local\nObject at Origin'),
                    ),
                    ElevatedButton(
                      onPressed: onWebObjectAtOriginButtonPressed,
                      child: const Text('Add/Remove Web\nObject at Origin'),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      onPressed: onLocalObjectShuffleButtonPressed,
                      child: const Text('Shuffle Local\nobject at Origin'),
                    ),
                    ElevatedButton(
                      onPressed: onWebObjectShuffleButtonPressed,
                      child: const Text('Shuffle Web\nObject at Origin'),
                    ),
                  ],
                )
              ]))
        ]));
  }

  void onARViewCreated(
      ARSessionManager arSessionManager,
      ARObjectManager arObjectManager,
      ARAnchorManager arAnchorManager,
      ARLocationManager arLocationManager) {
    this.arSessionManager = arSessionManager;
    this.arObjectManager = arObjectManager;

    this.arSessionManager.onInitialize(
          showFeaturePoints: false,
          showPlanes: true,
          customPlaneTexturePath: 'Images/triangle.png',
          showWorldOrigin: true,
          handleTaps: false,
        );
    this.arObjectManager.onInitialize();

    //Download model to file system
    httpClient = HttpClient();
    _downloadFile(
        'https://firebasestorage.googleapis.com/v0/b/stridenseek.appspot.com/o/files%2FAR_Models%2FAlien.glb?alt=media&token=fffd9db1-dcc5-4dae-bb1f-95d7ea867817',
        'Alien.glb');
    // Alternative to use type fileSystemAppFolderGLTF2:
    //_downloadAndUnpack(
    //    "https://drive.google.com/uc?export=download&id=1fng7yiK0DIR0uem7XkV2nlPSGH9PysUs",
    //    "Chicken_01.zip");
  }

  Future<File> _downloadFile(String url, String filename) async {
    var request = await httpClient.getUrl(Uri.parse(url));
    var response = await request.close();
    var bytes = await consolidateHttpClientResponseBytes(response);
    String dir = (await getApplicationDocumentsDirectory()).path;
    File file = File('$dir/$filename');
    await file.writeAsBytes(bytes);
    print('Downloading finished, path: ' '$dir/$filename');
    return file;
  }

  Future<void> _downloadAndUnpack(String url, String filename) async {
    var request = await httpClient.getUrl(Uri.parse(url));
    var response = await request.close();
    var bytes = await consolidateHttpClientResponseBytes(response);
    String dir = (await getApplicationDocumentsDirectory()).path;
    File file = File('$dir/$filename');
    await file.writeAsBytes(bytes);
    print('Downloading finished, path: ' '$dir/$filename');

    // To print all files in the directory: print(Directory(dir).listSync());
    try {
      print('$dir/$filename');

      throw 'no Unzipping ';

      // await ZipFile.extractToDirectory(
      //     zipFile: File('$dir/$filename'), destinationDir: Directory(dir));
      print('Unzipping successful');
    } catch (e) {
      print('Unzipping failed: $e');
    }
  }

  Future<void> onLocalObjectAtOriginButtonPressed() async {
    arObjectManager.removeNode(localObjectNode!);
    localObjectNode = null;
  }

  Future<void> onWebObjectAtOriginButtonPressed() async {
    arObjectManager.removeNode(webObjectNode!);
    webObjectNode = null;
  }

  Future<void> onFileSystemObjectAtOriginButtonPressed() async {
    arObjectManager.removeNode(fileSystemNode!);
    fileSystemNode = null;
  }

  Future<void> onLocalObjectShuffleButtonPressed() async {
    var newScale = Random().nextDouble() / 3;
    var newTranslationAxis = Random().nextInt(3);
    var newTranslationAmount = Random().nextDouble() / 3;
    var newTranslation = Vector3(0, 0, 0);
    newTranslation[newTranslationAxis] = newTranslationAmount;
    var newRotationAxisIndex = Random().nextInt(3);
    var newRotationAmount = Random().nextDouble();
    var newRotationAxis = Vector3(0, 0, 0);
    newRotationAxis[newRotationAxisIndex] = 1.0;

    final newTransform = Matrix4.identity();

    newTransform.setTranslation(newTranslation);
    newTransform.rotate(newRotationAxis, newRotationAmount);
    newTransform.scale(newScale);

    localObjectNode?.transform = newTransform;
  }

  Future<void> onWebObjectShuffleButtonPressed() async {
    var newScale = Random().nextDouble() / 3;
    var newTranslationAxis = Random().nextInt(3);
    var newTranslationAmount = Random().nextDouble() / 3;
    var newTranslation = Vector3(0, 0, 0);
    newTranslation[newTranslationAxis] = newTranslationAmount;
    var newRotationAxisIndex = Random().nextInt(3);
    var newRotationAmount = Random().nextDouble();
    var newRotationAxis = Vector3(0, 0, 0);
    newRotationAxis[newRotationAxisIndex] = 1.0;

    final newTransform = Matrix4.identity();

    newTransform.setTranslation(newTranslation);
    newTransform.rotate(newRotationAxis, newRotationAmount);
    newTransform.scale(newScale);

    webObjectNode?.transform = newTransform;
  }
}
