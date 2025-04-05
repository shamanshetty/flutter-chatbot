class ChatMessageModel {
  final String text;
  final bool isUser;
  final DateTime timestamp;
  final String? messageTopic; // Category of message like 'crop', 'market', etc.

  ChatMessageModel({
    required this.text,
    required this.isUser,
    DateTime? timestamp,
    this.messageTopic,
  }) : this.timestamp = timestamp ?? DateTime.now();

  // Convert to a Map for storage
  Map<String, dynamic> toMap() {
    return {
      'text': text,
      'isUser': isUser,
      'timestamp': timestamp.millisecondsSinceEpoch,
      'messageTopic': messageTopic,
    };
  }

  // Create from a Map for retrieval
  factory ChatMessageModel.fromMap(Map<String, dynamic> map) {
    return ChatMessageModel(
      text: map['text'],
      isUser: map['isUser'],
      timestamp: DateTime.fromMillisecondsSinceEpoch(map['timestamp']),
      messageTopic: map['messageTopic'],
    );
  }
}