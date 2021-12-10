import 'package:flutter/material.dart';

class ProductUnit extends StatelessWidget {
  final Function onTap;
  final String title;


  ProductUnit({this.onTap, this.title});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap:onTap,
      child: Container(
        height: 30,
        width: 30,
        decoration: BoxDecoration(
            border: Border.all(
              color: Colors.grey,
            ),
            borderRadius: BorderRadius.circular(10)),
        child: Row(
          children: [
            Expanded(
                child: Center(
                  child: Text(
                    '$title',
                    style: TextStyle(fontSize: 15),
                  ),
                )),
            Icon(Icons.arrow_drop_down)
          ],
        ),
      ),
    );
  }
}
