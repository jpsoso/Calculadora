import 'package:calculadora/Operacion.dart';
import 'package:calculadora/Suma.dart';

class Contexto {
  Operacion operacion = Suma();

  void changeOperation(Operacion operacion)
  {
    this.operacion = operacion;
  }

  double calcula(double member1, double member2)
  {
    return this.operacion.calcula(member1, member2);
  }
}