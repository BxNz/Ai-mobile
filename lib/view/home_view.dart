import 'package:ai_mobile/view/multiChildWidget/coloum_widget.dart';
import 'package:ai_mobile/view/multiChildWidget/row_widget.dart';
import 'package:ai_mobile/view/multiChildWidget/stack_widget.dart';
import 'package:ai_mobile/view/singleChildWidget/container_widget.dart';
import 'package:ai_mobile/view/singleChildWidget/text_form_field_widget.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [Icon(Icons.person, color: Colors.white, size: 30)],
        title: Text(
          "AI+Mobile",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        centerTitle: true,
        leading: Icon(Icons.menu, color: Colors.white),
        backgroundColor: const Color.fromARGB(255, 49, 121, 214),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            TextFormFieldWidget(),
            ContainerWidget(),
            ColoumWidget(),
            RowWidget(),
            StackWidget(),
          ],
        ),
      ),
    );
  }
}
