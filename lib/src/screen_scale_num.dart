//
// Created on Mon Dec 28 2020.
//
// Copyright (c) 2020 bybit group.
//

part of 'screen_scale.dart';

extension ScreenScaleNum on num {
  /// Scale according to the width of the design.
  ///
  num width(BuildContext context) {
    final state = _tryStateOf<_ScreenScaleState>(context);
    if (state == null) {
      return this;
    }
    return this * state._widthScaleFactor;
  }

  /// Scale according to the height of the design.
  ///
  num height(BuildContext context) {
    final state = _tryStateOf<_ScreenScaleState>(context);
    if (state == null) {
      return this;
    }
    return this * state._heightScaleFactor;
  }

  /// Scale according to the width/height of the design.
  ///
  num text(BuildContext context, {bool allowTextScale}) {
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
  num radius(BuildContext context) {
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
