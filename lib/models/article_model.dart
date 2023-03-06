import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:do_an_cuoi_ki/models/user.dart';

class Article{
  String? newsCategory;
  String? author;
  String? title;
  String? description;
  String? urlToImage;
  DateTime? publshedAt;
  String? content;
  String? articleUrl;
  bool? isDelete;
  // final Users? user;
  final List<String>? articleTraits;

  Article({this.newsCategory,
    this.author, this.urlToImage,
    this.title,this.description,
    this.content,this.publshedAt,
    this.articleUrl, this.isDelete,
    // this.user,
    this.articleTraits});

  Map<String, dynamic> toMap() {
    return {
      'newsCategory': newsCategory,
      'author': author,
      'title': title,
      'description': description,
      'urlToImage': urlToImage,
      'publshedAt': publshedAt,
      'content': content,
      'articleUrl': articleUrl,
      // 'user': user!.toMap(),
      'articleTraits': articleTraits
    };
  }

  Article.fromDocumentSnapshot(DocumentSnapshot<Map<String, dynamic>> doc)
      : newsCategory = doc.data()!["category"],
        author = doc.data()!["author"],
        title = doc.data()!["title"],
        description = doc.data()!["description"],
        urlToImage = doc.data()!["urlToImage"],
        publshedAt = DateTime.fromMillisecondsSinceEpoch(doc.data()!["publshedAt"].microsecondsSinceEpoch),
        content = doc.data()!["content"],
        articleUrl = doc.data()!["articleUrl"],
        // user = Users.fromMap(doc.data()!["user"]),
        articleTraits = doc.data()?["articleTraits"] == null
            ? null
            : doc.data()?["articleTraits"].cast<String>();
}