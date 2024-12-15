class CustomerModel {
  final int vatNr;
  final String email;
  final String company;
  final String companyAddress;

  CustomerModel({
    required this.vatNr,
    required this.email,
    required this.company,
    required this.companyAddress,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'vat_nr': vatNr,
      'email': email,
      'company': company,
      'company_address': companyAddress,
    };
  }

  factory CustomerModel.fromMap(Map<String, dynamic> map) {
    return CustomerModel(
      vatNr: map['vat_nr'] as int,
      email: map['email'] as String,
      company: map['company'] as String,
      companyAddress: map['company_address'] as String,
    );
  }
}
