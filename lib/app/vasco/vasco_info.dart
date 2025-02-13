import 'package:complex/complex.dart';

class VascoInfo {
  // Nominais
  double? pn; // Potência Nominal - Pn
  double? v1; // Tensão Primário - V1
  double? v2; // Tensão Secundário - V2

  // Ensaio à Vazio
  TipoEV tipoEV = TipoEV.primario;
  double? vvz; // Tensão - Vvz
  double? ivz; // Corrente - Ivz
  double? pvz; // Potência - Pvz

  // Ensaio de Curto-Circuito
  double? vcc; // Tensão - Vcc
  double? icc; // Corrente - Icc
  double? pcc; // Potência - Pcc

  // Operção
  TipoFP? tipoFP = TipoFP.indutivo;
  
  double? pop; // Potência de Operção - Pop
  double? vop; // Tensão de Operção - Vop
  
  double? pb; // Potência Base - Pb
  double? v2b; // Tensão Secundário Base - V2b

  // Resultados
  double? rc1;
  double? xm1;
  double? r1;
  double? x1;
  double? rc2;
  double? rm2;
  double? r2;
  double? x2;
  
  double? rcpu;
  double? xmpu;
  double? rpu;
  double? xpu;

  Complex? i2;
  Complex? e2;
  Complex? ic;
  Complex? im;
  Complex? i1_;
  Complex? v1_;
  Complex? v1op;
  Complex? i1;

  double? pcu1;
  double? pcu2;
  double? pcu;
  double? pnu;
  double? pt;
  double? rt;
  double? nef;

  Complex? v1pu;
  Complex? i1pu;
  Complex? v2pu;
  Complex? i2pu;
}

enum TipoEV{primario, secundario}
enum TipoFP{indutivo, capacitivo}