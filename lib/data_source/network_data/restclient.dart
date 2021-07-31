import 'package:flutter_project_structure/data_source/network_data/endpoint_api.dart';
import 'package:flutter_project_structure/models/request_model/body_update_sts_cate.dart';
import 'package:flutter_project_structure/models/response_model/all_product_res.dart';
import 'package:http_parser/http_parser.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'restclient.g.dart';

@RestApi()
abstract class RestClient {
  factory RestClient(Dio dio, {required String baseUrl}) = _RestClient;
  @GET(EndPoint.allProduct)
  Future<HttpResponse<AllProductRes>?> getProducts();

  @POST(EndPoint.createProduct)
  Future<HttpResponse<dynamic>?> createProduct({
    @Part() required String category,
    @Part() required String name,
    @Part() required String description,
    @Part() required String status,
    @Part(value: "img", contentType: "image/jpeg", fileName: "img.jpg") required List<List<int>> img,
  });

  @POST(EndPoint.updateProduct)
  Future<HttpResponse<dynamic>?> updateProduct({
    @Part() required String id,
    @Part() required String category,
    @Part() required String name,
    @Part() required String description,
    @Part() required String status,
    @Part() required List<String> oldImg,
    @Part(value: "img", contentType: "image/jpeg", fileName: "img.jpg") required List<List<int>> img,
  });
  @POST(EndPoint.updateStatusCate)
  Future<HttpResponse<dynamic>?> updateStatusCate({
    @Body() required BodyUpdateStscate body,
  });

  @GET(EndPoint.deleteProduct)
  Future<HttpResponse<dynamic>?> deleteProducts({@Query("id") required String id});
}
