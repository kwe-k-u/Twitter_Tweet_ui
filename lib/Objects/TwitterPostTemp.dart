import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:twitter_tweets_ui/Objects/TwitterUserTemp.dart';

class TwitterPostTemp{
  String _idString;
  TwitterUserTemp _user;
  String _tweetText;
  DateTime _createdAt;
  String _tweetUrl;
  bool _isTruncated; /// boolean to show if the tweet text was cut because the tweet was longer than 140 characters
  bool _isFavourite;
  bool _isRetweeted;
  bool _isPossiblySensitive;
  List<dynamic> _tweetCharacterRange;

  String _filterLevel;
  String _language;
  // matching rules

  //extended entities
  //entities
  int _favouriteCount;
  int _retweetCount;
  int _replyCount;
  int _quoteCount;

  // List<> __imageList list to hold images





  //                  SETTERS

  TwitterPostTemp createFromMap(Map<dynamic, dynamic> map){
    setDatePosted(map["created_at"]);
    setTweetId(map["id"]);
    setTweetText(map["full_text"]);
    setTruncatedStatus(map['truncated']);
    setIsSensitiveStatus(map["possibly_sensitive"]);
    setLanguage(map["lang"]);
    setRetweetedStatus(map["retweeted"]);
    setFavouriteStatus(map["favorited"]);
    setFavouriteCount(map["favoriteCount"]);
    setRetweetCount(map["retweet_count"]);
    // setUser(TwitterUserTemp().createFromMap(Map<String, dynamic>.from(map["usesr"])));
    setTweetCharacterRange(map['display_text_range']);



    return this;
  }

  void setTweetId(dynamic id){
    this._idString = id.toString();
  }



  void setDatePosted(dynamic date){
    if (date.runtimeType == String)
        this._createdAt = DateTime.parse(date);
    else if (date.runtimeType == DateTime)
      this._createdAt = date;
  }
  
  void setTweetCharacterRange(List<dynamic> range){
    this._tweetCharacterRange = range;
  }
  


  void setUser(TwitterUserTemp user){
    this._user = user;
  }

  void setTweetText(String text){
    this._tweetText = text; //todo add checker to keep length 140 characters
  }

  void setFavouriteStatus(bool status){
    this._isFavourite = status;
  }

  void setRetweetedStatus(bool status){
    this._isRetweeted = status;
  }

  void setIsSensitiveStatus(bool status){
    this._isPossiblySensitive = status;
  }

  void setTruncatedStatus(bool status){
    this._isTruncated = status;
  }

  void setTweetURL(String url){
    this._tweetUrl = url;
  }

  void setFavouriteCount(int count){
    this._favouriteCount = count;
  }


  void setRetweetCount(int count){
    this._retweetCount = count;
  }

  void setReplyCount(int count){
    this._replyCount = count;
  }

  void setQuoteCount (int count){
    this._quoteCount = count;
  }

  void setLanguage(String lang){
    this._language = lang;
  }

  void setFilterLevel(String level){
    this._filterLevel = level;
  }

  








  //                    GETTERS

  DateTime getDateCreated()
  => this._createdAt;



  TwitterUserTemp getUser(){
    return this._user;
  }

  String getTweetId()
  => this._idString;


  String getTweetText(){
    return this._tweetText;
  }


  bool isTruncated()
  => this._isTruncated;

  bool isFavourite(){
    return this._isFavourite;
  }

  String getTweetURL()
  => this._tweetUrl;

  bool isRetweeted()
  => this._isRetweeted;

  bool isSensitive()
  => this._isPossiblySensitive;

  int getFavouriteCount()
  => this._favouriteCount;

  int getRetweetCount()
  => this._retweetCount;

  int getReplyCount()
  => this._replyCount;

  int getQuoteCount()
  => this._quoteCount;


  String getFilterLevel()
      => this._filterLevel;

  String getLanguage()
  => this._language;
  
  
  List<dynamic> getTweetCharacterRange()
  => this._tweetCharacterRange;


  Map<String,dynamic> getMap(){
    Map<String,dynamic> map;



    return map;
  }



}