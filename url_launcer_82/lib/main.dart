import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MainPage(),
    );
  }
}

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Url Launcher Demo"),
        backgroundColor: Colors.lightBlue,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            LaunchButton(
                text: 'Call',
                onTap: () async {
                  print('hahaha');
                  await call('+6289627306954');
                }),
            LaunchButton(
              text: 'SMS',
              onTap: () async {
                print('hahaha');
                await sendSMS('+6289627306954');
              },
            ),
            LaunchButton(
                text: 'Email',
                onTap: () async {
                  await sendEmail('razzy@email.com');
                }),
            LaunchButton(
                text: 'URL',
                onTap: () async {
                  await openUrl(
                    'amazon.com',
                    forceWebView: true,
                    enableJavaScript: true,
                  );
                }),
          ],
        ),
      ),
    );
  }
}

class LaunchButton extends StatelessWidget {
  final String? text;
  final Function()? onTap;
  const LaunchButton({super.key, this.text, this.onTap});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 200,
      child: ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.blue[100],
        ),
        child: Text(text!),
      ),
    );
  }
}

Future<void> call(String phoneNumber) async {
  await launchUrl(Uri.parse('tel:$phoneNumber'));
}

Future<void> sendEmail(String email) async {
  await launchUrl(Uri.parse('mailto:$email'));
}

Future<void> sendSMS(String phoneNumber) async {
  Uri smsUri = Uri.parse('sms:$phoneNumber');
  if (await canLaunchUrl(smsUri)) {
    final bool launched = await launchUrl(smsUri);
    if (!launched) {
      print('Failed to launch SMS intent.');
    }
  } else {
    throw 'Could not send SMS to $phoneNumber';
  }
}

Future<void> openUrl(String url,
    {bool forceWebView = false, bool enableJavaScript = false}) async {
  // Ensure the URL starts with http or https
  if (!url.startsWith('http://') && !url.startsWith('https://')) {
    throw 'The provided URL is not valid for WebView. It must start with http:// or https://';
  }

  Uri uri = Uri.parse(url);
  if (await canLaunchUrl(uri)) {
    await launchUrl(
      uri,
      mode: LaunchMode.inAppWebView, // Force WebView mode
      webViewConfiguration:
          WebViewConfiguration(enableJavaScript: enableJavaScript),
    );
  } else {
    throw 'Could not launch $url';
  }
}
