
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_hello/get/counter_controller.dart'; // Importa el controlador





class CounterFunctionsScreen extends StatelessWidget{
  final CounterController counterController = Get.put(CounterController());
  // int clickCounter=0;

  CounterFunctionsScreen({super.key});

  @override
  Widget build(BuildContext context){

    //throw UnimplementedError();
    return Scaffold(
      //body:Center(child:Text("counter"))
      appBar: AppBar(
        title:Center(child:  Text("Contador"),),
        actions: [
          IconButton(
            icon: Icon(Icons.refresh_rounded),
            onPressed: (){
                counterController.count=0;
            },
          ),
        ],
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
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end, // Alinea los botones a la derecha
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          CustomButton(icon:Icons.refresh_rounded,
            onPress: (){
              counterController.count=0;
            },tooltip: "Refrescar"
          ),
          SizedBox(height: 20), // Espacio entre los botones
          CustomButton(icon:Icons.exposure_minus_1_outlined,
              onPress: () {
                if (counterController.count == 0) {
                  // Muestra un cuadro de diálogo si el contador es menor a cero
                  _showWarningDialog(context);
                  return;
                }
                counterController.decrement(); // Llama al método decrement
              },tooltip: "Restar"
          ),
          SizedBox(height: 20), // Espacio entre los botones
          CustomButton(icon:Icons.plus_one,
            onPress: (){
              counterController.increment();
            },tooltip: "Sumar"
          ),
          /*FloatingActionButton(
            onPressed: () {
              counterController.increment(); // Llama al método increment
            },
            child: Icon(Icons.add), // Ícono para incrementar
          ),*/
        ],
      ),floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,

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

class CustomButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback? onPress;
  final String? tooltip;

  const CustomButton({
    super.key, required this.icon, this.onPress, this.tooltip,
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
     // shape: StadiumBorder(),
      enableFeedback: true,
      tooltip: tooltip ,
      backgroundColor: Colors.deepPurpleAccent,
      onPressed: onPress,//() {
        /*if (counterController.count == 0) {
          // Muestra un cuadro de diálogo si el contador es menor a cero
          _showWarningDialog(context);
        }
        counterController.decrement(); // Llama al método decrement*/
      //},
      child: Icon(icon), // Ícono para decrementar
    );
  }
}

