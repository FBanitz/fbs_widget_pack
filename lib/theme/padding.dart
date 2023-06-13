import 'package:flutter/rendering.dart';

/// Set of offsets and EdgeInsets values used for padding and margin within the package.
///
/// You can also use them in your own widgets.
class FBEdgeInsets {
  /// Default offset value.
  static const double offset = offsetMedium;

  /// Extra small offset value.
  static const double offsetXSmall = 4.0;

  /// Small offset value.
  static const double offsetSmall = 8.0;

  /// Medium offset value.
  static const double offsetMedium = 16.0;

  /// Large offset value.
  static const double offsetLarge = 24.0;

  /// Extra large offset value.
  static const double offsetXLarge = 32.0;

  /// Extra extra large offset value.
  static const double offsetXXLarge = 48.0;

  /// Extra extra extra large offset value.
  static const double offsetXXXLarge = 64.0;

  /// The default EdgeInsets value used for padding and margin within the package.
  static const EdgeInsets padding = paddingMedium;

  /// Extra small EdgeInsets value.
  static const EdgeInsets paddingXSmall = EdgeInsets.all(offsetXSmall);

  /// Small EdgeInsets value.
  static const EdgeInsets paddingSmall = EdgeInsets.all(offsetSmall);

  /// Medium EdgeInsets value.
  static const EdgeInsets paddingMedium = EdgeInsets.all(offsetMedium);

  /// Large EdgeInsets value.
  static const EdgeInsets paddingLarge = EdgeInsets.all(offsetLarge);

  /// Extra large EdgeInsets value.
  static const EdgeInsets paddingXLarge = EdgeInsets.all(offsetXLarge);

  /// Extra extra large EdgeInsets value.
  static const EdgeInsets paddingXXLarge = EdgeInsets.all(offsetXXLarge);

  /// Extra extra extra large EdgeInsets value.
  static const EdgeInsets paddingXXXLarge = EdgeInsets.all(offsetXXXLarge);
}
