import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/article_model.dart';

class ArticleService{
  final FirebaseFirestore _db = FirebaseFirestore.instance;
  List<Article> news = [];
  List<Article> categoryNews = [];

  //
  Future<List<Article>> retrieveArticle() async {
    QuerySnapshot<Map<String, dynamic>> snapshot =
    await _db.collection("article").get();
    return snapshot.docs
        .map((docSnapshot) => Article.fromDocumentSnapshot(docSnapshot))
        .toList();
  }

  //get article
  Future<void> getNews() async {
    var retrievedArticleList = await retrieveArticle();
    retrievedArticleList.forEach((element) {
      if(element.newsCategory==""){
        Article article = Article(
          title: element.title,
          author: element.author,
          description: element.description,
          urlToImage: element.urlToImage,
          publshedAt: element.publshedAt,
          content: element.content,
          articleUrl: element.articleUrl,
        );
        news.add(article);
      }
    });
    print("get News oke!");
  }

  //get article from category
  Future<void> getNewsForCategory(String category) async {
    var retrievedArticleList = await retrieveArticle();
    retrievedArticleList.forEach((element) {
      if(element.newsCategory!=null && element.newsCategory==category){
        Article article = Article(
          title: element.title,
          author: element.author,
          description: element.description,
          urlToImage: element.urlToImage,
          publshedAt: element.publshedAt,
          content: element.content,
          articleUrl: element.articleUrl,
        );
        categoryNews.add(article);
      }
    });
    print("get categoryNews oke!");
  }
}