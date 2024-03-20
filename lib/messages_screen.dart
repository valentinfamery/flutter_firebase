import 'package:flutter/material.dart';
import 'package:stream_chat_flutter/stream_chat_flutter.dart';

class MessagesScreen extends StatelessWidget {
  StreamChatClient streamChatClient;

  MessagesScreen({required this.streamChatClient, super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      builder: (context, child) => StreamChat(
        client: streamChatClient,
        child: child,
      ),
      home: const ChannelListPage(),
    );
  }
}

class ChannelListPage extends StatefulWidget {
  const ChannelListPage({
    Key? key,
  }) : super(key: key);

  @override
  State<ChannelListPage> createState() => _ChannelListPageState();
}

class _ChannelListPageState extends State<ChannelListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Text(''));
  }
}

class ChannelPage extends StatelessWidget {
  const ChannelPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const StreamChannelHeader(),
      body: Column(
        children: const <Widget>[
          Expanded(
            child: StreamMessageListView(),
          ),
          StreamMessageInput(),
        ],
      ),
    );
  }
}
