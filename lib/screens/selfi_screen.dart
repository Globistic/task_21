import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class SelfieScreen extends StatefulWidget {
  @override
  _SelfieScreenState createState() => _SelfieScreenState();
}

class _SelfieScreenState extends State<SelfieScreen> {
  late CameraController _cameraController;
  late Future<void> _initializeControllerFuture;
  bool _isCameraReady = false;
  bool _isTakingSelfie = false;

  @override
  void initState() {
    super.initState();

    // Get the list of available cameras.
    availableCameras().then((cameras) {
      if (cameras.isNotEmpty) {
        // Use the first available camera.
        _cameraController = CameraController(
          cameras[0],
          ResolutionPreset.high,
          enableAudio: false,
        );

        // Initialize the controller.
        _initializeControllerFuture = _cameraController.initialize();

        // Notify when the camera is ready.
        _initializeControllerFuture.then((_) {
          setState(() {
            _isCameraReady = true;
          });
        });
      }
    });
  }

  @override
  void dispose() {
    _cameraController.dispose();
    super.dispose();
  }

  Future<void> _takeSelfie() async {
    // Prevent taking multiple selfies.
    if (_isTakingSelfie) {
      return;
    }

    setState(() {
      _isTakingSelfie = true;
    });

    try {
      // Wait for the camera to be ready.
      await _initializeControllerFuture;

      // Take the picture.
      final image = await _cameraController.takePicture();

      // Navigate to the next screen with the selfie image.
      Navigator.pushNamed(
        context,
        '/next_screen',
        arguments: {'selfie': File(image.path)},
      );
    } catch (e) {
      print('Error taking selfie: $e');
    } finally {
      setState(() {
        _isTakingSelfie = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Take a Selfie'),
      ),
      body: Stack(
        children: [
          // Show the camera preview.
          _isCameraReady
              ? CameraPreview(_cameraController)
              : const Center(child: CircularProgressIndicator()),

          // Show the face positioning box.
          Align(
            alignment: Alignment.center,
            child: Container(
              width: MediaQuery.of(context).size.width * 0.6,
              height: MediaQuery.of(context).size.width * 0.8,
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.white,
                  width: 2,
                ),
              ),
            ),
          ),

          // Show the take selfie button.
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: FloatingActionButton(
                backgroundColor: Colors.white,
                child: _isTakingSelfie
                    ? const CircularProgressIndicator()
                    : const Icon(Icons.camera_alt, color: Colors.black),
                onPressed: _takeSelfie,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
