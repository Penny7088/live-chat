/// interestss : [{"tagID":1,"translatedName":"音楽"},{"tagID":2,"translatedName":"スポーツ"},{"tagID":3,"translatedName":"旅行"},{"tagID":4,"translatedName":"技術"},{"tagID":5,"translatedName":"料理"},{"tagID":6,"translatedName":"写真"},{"tagID":7,"translatedName":"読書"},{"tagID":8,"translatedName":"ゲーム"},{"tagID":9,"translatedName":"フィットネス"},{"tagID":10,"translatedName":"映画"},{"tagID":11,"translatedName":"アート"},{"tagID":12,"translatedName":"科学"},{"tagID":13,"translatedName":"歴史"},{"tagID":14,"translatedName":"ファッション"},{"tagID":15,"translatedName":"自分で作る"},{"tagID":16,"translatedName":"自然"},{"tagID":17,"translatedName":"冒険"},{"tagID":18,"translatedName":"財務"},{"tagID":19,"translatedName":"プログラミング"},{"tagID":20,"translatedName":"ガーデニング"}]

class InterestsModel {
  InterestsModel({
    this.interestss,
  });

  InterestsModel.fromJson(dynamic json) {
    if (json['interestss'] != null) {
      interestss = [];
      json['interestss'].forEach((v) {
        interestss?.add(Interestss.fromJson(v));
      });
    }
  }

  List<Interestss>? interestss;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (interestss != null) {
      map['interestss'] = interestss?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

/// tagID : 1
/// translatedName : "音楽"

class Interestss {
  Interestss({this.tagID, this.translatedName, this.isChoose});

  Interestss.fromJson(dynamic json) {
    tagID = json['tagID'];
    translatedName = json['translatedName'];
  }

  int? tagID;
  String? translatedName;
  bool? isChoose;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['tagID'] = tagID;
    map['translatedName'] = translatedName;
    return map;
  }
}
