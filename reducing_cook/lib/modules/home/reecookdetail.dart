import 'package:ecook/common/color_helper.dart';import 'package:ecook/common/https/http_helper.dart';import 'package:ecook/common/screen_info_helper.dart';import 'package:flutter/material.dart';import 'package:flutter/services.dart';import 'package:ecook/model/ecook_detail_model.dart';const List<Map> materialList = [  {"name":"金针菇","num":"200g"},  {"name":"番茄","num":"2个"},  {"name":"鸡蛋","num":"2个"},  {"name":"油","num":"20g"},  {"name":"盐","num":"20g"},  {"name":"生抽","num":"10g"},  {"name":"胡椒粉","num":"半汤勺"},  {"name":"孜然粉","num":"半汤勺"},  {"name":"五谷鱼粉","num":"一大碗"},];const List<Map> cookStepList = [  {"num":"1/3","title":"鲫鱼收拾干净 表面划几刀易于入味","image":"assets/sc_pic2.png"},  {"num":"2/3","title":"辅料备好 葱 蒜 剁椒 花椒","image":"assets/sc_pic3.png"},  {"num":"3/3","title":"放入剁椒蒸鱼鼓油 糖 料汁备好","image":"assets/sc_pic4.png"},];ListBean _dataBean = ListBean();class DetaileEcook extends StatefulWidget {  DetaileEcook({Key key, this.id}) : super(key:ActivateAction.key);  final String id;  @override  DetailBodyView createState() => DetailBodyView();}class DetailBodyView extends State<DetaileEcook> {  void _loadDetailListData() async{    BaseHttpResponse response = await httpRequest.getRequest(GetRecipeListByIds, data: {"ids":widget.id});    _dataBean = EcookDetailModel.fromMap(response.responseJson).list[0];    setState(() {    });  }  @override  void initState() {    // TODO: implement initState    _loadDetailListData();    super.initState();  }  Widget build(BuildContext context) {    // TODO: implement build    SystemChrome.setSystemUIOverlayStyle(        SystemUiOverlayStyle.light    );    return Scaffold(      body: Column(        mainAxisAlignment: MainAxisAlignment.spaceBetween,        crossAxisAlignment: CrossAxisAlignment.start,        children: <Widget>[          detailTopNavtionView(context),          DetailCenterView(beanModel: _dataBean),          DetailBottomView(),        ],      ),    );  }  Widget detailTopNavtionView (BuildContext context) {    return Container(      decoration: BoxDecoration(//        color: ColorHelper.slRandomColor()      ),      height: REScreenInfo.statusBarHeight,      child: Container(        decoration: BoxDecoration(            color: ColorHelper.hexStringToColor("#000000")        ),        height: REScreenInfo.statusBarHeight,      ),    );  }}//底部视图class DetailBottomView extends StatelessWidget {  @override  Widget build(BuildContext context) {    // TODO: implement build    return Container(      decoration: BoxDecoration(          color: Colors.white      ),      height: 80,      padding: EdgeInsets.fromLTRB(20, 8, 20, 28),      child: Row(        children: <Widget>[          Expanded(            flex: 3,            child: Container(              decoration: BoxDecoration(                  color: ColorHelper.hexStringToColor("#C2BFCF"),                  borderRadius: BorderRadius.circular(8),              ),              height: 44,              child: Row(                mainAxisAlignment: MainAxisAlignment.center,                children: <Widget>[                  Image(image: AssetImage("assets/detail_add.png")),                  Padding(                    padding: EdgeInsets.symmetric(horizontal: 8),                    child: Text("加入收藏夹",style: TextStyle(fontSize: 14, color: Colors.white, fontWeight: FontWeight.w500),),                  ),                ],              ),            ),          ),          SizedBox(width: 16),          Expanded(            flex: 1,            child: Container(              decoration: BoxDecoration(                color: ColorHelper.hexStringToColor("#F5F5F7"),                borderRadius: BorderRadius.circular(8),              ),              height: 44,              child: Row(                mainAxisAlignment: MainAxisAlignment.center,                children: <Widget>[                  Image(image: AssetImage("assets/detail_zan.png")),                  Padding(                    padding: EdgeInsets.symmetric(horizontal: 4),                    child: Text("20",style: TextStyle(fontSize: 10, color: ColorHelper.hexStringToColor("#C2BFCF"))),                  ),                ],              ),            ),          ),        ],      ),    );  }}//中间视图class DetailCenterView extends StatefulWidget {  DetailCenterView({Key key, this.beanModel}) : super(key:key);  final ListBean beanModel;  @override  DetailCenterViewState createState() => DetailCenterViewState();}class DetailCenterViewState extends State<DetailCenterView> {  //监听滑动  ScrollController _controller = ScrollController();  double _imageHeight = REScreenInfo.screenWidth;  @override  void initState() {    super.initState();    // TODO: 计算问题    _controller.addListener(() {      print(_controller.offset);      double faxHeight = REScreenInfo.screenWidth - _controller.offset;      if (_controller.offset >= 0) {//上滑        _imageHeight = REScreenInfo.screenWidth;      } else {        _imageHeight = faxHeight;      }      setState(() {      });    });  }  Widget build(BuildContext context) {    // TODO: implement build    return Container(      decoration: BoxDecoration(          color: Colors.white      ),      height: REScreenInfo.screenHeight-REScreenInfo.statusBarHeight-80,      child: Stack(        children: <Widget>[          SizedBox(            child: getNetImageWithId(widget.beanModel != null ? widget.beanModel.imageid : "264208140", size: Size.square(_imageHeight)),            width: REScreenInfo.screenWidth,            height: _imageHeight,          ),          Container(            //中间List            width: REScreenInfo.screenWidth,            height: REScreenInfo.screenHeight-REScreenInfo.statusBarHeight-80,            child: mainListView(context),          ),          Container(            child: LayoutBuilder(              builder: (BuildContext context, BoxConstraints constraints) {                return Container(                  decoration: BoxDecoration(                      gradient: LinearGradient(                        colors: [Color(0xFF000000).withAlpha(102), Color(0xFF00000).withAlpha(0)],                        begin: Alignment.topCenter,                        end: Alignment.bottomCenter,                      )                  ),                  height: 44,                  width: REScreenInfo.screenWidth,                  margin: EdgeInsets.fromLTRB(0, 0, 0, constraints.heightConstraints().maxHeight-44),                  child: GestureDetector(                    child: Container(                      child: Image(image: AssetImage("assets/detail_back.png")),                      margin: EdgeInsets.fromLTRB(20, 10, REScreenInfo.screenWidth-20-24, 10),                      height: 24,                      width: 24,                    ),                    onTap: () => {Navigator.pop(context)},                  ),                );              },            ),          ),        ],      ),    );  }  Widget mainListView (BuildContext context) {    return ListView.builder(itemBuilder: (BuildContext context, int index) {      if (index == 0) {        return mainEmptyCell();      } else if (index == 1) {        return mainTitleCell();      } else if (index == 2) {        return mainUserDataCell();      } else if (index == 3) {        return mainMaterialDataCell();      } else if (index == 4) {        return mainStepTitleCell();      } else if (index == 5+(widget.beanModel == null ? 0 : widget.beanModel.stepList.length)) {        return mainAboutMaterCell(context);      } else {        print("${widget.beanModel.stepList[index-5]}");        String num = "${widget.beanModel.stepList[index-5].ordernum}/${widget.beanModel.stepList.length}";        String title = widget.beanModel.stepList[index-5].details;        String image = widget.beanModel.stepList[index-5].imageid;        return mainStepDataCell(num: num, title: title, image: image);      }    }, itemCount:6+(widget.beanModel == null ? 0 : widget.beanModel.stepList.length), controller: _controller,);  }  //空白cell  Widget mainEmptyCell () {    return Container(      decoration: BoxDecoration(      ),      height: REScreenInfo.screenWidth-64,    );  }  //标题cell  Widget mainTitleCell () {    return Container(      decoration: BoxDecoration(          color: Colors.white,          borderRadius: BorderRadius.only(topLeft: Radius.circular(16),topRight: Radius.circular(16))      ),//      height: 130,      child: Column(//        mainAxisAlignment: MainAxisAlignment.spaceBetween,        crossAxisAlignment: CrossAxisAlignment.start,        children: <Widget>[          Container(            decoration: BoxDecoration(                color: ColorHelper.hexStringToColor("#C2BFCF"),                borderRadius: BorderRadius.circular(2)            ),            width: 30,            height: 4,            margin: EdgeInsets.fromLTRB((REScreenInfo.screenWidth-30)/2, 14, (REScreenInfo.screenWidth-30)/2, 16),          ),          Padding(            padding: EdgeInsets.fromLTRB(20, 0, 0, 0),            child: Text(widget.beanModel.name, style: TextStyle(fontWeight: FontWeight.w500, fontSize: 24, color: ColorHelper.hexStringToColor("#1E192F"))),          ),          Padding(            padding: EdgeInsets.fromLTRB(20, 6, 0, 20),            child: Text("已有29人收藏 293人点赞", style: TextStyle(fontWeight: FontWeight.w400, fontSize: 12, color: ColorHelper.hexStringToColor("#C2BFCF")),),          ),        ],      ),    );  }  //用户信息cell  Widget mainUserDataCell () {    return Container(      decoration: BoxDecoration(          color: Colors.white      ),      height: 125,      child: Padding(        padding: EdgeInsets.fromLTRB(20, 0, 20, 0),        child: Stack(          fit: StackFit.expand,          children: <Widget>[            Image(              image: AssetImage("assets/detail_userbg.png"),              fit: BoxFit.fill,              //width: REScreenInfo.screenWidth-40,            ),            Positioned(              left: 16,              top: 12,              child: ClipRRect(                borderRadius: BorderRadius.circular(15),                child: SizedBox(                  child: getNetImageWithId(widget.beanModel.authorimageid, size: Size.square(30)),                  width: 30,                  height: 30,                ),              ),            ),            Positioned(              left: 56,              top: 17,              child: Text(widget.beanModel.authorname ,style: TextStyle(fontSize: 14, color: ColorHelper.hexStringToColor("#1E192F"), fontWeight: FontWeight.w500),),            ),            Positioned(              left: 16,              top: 52,              right: 16,              bottom: 16,              child: Text(widget.beanModel.description,style: TextStyle(                  fontSize: 14,                  color: ColorHelper.hexStringToColor("#1E192F"),                  fontWeight: FontWeight.w500),                  maxLines: 3),            ),          ],        ),      ),    );  }  //食材cell  Widget mainMaterialDataCell () {    double cellHeight = widget.beanModel.materialList == null ? 0.0 : widget.beanModel.materialList.length*40.0;    return Container(      decoration: BoxDecoration(          color: Colors.white      ),      height: cellHeight+105,      padding: EdgeInsets.fromLTRB(20, 16, 20, 28),      child: Container(        decoration: BoxDecoration(            color: ColorHelper.hexStringToColor("#F5F5F7"),            borderRadius: BorderRadius.circular(16)        ),        child: Column(          mainAxisAlignment: MainAxisAlignment.spaceBetween,          crossAxisAlignment: CrossAxisAlignment.start,          children: <Widget>[            Padding(              padding: EdgeInsets.fromLTRB(16, 20, 16, 0),              child: Text("需要材料", style: TextStyle(fontSize: 18,fontWeight: FontWeight.w600,color: ColorHelper.hexStringToColor("#1E192F")),),            ),            Container(              decoration: BoxDecoration(//                color: ColorHelper.slRandomColor()              ),              width: REScreenInfo.screenWidth-72,              height: cellHeight,              margin: EdgeInsets.fromLTRB(16, 8, 16, 8),              child: ListView.builder(itemBuilder: (BuildContext context, int index) {                String name = widget.beanModel.materialList[index].name;                String num = widget.beanModel.materialList[index].dosage;                return SizedBox(                  child: Row(                    mainAxisAlignment: MainAxisAlignment.spaceBetween,                    crossAxisAlignment: CrossAxisAlignment.start,                    children: <Widget>[                      SizedBox(                        height: 40,                        child: Text(name,style: TextStyle(fontSize: 14, color: ColorHelper.hexStringToColor("#84838B")),),                      ),                      SizedBox(                        height: 40,                        child: Text(num,style: TextStyle(fontSize: 14, color: ColorHelper.hexStringToColor("#84838B")),),                      ),                    ],                  ),                );              }, itemCount: widget.beanModel.materialList == null ? 0 : widget.beanModel.materialList.length, physics: NeverScrollableScrollPhysics(),),            ),          ],        ),      ),    );  }  //烹饪步骤标题cell  Widget mainStepTitleCell () {    return Container(      decoration: BoxDecoration(          color: Colors.white      ),      height: 30,      child: Padding(        padding: EdgeInsets.fromLTRB(20, 4, 0, 0),        child: Text("烹饪步骤", style: TextStyle(fontSize: 18,fontWeight: FontWeight.w500, color: ColorHelper.hexStringToColor("#1E192F")),),      ),    );  }  //烹饪步骤cell  Widget mainStepDataCell ({String num,String title, String image}){    return Container(      decoration: BoxDecoration(          color: Colors.white      ),      // TODO: 自适应高度问题//      height: 316,      child: Padding(        padding: EdgeInsets.fromLTRB(20, 16, 20, 0),        child: Column(          crossAxisAlignment: CrossAxisAlignment.start,          children: <Widget>[            Text(num, style: TextStyle(fontSize: 16, color: ColorHelper.hexStringToColor("#84838B"))),            Padding(              padding: EdgeInsets.fromLTRB(0, 16, 0, 16),              child: ClipRRect(                borderRadius: BorderRadius.circular(16),                child: SizedBox(                  width: REScreenInfo.screenWidth-40,                  height: 205,                  child: getNetImageWithId(image, size: Size(REScreenInfo.screenWidth-40, 205)),                ),              ),            ),            Text(title, style: TextStyle(fontSize: 16, color: ColorHelper.hexStringToColor("#1E192F")))          ],        ),      ),    );  }  //相关菜谱  Widget mainAboutMaterCell (BuildContext context) {    return Container(      decoration: BoxDecoration(          color: Colors.white      ),      height: 210,      child: Column(        crossAxisAlignment: CrossAxisAlignment.start,        children: <Widget>[          Padding(            padding: EdgeInsets.fromLTRB(20, 16, 0, 16),            child: Text("相关菜谱", style: TextStyle(fontSize: 18, color: ColorHelper.hexStringToColor("#1E192F"),fontWeight: FontWeight.w600)),          ),          Container(            decoration: BoxDecoration(                color: Colors.white            ),            height: 138,            child: bottomMoreCookView(context),          ),        ],      ),    );  }  //底部相关菜谱轮播视图  Widget bottomMoreCookView (BuildContext context) {    return ListView.builder(itemBuilder: (BuildContext context, int index) {      return Container(        decoration: BoxDecoration(            color: Colors.white        ),        padding: EdgeInsets.fromLTRB(8, 0, 8, 0),        child: Image(          image: AssetImage("assets/sc_pic1.png"),          fit: BoxFit.cover,        ),      );    }, itemCount: 10, itemExtent: 154,scrollDirection: Axis.horizontal,padding: EdgeInsets.fromLTRB(12, 0, 12, 0),);  }}