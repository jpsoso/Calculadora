import 'package:calculadora/Operacion.dart';

class Resta implements Operacion
{
  double calcula(double member1, double member2)
  {
    return member1 - member2;
  }
}