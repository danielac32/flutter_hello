import 'package:get/get.dart';

class CounterController extends GetxController {
  // Variable reactiva para el contador (privada)
  var _count = 0.obs;

  // Getter: Obtiene el valor actual del contador
  int get count => _count.value;

  // Setter: Actualiza el valor del contador con validación
  set count(int newValue) {
    if (newValue >= 0) {
      _count.value = newValue; // Solo permite valores mayores o iguales a cero
    }
  }

  // Método para incrementar el contador
  void increment() {
    count++; // Usa el setter implícitamente
  }

  // Método para decrementar el contador
  void decrement() {
    count--; // Usa el setter implícitamente
  }
}