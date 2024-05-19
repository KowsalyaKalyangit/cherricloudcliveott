import 'package:cliveott/utils/colors.dart';
import 'package:cliveott/utils/landscape.dart';
import 'package:flutter/material.dart';
import 'package:flick_video_player/flick_video_player.dart';
import 'package:flutter/services.dart';
import 'package:video_player/video_player.dart';

class SamplePlayer extends StatefulWidget {
  SamplePlayer({Key ?key}) : super(key: key);

  @override
  _SamplePlayerState createState() => _SamplePlayerState();
}

class _SamplePlayerState extends State<SamplePlayer> {
  FlickManager ? flickManager;
  @override
  void initState() {
    super.initState();
    flickManager = FlickManager(
      
      
      videoPlayerController:
 
      
          VideoPlayerController.network("https://60e68b19dd194.streamlock.net:55/madhatv/madhatv.stream_HDp/playlist.m3u8",
          
          
          
          ),
    );
  }

  @override
  void dispose() {
    flickManager!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      backgroundColor: clivecolor,
      ),
      body: Column(
        children: [
          Container(
            height: 300,
            width:500,
            
            child: FlickVideoPlayer(
              
              flickManager: flickManager!,
              flickVideoWithControls: FlickVideoWithControls(
     controls: Lansdscape(),
     ),
                
            ),
          ),
        ],
      ),
    );
  }
}