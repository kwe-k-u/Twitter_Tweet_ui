

class TwitterUserTemp{
  String _userHandle;
  String _userAccountName;
  String __profileUrl;
  String _userId;
  DateTime _createAt;
  String _description;
  String _location; //of type location
  String _profileImageUrl;
  bool _isProtected;
  bool _isVerified;
  int _followerCount; //these come from public_metrics
  int _followingCount;
  int _listedCount;
  int _tweetCount;
  //entities


  TwitterUserTemp createFromMap(Map<String,dynamic> map){

    setUserHandle(map["screen_name"]);
    setUserId(map["id"]);
    setUserName(map["name"]);
    setDescription(map["description"]);
    setCreatedDate(map["created_at"]);

    return this;
  }


  void setUserName(String name){
    this._userAccountName = name;
  }


  void setUserHandle(String handle){
    this._userHandle = handle;
  }


  void setProfileUrl(String url){
    this.__profileUrl = url;
  }


  void setProfileImageUrl(String url){
    this._profileImageUrl = url;
  }


  void setUserId(String id){
    this._userId = id;
  }


  void setCreatedDate(dynamic date){
    if (date.runtimeType == String){
      this._createAt = convertTwitterDate(date);
    } else if (date.runtimeType == DateTime){
      this._createAt = date;
    }
  }


  void setDescription(String description){
    this._description = description;
  }


  void setLocation(String location){
    this._location = location;
  }


  void setProtectedStatus(bool status){
    this._isProtected = status;
  }


  void setVerifiedStatus(bool status){
    this._isVerified = status;
  }


  void setFollowersCount(int count){
    this._followerCount = count;
  }


  void setFollowingCount(int count){
    this._followingCount = count;
  }


  void setTweetCount(int count){
    this._tweetCount = count;
  }












  String getUserHandle()
  => "@"+this._userHandle ?? "";

  String getAccountName()
  => this._userAccountName ?? "";

  String getProfileUrl()
  => this.__profileUrl ?? "";


  String getUserId()
  => this._userId ?? "";

  DateTime getDateCreated()
  => this._createAt;

  String getDescription()
  => this._description ?? "";


  String getLocation()
  => this._location ?? "";


  String getProfileImageUrl()
  => this._profileImageUrl ?? "";

  bool isProtected()
  => this._isProtected ?? false;

  bool isVerified()
  => this._isVerified ?? false;

  int getFollowerCount()
  => this._followerCount;

  int getFollowingCount()
  => this._followingCount;

  int getListedCount()
  => this._listedCount;

  int getTweetCount()
  => this._tweetCount;




  DateTime convertTwitterDate(String d){
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

}