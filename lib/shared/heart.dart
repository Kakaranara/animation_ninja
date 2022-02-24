import 'package:flutter/material.dart';

class Heart extends StatefulWidget {
  @override
  _HeartState createState() => _HeartState();
}

class _HeartState extends State<Heart> with TickerProviderStateMixin {

  bool isFav = false;
  AnimationController _controller;
  Animation _colorAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 200),
    );

    _colorAnimation = ColorTween(begin: Colors.grey, end: Colors.red).animate(_controller);

    _controller.addStatusListener((status) {
      if(status == AnimationStatus.completed){
        isFav = true;
      }
      if(status == AnimationStatus.dismissed){
        isFav = false;
      }
    });


  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (BuildContext context, _){
        return IconButton(
          icon: Icon(
            Icons.favorite,
            color: _colorAnimation.value,
            size: 30,
          ),
          onPressed: () {
            isFav ? _controller.reverse() : _controller.forward();
          },
        );
      },
    );
  }
}
