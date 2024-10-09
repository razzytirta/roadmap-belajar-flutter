import 'package:flutter/material.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  //Remove this method to stop OneSignal Debugging
  OneSignal.Debug.setLogLevel(OSLogLevel.verbose);

  OneSignal.initialize("e6faafe6-fc55-4d31-bfbc-98431e180e48");

// The promptForPushNotificationsWithUserResponse function will show the iOS or Android push notification prompt. We recommend removing the following code and instead using an In-App Message to prompt for notification permission
  OneSignal.Notifications.requestPermission(true);
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

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  String title = "title";
  String content = "Content";
  String url = "";
  @override
  void initState() {
    super.initState();

    OneSignal.Notifications.addForegroundWillDisplayListener((event) {
      /// Display Notification, preventDefault to not display
      event.preventDefault();

      /// Do async work

      /// notification.display() to display after preventing default
      event.notification.display();

      setState(() {
        title = event.notification.title ?? "No Message";
        content = event.notification.body ?? "No Body";
        url = event.notification.bigPicture ?? "";
      });
    });

    OneSignal.InAppMessages.addClickListener((event) {
      print("Notifikasi DIclik $event");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("One Signal Demo"),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(title),
            const SizedBox(
              height: 20,
            ),
            Text(content),
            (url != "")
                ? Container(
                    height: 393,
                    width: 700,
                    decoration: BoxDecoration(
                        image: DecorationImage(image: NetworkImage(url))),
                  )
                : const SizedBox(),
          ],
        ),
      ),
    );
  }
}
