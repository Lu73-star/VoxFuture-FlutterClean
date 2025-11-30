import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:voxfuture/features/voice/voice_page.dart';
import 'package:voxfuture/services/audio_service.dart';

void main() {
  testWidgets('VoicePage builds and toggles recording (stub)',
      (WidgetTester tester) async {
    // Ensure stub is used
    AudioService.instance = AudioServiceStub();

    await tester.pumpWidget(const MaterialApp(home: VoicePage()));

    // Wait for initialization
    await tester.pumpAndSettle();

    expect(find.text('Pronto para gravar'), findsOneWidget);

    // Tap the record button
    final recordButton = find.byType(ElevatedButton);
    expect(recordButton, findsOneWidget);
    await tester.tap(recordButton);
    await tester.pumpAndSettle();

    // Now it should show Gravando... (stub toggles state)
    expect(find.text('Gravando...'), findsOneWidget);

    // Tap to stop
    await tester.tap(recordButton);
    await tester.pumpAndSettle();

    // After stopping, should show Pronto para gravar and a last path
    expect(find.text('Pronto para gravar'), findsOneWidget);
    expect(find.textContaining('Último arquivo:'), findsOneWidget);
  });
}
