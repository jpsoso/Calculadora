import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'classes.dart';
import 'package:flutter/cupertino.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Calculadora Flutter',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.redAccent),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Calculadora Flutter'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}



class _MyHomePageState extends State<MyHomePage> {
  double _answer = 0;
  Operacion operacion = Suma();

  TextEditingController _primerOperando = TextEditingController(),
  _segundoOperando = TextEditingController();

  void _suma() {
    setState(() {
      this.operacion = Suma();
      this._answer = this.operacion.calcula(double.parse(this._primerOperando.text), double.parse(this._segundoOperando.text));
    });
  }
  void _resta() {
    setState(() {
      this.operacion = Resta();
      this._answer = this.operacion.calcula(double.parse(this._primerOperando.text), double.parse(this._segundoOperando.text));
    });
  }
  void _multiplica() {
    setState(() {
      this.operacion = Multiplicacion();
      this._answer = this.operacion.calcula(double.parse(this._primerOperando.text), double.parse(this._segundoOperando.text));
    });
  }
  void _divide() {
    setState(() {
      this.operacion = Division();
      this._answer = this.operacion.calcula(double.parse(this._primerOperando.text), double.parse(this._segundoOperando.text));
    });
  }
  void _eleva() {
    setState(() {
      this.operacion = Potencia();
      this._answer = this.operacion.calcula(double.parse(this._primerOperando.text), double.parse(this._segundoOperando.text));
    });
  }
  void _setToAnswer(TextEditingController controller) {
    controller.text = '$_answer';
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // TRY THIS: Try changing the color here to a specific color (to
        // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
        // change color while the other colors stay the same.
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(40.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 200,
                      child:TextFormField(
                          keyboardType: TextInputType.numberWithOptions(
                            decimal: true,
                            signed: false,
                          ),
                          inputFormatters: [
                            FilteringTextInputFormatter.allow(RegExp(r"[0-9.]")),
                            TextInputFormatter.withFunction((oldValue, newValue) {
                              final text = newValue.text;
                              return text.isEmpty
                                  ? newValue
                                  : double.tryParse(text) == null
                                  ? oldValue
                                  : newValue;
                            }),
                          ],
                          controller: _primerOperando,
                          decoration: const InputDecoration(
                              labelText: "Primer Operando"
                          )
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () { _setToAnswer(this._primerOperando); },
                      child: Text("ANS"),
                      style: ElevatedButton.styleFrom(shape: StadiumBorder()),
                    ),

                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 200,
                      child:TextFormField(
                          keyboardType: TextInputType.numberWithOptions(
                            decimal: true,
                            signed: false,
                          ),
                          inputFormatters: [
                            FilteringTextInputFormatter.allow(RegExp(r"[0-9.]")),
                            TextInputFormatter.withFunction((oldValue, newValue) {
                              final text = newValue.text;
                              return text.isEmpty
                                  ? newValue
                                  : double.tryParse(text) == null
                                  ? oldValue
                                  : newValue;
                            }),
                          ],
                          controller: _segundoOperando,
                          decoration: const InputDecoration(
                              labelText: "Segundo Operando"
                          )
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () { _setToAnswer(this._segundoOperando); },
                      child: Text("ANS"),
                      style: ElevatedButton.styleFrom(shape: StadiumBorder()),
                    ),

                  ],
                ),
              ],
            ),
          ),
          Container(
            alignment: Alignment.center,
            child: ElevatedButton(
              onPressed: () { this._primerOperando.text = ''; this._segundoOperando.text = '';},
              child: Icon(CupertinoIcons.trash_circle_fill),
              style: ElevatedButton.styleFrom(shape: CircleBorder()),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () { this._suma(); },
                  child: Icon(CupertinoIcons.add),
                  style: ElevatedButton.styleFrom(shape: StadiumBorder()),
                ),
                ElevatedButton(
                  onPressed: () { this._resta(); },
                  child: Icon(CupertinoIcons.minus),
                  style: ElevatedButton.styleFrom(shape: StadiumBorder()),
                ),
                ElevatedButton(
                  onPressed: () { this._multiplica(); },
                  child: Icon(CupertinoIcons.multiply),
                  style: ElevatedButton.styleFrom(shape: StadiumBorder()),
                ),
                ElevatedButton(
                  onPressed: () { this._divide(); },
                  child: Icon(CupertinoIcons.divide),
                  style: ElevatedButton.styleFrom(shape: StadiumBorder()),
                ),
                ElevatedButton(
                  onPressed: () { this._eleva(); },
                  child: Icon(CupertinoIcons.control),
                  style: ElevatedButton.styleFrom(shape: StadiumBorder()),
                ),
              ],
            ),
          ),
          Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text("Resultado:"),
                Text('$_answer', style: Theme.of(context).textTheme.headlineMedium)
              ],
            ),
          ),
        ],
      ),
    );
  }
}



