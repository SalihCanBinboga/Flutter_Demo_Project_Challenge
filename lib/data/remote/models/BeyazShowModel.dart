class BeyazShowModel {
  int _iD;
  String _dcPlaylistKategori;
  String _dcVideoBaslik;
  String _dcLink;
  String _dcBegeniSayisi;
  String _dcBegenilmemeSayisi;
  String _dcIzlenmeSayisi;
  String _dcYayinlanmaTarihi;

  BeyazShowModel(
      {int iD,
      String dcPlaylistKategori,
      String dcVideoBaslik,
      String dcLink,
      String dcBegeniSayisi,
      String dcBegenilmemeSayisi,
      String dcIzlenmeSayisi,
      String dcYayinlanmaTarihi}) {
    this._iD = iD;
    this._dcPlaylistKategori = dcPlaylistKategori;
    this._dcVideoBaslik = dcVideoBaslik;
    this._dcLink = dcLink;
    this._dcBegeniSayisi = dcBegeniSayisi;
    this._dcBegenilmemeSayisi = dcBegenilmemeSayisi;
    this._dcIzlenmeSayisi = dcIzlenmeSayisi;
    this._dcYayinlanmaTarihi = dcYayinlanmaTarihi;
  }

  int get iD => _iD;

  set iD(int iD) => _iD = iD;

  String get dcPlaylistKategori => _dcPlaylistKategori;

  set dcPlaylistKategori(String dcPlaylistKategori) =>
      _dcPlaylistKategori = dcPlaylistKategori;

  String get dcVideoBaslik => _dcVideoBaslik;

  set dcVideoBaslik(String dcVideoBaslik) => _dcVideoBaslik = dcVideoBaslik;

  String get dcLink => _dcLink;

  set dcLink(String dcLink) => _dcLink = dcLink;

  String get dcBegeniSayisi => _dcBegeniSayisi;

  set dcBegeniSayisi(String dcBegeniSayisi) => _dcBegeniSayisi = dcBegeniSayisi;

  String get dcBegenilmemeSayisi => _dcBegenilmemeSayisi;

  set dcBegenilmemeSayisi(String dcBegenilmemeSayisi) =>
      _dcBegenilmemeSayisi = dcBegenilmemeSayisi;

  String get dcIzlenmeSayisi => _dcIzlenmeSayisi;

  set dcIzlenmeSayisi(String dcIzlenmeSayisi) =>
      _dcIzlenmeSayisi = dcIzlenmeSayisi;

  String get dcYayinlanmaTarihi => _dcYayinlanmaTarihi;

  set dcYayinlanmaTarihi(String dcYayinlanmaTarihi) =>
      _dcYayinlanmaTarihi = dcYayinlanmaTarihi;

  BeyazShowModel.fromJson(Map<String, dynamic> json) {
    _iD = json['ID'];
    _dcPlaylistKategori = json['dc_Playlist_Kategori'];
    _dcVideoBaslik = json['dc_Video_Baslik'];
    _dcLink = json['dc_Link'];
    _dcBegeniSayisi = json['dc_Begeni_Sayisi'];
    _dcBegenilmemeSayisi = json['dc_Begenilmeme_Sayisi'];
    _dcIzlenmeSayisi = json['dc_Izlenme_Sayisi'];
    _dcYayinlanmaTarihi = json['dc_Yayinlanma_Tarihi'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ID'] = this._iD;
    data['dc_Playlist_Kategori'] = this._dcPlaylistKategori;
    data['dc_Video_Baslik'] = this._dcVideoBaslik;
    data['dc_Link'] = this._dcLink;
    data['dc_Begeni_Sayisi'] = this._dcBegeniSayisi;
    data['dc_Begenilmeme_Sayisi'] = this._dcBegenilmemeSayisi;
    data['dc_Izlenme_Sayisi'] = this._dcIzlenmeSayisi;
    data['dc_Yayinlanma_Tarihi'] = this._dcYayinlanmaTarihi;
    return data;
  }
}
