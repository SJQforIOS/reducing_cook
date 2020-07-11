import 'package:ecook/common/info_helper/info_helper.dart';import 'package:ecook/app/search/location_history/location_recipe_data_helper.dart';import 'package:flutter/material.dart';class SearchPage extends StatefulWidget {  SearchPage({Key key}) : super(key: key);  @override  _SearchPageState createState() => _SearchPageState();}class _SearchPageState extends State<SearchPage>{  String _inputString = '';  List<String> _historyList = [];  /// 点击历史搜索 item  void _searchHistoryClick(int index) {    setState(() {      _inputString = _historyList[index];    });  }  /// TODO 获取本地缓存历史记录并刷新页面  void _getSearchHistory() async {    _historyList = await getHistoryData();    setState(() {    });  }  @override  void initState() {    super.initState();    _getSearchHistory();  }  @override  Widget build(BuildContext context) {    return Scaffold(      body: Column(        children: <Widget>[          buildTopSearch(context),          if(_historyList.length > 0) historyHeadView(),          if(_historyList.length > 0) Expanded( child: SearchHistoryView(            historyList: _historyList,            onClicked: (i){ _searchHistoryClick(i); },          ),),        ],      ),    );  }  Widget buildTopSearch(BuildContext context) {    TextEditingController _controller = TextEditingController.fromValue(        TextEditingValue(            text: _inputString,            selection: TextSelection.fromPosition(TextPosition(                affinity: TextAffinity.downstream,                offset: _inputString.length            ))        )    );    return Container(      child: Row(        mainAxisAlignment: MainAxisAlignment.spaceBetween, // 主轴(水平)方向分布方式        crossAxisAlignment: CrossAxisAlignment.center, // 纵轴(垂直)方向分布方式        children: <Widget>[          GestureDetector(            child: Image.asset('assets/bk_gy.png'),            onTap: () => {  Navigator.pop(context)},          ),          Expanded(            child: Container(              margin: EdgeInsets.symmetric(horizontal: 16),              padding: EdgeInsets.only(right: elementHorizontal),              child: TextField (                controller: _controller,                autofocus: true,                decoration: InputDecoration (                  border: InputBorder.none,                  hintText: '搜索菜谱/食材',                  hintStyle: hintTextStyle16,                  prefixIcon: Image.asset('assets/home_search.png'),                ),                style: mainTitleBStyle16,                onChanged: (String content) {                  /// 输入框文字改变                  _inputString = content;                },                onSubmitted: (String content) {                  _inputString = content;                  /// TODO 保存搜索记录并刷新页面                  addHistoryData(content).then((value) {                    _historyList = value;                    setState(() {                    });                  });                  /// TODO 请求搜索接口                },              ),              decoration: BoxDecoration(                color: maskMainBackColor,                borderRadius: BorderRadius.circular(17),              ),            ),          ),          GestureDetector(            onTap: (){              _inputString = '';              setState(() {});            },            child: Text(              "取消",              style: subTitleBStyle16,            ),          ),        ],      ),      height: topBarHeight,      padding: EdgeInsets.fromLTRB(elementHorizontal, statusBarHeight, elementHorizontal, 0),    );  }  Widget historyHeadView() {    return Container(      child: Row(        mainAxisAlignment: MainAxisAlignment.spaceBetween, // 主轴(水平)方向分布方式        crossAxisAlignment: CrossAxisAlignment.end, // 纵轴(垂直)方向分布方式        children: <Widget>[          Text(            "历史搜索",            style: mainTitleBStyle16,          ),          GestureDetector(            child: Image.asset('assets/search_delete.png'),            onTap: () {              /// TODO 清空搜索记录并刷新页面              deleteHistoryData().then((value) {                _historyList = value;                setState(() {                });              });            },          ),        ],      ),      height: 42,      margin: EdgeInsets.fromLTRB(elementHorizontal, 0, elementHorizontal, 0),    );  }}class SearchHistoryView extends StatelessWidget {  SearchHistoryView({Key key, this.historyList, this.onClicked}) : super(key: key);  final List<String> historyList;  final Function(int index) onClicked;  @override  Widget build(BuildContext context) {    return Container(      child: Wrap(        spacing: 14.0, // 主轴(水平)方向间距        runSpacing: 12.0, // 纵轴(垂直)方向间距        alignment: WrapAlignment.start, // 沿主轴方向居左        children: historyList            .asMap().keys.map((i) => GestureDetector(          onTap: (){ onClicked(i); },          child: Container(              decoration: BoxDecoration(                  color: maskMainBackColor,                  borderRadius: BorderRadius.circular(14)              ),              height: 28,              padding: EdgeInsets.symmetric(vertical: 4, horizontal: 16),              child: Text(                historyList[i],                style: mainTitleBStyle14,              )),        )).toList(),      ),      constraints: BoxConstraints.expand(        width: double.infinity,        height: double.infinity,      ), // 限制宽高      margin: EdgeInsets.symmetric(horizontal: elementHorizontal, vertical: 16), // 设置边缘距离    );  }}