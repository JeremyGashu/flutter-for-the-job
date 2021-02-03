import 'package:flutter/material.dart';
import 'package:flutter_chat_for_job/models/ApplicationModel.dart';
import 'package:flutter_chat_for_job/models/Conversation.dart';
import 'package:provider/provider.dart';
import 'package:timeago/timeago.dart' as timeago;

class MessageDetail extends StatefulWidget {
  final Conversation conversation;
  final String selectedConversation;
  final String userID;
  MessageDetail({this.conversation, this.selectedConversation, this.userID});

  @override
  _MessageDetailState createState() => _MessageDetailState();
}

class _MessageDetailState extends State<MessageDetail> {
  final _myController = TextEditingController();

  @override
  void dispose() {
    _myController.dispose();
    super.dispose();
  }

  @override
  @override
  Widget build(BuildContext context) {
    return Consumer<ApplicationModel>(
      builder: (context, state, child) {
        // Conversation conversation =
        //     state.conversations[];
        print(state.getSelectedConversations());

        return SafeArea(
          child: Scaffold(
            body: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.all(10),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                                color: Colors.grey.withOpacity(0.4), width: 1),
                          ),
                          child: Row(
                            children: [
                              IconButton(
                                  icon: Icon(
                                    Icons.arrow_back,
                                    size: 30,
                                  ),
                                  onPressed: () {
                                    Navigator.pop(context);
                                  }),
                              Padding(
                                padding: EdgeInsets.all(10),
                                child: Stack(
                                  children: [
                                    CircleAvatar(
                                      radius: 25,
                                      backgroundImage: NetworkImage(
                                          "https://source.unsplash.com/user/jeremy/60x60"),
                                    ),
                                    Positioned(
                                      bottom: 0,
                                      right: 0,
                                      child: Container(
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(7.5),
                                          color: Colors.green[900],
                                        ),
                                        width: 15,
                                        height: 15,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Text(
                                '${this.widget.conversation.name}',
                                style: TextStyle(
                                  fontSize: 25,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(10),
                          child: ListView.builder(
                              scrollDirection: Axis.vertical,
                              shrinkWrap: true,
                              itemCount:
                                  this.widget.conversation.messages.length,
                              itemBuilder: (context, index) {
                                return this
                                            .widget
                                            .conversation
                                            .messages[index]
                                            .senderId ==
                                        this.widget.userID
                                    ? Container(
                                        margin: EdgeInsets.all(10),
                                        padding:
                                            EdgeInsets.fromLTRB(60, 5, 5, 5),
                                        child: Stack(
                                          overflow: Overflow.visible,
                                          children: [
                                            Container(
                                              padding: EdgeInsets.symmetric(
                                                  vertical: 10, horizontal: 5),
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                                color: Colors.purple,
                                              ),
                                              child: Padding(
                                                padding: EdgeInsets.all(5),
                                                child: Text(
                                                  this
                                                      .widget
                                                      .conversation
                                                      .messages[index]
                                                      .content,
                                                  style: TextStyle(
                                                    fontSize: 16,
                                                    color: Colors.white,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Positioned(
                                              bottom: -20,
                                              left: 15,
                                              child: Text(
                                                timeago.format(this
                                                    .widget
                                                    .conversation
                                                    .messages[index]
                                                    .time),
                                                style: TextStyle(
                                                  color: Colors.grey,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      )
                                    : Container(
                                        margin: EdgeInsets.all(20),
                                        padding: EdgeInsets.all(10),
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                              color: Colors.grey, width: 0.5),
                                          borderRadius:
                                              BorderRadius.circular(20),
                                        ),
                                        child: Stack(
                                          overflow: Overflow.visible,
                                          children: [
                                            Padding(
                                              padding: EdgeInsets.all(5),
                                              child: Text(
                                                this
                                                    .widget
                                                    .conversation
                                                    .messages[index]
                                                    .content,
                                                style: TextStyle(
                                                  fontSize: 16,
                                                ),
                                              ),
                                            ),
                                            Positioned(
                                              bottom: -30,
                                              right: 5,
                                              child: Text(
                                                timeago.format(this
                                                    .widget
                                                    .conversation
                                                    .messages[index]
                                                    .time),
                                                style: TextStyle(
                                                  color: Colors.grey,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      );
                              }),
                        ),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 70),
                      child: Row(
                        children: [
                          Expanded(
                            child: TextField(
                              controller: _myController,
                              autocorrect: false,
                              decoration: InputDecoration(
                                hintText: 'Write your message here',
                                enabledBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10.0)),
                                  borderSide: BorderSide(
                                      color: Colors.grey.withOpacity(0.5)),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10.0)),
                                  borderSide: BorderSide(
                                      color: Colors.grey.withOpacity(0.4)),
                                ),
                              ),
                            ),
                          ),
                          IconButton(
                            icon: Icon(
                              Icons.send,
                              size: 40,
                              color: Colors.purple,
                            ),
                            onPressed: () {
                              var _newMessage = _myController.value.text;
                              // print(_newMessage);
                              Provider.of<ApplicationModel>(context,
                                      listen: false)
                                  .sendMessage(widget.userID,
                                      widget.selectedConversation, _newMessage);
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
