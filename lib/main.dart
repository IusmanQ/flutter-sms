import 'package:flutter/material.dart';
import 'package:flutter_sms/flutter_sms.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home:  MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {

  void _sendSMS(String message, List<String> recipents) async {
    String _result = await sendSMS(message: message, recipients: recipents)
        .catchError((onError) {
      print(onError);
    });
    print(_result);
  }
  String message = "This is a test message!";
  List<String> recipents = ["+923416164636"];



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: MaterialButton(
        onPressed:() => _sendSMS(message, recipents),
        child: Text('Send Message'),
      )),
    );
  }
}



