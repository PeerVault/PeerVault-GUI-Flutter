class Owner {
  // ignore: non_constant_identifier_names
  final String QmPeerId;
  // ignore: non_constant_identifier_names
  final String Nickname;
  // ignore: non_constant_identifier_names
  final String DeviceName;
  // ignore: non_constant_identifier_names
  final String UnlockCode;
  // ignore: non_constant_identifier_names
  final int AskPassword;

  Owner({
    // ignore: non_constant_identifier_names
    this.QmPeerId,
    // ignore: non_constant_identifier_names
    this.Nickname,
    // ignore: non_constant_identifier_names
    this.DeviceName,
    // ignore: non_constant_identifier_names
    this.UnlockCode,
    // ignore: non_constant_identifier_names
    this.AskPassword
  });

  factory Owner.fromJson(Map<String, dynamic> json) {
    return Owner(
      QmPeerId: json['QmPeerId'],
      Nickname: json['Nickname'],
      DeviceName: json['DeviceName'],
      UnlockCode: json['UnlockCode'],
      AskPassword: json['AskPassword'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'Nickname': Nickname,
      'DeviceName': DeviceName,
      'UnlockCode': UnlockCode,
      'AskPassword': AskPassword,
    };
  }
}
