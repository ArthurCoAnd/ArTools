import 'package:flutter/material.dart';

class INTER extends StatefulWidget{
  const INTER({super.key});

  @override
  INTERState createState() => INTERState();
}

class INTERState extends State<INTER>{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(title: const Text('INTER')),
      body: Container(
        height: MediaQuery.of(context).size.height, width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(image: DecorationImage(image: AssetImage('assets/images/estádios/BeiraRio.jpg'), fit: BoxFit.cover)),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(13, 13, 13, 0),
                child: Image.asset('assets/images/escudos/Inter.png', height: 131, width: 131),
              ),
              const Padding(padding: EdgeInsets.fromLTRB(13, 13, 13, 0)),
            ],
          ),
        ),
      ),
    );
  }
}