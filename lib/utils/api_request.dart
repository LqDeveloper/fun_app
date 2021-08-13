import 'package:dio/dio.dart';
import 'package:fun_app/response_model/banner_model.dart';
import 'package:fun_app/utils/dio_manager.dart';
import 'package:fun_app/extensions/object_extensions.dart';

class ApiRequest {
  static Future<BannerModel> getBanner() async {
    var response = await DioManager.instance.get('banner/json');
    return response.map((e) => BannerModel.fromJson(response.data));
  }

}
