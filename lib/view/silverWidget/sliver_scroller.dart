import 'package:ai_mobile/view/multiChildWidget/coloum_widget.dart';
import 'package:ai_mobile/view/multiChildWidget/row_widget.dart';
import 'package:ai_mobile/view/multiChildWidget/stack_widget.dart';
import 'package:ai_mobile/view/singleChildWidget/container_widget.dart';
import 'package:ai_mobile/view/singleChildWidget/text_form_field_widget.dart';
import 'package:flutter/material.dart';

class SliverScroller extends StatefulWidget {
  const SliverScroller({super.key});

  @override
  State<SliverScroller> createState() => _SliverScrollerState();
}

class _SliverScrollerState extends State<SliverScroller> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            toolbarHeight: 300,
            pinned: false,
            leading: Icon(Icons.menu),
            centerTitle: true,
            title: Text("Ai+mobile"),
            actions: [Icon(Icons.person)],
          ),
          SliverList(
            delegate: SliverChildListDelegate([
              TextFormFieldWidget(),
              ContainerWidget(),
              ColoumWidget(),
              RowWidget(),
              StackWidget(),
            ]),
          ),
        ],
      ),
    );
  }
}
