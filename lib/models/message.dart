class Message {
  final String message;
  Message({required this.message});

  factory Message.fromjson(json){
    return Message(message: json['message']);
  }
}