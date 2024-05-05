import 'package:agora_uikit/agora_uikit.dart';
import 'package:flutter/material.dart';

class VideoCall extends StatefulWidget {
  const VideoCall({super.key});

  @override
  State<VideoCall> createState() => _VideoCallState();
}

class _VideoCallState extends State<VideoCall> {
  final appId = '651ee7a78a25439998d94e51275e51ef';
  final String channelName = 'consulta';
  final String token = '007eJxTYAjS//djSvbTzaKd2zf83zH1ntK3fJGQ5oMijo11+60PTb6iwGBmapiaap5obpFoZGpibGlpaZFiaZJqamhkbgokU9NqHpmlNQQyMjz9psvCyACBID4HQ3J+XnFpTkkiAwMAmIIjlg==';
  final int uid = 10; // u

  late AgoraClient client;

  @override
  void initState() {
    super.initState();

    client = AgoraClient(
      agoraConnectionData: AgoraConnectionData(
        appId: appId,
        channelName: channelName,
        tempToken: token,
        uid: uid,
      ),
    );

    initAgora();
  }

  void initAgora() async {
    await client.initialize();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Agora UI Kit'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Stack(
          children: [
            AgoraVideoViewer(
              client: client,
              layoutType: Layout.oneToOne,
              enableHostControls: true, // Add this to enable host controls
            ),
            AgoraVideoButtons(
              client: client,
            ),
          ],
        ),
      ),
    );
  }
}
