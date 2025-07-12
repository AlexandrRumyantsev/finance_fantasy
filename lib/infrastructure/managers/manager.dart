import 'package:flutter/material.dart';

import '../../presentation/components/connection_warning/animated.dart';

class NavigationManager {
  static final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey<NavigatorState>();

  static final GlobalKey<NavigatorState> subNavigatorKey =
      GlobalKey<NavigatorState>();

  static NavigatorState? get rootNavigator => navigatorKey.currentState;

  static NavigatorState? get subNavigator => subNavigatorKey.currentState;

  static void showConnectionWarning() {
    OverlayEntry? warning;
    final warningWidget = ConnectionWarning(
      () {
        warning?.remove();
        warning?.dispose();
      },
    );
    warning = OverlayEntry(builder: (context) => warningWidget);
    rootNavigator?.overlay?.insert(warning);
  }
}
