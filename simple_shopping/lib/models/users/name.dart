import 'dart:convert';

class Name {
  String? firstname;
  String? lastname;

  Name({this.firstname, this.lastname});

  @override
  String toString() => 'Name(firstname: $firstname, lastname: $lastname)';

  factory Name.fromAddressGeolocationLat373159Long811496CityKilcooleStreetNewRoadNumber7682Zipcode129263874Id1EmailJohnGmailComUsernameJohndPasswordM38rmFNameFirstnameJohnLastnameDoePhone15702367033V0AddressGeolocationLat373159Long811496CityKilcooleStreetLoversLnNumber7267Zipcode129263874Id2EmailMorrisonGmailComUsernameMor2314Password83r5NameFirstnameDavidLastnameMorrisonPhone15702367033V0AddressGeolocationLat403467Long301310CityCullmanStreetFrancesCtNumber86Zipcode295671452Id3EmailKevinGmailComUsernameKevinryanPasswordKev02937NameFirstnameKevinLastnameRyanPhone15670941345V0AddressGeolocationLat503467Long201310CitySanAntonioStreetHuntersCreekDrNumber6454Zipcode982341734Id4EmailDonGmailComUsernameDoneroPasswordEwedonNameFirstnameDonLastnameRomerPhone17657896734V0AddressGeolocationLat403467Long401310CitySanAntonioStreetAdamsStNumber245Zipcode807961234Id5EmailDerekGmailComUsernameDerekPasswordJklg56NameFirstnameDerekLastnamePowellPhone19560011945V0AddressGeolocationLat201677Long106789CityElPasoStreetProspectStNumber124Zipcode123460456Id6EmailDavidRGmailComUsernameDavidRPassword347854NameFirstnameDavidLastnameRussellPhone16783459856V0AddressGeolocationLat103456Long206419CityFresnoStreetSaddleStNumber1342Zipcode963780245Id7EmailMiriamGmailComUsernameSnyderPasswordF238NameFirstnameMiriamLastnameSnyderPhone11239430563V0AddressGeolocationLat503456Long106419CityMesaStreetVallyViewLnNumber1342Zipcode963780245Id8EmailWilliamGmailComUsernameHopkinsPasswordWilliam56HjNameFirstnameWilliamLastnameHopkinsPhone14780010890V0AddressGeolocationLat4012456Long205419CityMiamiStreetAvondaleAveNumber345Zipcode963780245Id9EmailKateGmailComUsernameKateHPasswordKfejkNameFirstnameKateLastnameHalePhone16784561934V0AddressGeolocationLat3024788Long20545419CityFortWayneStreetOakLawnAveNumber526Zipcode102564532Id10EmailJimmieGmailComUsernameJimmieKPasswordKleinNameFirstnameJimmieLastnameKleinPhone11040014567V0(
      Map<String, dynamic> data) {
    return Name(
      firstname: data['firstname'] as String?,
      lastname: data['lastname'] as String?,
    );
  }

  Map<String, dynamic>
      toAddressGeolocationLat373159Long811496CityKilcooleStreetNewRoadNumber7682Zipcode129263874Id1EmailJohnGmailComUsernameJohndPasswordM38rmFNameFirstnameJohnLastnameDoePhone15702367033V0AddressGeolocationLat373159Long811496CityKilcooleStreetLoversLnNumber7267Zipcode129263874Id2EmailMorrisonGmailComUsernameMor2314Password83r5NameFirstnameDavidLastnameMorrisonPhone15702367033V0AddressGeolocationLat403467Long301310CityCullmanStreetFrancesCtNumber86Zipcode295671452Id3EmailKevinGmailComUsernameKevinryanPasswordKev02937NameFirstnameKevinLastnameRyanPhone15670941345V0AddressGeolocationLat503467Long201310CitySanAntonioStreetHuntersCreekDrNumber6454Zipcode982341734Id4EmailDonGmailComUsernameDoneroPasswordEwedonNameFirstnameDonLastnameRomerPhone17657896734V0AddressGeolocationLat403467Long401310CitySanAntonioStreetAdamsStNumber245Zipcode807961234Id5EmailDerekGmailComUsernameDerekPasswordJklg56NameFirstnameDerekLastnamePowellPhone19560011945V0AddressGeolocationLat201677Long106789CityElPasoStreetProspectStNumber124Zipcode123460456Id6EmailDavidRGmailComUsernameDavidRPassword347854NameFirstnameDavidLastnameRussellPhone16783459856V0AddressGeolocationLat103456Long206419CityFresnoStreetSaddleStNumber1342Zipcode963780245Id7EmailMiriamGmailComUsernameSnyderPasswordF238NameFirstnameMiriamLastnameSnyderPhone11239430563V0AddressGeolocationLat503456Long106419CityMesaStreetVallyViewLnNumber1342Zipcode963780245Id8EmailWilliamGmailComUsernameHopkinsPasswordWilliam56HjNameFirstnameWilliamLastnameHopkinsPhone14780010890V0AddressGeolocationLat4012456Long205419CityMiamiStreetAvondaleAveNumber345Zipcode963780245Id9EmailKateGmailComUsernameKateHPasswordKfejkNameFirstnameKateLastnameHalePhone16784561934V0AddressGeolocationLat3024788Long20545419CityFortWayneStreetOakLawnAveNumber526Zipcode102564532Id10EmailJimmieGmailComUsernameJimmieKPasswordKleinNameFirstnameJimmieLastnameKleinPhone11040014567V0() {
    return {
      'firstname': firstname,
      'lastname': lastname,
    };
  }

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Name].
  factory Name.fromJson(String data) {
    return Name
        .fromAddressGeolocationLat373159Long811496CityKilcooleStreetNewRoadNumber7682Zipcode129263874Id1EmailJohnGmailComUsernameJohndPasswordM38rmFNameFirstnameJohnLastnameDoePhone15702367033V0AddressGeolocationLat373159Long811496CityKilcooleStreetLoversLnNumber7267Zipcode129263874Id2EmailMorrisonGmailComUsernameMor2314Password83r5NameFirstnameDavidLastnameMorrisonPhone15702367033V0AddressGeolocationLat403467Long301310CityCullmanStreetFrancesCtNumber86Zipcode295671452Id3EmailKevinGmailComUsernameKevinryanPasswordKev02937NameFirstnameKevinLastnameRyanPhone15670941345V0AddressGeolocationLat503467Long201310CitySanAntonioStreetHuntersCreekDrNumber6454Zipcode982341734Id4EmailDonGmailComUsernameDoneroPasswordEwedonNameFirstnameDonLastnameRomerPhone17657896734V0AddressGeolocationLat403467Long401310CitySanAntonioStreetAdamsStNumber245Zipcode807961234Id5EmailDerekGmailComUsernameDerekPasswordJklg56NameFirstnameDerekLastnamePowellPhone19560011945V0AddressGeolocationLat201677Long106789CityElPasoStreetProspectStNumber124Zipcode123460456Id6EmailDavidRGmailComUsernameDavidRPassword347854NameFirstnameDavidLastnameRussellPhone16783459856V0AddressGeolocationLat103456Long206419CityFresnoStreetSaddleStNumber1342Zipcode963780245Id7EmailMiriamGmailComUsernameSnyderPasswordF238NameFirstnameMiriamLastnameSnyderPhone11239430563V0AddressGeolocationLat503456Long106419CityMesaStreetVallyViewLnNumber1342Zipcode963780245Id8EmailWilliamGmailComUsernameHopkinsPasswordWilliam56HjNameFirstnameWilliamLastnameHopkinsPhone14780010890V0AddressGeolocationLat4012456Long205419CityMiamiStreetAvondaleAveNumber345Zipcode963780245Id9EmailKateGmailComUsernameKateHPasswordKfejkNameFirstnameKateLastnameHalePhone16784561934V0AddressGeolocationLat3024788Long20545419CityFortWayneStreetOakLawnAveNumber526Zipcode102564532Id10EmailJimmieGmailComUsernameJimmieKPasswordKleinNameFirstnameJimmieLastnameKleinPhone11040014567V0(
            json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Name] to a JSON string.
  String toJson() => json.encode(
      toAddressGeolocationLat373159Long811496CityKilcooleStreetNewRoadNumber7682Zipcode129263874Id1EmailJohnGmailComUsernameJohndPasswordM38rmFNameFirstnameJohnLastnameDoePhone15702367033V0AddressGeolocationLat373159Long811496CityKilcooleStreetLoversLnNumber7267Zipcode129263874Id2EmailMorrisonGmailComUsernameMor2314Password83r5NameFirstnameDavidLastnameMorrisonPhone15702367033V0AddressGeolocationLat403467Long301310CityCullmanStreetFrancesCtNumber86Zipcode295671452Id3EmailKevinGmailComUsernameKevinryanPasswordKev02937NameFirstnameKevinLastnameRyanPhone15670941345V0AddressGeolocationLat503467Long201310CitySanAntonioStreetHuntersCreekDrNumber6454Zipcode982341734Id4EmailDonGmailComUsernameDoneroPasswordEwedonNameFirstnameDonLastnameRomerPhone17657896734V0AddressGeolocationLat403467Long401310CitySanAntonioStreetAdamsStNumber245Zipcode807961234Id5EmailDerekGmailComUsernameDerekPasswordJklg56NameFirstnameDerekLastnamePowellPhone19560011945V0AddressGeolocationLat201677Long106789CityElPasoStreetProspectStNumber124Zipcode123460456Id6EmailDavidRGmailComUsernameDavidRPassword347854NameFirstnameDavidLastnameRussellPhone16783459856V0AddressGeolocationLat103456Long206419CityFresnoStreetSaddleStNumber1342Zipcode963780245Id7EmailMiriamGmailComUsernameSnyderPasswordF238NameFirstnameMiriamLastnameSnyderPhone11239430563V0AddressGeolocationLat503456Long106419CityMesaStreetVallyViewLnNumber1342Zipcode963780245Id8EmailWilliamGmailComUsernameHopkinsPasswordWilliam56HjNameFirstnameWilliamLastnameHopkinsPhone14780010890V0AddressGeolocationLat4012456Long205419CityMiamiStreetAvondaleAveNumber345Zipcode963780245Id9EmailKateGmailComUsernameKateHPasswordKfejkNameFirstnameKateLastnameHalePhone16784561934V0AddressGeolocationLat3024788Long20545419CityFortWayneStreetOakLawnAveNumber526Zipcode102564532Id10EmailJimmieGmailComUsernameJimmieKPasswordKleinNameFirstnameJimmieLastnameKleinPhone11040014567V0());

  Name copyWith({
    String? firstname,
    String? lastname,
  }) {
    return Name(
      firstname: firstname ?? this.firstname,
      lastname: lastname ?? this.lastname,
    );
  }
}
