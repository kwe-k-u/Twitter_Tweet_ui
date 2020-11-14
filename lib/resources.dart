


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