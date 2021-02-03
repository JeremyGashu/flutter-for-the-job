import 'package:flutter/cupertino.dart';
import 'package:flutter_chat_for_job/models/Conversation.dart';
import 'package:flutter_chat_for_job/models/Message.dart';

class ApplicationModel extends ChangeNotifier {
  String userID = 'gearmias';
  String name = 'Ermias Gashu';
  String selectedConversation;

  String getSelectedConversations() => this.selectedConversation;

  List<Conversation> conversations = [
    Conversation(
      id: '1',
      name: 'Ariana Grande',
      isOnline: true,
      messages: [
        Message(
          time: new DateTime.now(),
          content: 'Hi Jeremy This is just to say Hi!',
          senderId: 'arianagrande',
        ),
        Message(
          time: new DateTime.now(),
          content: 'Hi Ariana, What\'s up?',
          senderId: 'gearmias',
        ),
        Message(
          time: new DateTime.now(),
          content: 'I am good, what is new?',
          senderId: 'arianagrande',
        ),
        Message(
          time: new DateTime.now(),
          content: 'Nothing is new I will call you sometime.',
          senderId: 'gearmias',
        ),
      ],
    ),
    Conversation(
      id: '2',
      name: 'Selena Gomez',
      isOnline: true,
      messages: [
        Message(
          time: new DateTime.now(),
          content: 'Hi Jeremy This is just to say Hi!',
          senderId: 'arianagrande',
        ),
        Message(
          time: new DateTime.now(),
          content: 'Hi Selena, What\'s up?',
          senderId: 'gearmias',
        ),
        Message(
          time: new DateTime.now(),
          content: 'I am good, what is new?',
          senderId: 'arianagrande',
        ),
        Message(
          time: new DateTime.now(),
          content: 'Nothing is new I will call you sometime.',
          senderId: 'gearmias',
        ),
      ],
    ),
    Conversation(
      id: '3',
      name: 'Kim Kardashian',
      isOnline: true,
      messages: [
        Message(
          time: new DateTime.now(),
          content: 'Hi Jeremy This is just to say Hi!',
          senderId: 'arianagrande',
        ),
        Message(
          time: new DateTime.now(),
          content: 'Hi Kim, What\'s up?',
          senderId: 'gearmias',
        ),
        Message(
          time: new DateTime.now(),
          content: 'I am good, what is new?',
          senderId: 'arianagrande',
        ),
        Message(
          time: new DateTime.now(),
          content: 'Nothing is new I will call you sometime.',
          senderId: 'gearmias',
        ),
      ],
    ),
    Conversation(
      id: '4',
      name: 'Miley Cyrus',
      isOnline: true,
      messages: [
        Message(
          time: new DateTime.now(),
          content: 'Hi Jeremy This is just to say Hi!',
          senderId: 'arianagrande',
        ),
        Message(
          time: new DateTime.now(),
          content: 'Hi Miley, What\'s up?',
          senderId: 'gearmias',
        ),
        Message(
          time: new DateTime.now(),
          content: 'I am good, what is new?',
          senderId: 'arianagrande',
        ),
        Message(
          time: new DateTime.now(),
          content: 'Nothing is new I will call you sometime.',
          senderId: 'gearmias',
        ),
      ],
    ),
    Conversation(
      id: '5',
      name: 'Michael Jackson',
      isOnline: true,
      messages: [
        Message(
          time: new DateTime.now(),
          content: 'Hi Jeremy This is just to say Hi!',
          senderId: 'arianagrande',
        ),
        Message(
          time: new DateTime.now(),
          content: 'Hi Michael, What\'s up?',
          senderId: 'gearmias',
        ),
        Message(
          time: new DateTime.now(),
          content: 'I am good, what is new?',
          senderId: 'arianagrande',
        ),
        Message(
          time: new DateTime.now(),
          content: 'Nothing is new I will call you sometime.',
          senderId: 'gearmias',
        ),
      ],
    ),
    Conversation(
      id: '6',
      name: 'Tom Cruise',
      isOnline: true,
      messages: [
        Message(
          time: new DateTime.now(),
          content: 'Hi Jeremy This is just to say Hi!',
          senderId: 'arianagrande',
        ),
        Message(
          time: new DateTime.now(),
          content: 'Hi Tom, What\'s up?',
          senderId: 'gearmias',
        ),
        Message(
          time: new DateTime.now(),
          content: 'I am good, what is new?',
          senderId: 'arianagrande',
        ),
        Message(
          time: new DateTime.now(),
          content: 'Nothing is new I will call you sometime.',
          senderId: 'gearmias',
        ),
      ],
    ),
    Conversation(
      id: '7',
      name: 'Taylor Swift',
      isOnline: true,
      messages: [
        Message(
          time: new DateTime.now(),
          content: 'Hi Jeremy This is just to say Hi!',
          senderId: 'arianagrande',
        ),
        Message(
          time: new DateTime.now(),
          content: 'Hi Taylor, What\'s up?',
          senderId: 'gearmias',
        ),
        Message(
          time: new DateTime.now(),
          content: 'I am good, what is new?',
          senderId: 'arianagrande',
        ),
        Message(
          time: new DateTime.now(),
          content: 'Nothing is new I will call you sometime.',
          senderId: 'gearmias',
        ),
      ],
    ),
    Conversation(
      id: '8',
      name: 'Beyonce',
      isOnline: true,
      messages: [
        Message(
          time: new DateTime.now(),
          content: 'Hi Jeremy This is just to say Hi!',
          senderId: 'arianagrande',
        ),
        Message(
          time: new DateTime.now(),
          content: 'Hi B, What\'s up?',
          senderId: 'gearmias',
        ),
        Message(
          time: new DateTime.now(),
          content: 'I am good, what is new?',
          senderId: 'arianagrande',
        ),
        Message(
          time: new DateTime.now(),
          content: 'Nothing is new I will call you sometime.',
          senderId: 'gearmias',
        ),
      ],
    ),
  ];
  setSelectedConversation(String conversationId) {
    this.selectedConversation = conversationId;
    notifyListeners();
  }

  sendMessage(String senderID, conversationID, content) {
    Message newMessage =
        Message(time: new DateTime.now(), content: content, senderId: senderID);
    List<Conversation> updatedConversation = conversations.map((conversation) {
      if (conversation.id == conversationID) {
        conversation.messages = [...conversation.messages, newMessage];
        return conversation;
      } else {
        return conversation;
      }
    }).toList();
    this.conversations = updatedConversation;
    notifyListeners();
  }
}
