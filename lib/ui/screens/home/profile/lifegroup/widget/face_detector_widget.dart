import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

import 'face_painters_widget.dart';


class FaceDetectorWidget extends StatelessWidget {
  const FaceDetectorWidget({
    Key key,
    @required  scanResults,
    @required CameraController camera,
  }) : _scanResults = scanResults, _camera = camera, super(key: key);

  final  _scanResults;
  final CameraController _camera;

  @override
  Widget build(BuildContext context) {
    const Text noResultsText = const Text('');
    if (_scanResults == null ||
        _camera == null ||
        !_camera.value.isInitialized) {
      return noResultsText;
    }
    CustomPainter painter;

    final Size imageSize = Size(
      _camera.value.previewSize.height,
      _camera.value.previewSize.width,
    );
    painter = FaceDetectorPainter(imageSize, _scanResults);
    return CustomPaint(
      painter: painter,
    );
  }
}