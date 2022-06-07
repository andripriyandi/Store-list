import 'package:dependencies/url_launcher/url_launcher.dart';

class LaunchUrl {
  LaunchUrl._privateConstructor();

  static final LaunchUrl _instance = LaunchUrl._privateConstructor();

  static LaunchUrl get getInstance => _instance;

  Future<void> launchURL(String url) async => await canLaunchUrl(Uri.parse(url))
      ? await launchURL(url)
      : throw const FormatException("Url Tidak Valid");
}
