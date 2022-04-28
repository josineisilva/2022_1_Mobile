import 'vehicletype.dart';

// Classe para veiculos
class Vehicle {
  final Type type;
  final String make;
  final String model;
  final String year;
  final String image;

  Vehicle(this.type, this.make, this.model, this.year, this.image);
}

// Lista de veiculos
List<Vehicle> VehicleList = [
  Vehicle(Type.Car, "Bmw", "M3","2018", "assets/images/bmw_m3.jpg"),
  Vehicle(Type.Airplane, "Lockheed", "SR-71 Blackbird", "", "assets/images/lockheed_SR-71-blackbird.jpg"),
  Vehicle(Type.Car, "Nissan", "GTR", "2018", "assets/images/nissan_gt-r.jpg"),
  Vehicle(Type.Car, "Nissan", "Sentra", "2017", "assets/images/nissan_sentra.jpg"),
  Vehicle(Type.Motorcycle, "Kawasaki", "Ninja 650r", "2017", "assets/images/kawasaki_ninja-650r.jpg"),
  Vehicle(Type.Car, "Honda", "Civic", "2018", "assets/images/honda_civic.jpg"),
  Vehicle(Type.Airplane, "airbus", "A320", "", "assets/images/airbus_A320.jpg"),
  Vehicle(Type.Car, "Lamborghini", "Urus", "2019", "assets/images/lamborghini_urus.jpg"),
  Vehicle(Type.Motorcycle, "Suzuki", "Bandit 1250s", "2010", "assets/images/suzuki_bandit-1250s.jpg"),
  Vehicle(Type.Car, "Chevrolet", "Blazer", "2019", "assets/images/chevrolet_blazer.jpg"),
  Vehicle(Type.Motorcycle, "Honda", "Falcon", "2020", "assets/images/honda_falcon.jpg"),
  Vehicle(Type.Airplane, "Grumman", "F14B Tomcat", "", "assets/images/grumman_F14B-tomcat.jpg"),
  Vehicle(Type.Car, "Lincoln", "Zephyr", "2006", "assets/images/lincoln_zephyr.jpg"),
];