import 'dart:math';

void main() {
  print("Inicio do programa");
  String result = "Pending";
  var myFuture = Future.delayed(Duration(seconds: 3), () {
    Random rand = Random();
    int res = rand.nextInt(2);
    print("Randon $res");
    if (res == 0)
      throw Exception();
    else
      result = "Future completed";
    return "Result: $result";
  });

  myFuture.then((result) {
    print(result);
  }).catchError((error){
    print('Caught $error');
  });
  print("Final do programa $result");
}
