import 'package:flutter/material.dart';
import 'package:whatsapp/colors.dart';
import 'package:whatsapp/strings.dart';

class ChatScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final bool contactPermissionGranted = true;

    return Scaffold(
      body:
          contactPermissionGranted ? buildChatList() : buildPermissionRequest(),
      floatingActionButton:
          FloatingActionButton(onPressed: null, child: Icon(Icons.message)),
    );
  }

  buildChatList() {
    var list = List.generate(100, (index) {
      return index;
    });

    return ListView.builder(
      itemCount: list.length,
      itemBuilder: (BuildContext ctx, int index) {
        return Padding(
          padding: EdgeInsets.only(left: 16, bottom: 10, right: 5, top: 10),
          child: Row(
            children: <Widget>[
              buildChatAvatar(),
              buildChatDetails(),
              buildChatTimeAndCount(),
            ],
          ),
        );
      },
    );
  }

  Container buildChatTimeAndCount() {
    return Container(
      height: 40,
      child: Padding(
        padding: const EdgeInsets.only(left: 15, right: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Text(
              '1:22 PM',
              style: TextStyle(
                  fontWeight: FontWeight.w400,
                  color: fainterTextColor,
                  fontSize: 12),
            ),
            CircleAvatar(
              radius: 10,
              backgroundColor: btnBgColor,
              child: Center(
                child: Text(
                  '2',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 10,
                      fontWeight: FontWeight.w500),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Expanded buildChatDetails() {
    return Expanded(
      child: Container(
        height: 40,
        child: Padding(
          padding: const EdgeInsets.only(left: 15, right: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              buildChatName(),
              buildChatSnippet(),
            ],
          ),
        ),
      ),
    );
  }

  Text buildChatSnippet() => Text('..');

  Text buildChatName() {
    return Text(
      'Isaac Larbi',
      style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
    );
  }

  CircleAvatar buildChatAvatar() {
    return CircleAvatar(
      child: Icon(Icons.person, color: iconWhiteColor, size: 40),
      radius: 25,
      backgroundColor: avatarBgColor,
    );
  }

  buildPermissionRequest() {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          SizedBox(height: 65),
          Center(
            child: CircleAvatar(
              backgroundColor: pageHeadingColor,
              radius: 100,
              child: Icon(
                Icons.contacts,
                color: Colors.white,
                size: 70,
              ),
            ),
          ),
          SizedBox(height: 45),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Center(
                child: Text(
              to_help_you_message_friends,
              style: TextStyle(),
            )),
          ),
          SizedBox(height: 45),
          RaisedButton(
            color: btnBgColor,
            child: Text(
              settings_text_caps,
              style:
                  TextStyle(fontWeight: FontWeight.bold, color: btnTextColor),
            ),
            onPressed: () {
              //TODO implement onpressed
            },
          ),
        ],
      ),
    );
  }
}
