import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'IMC',
      theme: ThemeData(     
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'IMC'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;
  

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class InfoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Informações"),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(top: 30, bottom: 40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: const <Widget>[
              Text('Menor que 18,5 kg/m2', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 28),), 
              Text('Magreza', style: TextStyle(fontSize: 24)),
              Text('18,5 a 24,9 kg/m2', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 28),), 
              Text('Normal', style: TextStyle(fontSize: 24)),
              Text('25 a 29,9 kg/m2', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 28),),
              Text('Sobrepeso', style: TextStyle(fontSize: 24)),
              Text('30 a 34,9 kg/m2', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 28),),
              Text('Obesidade grau I', style: TextStyle(fontSize: 24)),
              Text('35 a 39,9 kg/m2', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 28),),
              Text('Obesidade grau II', style: TextStyle(fontSize: 24)),
              Text('Maior que 40 kg/m2', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 28),),
              Text('Obesidade grau III', style: TextStyle(fontSize: 24)),
            ],
          ),
        ),
      ),
    );
  }
}

class _MyHomePageState extends State<MyHomePage> {
  String imcTexto = "";
  TextEditingController controllerPeso = TextEditingController();
  TextEditingController controllerAltura = TextEditingController();
  Widget TextFieldComponent(String label, TextEditingController controller){
    return TextField(
      decoration: InputDecoration(
        labelText: label, labelStyle: TextStyle(color: Colors.black, fontSize: 18)
      ),
      style: TextStyle(color: Colors.black, fontSize: 18),
      keyboardType: TextInputType.number,
      controller: controller,
    );
  }
  void _calcularIMC() {
  double peso = double.parse(controllerPeso.text);
  double altura = double.parse(controllerAltura.text)/ 100;
  double imc = peso / (altura * altura);
  setState(() {
    if (imc < 17) {
      imcTexto = "Muito abaixo do peso. IMC:(${imc.toStringAsPrecision(4)})";
    }else if (imc >= 17 && imc <= 18.49){
      imcTexto = "Abaixo do Peso. IMC:(${imc.toStringAsPrecision(4)})";
    }else if(imc >= 18.5 && imc <= 24.99) {
      imcTexto = "Peso Ideal ou Normal.IMC:(${imc.toStringAsPrecision(4)})";
    } else if(imc >= 25 && imc <= 29.99) {
      imcTexto = "Acima do Peso. IMC:(${imc.toStringAsPrecision(4)})";
    } else if(imc >= 30 && imc <= 34.99){
      imcTexto = "Obesidade 1 IMC:(${imc.toStringAsPrecision(4)})";
    } else if(imc >= 35 && imc <= 39.99){
      imcTexto = "Obesidade 2 IMC:(${imc.toStringAsPrecision(4)})";
    } else if(imc >= 40){
      imcTexto = "Obesidade 3 IMC:(${imc.toStringAsPrecision(4)})";
    }
  });
  }

  @override
  Widget build(BuildContext context) {
   
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      appBar: AppBar(        
        title: Text(widget.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(14),
        child: Column(  
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,    
          children: <Widget>[
            Text(
              "IMC",
              style: TextStyle(
                color: Colors.black87,
                fontSize: 40,
                fontWeight: FontWeight.bold
                ),
              ),
            TextFieldComponent("Peso", controllerPeso),
            TextFieldComponent("Altura", controllerAltura),
            ElevatedButton(onPressed: _calcularIMC, child: Text("Calcular IMC")),
             Text(
              imcTexto,
              style: TextStyle(
                color: Colors.black87,
                fontSize: 24,
                fontWeight: FontWeight.bold
                ),
              ),
              FloatingActionButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => InfoPage()));
                },
                child: Icon(Icons.info),
              )

          ],
        ),
      ),     
    );
  }
}
