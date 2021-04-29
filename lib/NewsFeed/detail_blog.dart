import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';

class DetailBlog extends StatefulWidget {
  @override
  _DetailBlogState createState() => _DetailBlogState();
}

class _DetailBlogState extends State<DetailBlog> {
  @override
  Widget build(BuildContext context) {
    var isFavorited = true;
    var setImage = isFavorited
        ? Image.asset(
            'assets/heart_like.png',
            width: 25,
          )
        : Image.asset(
            'assets/heart.png',
            width: 25,
          );

    var screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
        body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Container(
          height: 250,
          width: screenWidth,
          child: Stack(children: [
            ListView(
              children: <Widget>[
                Container(
                  height: 250,
                  child: new Carousel(
                    boxFit: BoxFit.cover,
                    images: [
                      AssetImage('assets/cay_phong_thuy.PNG'),
                      AssetImage('assets/cay_trong_nha.jpg'),
                      AssetImage('assets/cay_ngoai_troi.jpg'),
                      AssetImage('assets/cay_phong_thuy.PNG'),
                      AssetImage('assets/cay_trong_nha.jpg'),
                      AssetImage('assets/cay_ngoai_troi.jpg'),
                    ],
                    dotColor: Color(0xFF407C5A),
                    autoplay: false,
                    animationCurve: Curves.fastOutSlowIn,
                    animationDuration: Duration(milliseconds: 1000),
                  ),
                )
              ],
            ),
            Positioned(
                top: 10,
                left: 5,
                child: IconButton(
                    onPressed: () => Navigator.pop(context, false),
                    icon: Icon(
                      Icons.arrow_back,
                      size: 25,
                      color: Color(0xFF407C5A),
                    ))),
            Positioned(
                top: 200,
                left: 20,
                child: Row(
                  children: [
                    CircleAvatar(
                      backgroundImage: AssetImage("assets/account.png"),
                      radius: 20,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "RoseShop",
                          style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 20,
                              color: Colors.white),
                        ),
                        Text("following/unfollow",
                            style:
                                TextStyle(fontSize: 18, color: Colors.white)),
                      ],
                    )
                  ],
                )),
          ])),
      SizedBox(
        height: 15,
      ),
      Expanded(
        child: SingleChildScrollView(
            child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(children: [
                        Container(
                          width: screenWidth * 0.75,
                          child: Text(
                              "Kỹ thuật trồng dâu tây trong thùng xốp tại nhà",
                              style: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 22,
                                color: Color(0xFF407C5A),
                              )),
                        ),
                        Spacer(),
                        Text('20+',
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 20,
                              color: Colors.red,
                            )),
                        IconButton(
                            icon: (setImage),
                            onPressed: () {
                              setState(() {
                                if (isFavorited) {
                                  isFavorited = false;
                                  setImage = Image.asset(
                                    'assets/heart.png',
                                    width: 25,
                                  );
                                } else {
                                  isFavorited = true;
                                  setImage = Image.asset(
                                    'assets/heart_like.png',
                                    width: 25,
                                  );
                                }
                              });
                            }),
                      ]),
                      SizedBox(
                        height: 3,
                      ),
                      Text(
                        "24/9/2021",
                        style: TextStyle(fontSize: 18, color: Colors.black54),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "1. Kỹ thuật trồng dâu tây trong thùng xốp đơn giản tại nhàCây dâu tây hay còn gọi là dâu dất, có nguồn gốc từ châu Mỹ. Quả dâu tây có mùi thơm, vị ngọt, chua nên hiện nay quả dâu tây rất được mọi người ưu chuộng.Quả dâu tây chứa rất nhiều các loại Vitamin và khoáng chất có lợi cho sức khỏe như: Vitamin A, B1, B2, C, Mangan, Kali… Ngoài ra trong quả dâu tây còn có chất chống oxi hóa tốt cho tim mạch, ngăn ngừa ung thư, giúp giảm cân..."
                        "Hiện nay quả dâu tây được bày bán rất nhiều trên thị trường, bạn có biết dâu được trồng từ đâu? Đó có phải là dâu sạch như những lời quảng cáo? Dâu có sử dụng hay không sử dụng các loại thuốc bảo vệ thực vật?... Cảm giác lo sợ về chất lượng sản phẩm vẫn luôn là bài toán đối với người sử dụng. Để giải quyết vấn đề đó bài viết sau đây xin giới thiệu đến các bạn cách trồng dâu tây trong thùng xốp đơn giản, hiệu quả để có được nhưng trái dâu tây “ngon và sạch” cho gia đình. "
                        "Trồng dâu tây trong thùng xốp tiết kiệm nước tưới, dễ dàng chăm sóc, ít sâu bệnh, tận dụng tối đa không gian, không mất nhiều thời gian chăm sóc, thu được những quả dâu tây sạch tại nhà và tiết kiệm chi phí."
                        "Thời vụ trồng: Cây dâu tây có thể trồng quanh năm nhưng thích hợp nhất là vào tháng 4-5. Sau 85-90 ngày thì dâu tây sẽ cho thu hoạch.",
                        textAlign: TextAlign.justify,
                        style: TextStyle(fontSize: 18),
                      ),
                    ]))),
      )
    ]));
  }
}
