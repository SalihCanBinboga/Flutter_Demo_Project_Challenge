class DictionaryModel {
  int _iD;
  String _dcTurkce;
  String _dcIngilizce;

  DictionaryModel({int iD, String dcTurkce, String dcIngilizce}) {
    this._iD = iD;
    this._dcTurkce = dcTurkce;
    this._dcIngilizce = dcIngilizce;
  }

  int get iD => _iD;

  set iD(int iD) => _iD = iD;

  String get dcTurkce => _dcTurkce;

  set dcTurkce(String dcTurkce) => _dcTurkce = dcTurkce;

  String get dcIngilizce => _dcIngilizce;

  set dcIngilizce(String dcIngilizce) => _dcIngilizce = dcIngilizce;

  DictionaryModel.fromJson(Map<String, dynamic> json) {
    _iD = json['ID'];
    _dcTurkce = json['dc_Turkce'];
    _dcIngilizce = json['dc_Ingilizce'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ID'] = this._iD;
    data['dc_Turkce'] = this._dcTurkce;
    data['dc_Ingilizce'] = this._dcIngilizce;
    return data;
  }
}
