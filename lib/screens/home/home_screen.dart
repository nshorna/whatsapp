import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:whatsapp/components/action_button.dart';
import 'package:whatsapp/screens/home/camera_tab.dart';
import 'package:whatsapp/screens/new_broadcast/new_broadcast_screen.dart';
import 'package:whatsapp/screens/new_group/new_group_screen.dart';
import 'package:whatsapp/screens/settings/settings_screen.dart';
import 'package:whatsapp/screens/starred_messages/starredmessages_screen.dart';
import 'package:whatsapp/screens/welcome/welcome_screen.dart';
import 'package:whatsapp/screens/whatsapp_web/whatsappweb_screen.dart';
import 'package:whatsapp/strings.dart';

import 'calls_tab.dart';
import 'chats_tab.dart';
import 'status_tab.dart';

class HomeScreen extends StatelessWidget {
  static final String id = 'homescreen';

  @override
  Widget build(BuildContext context) {
    // return DefaultTabController(
    //   initialIndex: 2,
    //   length: 4,
    //   child: Scaffold(
    //     body: CustomScrollView(
    //       slivers: <Widget>[
    //         SliverAppBar(
    //           backgroundColor: Color.fromRGBO(7, 94, 84, 1),
    //           title: Text(
    //             'WhatsApp',
    //           ),
    //           bottom: buildTabBar(),
    //           actions: buildActions(context),
    //         ),
    //         SliverList(
    //           delegate: SliverChildBuilderDelegate(
    //             (BuildContext ctx, int i) {
    //               return Column(children: <Widget>[
    //                 ListTile(title: Text('hello')),
    //                 ListTile(title: Text('hello')),
    //                 ListTile(title: Text('hello'))
    //               ],);
    //             },
    //             childCount: 5,
    //           ),
    //         )
    //       ],
    //     ),
    //   ),
    // );

    return DefaultTabController(
      initialIndex: 0,
      length: 4,
      child: Scaffold(
        appBar: buildAppBar(context),
        body: TabBarView(children: <Widget>[
          CameraTab(),
          ChatTab(),
          StatusTab(),
          CallsTab(),
        ]),
      ),
    );
  }

  buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: Color.fromRGBO(7, 94, 84, 1),
      title: Text(
        'WhatsApp',
      ),
      bottom: buildTabBar(),
      actions: buildActions(context),
    );
  }

  buildTabBar() {
    return TabBar(
      tabs: <Widget>[
        Tab(child: Icon(Icons.camera_alt)),
        Tab(child: Text(chats_text.toUpperCase())),
        Tab(child: Text(status_text.toUpperCase())),
        Tab(child: Text(calls_text.toUpperCase())),
      ],
    );
  }

  buildActions(BuildContext context) {
    return [
      ActionButton(
        icon: Icons.search,
        onPressed: () {},
      ),
      PopupMenuButton(
        child: ActionButton(icon: Icons.more_vert, onPressed: null),
        itemBuilder: (BuildContext context) {
          return [
            new_group_text,
            new_broadcast_text,
            whatsapp_web_text,
            starred_messages_text,
            settings_text,
            exit_text,
          ]
              .map((title) => PopupMenuItem(
                    value: title,
                    child: buildMenuItem(title, context),
                    enabled: true,
                  ))
              .toList();
        },
        onSelected: (title) {
          if (title == new_group_text) {
            Navigator.of(context).push(
              MaterialPageRoute(builder: (ctx) => NewGroupScreen()),
            );
          } else if (title == new_broadcast_text) {
            Navigator.of(context).push(
              MaterialPageRoute(builder: (ctx) => NewBroadcastScreen()),
            );
          } else if (title == whatsapp_web_text) {
            Navigator.of(context).push(
              MaterialPageRoute(builder: (ctx) => WhatsappwebScreen()),
            );
          } else if (title == starred_messages_text) {
            Navigator.of(context).push(
              MaterialPageRoute(builder: (ctx) => StarredmessagesScreen()),
            );
          } else if (title == settings_text) {
            Navigator.of(context).push(
              MaterialPageRoute(builder: (ctx) => SettingsScreen()),
            );
          } else if (title == exit_text) {
            Navigator.of(context).pushNamed(WelcomeScreen.id);
          }
        },
      ),
    ];
  }

  buildMenuItem(String title, BuildContext context) {
    return Text(title);
  }
}
