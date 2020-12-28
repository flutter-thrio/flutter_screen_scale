//
// Created on Mon Dec 28 2020.
//
// Copyright (c) 2020 bybit group.
//

import 'dart:math';

import 'package:flutter/material.dart';

part 'screen_scale_num.dart';

class ScreenScale extends StatefulWidget {
  const ScreenScale({
    Key key,
    @required this.designWidth,
    @required this.designHeight,
    this.allowTextScale = false,
    this.child,
  }) : super(key: key);

  final Widget child;

  final double designWidth;

  final double designHeight;

  final bool allowTextScale;

  @override
  _ScreenScaleState createState() => _ScreenScaleState();
}

class _ScreenScaleState extends State<ScreenScale> {
  /// Whether the font follows the system scaling.
  ///
  /// Default is `false`.
  ///
  bool get _allowTextScale => widget.allowTextScale;

  /// The number of font pixels for each logical pixel.
  ///
  double _textScaleFactor;

  /// The number of font pixels for each logical pixel.
  ///
  double _systemTextScaleFactor;

  /// The number of width pixels for each logical pixel.
  ///
  double _widthScaleFactor;

  /// The number of height pixels for each logical pixel.
  ///
  double _heightScaleFactor;

  void _init(BuildContext context, BoxConstraints constraints) {
    final mqa = MediaQuery.of(context);
    _systemTextScaleFactor = mqa.textScaleFactor;
    _widthScaleFactor = constraints.maxWidth / widget.designWidth;
    _heightScaleFactor = constraints.maxHeight / widget.designHeight;
    _textScaleFactor = min(_widthScaleFactor, _heightScaleFactor);
  }

  @override
  Widget build(BuildContext context) =>
      LayoutBuilder(builder: (context, constraints) {
        _init(context, constraints);
        return widget.child;
      });
}
