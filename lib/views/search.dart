
import 'package:flutter/material.dart';
import 'package:newspaper/constant/appdata.dart';
import 'package:newspaper/view_model/list_view_model.dart';
import 'package:newspaper/view_model/search_view_model.dart';
import 'package:newspaper/views/detail.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
class SearchData extends StatefulWidget {
  SearchData({Key? key}) : super(key: key);

  @override
  State<SearchData> createState() => _SearchDataState();
}

class _SearchDataState extends State<SearchData> {


  searchdatasave(String data) async{
SharedPreferences preferences=await SharedPreferences.getInstance();
preferences.setString('search', data.toString());
  }



   @override
 Widget build(BuildContext context) {
 return Scaffold(
  appBar: buildAppBar(),
  body: context.watch<SearchViewModel >().state == JobState1.BUSY
 ? buildLoadingWidget()
 : context.watch<SearchViewModel>().state == JobState1.ERROR
 ? buildErrorWidget()
 : buildListView(context));
  }

 AppBar buildAppBar() {
 return AppBar(
  elevation: 0.0,
  backgroundColor: Colors.white,
      title: Text('News',style: TextStyle(color: Colors.black),),
    );
  }

 Center buildErrorWidget() => Center(child: Text('Something went wrong!'));

 Center buildLoadingWidget() => Center(child: CircularProgressIndicator());

 buildListView(BuildContext context) {
 return Column(
mainAxisAlignment: MainAxisAlignment.center,
    mainAxisSize: MainAxisSize.max,
    children: <Widget>[
      Container(
  padding: EdgeInsets.only(left: 10,right: 10),
child: TextField(
  onChanged: ((value) {
    search=value.toString();
    print(search.toString());

    if(value.toString().length>3){
 searchdatasave(value.toString());
   Navigator.pushReplacement(
  context,
  MaterialPageRoute(
    builder: (context) => SearchData(
    ),
  ),
);

    }else{


    }




//SearchData
  
   
                    
  }),

          style: TextStyle(fontSize: 25.0),
          decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
            prefixIcon: Icon(Icons.search),
            hintText: "Search",
            border: OutlineInputBorder(
                 borderSide: BorderSide(color: Colors.white, width: 18.0),
                    borderRadius: BorderRadius.circular(15.0)
              ),
            )
),

),

 new Expanded(child: ListView.builder(
                itemCount:context.read<SearchViewModel >().jobsearch.length ,
   itemBuilder: (_, index) => buildListItem(context, index)))
            

    ],

 );
  }

 Widget buildListItem(BuildContext context, int index) {
 final job = context.read<SearchViewModel>().jobsearch[index];
 return Card(
      child: InkWell(
        onTap: () {
          Navigator.pushReplacement(
  context,
  MaterialPageRoute(
    builder: (context) => Detail(url:job.urlToImage.toString(),title: job.title.toString(),
    date: job.date.toString(),description: job.descriptipn.toString(),
    pageurl: job.url.toString(),
    author: job.author.toString(),
    ),
  ),
);
        },
        child: ListTile(
title: Text(job.title.toString()),
      subtitle: Text(job.descriptipn.toString().substring(0,10)),
        trailing: Image.network(job.urlToImage.toString(),
        fit: BoxFit.cover,
        ),
      ),
      )
    );
  }
}

