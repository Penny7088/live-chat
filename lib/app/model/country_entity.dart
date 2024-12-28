/// countriess : [{"id":1,"name":"Australia","isoCode":"AU"},{"id":2,"name":"Canada","isoCode":"CA"},{"id":3,"name":"Norway","isoCode":"NO"},{"id":4,"name":"Netherlands","isoCode":"NL"},{"id":5,"name":"Iceland","isoCode":"IS"},{"id":6,"name":"Indonesia","isoCode":"ID"},{"id":7,"name":"Philippines","isoCode":"PH"},{"id":8,"name":"Singapore","isoCode":"SG"},{"id":9,"name":"United States","isoCode":"US"},{"id":10,"name":"Mexico","isoCode":"MX"},{"id":11,"name":"France","isoCode":"FR"},{"id":12,"name":"Germany","isoCode":"DE"},{"id":13,"name":"China","isoCode":"CN"},{"id":14,"name":"India","isoCode":"IN"},{"id":15,"name":"Brazil","isoCode":"BR"},{"id":16,"name":"Russia","isoCode":"RU"},{"id":17,"name":"Japan","isoCode":"JP"},{"id":18,"name":"United Kingdom","isoCode":"GB"},{"id":19,"name":"Italy","isoCode":"IT"},{"id":20,"name":"South Korea","isoCode":"KR"},{"id":21,"name":"Spain","isoCode":"ES"},{"id":22,"name":"Ukraine","isoCode":"UA"},{"id":23,"name":"Thailand","isoCode":"TH"},{"id":24,"name":"Vietnam","isoCode":"VN"},{"id":25,"name":"United States","isoCode":"USA"},{"id":26,"name":"Canada","isoCode":"CAN"},{"id":27,"name":"United Kingdom","isoCode":"GBR"},{"id":28,"name":"Australia","isoCode":"AUS"},{"id":29,"name":"New Zealand","isoCode":"NZL"},{"id":30,"name":"Germany","isoCode":"DEU"},{"id":31,"name":"France","isoCode":"FRA"},{"id":32,"name":"Italy","isoCode":"ITA"},{"id":33,"name":"Spain","isoCode":"ESP"},{"id":34,"name":"Netherlands","isoCode":"NLD"},{"id":35,"name":"Belgium","isoCode":"BEL"},{"id":36,"name":"Sweden","isoCode":"SWE"},{"id":37,"name":"Norway","isoCode":"NOR"},{"id":38,"name":"Denmark","isoCode":"DNK"},{"id":39,"name":"Finland","isoCode":"FIN"},{"id":40,"name":"Ireland","isoCode":"IRL"},{"id":41,"name":"Switzerland","isoCode":"CHE"},{"id":42,"name":"Austria","isoCode":"AUT"},{"id":43,"name":"Portugal","isoCode":"PRT"},{"id":44,"name":"Greece","isoCode":"GRC"},{"id":45,"name":"Poland","isoCode":"POL"},{"id":46,"name":"Czech Republic","isoCode":"CZE"},{"id":47,"name":"Hungary","isoCode":"HUN"},{"id":48,"name":"Romania","isoCode":"ROU"},{"id":49,"name":"Russia","isoCode":"RUS"},{"id":50,"name":"China","isoCode":"CHN"},{"id":51,"name":"Japan","isoCode":"JPN"},{"id":52,"name":"South Korea","isoCode":"KOR"},{"id":53,"name":"India","isoCode":"IND"},{"id":54,"name":"Brazil","isoCode":"BRA"},{"id":55,"name":"Mexico","isoCode":"MEX"},{"id":56,"name":"Argentina","isoCode":"ARG"},{"id":57,"name":"Chile","isoCode":"CHL"},{"id":58,"name":"Colombia","isoCode":"COL"},{"id":59,"name":"South Africa","isoCode":"ZAF"},{"id":60,"name":"Egypt","isoCode":"EGY"},{"id":61,"name":"Nigeria","isoCode":"NGA"},{"id":62,"name":"Kenya","isoCode":"KEN"},{"id":63,"name":"Turkey","isoCode":"TUR"},{"id":64,"name":"Saudi Arabia","isoCode":"SAU"},{"id":65,"name":"United Arab Emirates","isoCode":"ARE"},{"id":66,"name":"Israel","isoCode":"ISR"},{"id":67,"name":"Indonesia","isoCode":"IDN"},{"id":68,"name":"Thailand","isoCode":"THA"},{"id":69,"name":"Vietnam","isoCode":"VNM"},{"id":70,"name":"Philippines","isoCode":"PHL"},{"id":71,"name":"Malaysia","isoCode":"MYS"},{"id":72,"name":"Singapore","isoCode":"SGP"},{"id":73,"name":"Bangladesh","isoCode":"BGD"}]

class CountryEntity {
  CountryEntity({
      this.countriess,});

  CountryEntity.fromJson(dynamic json) {
    if (json['countriess'] != null) {
      countriess = [];
      json['countriess'].forEach((v) {
        countriess?.add(Countries.fromJson(v));
      });
    }
  }
  List<Countries>? countriess;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (countriess != null) {
      map['countriess'] = countriess?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}


/// id : 1
/// name : "Australia"
/// isoCode : "AU"

class Countries {
  Countries({
      this.id, 
      this.name, 
      this.isoCode,
      this.flagIcon,
      });

  Countries.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    isoCode = json['isoCode'];
  }
  int? id;
  String? name;
  String? flagIcon;
  String? isoCode;

  bool? isChoose;



  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['isoCode'] = isoCode;
    map['flagIcon'] = flagIcon;
    return map;
  }

}