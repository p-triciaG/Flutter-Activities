class Location{
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

  search(String text) {
    if (title.toLowerCase().contains(text)) return true;
    if (subject.toLowerCase().contains(text)) return true;
    if (description.toLowerCase().contains(text)) return true;
    if (address.toLowerCase().contains(text)) return true;
    return false;
  }
}