import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:do_an_cuoi_ki/service/category_service.dart';
import 'package:flutter/material.dart';
import '../../helper/widgets.dart';
import '../../service/article_service.dart';
import 'Home_conponent/RightNavigationBar.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late bool _loading;
  var newslist; //List News
  var newsCategorielist; //List Categorie News
  var categoryList;
  TextEditingController searchController = new TextEditingController();
  String? category;
  int activeTab = 0;

  final CollectionReference _category = FirebaseFirestore.instance.collection('category');

  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  //Get All News
  void getNews() async {
    ArticleService articleService = ArticleService();
    await articleService.getNews();
    newslist = articleService.news;
    print("news: ${newslist}");
    setState(() {
      _loading = false;
    });
    print("this is home!");
  }

  //Get Categorie News
  void getCategorieNews() async {
    ArticleService articleService = ArticleService();
    if (activeTab == 0) {
      newsCategorielist = [];
    } else {
      await articleService.getNewsForCategory(category!.toLowerCase());
      newsCategorielist = articleService.categoryNews;
      setState(() {
        _loading = false;
      });
    }
    print("current category: ${category}");
  }

  void getCategory() async{
    CategoryService categoryService = CategoryService();
    await categoryService.getCategories();
    categoryList = categoryService.categories;
  }

  //Init
  @override
  void initState() {
    _loading = true;
    // TODO: implement initState
    super.initState();
    getNews();
    getCategory();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: TopAppBar(),
        body: SafeArea(
          child: _loading
              ? Center(
                  child: CircularProgressIndicator(),
                )
              :
          // OutlinedButton(onPressed: ()=>{
          // }, child: Text("${category}"))
              getArticle(
                  activeTab: activeTab,
                  newslist: newslist,
                  newscategorielist: newsCategorielist),
        ));
  }

  //App bar
  PreferredSizeWidget TopAppBar() {
    return AppBar(
      automaticallyImplyLeading: false,
      title: Container(
        height: 40,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(7.0), color: Colors.white),
        child: TextField(
          controller: searchController,
          onTap: () {},
          decoration: InputDecoration(
              enabledBorder: InputBorder.none,
              border: InputBorder.none,
              prefixIcon: Icon(
                Icons.search,
                color: Color(0xffe0e0e0),
                size: 30,
              ),
              hintText: 'Nhập từ khóa',
              hintStyle: TextStyle(color: Color(0xffe0e0e0), fontSize: 18),
              suffixIcon: Icon(Icons.area_chart, color: Color(0xffd43c3b))),
          textAlignVertical: TextAlignVertical.center,
          style: TextStyle(color: Colors.black87, fontSize: 18),
        ),
      ),
      bottom: AppBar(
        elevation: 0.0,
        bottomOpacity: 0.0,
        title: SingleChildScrollView(
            child: Container(
                child: Row(children: <Widget>[
                  /// Categories
                  Container(
                    height: 30,
                    width: 330,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: categoryList.length,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                              onTap: (){
                                setState((){
                                  category = categoryList[index].categorieSlug ?? "";
                                  activeTab = index;
                                });
                                getCategorieNews();
                              },
                              child: Container(
                                  margin: EdgeInsets.only(top: 5, right: 14),
                                  child: Stack(children: <Widget>[
                                    Column(
                                      children: [
                                        Text(
                                          '${categoryList[index].categorieName}',
                                          style: TextStyle(fontSize: 16, color: activeTab==index?Color(0xffd43c3b):Colors.black),
                                        ),
                                        SizedBox(height: 3),
                                        activeTab==index?Container(
                                          height: 2,
                                          width: 40,
                                          color: Color(0xffd43c3b),
                                        ):Container()
                                      ],
                                    )
                                  ])));
                        }),
                  ),
                  Container(
                    width: 30,
                    child: IconButton(onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => RightNavigationBar(category: categoryList, activeTab: activeTab,)));
                    },
                      icon: Icon(
                        Icons.menu,
                        size: 25,
                        color: Colors.black,
                      ),),
                  ),
                ]))),
        backgroundColor: Colors.white,
      ),
      backgroundColor: Color(0xffd43c3b),
    );
  }
}
