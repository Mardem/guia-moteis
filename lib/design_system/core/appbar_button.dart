import 'package:flutter/material.dart';

import '../tokens/colors.dart';

class AppBarButton extends StatefulWidget {
  const AppBarButton({
    super.key,
    required this.textLeft,
    required this.textRight,
    this.leftAction,
    this.rightAction,
    required this.leftIcon,
    required this.rightIcon,
  });

  final String textLeft;
  final String textRight;

  final VoidCallback? leftAction;
  final VoidCallback? rightAction;

  final IconData leftIcon;
  final IconData rightIcon;

  @override
  State<AppBarButton> createState() => _AppBarButtonState();
}

class _AppBarButtonState extends State<AppBarButton> {
  bool isLeftSelected = true;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        double width = constraints.maxWidth * 0.9;
        double height = constraints.maxHeight * 0.1;
        height = height < 50 ? 42 : height;

        return Center(
          child: GestureDetector(
            onTap: () => setState(() => isLeftSelected = !isLeftSelected),
            child: Container(
              width: width,
              height: height,
              decoration: BoxDecoration(
                color: const Color.fromRGBO(184, 0, 12, 1),
                borderRadius: BorderRadius.circular(height / 2),
              ),
              child: Stack(
                children: [
                  AnimatedAlign(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                    alignment: isLeftSelected
                        ? Alignment.centerLeft
                        : Alignment.centerRight,
                    child: Container(
                      width: width / 2,
                      height: height,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(height / 2),
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Container(
                          height: height,
                          alignment: Alignment.center,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                widget.leftIcon,
                                color: isLeftSelected
                                    ? AppColors.red
                                    : Colors.white,
                              ),
                              const SizedBox(width: 5),
                              Text(
                                widget.textLeft,
                                style: TextStyle(
                                  fontSize: height * 0.3,
                                  color: isLeftSelected
                                      ? AppColors.black
                                      : Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          height: height,
                          alignment: Alignment.center,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                widget.rightIcon,
                                color: isLeftSelected
                                    ? Colors.white
                                    : AppColors.red,
                              ),
                              const SizedBox(width: 5),
                              Text(
                                widget.textRight,
                                style: TextStyle(
                                  fontSize: height * 0.3,
                                  color: isLeftSelected
                                      ? Colors.white
                                      : AppColors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
