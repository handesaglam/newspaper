class Model{
String? title;
String? descriptipn;
String? url;
String? urlToImage;
String? date;
UserData? data;
String? author;
Model({this.title,this.descriptipn,this.url,this.urlToImage,this.date,this.data,this.author});

 factory Model.fromJson(Map<String, dynamic> parsedJson) {
    return new  Model(
      title: parsedJson['title'],
      url: parsedJson['url'],
      descriptipn:parsedJson['description'],
      author:parsedJson['author'],
      urlToImage: parsedJson['urlToImage'],
      date:parsedJson['publishedAt'],
      data: UserData.fromJson(parsedJson['source'])
     

    );
  }





}
class UserData{
String? name;
UserData({this.name});

factory UserData.fromJson(Map<String, dynamic> parsedJson) {
    return new UserData(
    name: parsedJson['name'],
    );
  }

  
}