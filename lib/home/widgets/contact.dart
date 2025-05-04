
import 'package:flutter/material.dart';
class WidgetContact extends StatelessWidget {
  WidgetContact({super.key});
  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 60, horizontal: 40),
      height: MediaQuery.of(context).size.height *0.9,
      width: MediaQuery.of(context).size.width *0.9,
      decoration:BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(20),
      ) ,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [

        ],
      ),
    );
  }
}