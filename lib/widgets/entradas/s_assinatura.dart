// import 'package:flutter/material.dart';
// import 'package:signature/signature.dart';

// // ███████ ██ ███    ███ ██████  ██      ███████ 
// // ██      ██ ████  ████ ██   ██ ██      ██      
// // ███████ ██ ██ ████ ██ ██████  ██      █████   
// //      ██ ██ ██  ██  ██ ██      ██      ██      
// // ███████ ██ ██      ██ ██      ███████ ███████ 

// //  █████  ███████ ███████ ██ ███    ██  █████  ████████ ██    ██ ██████   █████  
// // ██   ██ ██      ██      ██ ████   ██ ██   ██    ██    ██    ██ ██   ██ ██   ██ 
// // ███████ ███████ ███████ ██ ██ ██  ██ ███████    ██    ██    ██ ██████  ███████ 
// // ██   ██      ██      ██ ██ ██  ██ ██ ██   ██    ██    ██    ██ ██   ██ ██   ██ 
// // ██   ██ ███████ ███████ ██ ██   ████ ██   ██    ██     ██████  ██   ██ ██   ██ 

// class SAssinatura extends StatefulWidget{
//   const SAssinatura(
//     this.ass,
//     {
//       super.key,
//       this.ttl = 'Assinatura',
//       this.sttl = '',
//     }
//   );

//   final SignatureController ass;
//   final String ttl;
//   final String sttl;

//   @override
//   State<SAssinatura> createState() => _SimplePState();
// }

// class _SimplePState extends State<SAssinatura>{
//   void _limparAss(){
//     setState(() {
//       widget.ass.clear();
//     });
//   }

//   @override
//   Widget build(BuildContext context){
//     return Column(children: [
//       TextButton.icon(onPressed: _limparAss, label: Text(widget.ttl), icon: const Icon(Icons.delete)),
//       AspectRatio(aspectRatio: 2, child: Container(
//         decoration: BoxDecoration(border: Border.all(width: 1.5), borderRadius: BorderRadius.circular(31)),
//         child: ClipRRect(borderRadius: BorderRadius.circular(31), child: Signature(
//           controller: widget.ass,
//           backgroundColor: widget.ass.isEmpty ? Colors.grey.shade300 : Colors.yellow.shade200,
//         )),
//       )),
//       Text(widget.sttl, textAlign: TextAlign.center),
//     ]);
//   }
// }