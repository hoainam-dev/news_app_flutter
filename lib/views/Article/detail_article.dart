import 'package:do_an_cuoi_ki/views/Article/article_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../helper/widgets.dart';

class DetailArticle extends StatefulWidget {
  final String author, imgUrl, title, desc, content, posturl;
  final newsCategory;
  final DateTime publshedAt;
  DetailArticle({required this.newsCategory,
    required this.author,
    required this.imgUrl,
    required this.desc,
    required this.title,
    required this.publshedAt,
    required this.content,
    required this.posturl});

  @override
  State<DetailArticle> createState() => _DetailArticleState();
}

class _DetailArticleState extends State<DetailArticle> {
  TextEditingController searchController = new TextEditingController();

  String dateTimeFormat(DateTime publshedAt) {
    DateTime now = DateTime.now();
    String formattedDate = DateFormat('EEEE, MMM d, yyyy').format(now);
    return formattedDate;
  }

  @override
  Widget build(BuildContext context) {
    var urlNews = widget.posturl.split('/')[2].split('.');
    return Scaffold(
        appBar: AppBar(
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
              style: TextStyle(
                  color: Colors.black87,
                  fontWeight: FontWeight.bold,
                  fontSize: 18),
            ),
          ),
          backgroundColor: Color(0xffd43c3b),
        ),
        body: SafeArea(
            child: SingleChildScrollView(
                child: Container(
                    padding: EdgeInsets.only(left: 15, top: 20, right: 15),
                    child: Column(children: <Widget>[
                      Text(
                        "${widget.title}",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 20),
                      Row(
                        children: [
                          Text(
                            "${dateTimeFormat(widget.publshedAt)}",
                            style: TextStyle(color: Color(0xff929292), fontSize: 12),
                          ),
                          SizedBox(width: 20),
                          Text(urlNews.length==2?urlNews[0]+'.'+urlNews[1]:urlNews[1]+'.'+urlNews[2]+' /',
                            style: TextStyle(fontSize: 12, color: Color(0xff7e7e7e)),),
                          InkWell(
                              child: new Text(" Xem trang gốc",
                                  style: TextStyle(fontSize: 12, color: Colors.blue, decoration : TextDecoration.underline)),
                              onTap: () => {Navigator.push(context, MaterialPageRoute(builder:(context)=> ArticleView(postUrl: widget.posturl)))}
                          ),
                        ],
                      ),
                      SizedBox(height: 20),
                      Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(widget.author, style: TextStyle(fontSize: 15)),
                              // SizedBox(width: 5),
                              // Text(" - ", style: TextStyle(fontSize: 15)),
                              SizedBox(width: 5),
                              Text("${dateTimeFormat(widget.publshedAt)}",style: TextStyle(fontSize: 15)),
                            ],
                          )
                        ],
                      ),
                      SizedBox(height: 20),
                      Text(widget.desc, style: TextStyle(fontSize: 16), textAlign: TextAlign.justify,),
                      SizedBox(height: 20),
                      Image.network(widget.imgUrl),
                      SizedBox(height: 20),
                      Text(widget.content, style: TextStyle(fontSize: 16), textAlign: TextAlign.justify,),
                      SizedBox(height: 10),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Author: "+widget.author, style: TextStyle(fontSize: 16)),
                          SizedBox(height: 10),
                          Text("Source Link:", style: TextStyle(fontSize: 16)),
                          Text(widget.posturl, style: TextStyle(fontSize: 16)),
                          SizedBox(height: 10),
                          Text("Soure: ${urlNews.length==2?urlNews[0]+'.'+urlNews[1]:urlNews[1]+'.'+urlNews[2]}",
                              style: TextStyle(fontSize: 13, color: Color(0xff7e7e7e))),
                          Container(
                            margin: EdgeInsets.fromLTRB(0, 20, 0, 20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Column(
                                  children: [
                                    Icon(Icons.save, size: 25),
                                    Text("Save")
                                  ],
                                ),
                                Column(
                                  children: [
                                    Icon(Icons.share, size: 25),
                                    Text("Share")
                                  ],
                                ),
                              ],
                            ),
                          ),
                          const Divider(color: Colors.grey),
                          Text("good suggestion", textAlign: TextAlign.start,
                            style: TextStyle(fontSize: 15, color: Color(0xff7e7e7e))),
                        ],
                      ),
                      getSuggestArticle(),
                    ])))));
        // bottomNavigationBar: BotAppBar(context));
  }

  Widget getSuggestArticle() {
    return widget.newsCategory.length==0?Container():
    Container(
        child: Column(
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(top: 20),
              child: ListView.builder(
                  itemCount: widget.newsCategory.length>=8?8:widget.newsCategory.length,
                  shrinkWrap: true,
                  physics: ClampingScrollPhysics(),
                  itemBuilder: (context, index) {
                    return
                      NewsTile(
                        newsCategory: widget.newsCategory,
                        author: widget.newsCategory[index].author ?? "",
                        imgUrl: widget.newsCategory[index].urlToImage ?? "",
                        desc: widget.newsCategory[index].description ?? "",
                        title: widget.newsCategory[index].title ?? "",
                        content: widget.newsCategory[index].content ?? "",
                        publshedAt: widget.newsCategory[index].publshedAt ?? "",
                        posturl: widget.newsCategory[index].articleUrl ?? "",
                      );
                  }),
            ),
          ],
        )
    );
}
}

