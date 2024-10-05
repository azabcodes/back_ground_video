import 'package:flutter/material.dart';

import 'package:video_player/video_player.dart';

void main() {
  runApp(const BackgroundVideo());
}

class BackgroundVideo extends StatefulWidget {
  const BackgroundVideo({super.key});

  @override
  State<BackgroundVideo> createState() => _BackgroundVideoState();
}

class _BackgroundVideoState extends State<BackgroundVideo> {
  VideoPlayerController? _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset("assets/back_video.mp4")
      ..initialize().then((_) {
        _controller!.play();
        _controller!.setLooping(true);
        setState(() {});
      });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.red,
          title: const Text(
            'Mahmoud Azab',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Stack(
              children: <Widget>[
                SizedBox.expand(
                  child: FittedBox(
                    fit: BoxFit.fill,
                    child: SizedBox(
                      width: _controller?.value.size.width ?? 0,
                      height: _controller?.value.size.height ?? 0,
                      child: VideoPlayer(_controller!),
                    ),
                  ),
                ),
                const LoginWidget()
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller!.dispose();
  }
}

class LoginWidget extends StatelessWidget {
  const LoginWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Center(
          child: Container(
            width: 200,
            height: 200,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: AssetImage("assets/logo.jpg"),
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 50.0,
        ),
        Container(
          decoration: BoxDecoration(
            color: Colors.white.withAlpha(200),
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(10.0),
              topRight: Radius.circular(10.0),
              bottomLeft: Radius.circular(10.0),
              bottomRight: Radius.circular(10.0),
            ),
          ),
          padding: const EdgeInsets.all(16),
          width: 300,
          height: 300,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              TextFormField(
                cursorColor: const Color(0xffb55e28),
                decoration: const InputDecoration(
                  hintText: 'Username',
                ),
              ),
              TextFormField(
                cursorColor: const Color(0xffb55e28),
                decoration: const InputDecoration(
                  hintText: 'Password',
                ),
              ),
              TextFormField(
                cursorColor: const Color(0xffb55e28),
                decoration: const InputDecoration(
                  hintText: 'Confirm Password',
                ),
              ),
              ButtonTheme(
                minWidth: 300.0,
                child: MaterialButton(
                  color: Colors.red,
                  child: const Text(
                    'Login',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                  onPressed: () {},
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
