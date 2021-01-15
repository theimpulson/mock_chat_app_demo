import 'package:flutter/material.dart';
import 'package:mock_chat_app_demo/Conversations.dart';
import 'package:stream_chat_flutter/stream_chat_flutter.dart';

void main() async {
  // Client id is your API KEY
  final client = Client(
    'YOUR_API_KEY',
    logLevel: Level.INFO,
  );

  // Change id and token as given from [UserCreator] to be able to login as that user
  await client.setUser(
    User(id: 'OUR_CLIENT_NAME'),
    'YOUR_CLIENT_TOKEN',
  );

  // Channel id should be similar in both users
  final channel = client.channel('messaging', id: 'AvengersChat');
  channel.watch();

  runApp(MyApp(client, channel));
}

class MyApp extends StatelessWidget {
  final Client client;
  final Channel channel;

  MyApp(this.client, this.channel);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      builder: (context, widget) {
        return StreamChat(
          child: widget,
          client: client,
        );
      },
      home: HomeScreen(
        channel: channel,
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  final Channel channel;

  HomeScreen({@required this.channel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView(
        children: [
          ListTile(
            title: Text('AvengersChat'),
            onTap: () {
              return Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => AvengersChat(
                    channel: channel,
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
