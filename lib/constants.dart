import 'package:flutter/material.dart';

TextStyle kTextStyle(){
  return TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold,
  );
}

TextStyle kNumberStyle(){
  return TextStyle(
    fontSize: 50,
    fontWeight: FontWeight.w900,
  );
}

Text remark({String? type, Color? Color}){
  return Text(type.toString(),
  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.green),
  );
}