// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';

// // ███████ ██ ███    ███ ██████  ██      ███████ 
// // ██      ██ ████  ████ ██   ██ ██      ██      
// // ███████ ██ ██ ████ ██ ██████  ██      █████   
// //      ██ ██ ██  ██  ██ ██      ██      ██      
// // ███████ ██ ██      ██ ██      ███████ ███████ 

// // ███████  ██████  ████████  ██████  
// // ██      ██    ██    ██    ██    ██ 
// // █████   ██    ██    ██    ██    ██ 
// // ██      ██    ██    ██    ██    ██ 
// // ██       ██████     ██     ██████  

// class SFoto extends StatefulWidget{
//   const SFoto(this.foto, {super.key, this.deletavel = false});

//   final Foto foto;
//   final bool deletavel;

//   @override
//   State<SFoto> createState() => _SFotoState();
// }

// class _SFotoState extends State<SFoto>{
//   late Foto _foto;

//   void _fotoCamera() async {
//     final XFile? img = await ImagePicker().pickImage(source: ImageSource.camera, imageQuality: 25);
//     _foto.path = img?.path;
//     setState((){});
//   }

//   void _fotoGaleria() async {
//     final XFile? img = await ImagePicker().pickImage(source: ImageSource.gallery, imageQuality: 25);
//     _foto.path = img?.path;
//     setState((){});
//   }

//   void _vizualizarFoto() async {
//     await vizualizarFoto(context, _foto, deletavel: widget.deletavel);
//     setState((){});
//   }

//   @override
//   void initState() {
//     super.initState();
//     _foto = widget.foto;
//   }

//   @override
//   Widget build(BuildContext context){
//     return ElevatedButton.icon(
//       onPressed: _foto.path == null ? _fotoCamera : _vizualizarFoto,
//       onLongPress: _foto.path == null ? _fotoGaleria : null,
//       style: ElevatedButton.styleFrom(minimumSize: const Size(0, 50), backgroundColor: _foto.path == null ? Colors.grey : null),
//       icon: const Icon(Icons.camera_alt),
//       label: Text(_foto.nome ?? 'Foto', style: const TextStyle(fontSize: 20)),
//     );
//   }
// }