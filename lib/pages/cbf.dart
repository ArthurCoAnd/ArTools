import 'package:flutter/material.dart';

class CBF extends StatefulWidget{
  const CBF({super.key});

  @override
  CBFState createState() => CBFState();
}

class CBFState extends State<CBF>{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(title: const Text('Estados Brasileiros')),
      body: Container(
        height: MediaQuery.of(context).size.height, width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(image: DecorationImage(image: AssetImage('assets/images/Brasil.jpg'), fit: BoxFit.cover)),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(13, 13, 13, 0),
                child: Image.asset('assets/images/escudos/CBF.png', height: 131, width: 131),
              ),
              const Padding(padding: EdgeInsets.fromLTRB(13, 13, 13, 0)),
            ],
          ),
        ),
      ),
    );
  }
}