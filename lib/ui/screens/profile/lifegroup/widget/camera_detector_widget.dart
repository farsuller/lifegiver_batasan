import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

import 'face_detector_widget.dart';

class CameraDetectorWidget extends StatelessWidget {
  const CameraDetectorWidget({
    Key key,
    @required CameraController camera,
    @required scanResults,
  })  : _camera = camera,
        _scanResults = scanResults,
        super(key: key);

  final CameraController _camera;

  final _scanResults;

  @override
  Widget build(BuildContext context) {
    if (_camera == null || !_camera.value.isInitialized) {
      return Center(
        child: CircularProgressIndicator(),
      );
    }

    return Container(
      constraints: const BoxConstraints.expand(),
      child: _camera == null
          ? Center(
              child: SizedBox(
              width: 300,
              height: 100,
              child: Image.asset('assets/lifegiver_logo.jpg'),
            ))
          : Stack(
              fit: StackFit.expand,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Center(
                    child: AspectRatio(
                        aspectRatio: _camera.value.aspectRatio * 1,
                        child: CameraPreview(_camera)),
                  ),
                ),
                FaceDetectorWidget(scanResults: _scanResults, camera: _camera),
              ],
            ),
    );
  }
}
