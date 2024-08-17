class MessageBubbleModel {
  final String message;
  final String uid;

  MessageBubbleModel({
    required this.message,
    required this.uid,
    // required this.isMe,
  });

  factory MessageBubbleModel.fromJson(json) {
    return MessageBubbleModel(
      message: json['message'], uid: json['uid'],
      // isMe: json['isMe'],
    );
  }
}
