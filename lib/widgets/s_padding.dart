import 'package:flutter/material.dart';

// ███████ ██ ███    ███ ██████  ██      ███████ 
// ██      ██ ████  ████ ██   ██ ██      ██      
// ███████ ██ ██ ████ ██ ██████  ██      █████   
//      ██ ██ ██  ██  ██ ██      ██      ██      
// ███████ ██ ██      ██ ██      ███████ ███████ 

// ██████   █████  ██████  ██████  ██ ███    ██  ██████  
// ██   ██ ██   ██ ██   ██ ██   ██ ██ ████   ██ ██       
// ██████  ███████ ██   ██ ██   ██ ██ ██ ██  ██ ██   ███ 
// ██      ██   ██ ██   ██ ██   ██ ██ ██  ██ ██ ██    ██ 
// ██      ██   ██ ██████  ██████  ██ ██   ████  ██████  

class SPadding extends StatelessWidget{
  const SPadding({super.key,
    this.child,
    this.padding = 13,
    this.paddingValores,
    this.fim = false,
  });

  final Widget? child;
  final double padding;
  final List<double>? paddingValores;
  final bool fim;

  @override
  Widget build(BuildContext context){
    return Padding(
      padding: EdgeInsets.fromLTRB(
        paddingValores?[0] ?? padding,
        paddingValores?[1] ?? padding,
        paddingValores?[2] ?? padding,
        paddingValores?[3] ?? (fim ? padding : 0),
      ),
      child: child,
    );
  }
}