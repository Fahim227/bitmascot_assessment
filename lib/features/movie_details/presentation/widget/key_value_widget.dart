import 'package:flutter/material.dart';

class TitleDescriptionWidget extends StatelessWidget {
  final String title;
  final String description;

  const TitleDescriptionWidget({
    super.key,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: Theme.of(context).textTheme.titleMedium),
        Text(description, style: Theme.of(context).textTheme.titleSmall),
      ],
    );
  }
}
