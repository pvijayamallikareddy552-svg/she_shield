import 'package:flutter/material.dart';

class ContactModel {
  final String id;
  final String name;
  final String number;
  final IconData icon;

  ContactModel({
    required this.id,
    required this.name,
    required this.number,
    required this.icon,
  });
}
