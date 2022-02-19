void main() {
  print('Inicio do programa');
  wait10secs();
  wait5secs();
  wait3secs();
  print('Final do programa');
}

Future<void> wait10secs() {
  return Future.delayed(Duration(seconds: 10), () => print('Depois de 10 segundos'));
}

Future<void> wait5secs() {
  return Future.delayed(Duration(seconds: 5), () => print('Depois de 5 segundos'));
}

Future<void> wait3secs() {
  return Future.delayed(Duration(seconds: 3), () => print('Depois de 3 segundos'));
}

