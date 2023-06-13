import 'dart:math';
import 'dart:ui';

import 'package:fbs_widget_pack/theme/padding.dart';
import 'package:flutter/material.dart';

const double _kDefaultIconSize = 17.0;

// TODO: Use RawMaterialButton instead of ElevatedButton
class FBButton extends ElevatedButton {
  final bool isLoading;
  final Widget? icon;
  final double iconSize;
  final double? iconGap;
  final Color? loadingIndicatorColor;
  final EdgeInsetsGeometry? padding;

  const FBButton({
    super.key,
    super.onPressed,
    super.onLongPress,
    super.onHover,
    super.onFocusChange,
    super.style,
    super.focusNode,
    super.autofocus,
    super.clipBehavior,
    super.statesController,
    this.isLoading = false,
    this.icon,
    this.iconGap,
    this.iconSize = _kDefaultIconSize,
    this.loadingIndicatorColor,
    this.padding,
    required Widget child,
  }) : super(child: child);

  @override
  State<ButtonStyleButton> createState() {
    return _FBButtonState();
  }
}

class _FBButtonState extends State<FBButton> {
  @override
  Widget build(BuildContext context) {
    EdgeInsetsGeometry? padding = widget.padding;
    if (widget.padding != null) {
      padding = EdgeInsets.fromLTRB(
        widget.icon == null ? FBEdgeInsets.offset : FBEdgeInsets.offsetSmall,
        FBEdgeInsets.offsetSmall,
        widget.icon == null ? FBEdgeInsets.offset : FBEdgeInsets.offsetSmall,
        FBEdgeInsets.offsetSmall,
      );
    }

    final bool hasIcon = widget.icon != null || widget.isLoading;

    Widget icon = widget.icon ?? const SizedBox.shrink();

    if (widget.isLoading) {
      icon = CircularProgressIndicator(
        strokeWidth: 3.5,
        color: widget.loadingIndicatorColor ??
            Theme.of(context).colorScheme.onSurface,
      );
    }

    if (hasIcon) {
      icon = SizedBox(
        width: widget.iconSize,
        height: widget.iconSize,
        child: icon,
      );
    }

    final double scale = MediaQuery.textScaleFactorOf(context);
    double? gap = widget.iconGap;

    // If iconGap is not set, we will calculate it based on the text scale factor
    gap ??= scale <= 1 ? 8 : lerpDouble(8, 4, min(scale - 1, 1))!;

    return ElevatedButton(
      onPressed: widget.isLoading ? null : widget.onPressed,
      onLongPress: widget.isLoading ? null : widget.onLongPress,
      onHover: widget.onHover,
      onFocusChange: widget.onFocusChange,
      style: widget.style?.copyWith(
        minimumSize: MaterialStateProperty.all<Size>(
          Size.zero,
        ),
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
      ),
      focusNode: widget.focusNode,
      autofocus: widget.autofocus,
      clipBehavior: widget.clipBehavior,
      child: Padding(
        padding: padding ?? EdgeInsets.zero,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (hasIcon) icon,
            if (hasIcon) SizedBox(width: gap),
            widget.child!,
          ],
        ),
      ),
    );
  }
}
