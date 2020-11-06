import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:twitter_tweets_ui/Objects/TwitterPostTemp.dart';
import 'package:twitter_tweets_ui/resources.dart';
import 'package:url_launcher/url_launcher.dart';


class TweetWidget extends StatelessWidget {

  final TwitterPostTemp temp;

  TweetWidget(this.temp);


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async{
        if (await canLaunch(temp.getTweetURL())) {
        await launch(
        temp.getTweetURL(),
        forceSafariVC: false,
        forceWebView: false,
        headers: <String, String>{'my_header_key': 'my_header_value'},
        );
        } else {
        throw 'Could not launch ${temp.getTweetURL()}';
        }

      },
        child: Column(
          children: [
            ListTile(
              leading: CircleAvatar(
                child: Icon(Icons.account_circle),
              ),
              // title: Text("account name \t@account name\t 4h "),
              title: Text("${temp.getUser().getAccountName()} \t${temp.getUser().getUserHandle()}\t 4h "),
              trailing: Icon(Zocial.twitter, size: 20.0,),
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
                    Text(statText(temp.getReplyCount()))
                  ],
                ),

                Row(
                  children: [
                    IconButton(
                        icon: Icon(AntDesign.retweet),

                        onPressed: (){}),
                    Text(statText(temp.getRetweetCount()))
                  ],
                ),

                Row(
                  children: [
                    IconButton(
                        icon: Icon(EvilIcons.heart),
                        onPressed: (){}),
                    Text(statText(temp.getFavouriteCount()))
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
