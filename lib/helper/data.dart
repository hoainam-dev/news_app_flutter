import 'package:do_an_cuoi_ki/models/categorie_model.dart';

List<CategorieModel> getCategories(){

  List<CategorieModel> myCategories = <CategorieModel>[];
  CategorieModel categorieModel;

  //1
  categorieModel = new CategorieModel();
  categorieModel.categorieId = "Home";
  categorieModel.categorieName = "Trang chủ";
  myCategories.add(categorieModel);
  //1
  categorieModel = new CategorieModel();
  categorieModel.categorieId = "Business";
  categorieModel.categorieName = "Kinh doanh";
  myCategories.add(categorieModel);

  //2
  categorieModel = new CategorieModel();
  categorieModel.categorieId = "Entertainment";
  categorieModel.categorieName = "Giải trí";
  myCategories.add(categorieModel);

  //3
  categorieModel = new CategorieModel();
  categorieModel.categorieId = "General";
  categorieModel.categorieName = "Xã hội";
  myCategories.add(categorieModel);

  //4
  categorieModel = new CategorieModel();
  categorieModel.categorieId = "Health";
  categorieModel.categorieName = "Sức khỏe";
  myCategories.add(categorieModel);

  //5
  categorieModel = new CategorieModel();
  categorieModel.categorieId = "Science";
  categorieModel.categorieName = "Khoa học";
  myCategories.add(categorieModel);

  //5
  categorieModel = new CategorieModel();
  categorieModel.categorieId = "Sports";
  categorieModel.categorieName = "Thể Thao";
  myCategories.add(categorieModel);

  //5
  categorieModel = new CategorieModel();
  categorieModel.categorieId = "Technology";
  categorieModel.categorieName = "Công nghệ";
  myCategories.add(categorieModel);

  return myCategories;

}