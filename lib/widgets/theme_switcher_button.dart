import 'package:calculadora/providers/theme_switcher.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yaru/yaru.dart';

class ThemeSwitcherButton extends StatelessWidget {
  const ThemeSwitcherButton({super.key});

  @override
  Widget build(BuildContext context) {
    final themeSwitcher = context.watch<ThemeSwitcher>();
    final variants = themeSwitcher.availableVariants;
    final variantNames = themeSwitcher.variantNames;

    return Row(
      children: [
        PopupMenuButton(
          iconSize: 16,
          itemBuilder: (context) => variants.mapIndexed((i, variant) {
            final selectedVariantIcon = variant == themeSwitcher.variant
                ? const Icon(Icons.check, color: Colors.white)
                : null;

            final selectedVariantColor = themeSwitcher.variant.color
                .adjust(lightness: 0.25, saturation: 0.5);

            final selectedVariantBorder = variant == themeSwitcher.variant
                ? Border.all(width: 2, color: selectedVariantColor)
                : null;

            return PopupMenuItem(
              onTap: () => themeSwitcher.variant = variant,
              child: Row(
                children: [
                  Container(
                    width: 24,
                    height: 24,
                    decoration: BoxDecoration(
                      color: variant.color,
                      shape: BoxShape.circle,
                      border: selectedVariantBorder,
                    ),
                    child: selectedVariantIcon,
                  ),
                  const SizedBox(width: 8),
                  Text(variantNames[i]),
                ],
              ),
            );
          }).toList(),
          // TODO: create a custom popup menu to set
          //       shape to RoundedRectangleBorder
          icon: const Icon(Icons.style),
        ),
      ],
    );
  }
}
