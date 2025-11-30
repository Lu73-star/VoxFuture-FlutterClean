# VoxFuture-FlutterClean

Breve: app de voz minimal em Flutter (Android-first). Este README documenta como ativar gravação local, permissões e testes rápidos.

## Rodando localmente

Instale dependências e execute em um dispositivo/emulador:

```bash
flutter pub get
flutter run
```

Para builds de release:

```bash
flutter build appbundle --release
flutter build apk --release --split-per-abi
```

## Testes

Unit e widget tests:

```bash
flutter test
```

## Gravação de áudio

O projeto inclui um stub (funciona sem dependências nativas) e uma implementação mínima com o plugin `record`.

- Stub: `lib/services/audio_service.dart` (padrão: `AudioService.instance = AudioServiceStub();`).
- Implementação real: `lib/services/audio_service_record_impl.dart` (usa `package:record`).

Para ativar a gravação real (em `lib/main.dart` ou antes de chamar `runApp`):

```dart
import 'package:flutter/material.dart';
import 'package:voxfuture/services/audio_service_record_impl.dart';
import 'package:voxfuture/services/audio_service.dart';

Future<void> main() async {
	WidgetsFlutterBinding.ensureInitialized();
	AudioService.instance = AudioServiceRecordImpl();
	await AudioService.instance.initialize();
	runApp(const VoxFutureApp());
}
```

### Android

- O `AndroidManifest.xml` já inclui permissões: `RECORD_AUDIO` e `MODIFY_AUDIO_SETTINGS`.
- Em tempo de execução é preciso solicitar permissão ao usuário — o plugin `record` pode pedir automaticamente, ou use `permission_handler` para controle explícito.

Exemplo rápido (via `record`): o serviço chama `await Record.hasPermission()` antes de iniciar.

### iOS

- Caso adicione suporte iOS, inclua em `ios/Runner/Info.plist` a chave `NSMicrophoneUsageDescription` com uma mensagem para o usuário.

## Como o código está organizado

- `lib/main.dart` — app root, rota `/voice` adicionada para abrir a página de gravação.
- `lib/features/voice/voice_page.dart` — UI de exemplo (gravar/parar) que usa `AudioService.instance`.
- `lib/services/audio_service.dart` — interface + `AudioServiceStub`.
- `lib/services/audio_service_record_impl.dart` — implementação baseada em `record`.

## CI / Scripts

- `scripts/setup` — script que gera `codemagic.yaml`, configura Android/iOS e cria scripts de verificação.
- Após rodar `scripts/setup`, verifique com:

```bash
./scripts/verify_build_setup.sh
```

## Dicas rápidas

- Para desenvolvimento rápido sem permissões/AVD, use o stub (padrão).
- Antes de publicar, substitua `signingConfig signingConfigs.debug` no Gradle por sua configuração de release.

