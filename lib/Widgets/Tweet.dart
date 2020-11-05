import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';


class TweetWidget extends StatelessWidget {

  final String _displayName;
  final String _handle;
  final String _tweet;
  //todo add object for tweet json
  TweetWidget(this._displayName,this._handle,this._tweet);


  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
          children: [
            ListTile(
              leading: CircleAvatar(
                child: Icon(Icons.account_circle),
              ),
              title: Text("${this._displayName} \t${this._handle}\t 4h "),
              trailing: Icon(Zocial.twitter),
              subtitle: Text(this._tweet),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Spacer(),
                Row(
                  children: [
                    IconButton(
                        icon: Icon(Icons.chat_bubble_outline),
                        onPressed: (){}),
                    Text("3409")
                  ],
                ),

                Row(
                  children: [
                    IconButton(
                        icon: Icon(AntDesign.retweet),

                        onPressed: (){}),
                    Text("3409")
                  ],
                ),

                Row(
                  children: [
                    IconButton(
                        icon: Icon(EvilIcons.heart),
                        onPressed: (){}),
                    Text("3409")
                  ],
                ),

                IconButton(
                    icon: Icon(Icons.share),
                    onPressed: (){}),

                Spacer(),
              ],
            )
          ],
        )
    );
  }
}
