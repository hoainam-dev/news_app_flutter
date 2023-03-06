import 'package:flutter/material.dart';
import '../../../models/categorie_model.dart';

class RightNavigationBar extends StatefulWidget {
  @override
  State<RightNavigationBar> createState() => _RightNavigationBarState();
}

class _RightNavigationBarState extends State<RightNavigationBar> {
  bool _isPress = false;
  List<Category> categories = <Category>[];

  //Init
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0.0,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              IconButton(
                onPressed: () => {Navigator.pop(context)},
                icon: Icon(
                  Icons.cancel_outlined,
                  size: 25,
                  color: Colors.black,
                ),
              )
            ],
          ),
          automaticallyImplyLeading: false,
        ),
        body: SingleChildScrollView(
          child: Container(
              padding: EdgeInsets.fromLTRB(15, 10, 15, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Kênh của tôi"),
                      OutlinedButton(
                        onPressed: () => {
                          setState(() {
                            _isPress = !_isPress;
                          })
                        },
                        child: Text(_isPress ? "Hoàn thành" : "Chỉnh sửa"),
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Colors.white)),
                      )
                    ],
                  ),
                  Text(
                    "Nhấn và giữ để di chuyển hoặc xóa kênh",
                    style: TextStyle(color: Color(0xff7e7e7e)),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 16),
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    child: GridView.builder(
                        gridDelegate:
                            const SliverGridDelegateWithMaxCrossAxisExtent(
                                maxCrossAxisExtent: 130,
                                childAspectRatio: 4,
                                crossAxisSpacing: 5,
                                mainAxisSpacing: 5),
                        itemCount: categories.length,
                        itemBuilder: (BuildContext ctx, index) {
                          return TextButton(
                              onPressed: () {},
                              style: TextButton.styleFrom(
                                // background
                                primary: Colors.black, // foreground
                                side: BorderSide(width: 1, color: Colors.grey),
                              ),
                              child: Text(
                                "${categories[index].categorieName}",
                                style: TextStyle(fontSize: 12),
                              ));
                          //   Container(
                          //   alignment: Alignment.center,
                          //   decoration: BoxDecoration(
                          //       borderRadius: BorderRadius.circular(10)),
                          //   child: Text("${categories[index].categorieName}"),
                          // );
                        }),
                  )
                ],
              )),
        ));
  }

  Widget getListCategory() {
    return ListView.builder(
        itemCount: categories.length,
        shrinkWrap: true,
        physics: ClampingScrollPhysics(),
        itemBuilder: (context, index) {
          return Text("${categories[index].categorieName}");
        });
  }
}
