import 'package:flutter/material.dart';

class AMERICA extends StatefulWidget{
  const AMERICA({super.key});

  @override
  AMERICAState createState() => AMERICAState();
}

class AMERICAState extends State<AMERICA>{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(title: const Text('AMÉRICA')),
      body: Container(
        height: MediaQuery.of(context).size.height, width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(image: DecorationImage(image: AssetImage('assets/images/estádios/Independência.jpg'), fit: BoxFit.cover)),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(13, 13, 13, 0),
                child: Image.asset('assets/images/escudos/América.png', height: 131, width: 131),
              ),
              const Padding(padding: EdgeInsets.fromLTRB(13, 13, 13, 0)),
            ],
          ),
        ),
      ),
    );
  }
}