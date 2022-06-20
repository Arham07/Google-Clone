import 'package:flutter/material.dart';

import 'language_text.dart';

class TranslationButtons extends StatelessWidget {
  const TranslationButtons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Wrap(
      alignment: WrapAlignment.center,
      children: const [
        Text('Google offered in:'),
        SizedBox(width: 5),
        LanguageText(title: 'اردو'),
        SizedBox(width: 5),
        LanguageText(title: 'German'),
        SizedBox(width: 5),
        LanguageText(title: 'Turkish'),
      ],
    );
  }
}
