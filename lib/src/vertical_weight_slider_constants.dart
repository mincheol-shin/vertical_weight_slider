import 'package:flutter/services.dart';

enum Haptic {
  none,
  vibrate,
  lightImpact,
  mediumImpact,
  heavyImpact,
  selectionClick,
}

extension HapticExtension on Haptic {
  Future<void> run() async {
    switch (this) {
      case Haptic.none:
        break;
      case Haptic.vibrate:
        await HapticFeedback.vibrate();
        break;
      case Haptic.lightImpact:
        await HapticFeedback.lightImpact();
        break;
      case Haptic.mediumImpact:
        await HapticFeedback.mediumImpact();
        break;
      case Haptic.heavyImpact:
        await HapticFeedback.heavyImpact();
        break;
      case Haptic.selectionClick:
        await HapticFeedback.selectionClick();
        break;
      default:
        break;
    }
  }
}
