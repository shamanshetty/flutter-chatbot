import 'package:flutter/material.dart';
import 'chat_message.dart';
import 'response_handler.dart';
import '../../models/chat_message_model.dart';

class FarmerChatbot extends StatefulWidget {
  @override
  _FarmerChatbotState createState() => _FarmerChatbotState();
}

class _FarmerChatbotState extends State<FarmerChatbot> {
  final TextEditingController _controller = TextEditingController();
  final List<ChatMessage> _messages = [];
  final ScrollController _scrollController = ScrollController();
  final ResponseHandler _responseHandler = ResponseHandler();

  @override
  void dispose() {
    _controller.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  void _handleSubmitted(String text) {
    _controller.clear();

    // Add the user message to the chat
    ChatMessage userMessage = ChatMessage(
      text: text,
      isUser: true,
    );

    setState(() {
      _messages.add(userMessage);
    });

    // Get response using the response handler
    String response = _responseHandler.getResponse(text);

    // Add bot response
    ChatMessage botMessage = ChatMessage(
      text: response,
      isUser: false,
    );

    setState(() {
      _messages.add(botMessage);
    });

    // Scroll to bottom after message is sent
    Future.delayed(Duration(milliseconds: 100), () {
      _scrollToBottom();
    });
  }

  void _scrollToBottom() {
    if (_scrollController.hasClients) {
      _scrollController.animateTo(
        _scrollController.position.maxScrollExtent,
        duration: Duration(milliseconds: 300),
        curve: Curves.easeOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            controller: _scrollController,
            padding: EdgeInsets.all(8.0),
            itemCount: _messages.length,
            itemBuilder: (_, index) => _messages[index],
          ),
        ),
        Divider(height: 1.0),
        Container(
          decoration: BoxDecoration(
            color: Theme.of(context).cardColor,
          ),
          child: _buildTextComposer(),
        ),
      ],
    );
  }

  Widget _buildTextComposer() {
    return IconTheme(
      data: IconThemeData(color: Theme.of(context).primaryColor),
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 8.0),
        child: Row(
          children: [
            Flexible(
              child: TextField(
                controller: _controller,
                onSubmitted: _handleSubmitted,
                decoration: InputDecoration.collapsed(
                  hintText: 'Ask any farming question...',
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 4.0),
              child: IconButton(
                icon: Icon(Icons.send),
                onPressed: () => _handleSubmitted(_controller.text),
              ),
            ),
          ],
        ),
      ),
    );
  }
}