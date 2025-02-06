import 'package:flutter/material.dart';

class HomeCardContainerDetailsComponent extends StatelessWidget {
  const HomeCardContainerDetailsComponent({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: const <BoxShadow>[
          BoxShadow(
            color: Color.fromRGBO(229, 229, 229, 0.8),
            blurRadius: 10,
            spreadRadius: 1,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: child,
    );
  }
}
