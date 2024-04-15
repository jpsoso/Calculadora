import 'package:calculadora/Operacion.dart';

class Division implements Operacion
{
  double calcula(double member1, double member2)
  {
    return member1 / member2;
  }
}