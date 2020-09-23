class QuestionAnswerModel {
  int _iD;
  String _dcKategori;
  String _dcSoru;
  String _dcCevap;

  QuestionAnswerModel({int iD, String dcKategori, String dcSoru, String dcCevap}) {
    this._iD = iD;
    this._dcKategori = dcKategori;
    this._dcSoru = dcSoru;
    this._dcCevap = dcCevap;
  }

  int get iD => _iD;

  set iD(int iD) => _iD = iD;

  String get dcKategori => _dcKategori;

  set dcKategori(String dcKategori) => _dcKategori = dcKategori;

  String get dcSoru => _dcSoru;

  set dcSoru(String dcSoru) => _dcSoru = dcSoru;

  String get dcCevap => _dcCevap;

  set dcCevap(String dcCevap) => _dcCevap = dcCevap;

  QuestionAnswerModel.fromJson(Map<String, dynamic> json) {
    _iD = json['ID'];
    _dcKategori = json['dc_Kategori'];
    _dcSoru = json['dc_Soru'];
    _dcCevap = json['dc_Cevap'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ID'] = this._iD;
    data['dc_Kategori'] = this._dcKategori;
    data['dc_Soru'] = this._dcSoru;
    data['dc_Cevap'] = this._dcCevap;
    return data;
  }
}
