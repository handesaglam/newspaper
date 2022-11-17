
import 'package:flutter/foundation.dart';
import 'package:newspaper/Services/services.dart';
import 'package:newspaper/model/model.dart';


String? data;

enum JobState { IDLE, BUSY, ERROR }
 late JobState _state;


class NewViewModel with ChangeNotifier {
 List<Model> newList;

 NewViewModel(this.newList) {
    newList = [];
    _state = JobState.IDLE;
fetchdata();
  }

 JobState get state => _state;
 set state(JobState state) {
    _state = state;
 notifyListeners();
  }

 Future<List<Model>> fetchdata() async {
 try {
      state = JobState.BUSY;
    newList = await ApiService().fetchdataall();
      state = JobState.IDLE;
    return newList;
    } catch (e) {
      state = JobState.ERROR;
 return [];
    }
  }
}