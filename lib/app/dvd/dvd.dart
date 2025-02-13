import 'package:flutter/material.dart';

class DVD extends StatefulWidget {
  const DVD({super.key});

  @override
  State<DVD> createState() => _DVDState();
}

class _DVDState extends State<DVD> with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  double px = 0;
  double vx = 5;

  double py = 0;
  double vy = 5;

  double t_ = -1;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: Duration(seconds: 1),
      vsync: this,
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('DVD'), centerTitle: true),
      // backgroundColor: Colors.black,
      body: AnimatedBuilder(
        animation: _controller,
        child: Image.asset('assets/images/Logo.png', height: 131, width: 131),
        builder: (context, child) {
          _calculatePosition();
          return Transform.translate(offset: Offset(px, py), child: child);
        },
      ),
    );
  }

  void _calculatePosition(){
    // print(_controller.value);

    final Size screenSize = MediaQuery.of(context).size;
    
    if(t_ > _controller.value){
      // print('width x height');
      // print('${screenSize.width} x ${screenSize.height}');
      // print('${px} x ${py}');
      // print('${px += vx} x ${py += vy}');

      if(vx > 0 && px + vx > screenSize.width){vx *= -1;}
      if(vx < 0 && px + vx < screenSize.width){vx *= -1;}

      if(vy > 0 && py + vy > screenSize.height){vy *= -1;}
      if(vy < 0 && py + vy < screenSize.height){vy *= -1;}

      px += vx;
      py += vy;
    }
    t_ = _controller.value;
    
    // print(px);
  }
}