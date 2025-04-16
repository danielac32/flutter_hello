import 'package:flutter/material.dart';
import 'package:flutter_hello/presentation/screens/counter_screen.dart';

void main() {

  runApp(MyApp());
}



class MyApp extends StatelessWidget{
  const MyApp({super.key});

  @override
  Widget build(BuildContext context){
    //throw UnimplementedError();
    return MaterialApp(
       debugShowCheckedModeBanner:false,
       theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed:Colors.blue
       ),
       home:CounterScreen()
    );
  }
}
