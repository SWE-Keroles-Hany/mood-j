import 'package:emojis/emoji.dart';
import 'package:moodly_j/core/our_emojis.dart';

(Emoji, String) getEmoji(String? res) {
  if (res == "smiling face with smiling eyes") {
    return (OurEmojis.happy, "Happy");
  } else if (res == "crying face") {
    return (OurEmojis.sad, "Sad");
  } else if (res == "pouting face") {
    return (OurEmojis.angry, "Angry");
  } else if (res == "star-struck") {
    return (OurEmojis.excited, "Excited");
  } else if (res == "smirking face") {
    return (OurEmojis.boring, "Boring");
  } else if (res == "relieved face") {
    return (OurEmojis.calm, "Calm");
  } else {
    return (OurEmojis.question, "--");
  }
}
