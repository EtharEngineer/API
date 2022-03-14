import 'package:apeye/API/model/Jobs.dart';
import 'package:apeye/services/testJob_services.dart';
import 'package:flutter/cupertino.dart';

class Jobs_view_model extends ChangeNotifier {
  List<Jobs> _jobsList = [];

  Future<void> fetchJobs(List interest) async {
    _jobsList = await testJob_services().fetchJobs(interest);
    notifyListeners();
  }

  List<Jobs> get jobsList => _jobsList;
}

// class Jobs_view_model_management extends ChangeNotifier{
//   List<Jobs> _jobsList1 = [];


//    Future<void> fetchJobs() async {
//     _jobsList1 = await Jobs_services_Management().fetchJobs();
//     notifyListeners();  
//   }

//   List<Jobs> get jobsList1 => _jobsList1;
// }