import 'package:emojis/emoji.dart';
import 'package:flutter/material.dart';
import 'package:moodly_j/core/our_emojis.dart';
import 'package:moodly_j/l10n/app_localizations.dart';

(Emoji, String) getEmoji(String? res, BuildContext context) {
  if (res == "smiling face with smiling eyes") {
    return (OurEmojis.happy, AppLocalizations.of(context)!.happy);
  } else if (res == "crying face") {
    return (OurEmojis.sad, AppLocalizations.of(context)!.sad);
  } else if (res == "pouting face") {
    return (OurEmojis.angry, AppLocalizations.of(context)!.angry);
  } else if (res == "star-struck") {
    return (OurEmojis.excited, AppLocalizations.of(context)!.excited);
  } else if (res == "smirking face") {
    return (OurEmojis.boring, AppLocalizations.of(context)!.boring);
  } else if (res == "relieved face") {
    return (OurEmojis.calm, AppLocalizations.of(context)!.calm);
  } else {
    return (OurEmojis.question, "--");
  }
}
