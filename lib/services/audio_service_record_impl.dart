import 'dart:io';
import 'package:record/record.dart';
import 'audio_service.dart';

/// Implementation of [AudioService] using the `record` plugin.
///
/// Notes:
/// - Requires runtime permissions for microphone on Android/iOS.
/// - This implementation writes a WAV file to the system temp directory.

class AudioServiceRecordImpl implements AudioService {
  final Record _rec = Record();
  bool _recording = false;
  String? _lastPath;

  @override
  Future<void> initialize() async {
    // No heavy initialization required for `record`, but keep hook.
    return;
  }

  @override
  bool get isRecording => _recording;

  @override
  Future<void> startRecording() async {
    if (_recording) return;

    // Check permission
    final hasPermission = await _rec.hasPermission();
    if (!hasPermission) {
      throw Exception('Microphone permission not granted');
    }

    final tmpDir = Directory.systemTemp;
    final fileName = 'voxfuture_${DateTime.now().millisecondsSinceEpoch}.wav';
    final path = tmpDir.uri.resolve(fileName).toFilePath();

    await _rec.start(
      path: path,
      encoder: AudioEncoder.wav,
      bitRate: 128000,
    );

    _recording = true;
    _lastPath = null;
  }

  @override
  Future<String?> stopRecording() async {
    if (!_recording) return _lastPath;
    final path = await _rec.stop();
    _recording = false;
    _lastPath = path;
    return _lastPath;
  }

  @override
  Future<void> dispose() async {
    if (_recording) {
      await stopRecording();
    }
  }
}

// To use in the app, assign:
// AudioService.instance = AudioServiceRecordImpl();
