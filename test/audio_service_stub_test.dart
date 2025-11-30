import 'package:flutter_test/flutter_test.dart';
import 'package:voxfuture/services/audio_service.dart';

void main() {
  test('AudioServiceStub start/stop lifecycle', () async {
    final svc = AudioServiceStub();
    expect(svc.isRecording, isFalse);

    await svc.initialize();
    await svc.startRecording();
    expect(svc.isRecording, isTrue);

    final path = await svc.stopRecording();
    expect(svc.isRecording, isFalse);
    expect(path, isNotNull);
  });
}
