import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

// A widget that turns any URLs or internal links in the provided text into clickable links.
class ClickableLinks extends StatelessWidget {
  final String text;
  final TextAlign textAlign;
  final TextStyle? style;

  const ClickableLinks({
    super.key,
    required this.text,
    required this.textAlign,
    this.style,
  });

  // Opens the provided URL in the default browser.
  Future<void> _launchUrl(String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    }
  }

  @override
  Widget build(BuildContext context) {
    // RegEx for external links starting with http:// or https://
    final externalLinkRegex = RegExp(r'(https?://[^\s\)]+)');
    // RegEx for internal links in the form of {link:/somepath:Text:icon}
    final internalLinkRegex =
        RegExp(r'\(link:(\/[^\s:]*):([^\):]*):([^\)]*)\)');

    // Combining the regex to match both external and internal links.
    final externalMatches = externalLinkRegex.allMatches(text).toList();
    final internalMatches = internalLinkRegex.allMatches(text).toList();

    // Combine both lists of matches
    final allMatches = [...externalMatches, ...internalMatches];

    final textSpans = <TextSpan>[];
    int lastMatchEnd = 0;

    for (final match in allMatches) {
      String? link;
      String? linkText;
      String? iconName;
      bool isExternal = false;

      if (externalLinkRegex.hasMatch(match.group(0)!)) {
        link = match.group(0);
        isExternal = true;
      } else if (internalLinkRegex.hasMatch(match.group(0)!)) {
        link = match.group(1); // Group 1 captures the link path after {link:}
        linkText =
            match.group(2); // Group 2 captures the link text (e.g., Timer)
        iconName =
            match.group(3); // Group 3 captures the icon name (e.g., "alarm")
      }

      // Add text before the link
      textSpans.add(TextSpan(
        text: text.substring(lastMatchEnd, match.start),
        style: Theme.of(context).textTheme.bodyMedium,
      ));

      // Add the clickable link with icon
      textSpans.add(TextSpan(
        style: const TextStyle(
          color: Colors.blue,
        ),
        children: [
          if (iconName != null)
            WidgetSpan(
              child: Padding(
                padding: const EdgeInsets.only(right: 2.0),
                child: Icon(
                  _getIconByName(iconName),
                  size: 16.0,
                  color: Colors.blue,
                ),
              ),
            ),
          TextSpan(
            text: linkText ?? link,
            style: const TextStyle(
              color: Colors.blue,
            ),
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                if (isExternal) {
                  _launchUrl(link!); // External URL
                } else {
                  Navigator.pushReplacementNamed(
                      context, link!); // Internal link
                }
              },
          ),
        ],
      ));

      lastMatchEnd = match.end;
    }

    // Add any remaining text after the last link
    textSpans.add(TextSpan(
      text: text.substring(lastMatchEnd),
      style: style ??
          const TextStyle(color: Colors.black), // Fallback to default style
    ));

    return RichText(
      textAlign: textAlign,
      text: TextSpan(
        children: textSpans,
      ),
    );
  }

  // Function to get an icon by name
  IconData _getIconByName(String iconName) {
    switch (iconName) {
      case 'alarm':
        return Icons.alarm;
      case 'lock':
        return Icons.lock;
      case 'timer':
        return Icons.timer;
      default:
        return Icons.link; // Default icon if no match
    }
  }
}
