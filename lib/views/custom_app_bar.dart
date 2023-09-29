import 'package:flutter/material.dart';
import 'package:notes_app/constants.dart';

class CustomAppBar extends StatelessWidget {
  CustomAppBar({required this.text, required this.iconName,required this.onTap});
  String text;
  IconData iconName;
  void Function()? onTap;
  @override
  AppBar build(
    BuildContext context,
  ) {
    return AppBar(
      toolbarHeight: 60,
      title: Padding(
        padding: const EdgeInsets.only(
          top: 18,
          right: 18,
        ),
        child: Text(
          text,
          style: const TextStyle(
            fontSize: 26,
            color: kAppBarSecondaryColor,
          ),
        ),
      ),
      backgroundColor: kAppBarPrimaryColor,
      elevation: 0,
      actions: [
        Padding(
          padding: const EdgeInsets.only(
            top: 12.0,
            right: 18.0,
          ),
          child: GestureDetector(
            onTap: onTap,
            child: Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  width: 42,
                  height: double.infinity,
                  decoration: BoxDecoration(
                    color: kSearchButtonBackgroundColor,
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
                Icon(
                  iconName,
                  size: 25,
                  color: kAppBarSecondaryColor,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
