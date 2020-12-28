//
// Created on Mon Dec 28 2020.
//
// Copyright (c) 2020 bybit group.
//

part of 'screen_scale.dart';

extension ScreenScaleNum on num {
  /// Scale according to the width of the design.
  ///
  T width<T extends num>(BuildContext context) {
    final state = _tryStateOf<_ScreenScaleState>(context);
    if (state == null) {
      return this;
    }
    return this * state._widthScaleFactor;
  }

  /// Scale according to the height of the design.
  ///
  T height<T extends num>(BuildContext context) {
    final state = _tryStateOf<_ScreenScaleState>(context);
    if (state == null) {
      return this;
    }
    return this * state._heightScaleFactor;
  }

  /// Scale according to the width/height of the design.
  ///
  T text<T extends num>(BuildContext context, [bool allowTextScale = null]) {
    final state = _tryStateOf<_ScreenScaleState>(context);
    if (state == null) {
      return this;
    }
    return allowTextScale == true ||
            (allowTextScale == null && state._allowTextScale)
        ? this * state._textScaleFactor * state._systemTextScaleFactor
        : this * state._textScaleFactor;
  }

  /// Scale according to the width/height of the design.
  ///
  T radius<T extends num>(BuildContext context) {
    final state = _tryStateOf<_ScreenScaleState>(context);
    if (state == null) {
      return this;
    }
    return this * state._textScaleFactor;
  }

  /// Get widget state by ancestorStateOfType method.
  ///
  T _tryStateOf<T extends State<StatefulWidget>>(BuildContext context) {
    final state = context.findAncestorStateOfType<T>();
    if (state != null && state is T) {
      return state;
    }
    return null;
  }
}
