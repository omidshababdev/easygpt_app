// ignore_for_file: must_be_immutable

import 'dart:ui';

import 'package:easygpt/ui/widgets/buttons/icon.button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EasyGPTAppbar extends StatelessWidget {
  String? title;
  VoidCallback? titleOnTap;
  IconData? actionsIcon;
  VoidCallback? actionsIconOnPressed;
  IconData? leadingIcon;
  VoidCallback? leadingIconOnPressed;

  EasyGPTAppbar({
    super.key,
    this.title,
    this.titleOnTap,
    this.actionsIcon,
    this.actionsIconOnPressed,
    this.leadingIcon,
    this.leadingIconOnPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 65.0),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.0),
            border: Border(
              bottom: BorderSide(
                width: 1,
                color: !context.isDarkMode
                    ? const Color(0xffF1F1F1).withOpacity(0.5)
                    : const Color(0xffF1F1F1).withOpacity(0.1),
              ),
            ),
          ),
          child: AppBar(
            backgroundColor: Colors.transparent,
            leadingWidth: 50,
            leading: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: AspectRatio(
                aspectRatio: 1 / 1,
                child: EasyGPTIconButton(
                  onPressed: leadingIconOnPressed!,
                  icon: leadingIcon!,
                ),
              ),
            ),
            title: GestureDetector(
              onTap: titleOnTap,
              child: Text(
                title!.tr,
                style: TextStyle(
                  fontSize: 18,
                  color: !context.isDarkMode ? Colors.black : Colors.white,
                ),
              ),
            ),
            actions: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: EasyGPTIconButton(
                  onPressed: actionsIconOnPressed!,
                  icon: actionsIcon!,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
