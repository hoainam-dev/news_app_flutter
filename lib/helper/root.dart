import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:do_an_cuoi_ki/views/Profile/profile.dart';
import 'package:do_an_cuoi_ki/views/Home/homepage.dart';

import '../views/Authentication/Login_Screen.dart';

class Root extends StatefulWidget {
  const Root({Key? key}) : super(key: key);

  @override
  State<Root> createState() => _RootState();
}

class _RootState extends State<Root> {
  final User? user = FirebaseAuth.instance.currentUser;
  int activeTab = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      bottomNavigationBar: getFooter(),
      body: getBody(),
    );
  }

  Widget getFooter() {
    List icons1 = [Icons.home_filled, Icons.account_circle];
    List icons2 = [Icons.refresh, Icons.account_circle];
    List texts = ["Trang chủ", "Tôi"];

    return Container(
      padding: EdgeInsets.fromLTRB(0, 7, 0, 0),
      height: 50,
      decoration: BoxDecoration(color: Color(0xfffafafa)),
      child: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: List.generate(2, (index) {
            return GestureDetector(
                onTap: () {
                  setState(() {
                    activeTab = index;
                  });
                },
                child: Column(
                  children: [
                    Icon(
                      activeTab==1 ? icons1[index] : icons2[index],
                      color: activeTab == index
                          ? Color(0xffd43c3b)
                          : Color(0xff7e7e7e),
                      size: 25,
                    ),
                    Text(texts[index],
                        style: TextStyle(color: Color(0xff7e7e7e), fontSize: 12))
                  ],
                ));
          } // 1 mang chua items.length phan tu icon
              ),
        ),
      ),
    );
  }

  Widget getBody() {
    // IndexedStack là một Stack mà chỉ một element được
    // hiển thị tại một thời điểm bằng index của nó
    return IndexedStack(
      index: activeTab,
      children: [
        HomePage(), // Center(
        //   child: Text("Home", style: TextStyle(
        //       fontSize: 20,
        //       fontWeight: FontWeight.bold,
        //       color: Colors.white
        //   ),
        //   ),
        // ),
        // ProfileWidget(infor: Container(
        //     margin: EdgeInsets.fromLTRB(0, 50, 0, 0),
        //     child: Row(
        //       mainAxisAlignment: MainAxisAlignment.center,
        //       children: [
        //         ElevatedButton(
        //           onPressed: () => {
        //             Navigator.push(context,
        //                 MaterialPageRoute(builder: (context) => LoginScreen()))
        //           },
        //           style: ButtonStyle(
        //               backgroundColor: MaterialStateProperty.all(Colors.white)),
        //           child: Column(
        //             children: [
        //               Text("Đăng nhập", style: TextStyle(color: Colors.black, fontWeight: FontWeight.w400))
        //             ],
        //           ),
        //         )
        //       ],
        //     ),
        //   )),
        StreamBuilder<User?>(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot){
            if(snapshot.hasData){
              return ProfileWidget(infor: Container(
                  margin: EdgeInsets.fromLTRB(0, 50, 0, 0),
                  child:
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                    Column(
                      children: [
                        SizedBox(
                          width: 60,
                          height: 60,
                          child: CircleAvatar(
                            radius: 60,
                            backgroundImage:
                            AssetImage("assets/images/background.jpg"),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text("${user!.email}", ),
                        // Text("${user!.displayName}", ),
                      ],
                    )
                  ])));
            }else{
              return ProfileWidget(infor: Container(
                margin: EdgeInsets.fromLTRB(0, 50, 0, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () => {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => LoginScreen()))
                      },
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(Colors.white)),
                      child: Column(
                        children: [
                          Text("Đăng nhập", style: TextStyle(color: Colors.black))
                        ],
                      ),
                    )
                  ],
                ),
              ));
            }
          },
        ),
      ],
    );
  }
}
