class Data{
String? title;
String? image;
String? descrition;

Data({this.title,this.image,this.descrition});

Map<String,dynamic>toJson(){
return{
'title':title,
'image':image,
'descrition':descrition


};
}

Data.fromJson(Map<String,dynamic> json){
title=json['title'];
image=json['image'];
descrition=json['descrition'];


}

}