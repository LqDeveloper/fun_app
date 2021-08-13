import 'package:fun_app/view_model/base_view_model.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class HomeViewModel extends BaseViewModel {
  final RefreshController refreshController;

  HomeViewModel({required this.refreshController});

}
