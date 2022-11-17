
import 'package:flutter/foundation.dart';
import 'package:newspaper/Services/services.dart';
import 'package:newspaper/model/model.dart';


String? data;

enum JobState1 { IDLE, BUSY, ERROR }
 late JobState1 _state;


class SearchViewModel with ChangeNotifier {
 List<Model> jobsearch;

 SearchViewModel(this.jobsearch) {
   jobsearch = [];
    _state = JobState1.IDLE;
 fetchJobs();
  }

 JobState1 get state => _state;
 set state(JobState1 state) {
    _state = state;
 notifyListeners();
  }

 Future<List<Model>> fetchJobs() async {
 try {
      state = JobState1.BUSY;
      jobsearch = await ApiService().fetchdataseach();
      state = JobState1.IDLE;
 return jobsearch;
    } catch (e) {
      state = JobState1.ERROR;
 return [];
    }
  }
}