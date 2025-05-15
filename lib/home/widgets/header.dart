import 'package:flutter/material.dart';

class WidgetHeader extends StatelessWidget {
  const WidgetHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.1,
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/Cintillo.jpg'),
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}