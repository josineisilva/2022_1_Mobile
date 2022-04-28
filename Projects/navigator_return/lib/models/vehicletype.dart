import 'package:flutter/material.dart';

// Tipos de veiculos
enum Type { All, Car, Motorcycle, Airplane }

// Classe para tipos de veiculos
class VehicleType {
  final Type type;
  final String title;
  final IconData? icon;
  VehicleType(this.type, this.title, this.icon);
}

// Lista de tipos de veiculos
List<VehicleType> TypeList = [
  VehicleType(Type.All, "Todos", null),
  VehicleType(Type.Car, "Automovel", Icons.directions_car),
  VehicleType(Type.Motorcycle, "Motocicleta", Icons.motorcycle),
  VehicleType(Type.Airplane, "Aviao", Icons.flight),
];