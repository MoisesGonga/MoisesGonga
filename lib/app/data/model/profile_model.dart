class Profile {
  final String firstName;
  final String lastName;
  final String email;
  final String telephoneNumber;

  String get fullName => "$firstName $lastName";

  Profile(this.firstName, this.lastName, this.email, this.telephoneNumber);
}