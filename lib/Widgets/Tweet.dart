import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';


class TweetWidget extends StatelessWidget {

  TweetWidget(String displayName,String handleString, tweetString){
    final String dis = displayName;
    final String handle = handleString;
    final String tweet = tweetString;
  }


  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
          children: [
            ListTile(
              leading: CircleAvatar(
                child: Icon(Icons.account_circle),
              ),
              title: Text("{display name} \t{username}\t 4h "),
              trailing: Icon(Zocial.twitter),
              subtitle: Text("Something cool about twitter"),
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
