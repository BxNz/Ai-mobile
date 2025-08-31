import 'package:flutter/material.dart';

appbarWidgetDer() {
  return AppBar(
    leading: Text(''),
    leadingWidth: 0,
    title: Container(
      height: 50,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.grey[300],
        borderRadius: BorderRadius.circular(100),
      ),
      child: TextFormField(
        decoration: InputDecoration(
          hintText: "Search",
          prefixIcon: Icon(Icons.search),

          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(100),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    ),
    centerTitle: true,
    actions: [
      Container(
        height: 50,
        width: 50,
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 230, 224, 224),
          borderRadius: BorderRadius.circular(100),
        ),
        child: Stack(
          children: [
            Center(
              child: Icon(
                Icons.notifications_none_outlined,
                color: Colors.black,
              ),
            ),
            Positioned(
              top: 0,
              right: 0,
              child: Container(
                height: 20,
                width: 20,
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(100),
                ),
                child: Center(
                  child: Text(
                    "10",
                    style: TextStyle(color: Colors.white, fontSize: 11),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    ],
  );
}
