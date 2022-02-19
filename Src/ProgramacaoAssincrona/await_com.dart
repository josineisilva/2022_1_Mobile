import 'dart:math';

void main() async {
  print('Inicio do programa');
  var x = await getRandom();
  print("Valor ${x}");
  print('Final do programa');
}

Future<int> getRandom() { 
  Random rand = Random();
  return Future.delayed(Duration(seconds: 2), () {
      int x = rand.nextInt(10);
      print("Random ${x}");
      return x;
    }
  );
}
