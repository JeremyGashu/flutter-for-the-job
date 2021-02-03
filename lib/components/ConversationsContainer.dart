import 'package:flutter/material.dart';
import 'package:flutter_chat_for_job/components/MessageDetail.dart';
import 'package:flutter_chat_for_job/models/ApplicationModel.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class ConversationsContainer extends StatelessWidget {
  final DateFormat dateFormat = DateFormat("HH:mm a");
  @override
  Widget build(BuildContext context) {
    return Consumer<ApplicationModel>(
      builder: (context, state, child) {
        return SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(10),
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    border: Border.all(
                        color: Colors.grey.withOpacity(0.5), width: 1),
                  ),
                  child: Text(
                    'Messages',
                    style: TextStyle(
                        letterSpacing: 1.2,
                        fontFamily: 'Lato',
                        fontSize: 30,
                        color: Colors.grey[800]),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(5),
                  child: ListView.builder(
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      itemCount: state.conversations.length,
                      itemBuilder: (context, index) {
                        return InkWell(
                          splashColor: Colors.grey.withOpacity(0.2),
                          onTap: () {
                            Provider.of<ApplicationModel>(context,
                                    listen: false)
                                .setSelectedConversation(
                                    (index + 1).toString());

                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        ChangeNotifierProvider(
                                          create: (_) => ApplicationModel(),
                                          child: MessageDetail(
                                            conversation:
                                                state.conversations[index],
                                            selectedConversation:
                                                state.selectedConversation,
                                            userID: state.userID,
                                          ),
                                        )));
                            // print(.id);
                          },
                          child: Card(
                            child: Padding(
                              padding: EdgeInsets.all(5),
                              child: ListTile(
                                leading: CircleAvatar(
                                  radius: 25,
                                  backgroundImage: NetworkImage(
                                      "https://source.unsplash.com/user/jeremy/60x60"),
                                ),
                                title: Text(
                                  '${state.conversations[index].name}',
                                  style: TextStyle(
                                    // fontFamily: 'Lato',
                                    letterSpacing: 1.1,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                subtitle: Text(
                                  '${state.conversations[index].messages[state.conversations[index].messages.length - 1].content}',
                                ),
                                //   DateTime durationDate = DateTime.fromMillisecondsSinceEpoch(0);
                                // String duration = DateFormat('hh:mm:ss').format(durationDate);
                                trailing: Text(
                                  '${dateFormat.format(state.conversations[index].messages[state.conversations[index].messages.length - 1].time)}',
                                ),
                              ),
                            ),
                          ),
                        );
                      }),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
