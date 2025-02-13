import 'dart:ui';
import 'package:artools/app/menu/menu_item.dart';
import 'package:flutter/material.dart';

class MenuBotao extends StatelessWidget{
  const MenuBotao(this.menuItem, {super.key});

  final MenuItem menuItem;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 313, width: 313,
      child: InkWell(
        onTap: menuItem.pg == null ? null : () => Navigator.pushNamed(context, menuItem.pg!),
        child: ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(131)),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 3.1, sigmaY: 3.1),
            child: Container(
              decoration: BoxDecoration(
                image: menuItem.icone == null ? null : DecorationImage(image: AssetImage('assets/images/${menuItem.icone}'), fit: BoxFit.contain, opacity: 0.13),
                color: menuItem.corBase.withAlpha(131),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if(menuItem.icone != null) Image.asset('assets/images/${menuItem.icone!}', height: 131, width: 131),
                  Text(menuItem.titulo, style: TextStyle(fontSize: 31, fontWeight: FontWeight.bold, color: menuItem.corTxt), textAlign: TextAlign.center),
                  if(menuItem.subTitulo != null) Text(menuItem.subTitulo!, style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold, color: menuItem.corTxt), textAlign: TextAlign.center),
                ]
              ),
            ),
          ),
        ),
      ),
    );
  }
}