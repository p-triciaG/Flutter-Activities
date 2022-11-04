class Location{
  int? id;
  String title = '';
  String subject = '';
  String description = '';
  String address = '';
  String imagePath = '';

  Location({title, subject, address, description, imagePath}){
    if (title != null) this.title = title;
    if (subject != null) this.subject = subject;
    if (address != null) this.address = address;
    if (description != null) this.description = description;
    if (imagePath != null) this.imagePath = imagePath;
  }
  Location.fromMap(map){
    id = map["id"];
    title = map["title"];
    subject = map["subject"];
    address = map["address"];
    description = map["description"];
    imagePath = map["image"];
  }

  search(String text) {
    if (title.toLowerCase().contains(text)) return true;
    if (subject.toLowerCase().contains(text)) return true;
    if (description.toLowerCase().contains(text)) return true;
    if (address.toLowerCase().contains(text)) return true;
    return false;
  }

  toMap() {
    var map = <String, dynamic>{};
    map["title"] = title;
    map["subject"] = subject;
    map["image"] = imagePath;
    map["description"] = description;
    map["address"] = address;
    return map;
  }
}
// Backup
  // toMap() {
  //   var map = <String, dynamic>{};
  //   if (title.isNotEmpty) map["title"] = title;
  //   if (subject.isNotEmpty) map["subject"] = subject;
  //   if (imagePath.isNotEmpty) map["image"] = imagePath;
  //   if (description.isNotEmpty) map["description"] = description;
  //   if (address.isNotEmpty) map["address"] = address;
  //   return map;
  // }