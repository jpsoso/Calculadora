import 'package:calculadora/Operacion.dart';
import "dart:math";

class Potencia implements Operacion
{
  double calcula(double member1, double member2)
  {
    return pow(member1, member2).toDouble();
  }
}