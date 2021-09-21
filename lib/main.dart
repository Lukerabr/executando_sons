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
  bool primeiraExecucao = true;


  _executar_local() async {
    if(primeiraExecucao){
      audioPlayer = await audioCache.play("musica.mp3");
      primeiraExecucao = false;
    }else{
      audioPlayer.resume();
    }

  }

  _pausar_local() async {
    int resultado = await audioPlayer.pause();
    if(resultado == 1){
      //sucesso
    }else{
    }
  }

  _parar_local() async {

    int resultado = await audioPlayer.stop();
    if(resultado == 1){
      //sucesso
    }else{
    }

  }


  _executar_url() async {
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

    return Scaffold(
      appBar: AppBar(
        title: Text("Executando sons"),
      ),
      body: Column(
        children: [
          //Slider
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              Padding(
                  padding: EdgeInsets.all(8),
                child: GestureDetector(
                  child: Image.asset("assets/imagens/executar.png"),
                  onTap: (){
                    _executar_local();
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.all(8),
                child: GestureDetector(
                  child: Image.asset("assets/imagens/pausar.png"),
                  onTap: (){
                    _pausar_local();
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.all(8),
                child: GestureDetector(
                  child: Image.asset("assets/imagens/parar.png"),
                  onTap: (){
                    _parar_local();
                  },
                ),
              )



            ],
          )
        ],
      ),
    );
  }
}
