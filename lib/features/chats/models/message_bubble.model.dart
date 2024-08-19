class MessageBubbleModel {
  final String message;
  final String receiverId;
  final String senderId;

  MessageBubbleModel({
    required this.message,
    required this.receiverId,
    required this.senderId,
  });

  factory MessageBubbleModel.fromJson(json) {
    return MessageBubbleModel(
      message: json['message'],
      receiverId: json['receiverId'],
      senderId: json['senderId'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'message': message,
      'receiverId': receiverId,
      'senderId': senderId,
    };
  }
}
