import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProfileWidget extends StatefulWidget {
  const ProfileWidget({Key? key, required this.infor}) : super(key: key);
  final Widget infor;

  @override
  State<ProfileWidget> createState() => _ProfileWidgetState();
}

class _ProfileWidgetState extends State<ProfileWidget> {
  @override
  void initState(){
    // TODO: implement initState
    super.initState();
    // getUsers();
  }

  @override
  Widget build(BuildContext context) {
    var titleInforText = [
      "CÔNG TY TNHH CÔNG NGHỆ MẠNG THÔNG TIN VIỆT NAM",
      "Giấy phép:",
      "Thông tin liên hệ:"];
    var inforText = ["Mã số doanh nghiệp: 0314505650",
      "Ngày cấp: 10/07/2017",
      "Nơi cấp: Sở Kế hoạch và Đầu tư Tp. Hồ Chí Minh",
      "Giấy phép thiết lập trang thông tin điện tử tổng hợp trên mạng Số 44/ GP – STTTT do Sở Thông tin và Truyền thông Thành phố Hồ Chí Minh cấp ngày 13/9/2017",
      "Chịu trách nhiệm nội dung: Lê Phạm Huyền Nhung",
      "Giấy chứng nhận đăng ký cung cấp dịch vụ trò chơi điện tử trên mạng số 175/GCNPTTH&TTĐT do Cục Phát thanh truyền hình và Thông tin điện tử cấp ngày 11 tháng 09 năm 2019",
      "Địa chỉ: Tòa nhà H2, số 196 Hoàng Diệu, Phường 08, Quận 4, TP.HCM, Việt Nam.",
      "Email: contact@vngaynay.vn",
      "Điện thoại: 02836362391",
      "Zalo: 0932728536"
    ];
    return Scaffold(
        body: SingleChildScrollView(
      child: Container(
          child: Stack(
            children: [
              Container(
                child: Image.asset("assets/images/background.jpg"),
              ),
              widget.infor,
              Container(
                padding: EdgeInsets.only(top: 50),
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                margin: EdgeInsets.fromLTRB(0, 200, 0, 0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.elliptical(260, 30),
                      topRight: Radius.elliptical(260, 30)),
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(
                          children: [
                            Icon(
                              Icons.group,
                              size: 30,
                              color: Colors.deepOrange,
                            ),
                            Text("Theo dõi")
                          ],
                        ),
                        SizedBox(width: 30),
                        Column(
                          children: [
                            Icon(
                              Icons.doorbell,
                              size: 30,
                              color: Colors.purple,
                            ),
                            Text("Thông báo")
                          ],
                        ),
                        SizedBox(width: 30),
                        Column(
                          children: [
                            Icon(
                              Icons.star,
                              size: 30,
                              color: Colors.lightBlue,
                            ),
                            Text("Ban đêm")
                          ],
                        ),
                      ],
                    ),
                    const Divider(color: Colors.grey),
                    Column(
                      children: [
                        ProfileMenuWidget(
                          onPress: () => {},
                          title: "Lưu",
                          icon: Icons.save,
                          Iconcolor: Colors.red,
                        ),
                        ProfileMenuWidget(
                          onPress: () => {},
                          title: "Lịch sử",
                          icon: Icons.query_builder_sharp,
                          Iconcolor: Colors.yellow,
                        ),
                      ],
                    ),
                    const Divider(color: Colors.grey),
                    Column(
                      children: [
                        ProfileMenuWidget(
                          onPress: () => {},
                          title: "Phản hồi",
                          icon: Icons.question_answer,
                        ),
                        ProfileMenuWidget(
                          onPress: () => {
                            FirebaseAuth.instance.signOut(),
                            // Navigator.push(context,
                            // MaterialPageRoute(builder: (context) => LoginScreen()))
                          },
                          title: "Cài đặt",
                          icon: Icons.settings,
                          textColor: Colors.red,
                          endIcon: false,
                        )
                      ],
                    ),
                    const Divider(color: Colors.grey),
                    Container(
                      padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                      height: 370,
                      child: Column(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              titleInfoText(titleInforText[0]+"     "),
                              SizedBox(height: 5),
                              infoText(inforText[0]),
                              SizedBox(height: 5),
                              infoText(inforText[1]),
                              SizedBox(height: 5),
                              infoText(inforText[2]),
                            ],
                          ),
                          SizedBox(height: 5),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              titleInfoText(titleInforText[1]),
                              SizedBox(height: 5),
                              infoText(inforText[3]),
                              SizedBox(height: 5),
                              infoText(inforText[4]),
                              SizedBox(height: 5),
                              infoText(inforText[5]),
                            ],
                          ),
                          SizedBox(height: 5),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              titleInfoText(titleInforText[2]),
                              SizedBox(height: 5),
                              infoText(inforText[6]),
                              SizedBox(height: 5),
                              infoText(inforText[7]),
                              SizedBox(height: 5),
                              infoText(inforText[8]),
                              SizedBox(height: 5),
                              infoText(inforText[9]),
                            ],
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(0, 175, 0, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      height: 60,
                      child: ElevatedButton(
                        onPressed: () => {print("aaa")},
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Colors.white)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text("Cấp 2",
                                style: TextStyle(color: Colors.black)),
                            Text("Tiến Sĩ Khoa Học >",
                                style: TextStyle(color: Colors.black))
                          ],
                        ),
                      ),
                    ),
                    Container(
                      height: 60,
                      child: ElevatedButton(
                        onPressed: () => {print("aaa")},
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Colors.white)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text("0cs", style: TextStyle(color: Colors.green)),
                            Text("Điểm tín dụng >",
                                style: TextStyle(color: Colors.black87))
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          )),
    ));
  }

  Widget infoText(String text){
    return Text(text,style: TextStyle(color: Colors.grey));
  }
  Widget titleInfoText(String text){
    return Text(text);
  }
}

class ProfileMenuWidget extends StatelessWidget {
  const ProfileMenuWidget({
    Key? key,
    required this.title,
    required this.icon,
    required this.onPress,
    this.endIcon = true,
    this.textColor,
    this.Iconcolor,
  }) : super(key: key);

  final String title;
  final IconData icon;
  final VoidCallback onPress;
  final bool endIcon;
  final Color? textColor;
  final Color? Iconcolor;

  @override
  Widget build(BuildContext context) {
    return ListTile(
        onTap: onPress,
        leading: Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
          ),
          child: Icon(
            icon,
            color: Iconcolor,
          ),
        ),
        title: Text(this.title,
            style: Theme.of(context)
                .textTheme
                .bodyText1
                ?.apply(color: textColor)));
  }
}

