class Address {
  String placeId;
  String placeName;
  double latitude;
  double longitude;
  String mainText;
  String secondaryText;

  Address.withAdditionalInfo(
      String placeId, String placeName, double latitude, double longitude,
      [String mainText, String secondaryText]) {
    this.placeId = placeId;
    this.placeName = placeName;
    this.latitude = latitude;
    this.longitude = longitude;
    this.mainText = mainText;
    this.secondaryText = secondaryText;
  }

  Address(this.placeId, this.placeName, this.latitude, this.longitude);

  Address.empty();

  Map toJson() => {
        'placeId': placeId,
        'placeName': placeName,
        'latitude': latitude,
        'longitude': longitude,
        'mainText': mainText,
        'secondaryText': secondaryText,
      };

  factory Address.fromJson(Map<String, dynamic> parsedJson) {
    return Address.withAdditionalInfo(
        parsedJson['placeId'],
        parsedJson['placeName'],
        parsedJson['latitude'],
        parsedJson['longitude'],
        parsedJson['mainText'],
        parsedJson['secondaryText']);
  }
}
