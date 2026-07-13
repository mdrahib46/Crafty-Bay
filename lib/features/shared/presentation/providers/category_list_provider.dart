


// import 'package:craftybay/app/get_network_caller.dart';
// import 'package:craftybay/app/urls.dart';
// import 'package:craftybay/core/service/network_caller/network_caller.dart';
// import 'package:craftybay/features/shared/data/model/category_model.dart';
// import 'package:flutter/cupertino.dart';
//
// class CategoryListProvider extends ChangeNotifier{
//   bool _categoryListInProgress = false;
//   bool get categoryListInProgress => _categoryListInProgress;
//
//   String? _errorMessage;
//   String? get errorMessage => _errorMessage;
//
//   List<CategoryModel> _categoryList = [];
//   List<CategoryModel> get categoryList => _categoryList;
//
//   Future<bool> getCategoryItem() async{
//     bool isSuccess = false;
//
//     _categoryListInProgress = true;
//     notifyListeners();
//
//
//     final NetworkResponse response = await getNetworkCaller().getRequest(AppUrls.getCategory(pageSize, pageNo))
//   }
// }