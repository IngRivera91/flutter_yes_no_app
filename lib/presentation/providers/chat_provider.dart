import 'package:flutter/material.dart';
import 'package:yes_no_app/domain/entities/message.dart';

class ChatProvider extends ChangeNotifier {
  final ScrollController cahtScrollController = ScrollController();

  List<Message> messageList = [
    Message(text: 'hi!!', fromWho: FromWho.me),
    Message(text: 'Ya estas en la casa?', fromWho: FromWho.me),
  ];

  Future<void> sendMessage(String text) async {
    if (text.isEmpty) {
      return;
    }
    
    final Message newMessage = Message(text: text, fromWho: FromWho.me);
    messageList.add(newMessage);
    notifyListeners();
    moveScrollToBottom();
  }

  void moveScrollToBottom() {
    cahtScrollController.animateTo(
        cahtScrollController.position.maxScrollExtent,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut);
  }
}
