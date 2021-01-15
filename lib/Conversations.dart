import 'package:flutter/material.dart';
import 'package:stream_chat_flutter/stream_chat_flutter.dart';

class AvengersChat extends StatelessWidget {
  final Channel channel;

  AvengersChat({@required this.channel});

  @override
  Widget build(BuildContext context) {
    return StreamChannel(
      channel: channel,
      child: Scaffold(
        appBar: ChannelHeader(),
        body: Column(
          children: <Widget>[
            Expanded(
              child: MessageListView(),
            ),
            MessageInput(),
          ],
        ),
      ),
    );
  }
}