/// state : "200"
/// list : [{"hasVideo":false,"imageid":"264208140","materialList":[{"dosage":"260g","contentid":"264208141","mwikipediaid":"","name":"牛柳","ordernum":0,"id":"6516217","version":0},{"dosage":"半条","contentid":"264208141","mwikipediaid":"","name":"青瓜","ordernum":1,"id":"6516218","version":0},{"dosage":"一个","contentid":"264208141","mwikipediaid":"","name":"红尖椒","ordernum":2,"id":"6516219","version":0},{"dosage":"2条","contentid":"264208141","mwikipediaid":"","name":"西芹","ordernum":3,"id":"6516220","version":0},{"dosage":"3g","contentid":"264208141","mwikipediaid":"","name":"盐","ordernum":4,"id":"6516221","version":0},{"dosage":"一小块","contentid":"264208141","mwikipediaid":"","name":"生姜","ordernum":5,"id":"6516222","version":0},{"dosage":"2g","contentid":"264208141","mwikipediaid":"","name":"花椒粉","ordernum":6,"id":"6516223","version":0},{"dosage":"40ml","contentid":"264208141","mwikipediaid":"","name":"花生油","ordernum":7,"id":"6516224","version":0},{"dosage":"10ml","contentid":"264208141","mwikipediaid":"","name":"蚝油","ordernum":8,"id":"6516225","version":0},{"dosage":"3g","contentid":"264208141","mwikipediaid":"","name":"玉米淀粉","ordernum":9,"id":"6516226","version":0}],"description":"可以吃三碗的下饭菜，不信来试试吧","stepList":[{"imageid":"264208148","contentid":"264208141","details":"准备好2片牛排","ordernum":0,"id":"8753570","time":0,"version":0},{"imageid":"264208150","contentid":"264208141","details":"撕开包装袋","ordernum":1,"id":"8753571","time":0,"version":0},{"imageid":"264208149","contentid":"264208141","details":"切成丝，放入料酒、玉米淀粉、蚝油、花椒粉拌匀腌制一会儿","ordernum":2,"id":"8753572","time":0,"version":0},{"imageid":"264208145","contentid":"264208141","details":"青瓜、西芹、红尖椒准备好","ordernum":3,"id":"8753573","time":0,"version":0},{"imageid":"264208144","contentid":"264208141","details":"全部切成丝","ordernum":4,"id":"8753574","time":0,"version":0},{"imageid":"264208160","contentid":"264208141","details":"热锅冷油","ordernum":5,"id":"8753575","time":0,"version":0},{"imageid":"264208157","contentid":"264208141","details":"放入姜丝炒香","ordernum":6,"id":"8753576","time":0,"version":0},{"imageid":"264208156","contentid":"264208141","details":"放入牛排上的肥肉","ordernum":7,"id":"8753577","time":0,"version":0},{"imageid":"264208158","contentid":"264208141","details":"放入牛柳","ordernum":8,"id":"8753578","time":0,"version":0},{"imageid":"264208152","contentid":"264208141","details":"炒至断生","ordernum":9,"id":"8753579","time":0,"version":0},{"imageid":"264208147","contentid":"264208141","details":"装盘备用。","ordernum":10,"id":"8753580","time":0,"version":0},{"imageid":"264208159","contentid":"264208141","details":"锅中留油","ordernum":11,"id":"8753581","time":0,"version":0},{"imageid":"264208154","contentid":"264208141","details":"放入配菜","ordernum":12,"id":"8753582","time":0,"version":0},{"imageid":"264208155","contentid":"264208141","details":"放盐迅速翻炒","ordernum":13,"id":"8753583","time":0,"version":0},{"imageid":"264208153","contentid":"264208141","details":"倒入牛柳","ordernum":14,"id":"8753584","time":0,"version":0},{"imageid":"264208151","contentid":"264208141","details":"炒匀即可","ordernum":15,"id":"8753585","time":0,"version":0},{"imageid":"264208146","contentid":"264208141","details":"装盘食用。","ordernum":16,"id":"8753586","time":0,"version":0}],"video":null,"authorid":"263277981","version":"1","url":null,"tags":"下饭菜,减脂健身,家常菜,快手菜,美容养颜","tipList":[{"contentid":"264208141","details":"","ordernum":0,"id":"814139","version":0}],"gettime":"2020年","name":"青瓜炒牛柳","authorname":"薯条沾腐乳","exclusive":0,"id":"264208141","isrec":"4","authorimageid":"264065389"}]
/// message : "获取成功！"

class EcookDetailModel {
  String state;
  List<ListBean> list;
  String message;

  static EcookDetailModel fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
    EcookDetailModel ecookDetailModelBean = EcookDetailModel();
    ecookDetailModelBean.state = map['state'];
    ecookDetailModelBean.list = List()..addAll(
      (map['list'] as List ?? []).map((o) => ListBean.fromMap(o))
    );
    ecookDetailModelBean.message = map['message'];
    return ecookDetailModelBean;
  }

  Map toJson() => {
    "state": state,
    "list": list,
    "message": message,
  };
}

/// hasVideo : false
/// imageid : "264208140"
/// materialList : [{"dosage":"260g","contentid":"264208141","mwikipediaid":"","name":"牛柳","ordernum":0,"id":"6516217","version":0},{"dosage":"半条","contentid":"264208141","mwikipediaid":"","name":"青瓜","ordernum":1,"id":"6516218","version":0},{"dosage":"一个","contentid":"264208141","mwikipediaid":"","name":"红尖椒","ordernum":2,"id":"6516219","version":0},{"dosage":"2条","contentid":"264208141","mwikipediaid":"","name":"西芹","ordernum":3,"id":"6516220","version":0},{"dosage":"3g","contentid":"264208141","mwikipediaid":"","name":"盐","ordernum":4,"id":"6516221","version":0},{"dosage":"一小块","contentid":"264208141","mwikipediaid":"","name":"生姜","ordernum":5,"id":"6516222","version":0},{"dosage":"2g","contentid":"264208141","mwikipediaid":"","name":"花椒粉","ordernum":6,"id":"6516223","version":0},{"dosage":"40ml","contentid":"264208141","mwikipediaid":"","name":"花生油","ordernum":7,"id":"6516224","version":0},{"dosage":"10ml","contentid":"264208141","mwikipediaid":"","name":"蚝油","ordernum":8,"id":"6516225","version":0},{"dosage":"3g","contentid":"264208141","mwikipediaid":"","name":"玉米淀粉","ordernum":9,"id":"6516226","version":0}]
/// description : "可以吃三碗的下饭菜，不信来试试吧"
/// stepList : [{"imageid":"264208148","contentid":"264208141","details":"准备好2片牛排","ordernum":0,"id":"8753570","time":0,"version":0},{"imageid":"264208150","contentid":"264208141","details":"撕开包装袋","ordernum":1,"id":"8753571","time":0,"version":0},{"imageid":"264208149","contentid":"264208141","details":"切成丝，放入料酒、玉米淀粉、蚝油、花椒粉拌匀腌制一会儿","ordernum":2,"id":"8753572","time":0,"version":0},{"imageid":"264208145","contentid":"264208141","details":"青瓜、西芹、红尖椒准备好","ordernum":3,"id":"8753573","time":0,"version":0},{"imageid":"264208144","contentid":"264208141","details":"全部切成丝","ordernum":4,"id":"8753574","time":0,"version":0},{"imageid":"264208160","contentid":"264208141","details":"热锅冷油","ordernum":5,"id":"8753575","time":0,"version":0},{"imageid":"264208157","contentid":"264208141","details":"放入姜丝炒香","ordernum":6,"id":"8753576","time":0,"version":0},{"imageid":"264208156","contentid":"264208141","details":"放入牛排上的肥肉","ordernum":7,"id":"8753577","time":0,"version":0},{"imageid":"264208158","contentid":"264208141","details":"放入牛柳","ordernum":8,"id":"8753578","time":0,"version":0},{"imageid":"264208152","contentid":"264208141","details":"炒至断生","ordernum":9,"id":"8753579","time":0,"version":0},{"imageid":"264208147","contentid":"264208141","details":"装盘备用。","ordernum":10,"id":"8753580","time":0,"version":0},{"imageid":"264208159","contentid":"264208141","details":"锅中留油","ordernum":11,"id":"8753581","time":0,"version":0},{"imageid":"264208154","contentid":"264208141","details":"放入配菜","ordernum":12,"id":"8753582","time":0,"version":0},{"imageid":"264208155","contentid":"264208141","details":"放盐迅速翻炒","ordernum":13,"id":"8753583","time":0,"version":0},{"imageid":"264208153","contentid":"264208141","details":"倒入牛柳","ordernum":14,"id":"8753584","time":0,"version":0},{"imageid":"264208151","contentid":"264208141","details":"炒匀即可","ordernum":15,"id":"8753585","time":0,"version":0},{"imageid":"264208146","contentid":"264208141","details":"装盘食用。","ordernum":16,"id":"8753586","time":0,"version":0}]
/// video : null
/// authorid : "263277981"
/// version : "1"
/// url : null
/// tags : "下饭菜,减脂健身,家常菜,快手菜,美容养颜"
/// tipList : [{"contentid":"264208141","details":"","ordernum":0,"id":"814139","version":0}]
/// gettime : "2020年"
/// name : "青瓜炒牛柳"
/// authorname : "薯条沾腐乳"
/// exclusive : 0
/// id : "264208141"
/// isrec : "4"
/// authorimageid : "264065389"

class ListBean {
  bool hasVideo;
  String imageid;
  List<MaterialListBean> materialList;
  String description;
  List<StepListBean> stepList;
  dynamic video;
  String authorid;
  String version;
  dynamic url;
  String tags;
  List<TipListBean> tipList;
  String gettime;
  String name;
  String authorname;
  int exclusive;
  String id;
  String isrec;
  String authorimageid;

  static ListBean fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
    ListBean listBean = ListBean();
    listBean.hasVideo = map['hasVideo'];
    listBean.imageid = map['imageid'];
    listBean.materialList = List()..addAll(
      (map['materialList'] as List ?? []).map((o) => MaterialListBean.fromMap(o))
    );
    listBean.description = map['description'];
    listBean.stepList = List()..addAll(
      (map['stepList'] as List ?? []).map((o) => StepListBean.fromMap(o))
    );
    listBean.video = map['video'];
    listBean.authorid = map['authorid'];
    listBean.version = map['version'];
    listBean.url = map['url'];
    listBean.tags = map['tags'];
    listBean.tipList = List()..addAll(
      (map['tipList'] as List ?? []).map((o) => TipListBean.fromMap(o))
    );
    listBean.gettime = map['gettime'];
    listBean.name = map['name'];
    listBean.authorname = map['authorname'];
    listBean.exclusive = map['exclusive'];
    listBean.id = map['id'];
    listBean.isrec = map['isrec'];
    listBean.authorimageid = map['authorimageid'];
    return listBean;
  }

  Map toJson() => {
    "hasVideo": hasVideo,
    "imageid": imageid,
    "materialList": materialList,
    "description": description,
    "stepList": stepList,
    "video": video,
    "authorid": authorid,
    "version": version,
    "url": url,
    "tags": tags,
    "tipList": tipList,
    "gettime": gettime,
    "name": name,
    "authorname": authorname,
    "exclusive": exclusive,
    "id": id,
    "isrec": isrec,
    "authorimageid": authorimageid,
  };
}

/// contentid : "264208141"
/// details : ""
/// ordernum : 0
/// id : "814139"
/// version : 0

class TipListBean {
  String contentid;
  String details;
  int ordernum;
  String id;
  int version;

  static TipListBean fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
    TipListBean tipListBean = TipListBean();
    tipListBean.contentid = map['contentid'];
    tipListBean.details = map['details'];
    tipListBean.ordernum = map['ordernum'];
    tipListBean.id = map['id'];
    tipListBean.version = map['version'];
    return tipListBean;
  }

  Map toJson() => {
    "contentid": contentid,
    "details": details,
    "ordernum": ordernum,
    "id": id,
    "version": version,
  };
}

/// imageid : "264208148"
/// contentid : "264208141"
/// details : "准备好2片牛排"
/// ordernum : 0
/// id : "8753570"
/// time : 0
/// version : 0

class StepListBean {
  String imageid;
  String contentid;
  String details;
  int ordernum;
  String id;
  int time;
  int version;

  static StepListBean fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
    StepListBean stepListBean = StepListBean();
    stepListBean.imageid = map['imageid'];
    stepListBean.contentid = map['contentid'];
    stepListBean.details = map['details'];
    stepListBean.ordernum = map['ordernum'];
    stepListBean.id = map['id'];
    stepListBean.time = map['time'];
    stepListBean.version = map['version'];
    return stepListBean;
  }

  Map toJson() => {
    "imageid": imageid,
    "contentid": contentid,
    "details": details,
    "ordernum": ordernum,
    "id": id,
    "time": time,
    "version": version,
  };
}

/// dosage : "260g"
/// contentid : "264208141"
/// mwikipediaid : ""
/// name : "牛柳"
/// ordernum : 0
/// id : "6516217"
/// version : 0

class MaterialListBean {
  String dosage;
  String contentid;
  String mwikipediaid;
  String name;
  int ordernum;
  String id;
  int version;

  static MaterialListBean fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
    MaterialListBean materialListBean = MaterialListBean();
    materialListBean.dosage = map['dosage'];
    materialListBean.contentid = map['contentid'];
    materialListBean.mwikipediaid = map['mwikipediaid'];
    materialListBean.name = map['name'];
    materialListBean.ordernum = map['ordernum'];
    materialListBean.id = map['id'];
    materialListBean.version = map['version'];
    return materialListBean;
  }

  Map toJson() => {
    "dosage": dosage,
    "contentid": contentid,
    "mwikipediaid": mwikipediaid,
    "name": name,
    "ordernum": ordernum,
    "id": id,
    "version": version,
  };
}