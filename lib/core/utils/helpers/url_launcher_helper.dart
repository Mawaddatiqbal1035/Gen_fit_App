import 'package:url_launcher/url_launcher.dart';

class UrlLauncherHelper{

  static Future<void> openUrl(String url) async {
    final Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(
        uri,
        mode: LaunchMode.externalApplication, // Opens in the system's browser
      );
    } else {
      throw Exception('Could not launch $url');
    }
  }
}