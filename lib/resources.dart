


import 'dart:convert';

import 'package:twitter_api/twitter_api.dart';

///Obtains a date format as a string and converts it into a dart DateTime object
dynamic convertTwitterDate(String d){
  DateTime newDate;
  List<String> _months = ["Jan", "Feb",	"Mar", 	"Apr",	"May", 	"June", 	"July",
    "Aug",	"Sept",	"Oct", 	"Nov",	"Dec"];

  List<String> date = d.split(" ");

  newDate = new DateTime(
    int.parse(date.elementAt(5)), //year
    int.parse(date.elementAt(2)), //month
    _months.indexOf(date.elementAt(1)), //date
    int.parse(date.elementAt(3).split(":").elementAt(0)),// hour
    int.parse(date.elementAt(3).split(":").elementAt(1)),// minute
    int.parse(date.elementAt(3).split(":").elementAt(2)),// second
  );


  return newDate;
}


///Converts numbers to twitter styled statistics.
///Accepts only int or numbers as a string
///Eg:
///   2000 becomes 2k
String statText(dynamic data){
  String text = "";
  if (data.runtimeType == Null)
    return null.toString();
  if (data.runtimeType == String)
    data = int.parse(data);

  //don't change format if the number is less than 2k
  if (data <2000)
    text = data.toString();

  //Change to xM if number is a multiple of a million
  else if (data > 2000){
    text = "${data~/1000}k";
  }
  else if (data > 1000000){
    text = "${data~/1000000}M";
  } else{
    text = data.toString();
  }

  return text.toString();
}





///Returns a json object for the twitter user that matches the [id]
Future<Map<String,dynamic>> findUser(String id) async{
  var au = new twitterApi(
    consumerKey: "NxaAqeLwbd3bI0of36MF5sjs3",
    consumerSecret: "1Pp0BWpGeHXwLNCLGSC4SkNPkyZKCV2rWjv55LjD2PZ81WqAxN",
    token: "721809764-mzwYMd8R89NajMboUuZ6YZkBuCkDlFcP8YzDg3Qv",
    tokenSecret: "M9QxNtnp6wuaLN27oSQtQ0coR6vv8e8ETRKuTygMGPXt6",
  );

  Future twitterRequest = au.getTwitterRequest(
    // Http Method
    "GET",
    // Endpoint you are trying to reach
    "/users/lookup.json",
    // The options for the request
    options: {
      "user_id": id,
    },
  );

  // Wait for the future to finish
  var res = await twitterRequest;

  // Print off the response

  // Convert the string response into something more useable
  dynamic t = json.decode(res.body);

  // for (Map<dynamic, dynamic> map in t){
  //   // print("asdf t is $map");
  // }
  return Map<String,dynamic>.of(t[0]);
}