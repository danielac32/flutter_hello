
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_hello/get/counter_controller.dart'; // Importa el controlador



 

class CounterScreen extends StatelessWidget{
  final CounterController counterController = Get.put(CounterController());
  // int clickCounter=0;

   CounterScreen({super.key});

  @override
  Widget build(BuildContext context){
    
    //throw UnimplementedError();
    return Scaffold(
        //body:Center(child:Text("counter"))
        appBar: AppBar(
          title:Center(child:  Text("Contador"),),
        ),
        body:Center(
        	child:Column(
        		mainAxisAlignment:MainAxisAlignment.center,
        		children:[
              Obx(() =>Text('${counterController.count}',style:TextStyle(fontSize: 160,fontWeight: FontWeight.w100))),
              Obx(() =>Text("Click${counterController.count==1?" ":"s"}",style:TextStyle(fontSize: 25))),

        		],
        	)
        ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end, // Alinea los botones a la derecha
        children: [
          FloatingActionButton(
            onPressed: () {
              if (counterController.count == 0) {
                // Muestra un cuadro de diálogo si el contador es menor a cero
                _showWarningDialog(context);
              }
              counterController.decrement(); // Llama al método decrement
            },
            child: Icon(Icons.remove), // Ícono para decrementar
          ),
          SizedBox(width: 10), // Espacio entre los botones
          FloatingActionButton(
            onPressed: () {
              counterController.increment(); // Llama al método increment
            },
            child: Icon(Icons.add), // Ícono para incrementar
          ),
        ],
      ),floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }


  void _showWarningDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Advertencia"),
          content: Text("El contador no puede ser menor a cero."),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Cierra el cuadro de diálogo
              },
              child: Text("Aceptar"),
            ),
          ],
        );
      },
    );
  }

}

