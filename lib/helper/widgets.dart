import 'package:flutter/material.dart';
import 'package:do_an_cuoi_ki/views/Article/detail_article.dart';

//Get Article
class getArticle extends StatefulWidget {
  const getArticle({Key? key, this.activeTab, this.newslist, this.newscategorielist}) : super(key: key);
  final activeTab, newslist, newscategorielist;

  @override
  State<getArticle> createState() => _getArticleState();
}

class _getArticleState extends State<getArticle> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
          child: Column(
            children: <Widget>[
              /// News Article
             widget.activeTab == 0
                  ? Container(
                margin: EdgeInsets.only(top: 16),
                child: ListView.builder(
                    itemCount: widget.newslist.length,
                    shrinkWrap: true,
                    physics: ClampingScrollPhysics(),
                    itemBuilder: (context, index) {
                      return NewsTile(
                        newsCategory: widget.newslist,
                        author: widget.newslist[index].author ?? "",
                        imgUrl: widget.newslist[index].urlToImage ?? "",
                        desc: widget.newslist[index].description ?? "",
                        title: widget.newslist[index].title ?? "",
                        content: widget.newslist[index].content ?? "",
                        publshedAt: widget.newslist[index].publshedAt ?? "",
                        posturl: widget.newslist[index].articleUrl ?? "",
                      );
                    }),
              )
                  : Container(
                margin: EdgeInsets.only(top: 16),
                child: ListView.builder(
                    itemCount: widget.newscategorielist.length,
                    shrinkWrap: true,
                    physics: ClampingScrollPhysics(),
                    itemBuilder: (context, index) {
                      return
                        NewsTile(
                          newsCategory: widget.newscategorielist,
                          author: widget.newscategorielist[index].author ?? "",
                          imgUrl: widget.newscategorielist[index].urlToImage ?? "",
                          desc: widget.newscategorielist[index].description ?? "",
                          title: widget.newscategorielist[index].title ?? "",
                          content: widget.newscategorielist[index].content ?? "",
                          publshedAt: widget.newscategorielist[index].publshedAt ?? "",
                          posturl: widget.newscategorielist[index].articleUrl ?? "",
                        );
                    }),
              ),
            ],
          )
      ),
    );
  }
}


class NewsTile extends StatelessWidget {
  final String author, imgUrl, title, desc, content, posturl;
  final newsCategory;
  final DateTime publshedAt;
  NewsTile({required this.newsCategory,
    required this.author,
    required this.imgUrl,
    required this.desc,
    required this.title,
    required this.publshedAt,
    required this.content,
    required this.posturl});

  @override
  Widget build(BuildContext context) {
    var urlNews = posturl.split('/')[2].split('.');
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => DetailArticle(
                  newsCategory: newsCategory,
                  author: author,
                  imgUrl: imgUrl,
                  desc: desc,
                  title: title,
                  content: content,
                  publshedAt: publshedAt,
                  posturl: posturl,
                )));
      },
      child: Container(
          margin: EdgeInsets.only(bottom: 24),
          width: MediaQuery.of(context).size.width,
          child: Container(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 16),
              alignment: Alignment.bottomCenter,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(6),
                      bottomLeft: Radius.circular(6))),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Container(
                      width: 230,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            children: [
                              Text(
                                title,
                                maxLines: 3,
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.w900),
                              ),
                            ],
                          ),
                          SizedBox(height: 15),
                          Row(
                            children: [
                              Text(urlNews.length==2?urlNews[0]+'.'+urlNews[1]:urlNews[1]+'.'+urlNews[2],
                              style: TextStyle(fontSize: 12, color: Color(0xff7e7e7e)),),
                              Container(
                                margin: EdgeInsets.fromLTRB(10, 0, 0, 0),
                                height: 7,
                                width: 1,
                                color: Color(0xffdedede),
                              )
                            ],
                          ),
                        ],
                      )),
                  SizedBox(
                    width: 4,
                  ),
                  imgUrl!=null?Image.network(
                    imgUrl,
                    height: 90,
                    width: 140,
                    fit: BoxFit.cover,
                  ):Image.asset("assets/images/errorimg.jpg")
                ],
              ),
            ),
          )),
    );
  }
}
