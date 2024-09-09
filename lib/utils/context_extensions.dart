import 'package:flutter/material.dart';

// USAGE context.
// e.g. context.height

extension ContextExtension on BuildContext {
  // ThemeData get theme => Theme.of(this);

  MediaQueryData get mediaQuery => MediaQuery.of(this);

  Size get size => mediaQuery.size;
  EdgeInsets get viewInsets => mediaQuery.viewInsets;

  double get height => size.height;
  double get width => size.width;
}

extension SpacingExtension on num {
  // Method to return a SizedBox with vertical or horizontal spacing
  Widget get spacing {
    return Builder(
      builder: (BuildContext context) {
        final axis = context.parentAxis;
        if (axis == Axis.horizontal) {
          return SizedBox(width: toDouble());
        } else {
          return SizedBox(height: toDouble());
        }
      },
    );
  }
}

extension BuildContextExtension on BuildContext {
  // Helper method to determine the axis of the parent widget
  Axis get parentAxis {
    if (findAncestorWidgetOfExactType<Row>() != null) {
      return Axis.horizontal;
    } else if (findAncestorWidgetOfExactType<Column>() != null) {
      return Axis.vertical;
    } else {
      // Default to vertical if the parent is neither Row nor Column
      return Axis.vertical;
    }
  }
}
