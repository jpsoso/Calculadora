import "dart:math";

abstract class Operacion
{
  double calcula(double member1, double member2);
}

class Suma implements Operacion
{
  double calcula(double member1, double member2)
  {
    return member1 + member2;
  }
}

class Resta implements Operacion
{
  double calcula(double member1, double member2)
  {
    return member1 - member2;
  }
}

class Multiplicacion implements Operacion
{
  double calcula(double member1, double member2)
  {
    return member1 * member2;
  }
}

class Division implements Operacion
{
  double calcula(double member1, double member2)
  {
    return member1 / member2;
  }
}

class Potencia implements Operacion
{
  double calcula(double member1, double member2)
  {
    return pow(member1, member2).toDouble();
  }
}