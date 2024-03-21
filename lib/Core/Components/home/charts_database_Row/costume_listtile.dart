// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:sales_management_system/Controllers/lang/lang_controller.dart';
import 'package:sales_management_system/Core/Constants/theme.dart';

// ignore: must_be_immutable
class CostumeListTile extends StatelessWidget {
  const CostumeListTile({
    Key? key,
    required this.title,
    required this.subtitle,
    required this.icon,
  }) : super(key: key);
  final String title;
  final String subtitle;
  final dynamic icon;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: ThemeColors.secondary.withOpacity(.4),
        borderRadius: BorderRadius.circular(5),
        border: Border.all(color: ThemeColors.secondary, width: 2),
      ),
      child: ListTile(
        leading: Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
              color: ThemeColors.secondary,
              borderRadius: BorderRadius.circular(5)),
          child: Icon(
            icon,
            color: ThemeColors.secondaryTextColor,
            size: 25,
          ),
        ),
        title: Text(
          title,
          style: const TextStyle(
              color: ThemeColors.primaryTextColor,
              fontWeight: FontWeight.bold,
              fontSize: 14),
        ),
        subtitle: Text(subtitle,
            textDirection: LanguageRadioController().selectedValue
                ?TextDirection.ltr : null,
            textAlign: LanguageRadioController().selectedValue
                ? TextAlign.end
                : TextAlign.start,
            style: const TextStyle(
              color: ThemeColors.primaryTextColor,
            )),
      ),
    );
  }
}
