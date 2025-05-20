import 'dart:math';
import 'package:artools/services/conversores.dart';

class CCCPcoordenadas{
  CCCPcoordenadas({this.x, this.y, this.mod, this.angG, this.angR});

  double? x;
  double? y;
  double? mod;
  double? angG;
  double? angR;

  void altX(String str){x = str2double(str);}
  void altY(String str){y = str2double(str);}
  void altMod(String str){mod = str2double(str);}
  void altAngG(String str){angG = str2double(str);}
  void altAngR(String str){angR = str2double(str);}

  void grau2rag(){
    try{angR = 2 * pi * angG! / 360;}
    catch(_){angR = null;}
  }

  void rad2grau(){
    try{angG = angR! * 360 / (2 * pi);}
    catch(_){angG = null;}
  }

  void car2pol(){
    try{
      mod = sqrt(x!*x!+y!*y!);
      angR = asin(y!/mod!);
      angG = angR!*360/(2*pi);
    }catch(_){
      mod = null;
      angR = null;
      angG = null;
    }
  }

  void pol2car(){
    try{
      x = mod! * cos(angR!);
      y = mod! * sin(angR!);
    }catch(_){
      x = null;
      y = null;
    }
  }
}