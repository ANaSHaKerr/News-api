import 'package:flutter_news_app/models/category_model.dart';

List<CategoryModel> getCategories() {
  List<CategoryModel> categories = List<CategoryModel>();

  CategoryModel categoryModel;

  //1
  categoryModel = CategoryModel();
  categoryModel.categoryName = "تكنولوجيا";
  categoryModel.imageUrl =
  "https://www.goodcore.co.uk/blog/wp-content/uploads/2019/08/coding-vs-programming-2.jpg";
  categoryModel.category = 'technology';
  categories.add(categoryModel);

  //2
  categoryModel = CategoryModel();
  categoryModel.categoryName = "رياضة";
  categoryModel.imageUrl =
  "https://www.telegraph.co.uk/content/dam/football/2019/02/07/TELEMMGLPICT000166342089_trans_NvBQzQNjv4BqUgehH7knIs2mL4LO-crfgorempWLTe02qz9Fy_-wUAM.jpeg";
  categoryModel.category = 'sport';
  categories.add(categoryModel);



  //3
  categoryModel = CategoryModel();
  categoryModel.categoryName = "دراما";
  categoryModel.imageUrl =
  "https://www.almaalomah.com/wp-content/uploads/2019/06/Netflix.jpg";
  categoryModel.category = 'entertainment';
  categories.add(categoryModel);

  //4
  categoryModel = CategoryModel();
  categoryModel.categoryName = "صحة";
  categoryModel.imageUrl =
      "https://images.unsplash.com/photo-1494390248081-4e521a5940db?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1595&q=80";
  categoryModel.category = 'health';
  categories.add(categoryModel);

  //5
  categoryModel = CategoryModel();
  categoryModel.categoryName = "علوم";
  categoryModel.imageUrl =
      "https://images.unsplash.com/photo-1554475901-4538ddfbccc2?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1504&q=80";
  categoryModel.category = 'science';
  categories.add(categoryModel);

  //6

  categoryModel = CategoryModel();
  categoryModel.categoryName = "أعمال";
  categoryModel.imageUrl =
  "https://www.yourvalued.co.uk/wp-content/uploads/2018/11/value-business.jpg";
  categoryModel.category = 'business';
  categories.add(categoryModel);
  //7
  categoryModel = CategoryModel();
  categoryModel.categoryName = "عام";
  categoryModel.imageUrl =
  "https://images.unsplash.com/photo-1495020689067-958852a7765e?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60";
  categoryModel.category = 'general';
  categories.add(categoryModel);



  return categories;
}
