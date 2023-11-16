import 'package:calculadora/widgets/theme_switcher.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:yaru/yaru.dart';

class ThemeSwitcherButton extends StatelessWidget {
  const ThemeSwitcherButton({super.key});

  @override
  Widget build(BuildContext context) {
    final themeSwitcher = ThemeSwitcherProvider.of(context).themeSwitcher;
    final variants = themeSwitcher.availableVariants;
    final variantNames = themeSwitcher.variantNames;

    return PopupMenuButton(
      icon: const Icon(Icons.style),
      itemBuilder: (context) => variants.mapIndexed((i, variant) {
        return PopupMenuItem(
          onTap: () => themeSwitcher.variant = variant,
          child: Row(
            children: [
              SizedBox.square(
                dimension: 24,
                child: ListenableBuilder(
                  listenable: themeSwitcher,
                  builder: (context, child) {
                    return DecoratedBox(
                      decoration: BoxDecoration(
                        color: variant.color,
                        shape: BoxShape.circle,
                        border: Border.all(
                          width: 2,
                          color: variant == themeSwitcher.variant
                              ? themeSwitcher.variant.color.adjust(
                                  lightness: 0.25,
                                  saturation: 0.5,
                                )
                              : Colors.transparent,
                        ),
                      ),
                      child: variant == themeSwitcher.variant
                          ? const Icon(
                              size: 16,
                              Icons.check,
                              color: Colors.white,
                            )
                          : null,
                    );
                  },
                ),
              ),
              const SizedBox(width: 8),
              Text(variantNames[i]),
            ],
          ),
        );
      }).toList(),
    );
  }
}
