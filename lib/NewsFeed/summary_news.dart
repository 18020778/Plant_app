import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'create_blog.dart';
import 'detail_blog.dart';

class SummaryNews extends StatefulWidget {
  @override
  _SummaryNewsState createState() => _SummaryNewsState();
}

class _SummaryNewsState extends State<SummaryNews> {
  List<Map> RoseArticles = [
    {
      "title": "Chă hồng cảnh sao cho đúng, tiêu chuẩn Việt Nam, chuẩn chất lượng",
      "image": "assets/cuc.jpg",
      "authorImg": "assets/account.png",
      "author": "RoseShop",
      "time": "26/04/2021"
    },
    {
      "title": "Cách chiết cành hồng",
      "image": "assets/cuc.jpg",
      "authorImg": "assets/account.png",
      "author": "RoseShop",
      "time": "26/04/2021"
    },
  ];

  List<Map> OrchidArticles = [
    {
      "title": "Chă hồng cảnh sao cho đúng, tiêu chuẩn Việt Nam, chuẩn chất lượng",
      "image": "assets/lan.jpg",
      "author": "ParisRoseShop",
      "time": "26/04/2021"
    },
    {
      "title": "Cách chiết cành hồng",
      "image": "assets/lan.jpg",
      "authorImg": "assets/account.png",
      "author": "RoseShop",
      "time": "26/04/2021"
    },
    {
      "title": "Chă hồng cảnh sao cho đúng, tiêu chuẩn Việt Nam, chuẩn chất lượng",
      "image": "assets/lan.jpg",
      "authorImg": "assets/account.png",
      "author": "ParisRoseShop",
      "time": "26/04/2021"
    },
    {
      "title": "Cách chiết cành hồng",
      "image": "assets/lan.jpg",
      "authorImg": "assets/account.png",
      "author": "RoseShop",
      "time": "26/04/2021"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: 5,
      child: Theme(
        data: ThemeData(
          appBarTheme: AppBarTheme(
            backgroundColor: Color(0xFF407C5A),
            actionsIconTheme: IconThemeData(color: Colors.white)
          )
        ),
        child: Scaffold(
          appBar: AppBar(
            toolbarHeight: 100,
            centerTitle: true,
            title: Text('Cẩm nang chăm cây', style: TextStyle(fontSize: 28),),
            automaticallyImplyLeading: false,
            actions: <Widget>[
              IconButton(icon: Icon(Icons.search, size: 28,), onPressed: (){})
            ],
            bottom: TabBar(
              isScrollable: true,
              indicatorColor: Colors.white,
              tabs: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("Hoa hồng", style: TextStyle(fontSize: 18)),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("Hoa cúc", style: TextStyle(fontSize: 18)),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("Hoa lan", style: TextStyle(fontSize: 18)),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("Bonsai", style: TextStyle(fontSize: 18)),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('Cây ăn quả', style: TextStyle(fontSize: 18),),
                ),
              ],
            ),
          ),
          body: Container(
            color: Colors.blueGrey[50],
            child: TabBarView(
              children: <Widget>[
                ListView.separated(
                  padding: EdgeInsets.symmetric(horizontal: 5, vertical: 13),
                    itemCount: RoseArticles.length,
                    itemBuilder: (context,index) {
                      return _buildArticleItem(RoseArticles, index);
                    },
                separatorBuilder: (context, index) => SizedBox(height: 16),),

                ListView.separated(
                  padding: EdgeInsets.symmetric(horizontal: 5, vertical: 13),
                  itemCount: OrchidArticles.length,
                  itemBuilder: (context,index) {
                    return _buildArticleItem(OrchidArticles, index);
                  },
                  separatorBuilder: (context, index) => SizedBox(height: 16),),
                Container(
                  child: Text("Tab2"),
                ),
                Container(
                  child: Text("Tab3"),
                ),
                Container(
                  child: Text("Tab4"),
                ),
              ],
            ),
          ),
          floatingActionButton: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              FloatingActionButton(
                backgroundColor: Color(0xFF407C5A),
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => CreateBlog()));
                },
              child: Icon(FontAwesomeIcons.pen),)
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildArticleItem(List<Map> articles,int index) {
    Map article = articles[index];
    return Container(
      color: Colors.white,
        child: Stack(
          children: [
            Container(
              width: 90,
                height: 90,
              color: Color(4291751385),
            ),
            FlatButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => DetailBlog()));
              },
              child: Container(
                color: Colors.white,
                margin: EdgeInsets.fromLTRB(0, 12,10, 10),
                padding: EdgeInsets.all(10),
                child: Row(
                  children: [
                    Container(
                      height: 100,
                      color: Colors.blue,
                      width: 80,
                      child: Image.asset(article["image"], fit: BoxFit.cover,),
                    ),
                    SizedBox(width: 20,),
                    Expanded(child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 65,
                          child: Text(article["title"],
                              overflow: TextOverflow.ellipsis,
                              maxLines: 3,
                              textAlign: TextAlign.justify,
                          style: TextStyle(color: Color(0xff324558), fontWeight: FontWeight.bold,
                          fontSize: 18)),
                        ),
                        Text.rich(
                          TextSpan(
                          children: [
                            WidgetSpan(child: CircleAvatar(
                              radius: 15,
                              backgroundImage: AssetImage(article["authorImg"]),)),
                          WidgetSpan(child: SizedBox(width: 5,)),
                           TextSpan(
                             text: article["author"],
                             style: TextStyle(fontSize: 17),
                           ) ,
                            WidgetSpan(child: SizedBox(width: 25,)),
                            //WidgetSpan(child: SizedBox(width: 5,)),
                            TextSpan(
                              text: article["time"], style: TextStyle(fontSize: 17),
                            )
                          ]
                        ),
                        style: TextStyle(height: 2),)
                      ],
                    ))
                  ],
                )),
            )
                ]),
    );

     }
}
