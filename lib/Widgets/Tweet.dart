import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:twitter_tweets_ui/Objects/TwitterPostTemp.dart';


class TweetWidget extends StatelessWidget {

  final TwitterPostTemp temp;

  TweetWidget(this.temp);


  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
          children: [
            ListTile(
              leading: CircleAvatar(
                child: Icon(Icons.account_circle),
              ),
              title: Text("account name \t@account name\t 4h "),
              // title: Text("${temp.getUser().getAccountName()} \t${temp.getUser().getUserHandle()}\t 4h "),
              trailing: Icon(Zocial.twitter),
              subtitle: Text(temp.getTweetText()),
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
                    Text(temp.getReplyCount().toString())
                  ],
                ),

                Row(
                  children: [
                    IconButton(
                        icon: Icon(AntDesign.retweet),

                        onPressed: (){}),
                    Text(temp.getRetweetCount().toString())
                  ],
                ),

                Row(
                  children: [
                    IconButton(
                        icon: Icon(EvilIcons.heart),
                        onPressed: (){}),
                    Text(temp.getFavouriteCount().toString())
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
