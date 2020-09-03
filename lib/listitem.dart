import 'package:flutter/material.dart';

class ListItem extends StatelessWidget {
  ListItem(this.borderColor, this.title);

  MaterialColor borderColor;
  String title;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        height: 100,
        child: Row(
          children: [
            Container(height: 100, width: 10, color: borderColor,),
            SizedBox(width: 8,),
            Text(title, style: Theme.of(context).textTheme.headline6,),
          ],
        ),
      ),
    );
  }
}