import 'package:flutter/material.dart';
import 'package:voxfuture/services/audio_service.dart';

/// Página de exemplo para gravação de voz.
/// Usa `AudioService.instance` (por padrão o `AudioServiceStub`).
class VoicePage extends StatefulWidget {
  const VoicePage({super.key});

  @override
  State<VoicePage> createState() => _VoicePageState();
}

class _VoicePageState extends State<VoicePage> {
  final AudioService _svc = AudioService.instance;
  String? _lastPath;
  bool _loading = true;

  @override
  void initState() {
    super.initState();
    _initSvc();
  }

  Future<void> _initSvc() async {
    await _svc.initialize();
    setState(() {
      _loading = false;
    });
  }

  Future<void> _toggleRecording() async {
    if (_svc.isRecording) {
      final path = await _svc.stopRecording();
      setState(() {
        _lastPath = path;
      });
    } else {
      await _svc.startRecording();
    }
    setState(() {});
  }

  @override
  void dispose() {
    _svc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Voice')),
      body: _loading
          ? const Center(child: CircularProgressIndicator())
          : Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    _svc.isRecording ? 'Gravando...' : 'Pronto para gravar',
                    style: const TextStyle(fontSize: 18),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton.icon(
                    icon: Icon(_svc.isRecording ? Icons.stop : Icons.mic),
                    label: Text(_svc.isRecording ? 'Parar' : 'Gravar'),
                    onPressed: _toggleRecording,
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size(160, 48),
                    ),
                  ),
                  const SizedBox(height: 16),
                  if (_lastPath != null)
                    SelectableText('Último arquivo: $_lastPath'),
                  const SizedBox(height: 8),
                  const Text(
                    'Dica: para usar gravação real, atribua:\nAudioService.instance = AudioServiceRecordImpl();',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 12, color: Colors.grey),
                  ),
                ],
              ),
            ),
    );
  }
}
