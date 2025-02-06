import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../design_system/design_system.dart';

class HomeFilterChip extends StatefulWidget {
  const HomeFilterChip({
    super.key,
    required this.title,
    this.onPressed,
    this.icon,
    this.disableSelection = false,
  });

  final String title;
  final VoidCallback? onPressed;
  final Icon? icon;

  final bool disableSelection;

  @override
  State<HomeFilterChip> createState() => _HomeFilterChipState();
}

class _HomeFilterChipState extends State<HomeFilterChip> {
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: InkWell(
        onTap: () {
          if (widget.onPressed != null) widget.onPressed!();

          setState(() {
            isSelected = !isSelected;
          });
        },
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 100),
          curve: Curves.easeInOut,
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: isSelected && !widget.disableSelection
                ? AppColors.red
                : Colors.transparent,
            border: Border.all(
              color: isSelected && !widget.disableSelection
                  ? AppColors.red
                  : AppColors.darkGrey,
              width: 1,
            ),
          ),
          child: Row(
            children: [
              widget.icon ?? const SizedBox.shrink(),
              const SizedBox(width: 4),
              Text(
                widget.title,
                style: GoogleFonts.openSans(
                  textStyle: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: isSelected && !widget.disableSelection
                        ? Colors.white
                        : AppColors.black.withOpacity(.8),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
