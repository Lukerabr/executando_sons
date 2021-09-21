import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';


void main() {
  runApp(MaterialApp(
    home: Home(),
  ));
}


class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  AudioPlayer audioPlayer = AudioPlayer();
  AudioCache audioCache = AudioCache(prefix: "audios/");


  _executar_local() async {

    audioPlayer = await audioCache.play("musica.mp3");

  }

  _executar_player() async {
    String url = "https://www.soundhelix.com/examples/mp3/SoundHelix-Song-1.mp3";
    int resultado = await audioPlayer.play(url);

    if(resultado == 1){
      //sucesso
    }else{

    }

  }



  @override
  Widget build(BuildContext context) {

    //_executar_player();

    return Container();
  }
}
