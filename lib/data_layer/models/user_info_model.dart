import 'package:equatable/equatable.dart';

class User extends Equatable {
  final int phone;
  final String? name;

  User({required this.phone,this.name});

  @override
  List<Object?> get props => [phone,name];
}

