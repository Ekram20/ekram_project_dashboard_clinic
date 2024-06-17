class Subscribemodel{
  final String clinicName;
  final String CertificateNumber;
  final dynamic licenseImage;
  final String phoneNumber;

  Subscribemodel({
    required this.CertificateNumber,
    required this.clinicName,
    required this.licenseImage,
    required this.phoneNumber,
  });

  Map<String, dynamic> toMap(){
    return  {
      'CertificateNumber':CertificateNumber,
      'clinicName':clinicName,
      'licenseImage':licenseImage,
      'phoneNumber':phoneNumber,
    };}

    factory Subscribemodel.fromMap(Map<String, dynamic> json){
    return Subscribemodel(
      CertificateNumber: json['CertificateNumber'],
      clinicName: json['clinicName'],
      licenseImage: json['licenseImage'],
      phoneNumber: json['phoneNumber']
    );
  }

}
