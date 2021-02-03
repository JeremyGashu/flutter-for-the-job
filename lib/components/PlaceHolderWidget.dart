import 'package:flutter/material.dart';

class PlaceholderWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: Text(
          'Place Holder Widget',
          style: TextStyle(
              fontFamily: 'Lato', fontSize: 29, color: Colors.grey[700]),
        ),
      ),
    );
  }
}
