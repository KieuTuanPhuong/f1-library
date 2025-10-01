import '../../../helper/rk_validate.dart';

class ContactRequest {
  String? email;
  String? name;
  String? phone;
  String? content;
  String? realEstateId;

  ContactRequest({
    this.email,
    this.name,
    this.phone,
    this.content,
    this.realEstateId,
  }) : super();

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (!RkValidate.nullOrEmpty(name)) data['name'] = name;
    if (!RkValidate.nullOrEmpty(email)) data['email'] = email;
    if (!RkValidate.nullOrEmpty(phone)) data['phone'] = phone;
    if (!RkValidate.nullOrEmpty(content)) data['content'] = content;
    if (!RkValidate.nullOrEmpty(realEstateId)) data['real_estate_id'] = realEstateId;

    return data;
  }
}
