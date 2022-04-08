import 'package:e_commerace/models/products_model.dart';
import 'package:get/get.dart';
import '../data/repository/recommended_product_repo.dart';

class RecommendedProductController extends GetxController{
  final RecommendedProductRepo recommendedProductRepo;
  RecommendedProductController({required this.recommendedProductRepo});
  List<dynamic> _recommendedProductList = [];
  List<dynamic> get recommendedProductList => _recommendedProductList;
  bool  _isLoaded = false;
  bool get isLoaded=>_isLoaded;

  Future<void> getRecommendedProductList() async{
    Response response = await recommendedProductRepo.getRecommendedProductList();
    if(response.statusCode ==  200){
      _recommendedProductList = [];
      _recommendedProductList.addAll(Product.fromJson(response.body).products);
      print("get product recommended");
      _isLoaded=true;
      update();
    }else{
      print("couldnt get product recommended");
    }
  }
}