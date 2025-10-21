import 'package:flutter/material.dart';

class NeuBox extends StatelessWidget {
  final Widget? child;
  const NeuBox({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final surface = Theme.of(context).colorScheme.surface;
    // light highlight for top-left, dark shadow for bottom-right
    final highlight = isDark ? Colors.white.withOpacity(0.04) : Colors.white.withOpacity(0.8);
    final shadow = isDark ? Colors.black.withOpacity(0.6) : Colors.black.withOpacity(0.12);
    // thin outline to emphasize the cube edge
    final outline = isDark ? Colors.white.withOpacity(0.03) : Colors.black.withOpacity(0.05);

    return Card(
      elevation: 10,
      child: Container(
        decoration: BoxDecoration(
          // gentle gradient gives slight depth
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              surface.withOpacity(isDark ? 0.98 : 1.0),
              surface.withOpacity(isDark ? 0.94 : 0.98),
            ],
          ),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: outline, width: 0.6),
          boxShadow: [
            // subtle top-left highlight (thin, small blur)
            BoxShadow(
              color: highlight,
              offset: const Offset(-4, -4),
              blurRadius: 6,
              spreadRadius: 0,
            ),
            // subtle bottom-right shadow (thin, small blur)
            BoxShadow(
              color: shadow,
              offset: const Offset(4, 4),
              blurRadius: 8,
              spreadRadius: 0,
            ),
          ],
        ),
        padding: const EdgeInsets.all(12),
        child: child,
      ),
    );
  }
}