import 'package:flutter/material.dart';

class TextFormFieldWidget extends StatefulWidget {
  const TextFormFieldWidget({super.key});

  @override
  State<TextFormFieldWidget> createState() => _TextFormFieldWidgetState();
}

class _TextFormFieldWidgetState extends State<TextFormFieldWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        controller: null,
        validator: (value) => value!.isEmpty ? "Please enter your name" : null,
        decoration: InputDecoration(
          labelText: "Name",
          hintText: "Enter your name",
          errorBorder: OutlineInputBorder(),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
          prefixIcon: Icon(Icons.person, color: Colors.blue),
        ),
      ),
    );
  }
}
