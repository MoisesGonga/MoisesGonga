
class Place{

  final String placeId;
  final String description;
  final String mainText;
  final String secondaryText;

  Place(this.placeId, this.description, this.mainText, this.secondaryText);


  Map toJson() => {
    'placeId': placeId,
    'description': description,
    'mainText': mainText,
    'secondaryText': secondaryText,
  };

  factory Place.fromJson(Map<String, dynamic> parsedJson) {
    return Place(
        parsedJson['placeId'],
        parsedJson['description'],
        parsedJson['mainText'],
        parsedJson['secondaryText']
    );
  }
}