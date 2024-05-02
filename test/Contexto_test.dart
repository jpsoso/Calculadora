import 'package:flutter_test/flutter_test.dart';
import 'package:calculadora/Contexto.dart';
import 'package:calculadora/Suma.dart';
import 'package:calculadora/Resta.dart';
import 'package:calculadora/Multiplicacion.dart';
import 'package:calculadora/Division.dart';
import 'package:calculadora/Potencia.dart';

void main()
{
  group('Tareas y gestor de tareas', (){
    late Contexto context;
    late Suma suma;
    late Resta resta;
    late Division division;
    late double number1;
    late double number2;

    setUp(() {
      context = new Contexto();
      suma = new Suma();
      resta = new Resta();
      division = new Division();
      number1 = 4;
      number2 = 2;
    });

    test('Probando el cambio de estrategia: SUMA', () {
      context.changeOperation(suma);
      expect(context.calcula(number1, number2), number1 + number2);
    });

    test('Probando el cambio de estrategia: RESTA', () {
      context.changeOperation(resta);
      expect(context.calcula(number1, number2), number1 - number2);
    });

    test('Probando el cambio de estrategia: DIVISION', () {
      context.changeOperation(division);
      expect(context.calcula(number1, number2), number1 / number2);
    });
  });
}
