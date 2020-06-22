import 'package:ecook/common/color_helper.dart';import 'package:ecook/common/screen_info_helper.dart';import 'package:flutter/material.dart';class NewsVC extends StatelessWidget {  TabController controller;  @override  Widget build(BuildContext context) {    return NewsMainViewController();  }}const List<String> titleArr = [  "美食","健康","星座","美女","健身","电影","旅行","山楂树之恋","时间","原谅"];//主页面class NewsMainViewController extends StatelessWidget {  @override  Widget build(BuildContext context) {    // TODO: implement build    return DefaultTabController(      length: titleArr.length,      child: Scaffold(        appBar: TabBar(          labelPadding: EdgeInsets.fromLTRB(16, REScreenInfo.statusBarHeight, 16, 0),          isScrollable: true,          labelColor: ColorHelper.hexStringToColor("#00AD53"),          labelStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),          unselectedLabelColor: ColorHelper.hexStringToColor("#405C69"),          unselectedLabelStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.normal),          indicatorColor: ColorHelper.hexStringToColor("#00AD53"),          indicatorWeight: 3,          indicatorSize: TabBarIndicatorSize.label,          indicatorPadding: EdgeInsets.symmetric(horizontal: 8),          tabs: titleArr.map<Widget>((String title) {            return Tab(              text: title,            );          }).toList(),        ),        body: TabBarView(          children: titleArr.map<Widget>((String title) {            return Padding(              padding: const EdgeInsets.all(8.0),              child: NewsItemChildView(title: title,),            );          }).toList(),        ),      ),    );  }}//子页面class NewsItemChildView extends StatelessWidget {  const NewsItemChildView({ Key key, this.title }) : super(key: key);  final String title;  @override  Widget build(BuildContext context) {    // TODO: implement build    return ListView.separated(itemBuilder: (BuildContext context, int index) {      return index%2 == 0 ? NewOnePictureCell() : NewMuchPictureCell();    }, separatorBuilder: (BuildContext context, int index) {      return Divider(height: 1, color: Color(0xFFF5F5F5));    }, itemCount: 10,padding: EdgeInsets.fromLTRB(20, 0, 20, 0),);  }}//单张图片cell样式class NewOnePictureCell extends StatelessWidget {  @override  Widget build(BuildContext context) {    return SizedBox(      height: 124,      child: Row (        children: <Widget>[          Expanded(            child: Container(              padding: EdgeInsets.fromLTRB(0, 16, 16, 20),              decoration: BoxDecoration(                color: Colors.white,              ),              child: Column(                mainAxisAlignment: MainAxisAlignment.spaceBetween,                crossAxisAlignment: CrossAxisAlignment.start,                children: <Widget>[                  Text('隔离14天没有用！！无症状感染者再度点亮河南',                    style: TextStyle(                        fontSize: 16,                        color: Color(0xFF1E192F)                    ),                    maxLines: 2,                  ),                  Text('大观新闻',                    style: TextStyle(                        fontSize: 12,                        color: Color(0xFF84838B)                    ),                    maxLines: 2,                  ),                ],              ),            ),          ),          SizedBox(            width: 96,            child: AspectRatio(              aspectRatio: 1,              child: ClipRRect(                child: Image(                  image: AssetImage("assets/sc_pic2.png"),                  fit: BoxFit.cover,                ),                borderRadius: BorderRadius.circular(16),              ),            ),          ),        ],      ),    );  }}//多张图片cell样式class NewMuchPictureCell extends StatelessWidget {  @override  Widget build(BuildContext context) {    /// TODO: 此处需小驼峰命名法    final KWidth =MediaQuery.of(context).size.width;    final KHeight =MediaQuery.of(context).size.height;    var iconImageWidth = (KWidth - 21*2 - 9*2)/3;    var cellHeight = 84+iconImageWidth;    return SizedBox(      /*          TODO: 思考此处标题高度是不确定的，因此高度也是不确定的                 所以高度不能定死                 Cell 高度不可控时，是可以自适应高度的（这点我课上说错了）      */      height: cellHeight,      child: Container(        decoration: BoxDecoration(          color: Colors.white,        ),        margin: EdgeInsets.fromLTRB(0, 12, 0, 16),        child: Column(          mainAxisAlignment: MainAxisAlignment.spaceBetween,          crossAxisAlignment: CrossAxisAlignment.start,                    children: <Widget>[            Text("海绵蛋糕不用买，只需3个鸡蛋1碗面粉，无油无水，柔软细腻又健康",              style: TextStyle(                fontSize: 16,                color: Color(0xFF1E192F)              ),            ),            Container(              decoration: BoxDecoration(                color: Colors.white,              ),              child: Row(                mainAxisAlignment: MainAxisAlignment.spaceBetween,                children: <Widget>[                  Image(                    image: AssetImage("assets/sc_pic1.png"),                    fit: BoxFit.cover,                    height: iconImageWidth,                    width: iconImageWidth,                  ),                  Image(                    image: AssetImage("assets/sc_pic2.png"),                    fit: BoxFit.cover,                    height: iconImageWidth,                    width: iconImageWidth,                  ),                  Image(                    image: AssetImage("assets/sc_pic3.png"),                    fit: BoxFit.cover,                    height: iconImageWidth,                    width: iconImageWidth,                  ),                ],              ),            ),          ],        ),      ),    );  }}