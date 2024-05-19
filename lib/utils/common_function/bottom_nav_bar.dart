library bottom_navy_bar;

import 'package:cliveott/utils/responsive.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../colors.dart';

/// A beautiful and animated bottom navigation that paints a rounded shape
/// around its [items] to provide a wonderful look.
///
/// Update [selectedIndex] to change the selected item.
/// [selectedIndex] is required and must not be null.
class BottomNavyBar extends StatelessWidget {
  const BottomNavyBar({
    Key? key,
    this.selectedIndex = 0,
    this.showElevation = true,
    this.iconSize = 24,
    this.backgroundColor,
    this.itemCornerRadius = 50,
    this.containerHeight = 56,
    this.animationDuration = const Duration(milliseconds: 270),
    this.mainAxisAlignment = MainAxisAlignment.spaceBetween,
    required this.items,
    required this.onItemSelected,
    this.curve = Curves.linear,
  })  : assert(items.length >= 2 && items.length <= 5),
        super(key: key);

  /// The selected item is index. Changing this property will change and animate
  /// the item being selected. Defaults to zero.
  final int selectedIndex;

  /// The icon size of all items. Defaults to 24.
  final double iconSize;

  /// The background color of the navigation bar. It defaults to
  /// [Theme.bottomAppBarColor] if not provided.
  final Color? backgroundColor;

  /// Whether this navigation bar should show a elevation. Defaults to true.
  final bool showElevation;

  /// Use this to change the item's animation duration. Defaults to 270ms.
  final Duration animationDuration;

  /// Defines the appearance of the buttons that are displayed in the bottom
  /// navigation bar. This should have at least two items and five at most.
  final List<BottomNavyBarItem> items;

  /// A callback that will be called when a item is pressed.
  final ValueChanged<int> onItemSelected;

  /// Defines the alignment of the items.
  /// Defaults to [MainAxisAlignment.spaceBetween].
  final MainAxisAlignment mainAxisAlignment;

  /// The [items] corner radius, if not set, it defaults to 50.
  final double itemCornerRadius;

  /// Defines the bottom navigation bar height. Defaults to 56.
  final double containerHeight;

  /// Used to configure the animation curve. Defaults to [Curves.linear].
  final Curve curve;

  @override
  Widget build(BuildContext context) {
    final bgColor = backgroundColor ?? Theme.of(context).bottomAppBarColor;

    return Material(
      color: black1,
      elevation: 5,
      borderRadius: BorderRadius.circular(10),
      child: Container(
        width: 95.00.wp,
        decoration: BoxDecoration(
          color: black,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            if (showElevation)
              const BoxShadow(
                color: Colors.black12,
                blurRadius: 7,
              ),
          ],
        ),
        child: SafeArea(
          child: Container(
            height: containerHeight,
            //  decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
            padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: items.map((item) {
                var index = items.indexOf(item);
                return GestureDetector(
                  onTap: () => onItemSelected(index),
                  child: _ItemWidget(
                    item: item,
                    iconSize: iconSize,
                    isSelected: index == selectedIndex,
                    backgroundColor: bgColor,
                    itemCornerRadius: itemCornerRadius,
                    animationDuration: animationDuration,
                    curve: curve,
                  ),
                );
              }).toList(),
            ),
          ),
        ),
      ),
    );
  }
}

class _ItemWidget extends StatelessWidget {
  final double iconSize;
  final bool isSelected;
  final BottomNavyBarItem item;
  final Color backgroundColor;
  final double itemCornerRadius;
  final Duration animationDuration;
  final Curve curve;

  const _ItemWidget({
    Key? key,
    required this.item,
    required this.isSelected,
    required this.backgroundColor,
    required this.animationDuration,
    required this.itemCornerRadius,
    required this.iconSize,
    this.curve = Curves.linear,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      physics: const NeverScrollableScrollPhysics(),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        //crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: isSelected
                    ? Colors.white
                    : const Color(0xffD9D9D9).withOpacity(0.2),
                // color: const Color(0xffD9D9D9).withOpacity(0.2),
                border: Border.all(color: appcolor.withOpacity(0.4))),
            padding: const EdgeInsets.all(6),
            child: Center(
              child: IconTheme(
                data: IconThemeData(
                  size: iconSize,
                  color: isSelected
                      ? Colors.black
                      : item.inactiveColor != null
                          ? item.activeColor
                          : Colors.white,
                ),
                child: item.icon,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/// The [BottomNavyBar.items] definition.
class BottomNavyBarItem {
  BottomNavyBarItem({
    required this.icon,
    required this.title,
    this.activeColor = Colors.blue,
    this.textAlign,
    this.inactiveColor,
  });

  /// Defines this item's icon which is placed in the right side of the [title].
  final Widget icon;

  /// Defines this item's title which placed in the left side of the [icon].
  final Widget title;

  /// The [icon] and [title] color defined when this item is selected. Defaults
  /// to [Colors.blue].
  final Color activeColor;

  /// The [icon] and [title] color defined when this item is not selected.
  final Color? inactiveColor;

  /// The alignment for the [title].
  ///
  /// This will take effect only if [title] it a [Text] widget.
  final TextAlign? textAlign;
}
