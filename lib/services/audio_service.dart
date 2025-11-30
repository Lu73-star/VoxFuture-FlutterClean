/// AudioService: interface e stub para gravação de áudio.
///
/// Propósito: fornecer uma API mínima que agentes e desenvolvedores possam
/// implementar/integrar com plugins reais (ex.: `record`, `flutter_sound`).
///
/// Uso recomendado:
/// - Substituir `AudioService.instance` por uma implementação real durante
///   integração (ex.: `AudioServiceRecordImpl`).
/// - Implementar tratamento de permissões em plataforma antes de gravar.

import 'dart:async';

abstract class AudioService {
  /// Inicializa recursos nativos se necessário.
  Future<void> initialize();

  /// Inicia gravação. Lance uma exceção se permissões não concedidas.
  Future<void> startRecording();

  /// Para a gravação e retorna o caminho do arquivo gravado (ou null).
  Future<String?> stopRecording();

  /// Se há uma gravação em progresso.
  bool get isRecording;

  /// Limpa recursos.
  Future<void> dispose();

  /// Instância padrão (stub). Troque por implementação real em runtime.
  static AudioService instance = AudioServiceStub();
}

/// Implementação stub usada durante desenvolvimento inicial e testes.
class AudioServiceStub implements AudioService {
  bool _recording = false;
  String? _lastPath;

  @override
  Future<void> initialize() async {
    // TODO: Inicializar canais nativos / plugins (ex.: Record.hasPermission())
    return Future.value();
  }

  @override
  Future<void> startRecording() async {
    if (_recording) return;
    // Simula atraso e começa gravação de mentira.
    _recording = true;
    _lastPath = null;
    await Future.delayed(const Duration(milliseconds: 150));
  }

  @override
  Future<String?> stopRecording() async {
    if (!_recording) return _lastPath;
    // Simula finalização e retorna um caminho fictício.
    await Future.delayed(const Duration(milliseconds: 150));
    _recording = false;
    _lastPath = 'tmp/voxfuture_recording_${DateTime.now().millisecondsSinceEpoch}.wav';
    return _lastPath;
  }

  @override
  bool get isRecording => _recording;

  @override
  Future<void> dispose() async {
    _recording = false;
    _lastPath = null;
  }
}

// Exemplo de como trocar para implementação real:
// AudioService.instance = AudioServiceRecordImpl();
