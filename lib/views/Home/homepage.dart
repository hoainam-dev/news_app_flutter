import 'package:flutter/material.dart';
import 'package:do_an_cuoi_ki/helper/data.dart';
import 'package:do_an_cuoi_ki/helper/widgets.dart';
import 'package:do_an_cuoi_ki/models/categorie_model.dart';
import '../../helper/news.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late bool _loading;
  var newslist;//List News
  var categorielist;//List Categorie News
  TextEditingController searchController = new TextEditingController();
  String? category;
  int activeTab = 0;

  List<CategorieModel> categories = <CategorieModel>[];//Categorie Model

  //Get All News
  void getNews() async {
    News news = News();
    await news.getNews();
    newslist = news.news;
    setState(() {
      _loading = false;
    });
  }

  //Get Categorie News
  void getCategorieNews() async {
    NewsForCategorie categorieNews = NewsForCategorie();
    if(activeTab==0){
      categorielist = [];
    }else{
      await categorieNews.getNewsForCategory(category!.toLowerCase());
      categorielist = categorieNews.news;
      setState(() {
        _loading = false;
      });
    }
  }

  //Init
  @override
  void initState(){
    _loading = true;
    // TODO: implement initState
    super.initState();
    categories = getCategories();
    getNews();
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
                : getArticle(activeTab: activeTab, newslist: newslist, categorielist: categorielist)
          ),
    );
  }

  //App bar
  PreferredSizeWidget TopAppBar() {
    return AppBar(
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
        title: SingleChildScrollView(
            child: Container(
                child: Row(children: <Widget>[
          /// Categories
          Container(
            height: 30,
            width: 330,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: categories.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                      onTap: (){
                        setState((){
                          category = categories[index].categorieId ?? "";
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
                                  '${categories[index].categorieName}',
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
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Icon(
                    Icons.menu,
                    size: 25,
                    color: Colors.black,
                  ),
                ],
              ))
        ]))),
        backgroundColor: Colors.white,
      ),
      backgroundColor: Color(0xffd43c3b),
    );
  }
}
