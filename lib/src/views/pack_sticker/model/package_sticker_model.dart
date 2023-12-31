class Autogenerated {
  List<PackSticker>? packSticker;

  Autogenerated({this.packSticker});

  Autogenerated.fromJson(Map<String, dynamic> json) {
    if (json['packSticker'] != null) {
      packSticker = <PackSticker>[];
      json['packSticker'].forEach((v) {
        packSticker!.add(new PackSticker.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (packSticker != null) {
      data['packSticker'] = packSticker!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class PackSticker {
  String? id;
  String? urlImage;
  String? title;
  bool? status;
  List<String>? stickerChild;

  PackSticker({this.id, this.urlImage, this.title, this.status, this.stickerChild});

  PackSticker.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    urlImage = json['urlImage'];
    title = json['title'];
    status = json['status'];
    stickerChild = json['stickerChild'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id;
    data['urlImage'] = urlImage;
    data['title'] = title;
    data['status'] = status;
    data['stickerChild'] = stickerChild;
    return data;
  }
}
