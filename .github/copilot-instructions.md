# Instruções para agentes (Copilot)

Visão rápida: aplicativo de voz construído com Flutter; atualmente minimalista e focado em Android. Use `lib/main.dart` como ponto de partida.

**Arquivos-chave**
- `lib/main.dart` — app root, tema e tela inicial.
- `android/` — configuração Android (namespace `com.voxfuture.app`, `compileSdk 34`).
- `android/app/src/main/AndroidManifest.xml` — permissões de áudio e `usesCleartextTraffic`.
- `scripts/setup` — script que gera `codemagic.yaml`, arquivos Android/iOS e scripts de verificação.
- `pubspec.yaml` — dependências mínimas (Flutter, `cupertino_icons`).

**Como começar (rápido)**
```bash
flutter pub get
flutter run            # emulador ou dispositivo conectado
flutter build appbundle --release
flutter build apk --release --split-per-abi
```

**Fluxos importantes**
- CI/CD: `scripts/setup` cria `codemagic.yaml` com workflows para Android (AAB/APKs) e iOS (quando existir).
- Debug: `flutter run -d <device>`; use `flutter logs` e `adb logcat` para problemas nativos.

**Padrões e convenções locais**
- Código atual é minimalista: prefira `const` para widgets e construtores (`const VoxFutureApp({super.key})`).
- Siga as lints em `analysis_options.yaml` (base `flutter_lints`).
- Evite alterar `android/` sem atualizar `scripts/setup`, que pode sobrescrever arquivos gerados.

**Visão geral (big picture)**
- Arquitetura atual: app minimal em `lib/main.dart`. Não há módulos/serviços separados — espera-se criar `lib/features/` e `lib/services/` ao expandir.
- Razão do layout atual: repo é um MVP/poC focado em integrar gravação/IA; o `scripts/setup` automatiza geração de infra (Android/iOS + CI) para reduzir fricção.

**Comandos e fluxos não óbvios**
- Regenerar plataforma (quando indicado pelo `scripts/setup`):
```bash
./scripts/setup        # cria/atualiza android/, ios/, codemagic.yaml e scripts auxiliares
```
- Verificação (após rodar `scripts/setup`):
```bash
./scripts/verify_build_setup.sh
```
- Logs e debug nativo:
```bash
flutter logs
adb logcat -s FlutterActivity
```

**Referências rápidas no código**
- Tema e tela inicial: `lib/main.dart` (`VoxFutureApp`, `VoxFutureHome`).
- Android config: `android/build.gradle` e `android/app/src/main/AndroidManifest.xml` (permissões `RECORD_AUDIO`, `MODIFY_AUDIO_SETTINGS`, etc.).
- Main activity: `android/app/src/main/kotlin/com/voxfuture/app/MainActivity.kt` (Flutter embedding v2).

**Riscos / pontos de atenção**
- `scripts/setup` pode sobrescrever arquivos em `android/` e `ios/` — faça backup antes de mudanças manuais.
- Release builds usam `signingConfig signingConfigs.debug` atualmente; substitua por configuração de release antes de publicar.

**Integrações e pontos de atenção**
- Permissões de áudio: `RECORD_AUDIO`, `MODIFY_AUDIO_SETTINGS` estão no `AndroidManifest`.
- Assinatura: builds de release usam `signingConfig signingConfigs.debug` no Gradle (trocar para configuração de release ao preparar produção).
- iOS: estrutura não existe por pad
ão; `scripts/setup` pode gerar os arquivos necessários.

**Onde alterar para expandir**
- Ao adicionar recursos: crie `lib/features/<feature>/` e coloque widgets, serviços e testes lá.
- Serviços de áudio/IA devem viver em `lib/services/` e ser injetáveis para facilitar testes.

**Checklist rápido para PRs**
- `flutter analyze` passa e lints não ficam desabilitados sem justificativa.
- `flutter pub get` atualiza e `pubspec.yaml` versione pacotes apropriadamente.
- Não quebrar `scripts/setup` ou sobrescrever configurações de CI sem coordenação.
**Checklist rápido para PRs**
- `flutter analyze` passa e lints não ficam desabilitados sem justificativa.
- `flutter pub get` atualiza e `pubspec.yaml` versione pacotes apropriadamente.
- Não quebrar `scripts/setup` ou sobrescrever configurações de CI sem coordenação.

**PR Checklist (recomendado antes de abrir PR)**
- **Lint & Test:** rode `flutter analyze` e `flutter test` localmente; corrija falhas.
- **Deps:** se alterar `pubspec.yaml`, atualize a documentação (`README.md`) e explique a razão no PR.
- **Android/iOS:** verifique `AndroidManifest.xml`/`Info.plist` se tocar permissões ou configuração nativa.
- **Não sobrescrever:** evite commits que substituam arquivos gerados por `scripts/setup` sem aviso; faça backup ou comente no PR.
- **Descrição do PR:** inclua resumo curto, mudanças principais e instruções de teste rápido.

**Commit & Branch conventions**
- Use **Conventional Commits** para mensagens de commit — exemplos: `feat:`, `fix:`, `chore:`.
- Nomeie branches com escopo e propósito, ex.: `feat/voice-audio`, `fix/android-manifest`.
- Inclua no corpo do commit referências a tickets/issue quando aplicável.

Se algo estiver faltando (ex.: detalhes do fluxo de voz/IA), diga o que quer que eu documente e eu atualizo estas instruções.
# Instruções para agentes (Copilot)

Visão rápida: aplicativo de voz construído com Flutter; atualmente minimalista e focado em Android. Use `lib/main.dart` como ponto de partida.

**Arquivos-chave**
- `lib/main.dart` — app root, tema e tela inicial.
- `android/` — configuração Android (namespace `com.voxfuture.app`, `compileSdk 34`).
- `android/app/src/main/AndroidManifest.xml` — permissões de áudio e `usesCleartextTraffic`.
- `scripts/setup` — script que gera `codemagic.yaml`, arquivos Android/iOS e scripts de verificação.
- `pubspec.yaml` — dependências mínimas (Flutter, `cupertino_icons`).

**Como começar (rápido)**
```bash
flutter pub get
flutter run            # emulador ou dispositivo conectado
flutter build appbundle --release
flutter build apk --release --split-per-abi
```

**Fluxos importantes**
- CI/CD: `scripts/setup` cria `codemagic.yaml` com workflows para Android (AAB/APKs) e iOS (quando existir).
- Debug: `flutter run -d <device>`; use logs `flutter logs` e `adb logcat` para problemas nativos.

**Padrões e convenções locais**
- Código atual é minimalista: prefira `const` para widgets e construtores (`const VoxFutureApp({super.key})`).
- Siga as lints em `analysis_options.yaml` (base `flutter_lints`).
- Evite alterar `android/` sem atualizar `scripts/setup`, que pode sobrescrever arquivos gerados.

**Integrações e pontos de atenção**
- Permissões de áudio: `RECORD_AUDIO`, `MODIFY_AUDIO_SETTINGS` estão no `AndroidManifest`.
- Assinatura: builds de release usam `signingConfig signingConfigs.debug` no Gradle (trocar para configuração de release ao preparar produção).
- iOS: estrutura não existe por padrão; `scripts/setup` pode gerar os arquivos necessários.

**Onde alterar para expandir**
- Ao adicionar recursos: crie `lib/features/<feature>/` e coloque widgets, serviços e testes lá.
- Serviços de áudio/IA devem viver em `lib/services/` e ser injetáveis para facilitar testes.

**Checklist rápido para PRs**
- `flutter analyze` passa e lints não ficam desabilitados sem justificativa.
- `flutter pub get` atualiza e `pubspec.yaml` versione pacotes apropriadamente.
- Não quebrar `scripts/setup` ou sobrescrever configurações de CI sem coordenação.

Se algo estiver faltando (ex.: detalhes do fluxo de voz/IA), diga o que quer que eu documente e eu atualizo estas instruções.
