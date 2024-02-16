import 'package:amazonmusiclone/settings/themes/dark_theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../settings/themes/theme_provider.dart';

class ovalbox extends StatelessWidget {
  final child;

  final Function()? onTap;
  const ovalbox({super.key, required this.child, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(1.0),
        child: Container(
          decoration: BoxDecoration(
              color: context.read<ThemeProvider>().themeData == darkTheme
                  ? context.read<ThemeProvider>().containerColor(
                        Colors.black.withOpacity(0.47),
                      )
                  : context.read<ThemeProvider>().containerColor(
                        Colors.grey.shade400,
                      ),
              border: Border.all(color: Colors.grey.shade900),
              borderRadius: BorderRadius.circular(15)),
          child: Center(
            child: child,
          ),
        ),
      ),
    );
  }
}
