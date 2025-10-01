class APIEndPoint {
  static String LOGIN = 'api/member/signinMember';
  static String GetProfile({required String member_id}) => 'api/member/viewProfileMember';
  static String UploadFile = 'api/common/uploadFile';
  static String District({required String province_id}) => 'api/common/getDistrictByProvince?province_id=$province_id';
  static String Ward({required String district_id}) => 'api/common/getWardByDistrict?district_id=$district_id';
  static String Province = 'api/common/getListProvince';
  static String Bank = 'api/common/getListBank';
  static String SignUp = 'api/member/createMember?';

  static String UPDATE_AVATAR = 'api/member/updateMemberAvatar';
  static String Sent_Otp = 'api/member/sendOTP';
  static String Check_Otp = 'api/member/validOTP';
  static String Forget_Password = 'api/member/forgetPass';
  static String Change_Password = 'api/member/changePass';
  static String Update_Profile = 'api/member/updateMember';
  static String List_News({required int page, required int per_page}) => 'api/news/getListNews?page=$page&per_page=$per_page';
  static String NewsDetails({String? news_id}) => 'api/news/getNewsDetail?news_id=$news_id';
  static String ListKeyWordSreach({required int page, required int per_page, String? keyword}) => 'api/common/getListKeyWord?page=$page&per_page=$per_page&keyword=$keyword';
  static String checkDuplicateEmailAndPhone = 'api/common/checkDuplicateEmailAndPhone';
  static String checkDuplicateID = 'api/common/checkDuplicateID';
  static String checkDuplicateTax = 'api/common/checkDuplicateTax';
  static String checkDuplicateEmail = 'api/common/checkDuplicateEmail';
  static String checkDuplicateUserName = 'api/common/checkDuplicateUserName';
  static String checkDuplicatePhone = 'api/common/checkDuplicatePhone';
  static String deleteMember = 'api/member/deleteMember';
  static String refreshTokenMember = 'api/member/refreshTokenMember';
  static String viewNotification = 'api/notification/readNotification';
  static String getNotificationDetail({required int notification_id}) => 'api/notification/getNotificationDetail?id=$notification_id';
  static String getListNotificationForMemberAll({required int page, required int per_page}) => 'api/notification/getListNotificationForMember?order_by=latest&page=$page&per_page=$per_page';
  // static String getListNotificationForMemberFilter({required int page, required int per_page, int? view_status}) =>
  //     'api/notification/getListNotificationForMember?order_by=latest&page=$page&per_page=$per_page&view_status=$view_status';
  static String signOutMember = 'api/member/signoutMember';
  static String MAPS_AUTO_PLACE({String? search}) => "https://rsapi.goong.io/geocode?api_key=pxQbcAMWO8thiZGJZE5PZBZnov1FLLJ762QCPoDq&address=$search";

  /// AIzaSyCQFNBuZLya9GLxOf30rBbjr6kTWSKR2QU
  static String MAPS_GET_LAT_LONG({String? input}) =>
      "https://maps.googleapis.com/maps/api/place/textsearch/json?query=$input&inputtype=textquery&fields=formatted_address%2Cname%2Crating%2Copening_hours%2Cgeometry&key=AIzaSyBZTgds7Yv0XhQM7ss1aHav16Rinho8Lzs";
  static String getListRankPackage = 'api/real_estate/getListRankPackage';
  static String getListRank = 'api/real_estate/getListRank';
  static String getRankDetail({String? rank_id}) => 'api/real_estate/getRankDetail?rank_id=$rank_id';
  static String verifyMember = 'api/member/verifyMember?';
  static String getListRealEstateForMember({required int page, required int per_page, required int publish_status}) =>
      'api/real_estate/getListRealEstateForMember?publish_status=$publish_status&page=$page&per_page=$per_page';
  static String updateViewStatusRealEstate = 'api/real_estate/updateViewStatusRealEstate';
  static String deleteRealEstate = 'api/real_estate/deleteRealEstate';
  static String getListCategoryCreatePost({required int page, required int per_page, required int type}) => 'api/real_estate/getListCategory?type=$type&name=&page=$page&per_page=$per_page';
  static String upload360image = 'api/common/upload360image';
  static String getListUnit = 'api/real_estate/getListUnit';
  static String getCategoryDetailCreatePost({required int category_id}) => 'api/real_estate/getCategoryDetail?category_id=$category_id';
  static String getListRealEstate({required int page, required int per_page, required int type}) => 'api/real_estate/getListRealEstate?page=$page&per_page=$per_page&type=$type&category_id';
  static String createRealEstate = 'api/real_estate/createRealEstate';
  static String getRealEstateDetailForMember({required String id}) => 'api/real_estate/getRealEstateDetailForMember?id=$id';
  static String updatePostRealEstate = 'api/real_estate/updateRealEstate';
  static String getListRealEstateByCategory({required int page, required int per_page, required int type, required String category_id}) =>
      'api/real_estate/getListRealEstate?page=$page&per_page=$per_page&type=$type&category_id=$category_id';
  static String getListNewsForMember({required int page, required int per_page, required String title, required String order, required String category}) =>
      'api/news/getListNewsForMember?title=$title&order=$order&category=$category&page=$page&per_page=$per_page';
  static String getListNewsCategory = 'api/news/getListNewsCategory';
  static String getNewsCategoryDetail({required int id}) => 'api/news/getNewsCategoryDetail?id=$id';
  static String getNewsDetail({required String id}) => 'api/news/getNewsDetail?id=$id';
  static String getListAgency({required int page, required int per_page}) => 'api/agency/getListAgency?name=&page=$page&per_page=$per_page';
  static String getAgencyDetail({required String agency_id}) => 'api/agency/getAgencyDetail?agency_id=$agency_id';
  static String getListProjectForMember({required int page, required int per_page, required String order, required String name}) =>
      'api/project/getListProjectForMember?order=$order&page=$page&per_page=$per_page&name=$name';
  static String getProjectDetailForMember({required String id}) => 'api/project/getProjectDetailForMember?id=$id';
  static String supportMember = 'api/support/supportMember';
  static String getParamsSearch = 'api/real_estate/getParamsSearch';
  static String searchRealEstate = 'api/real_estate/searchRealEstate';
  static String getSearchHistory = 'api/real_estate/getSearchHistory';
  static String addFavoriteRealEstate = 'api/real_estate/addFavoriteRealEstate';
  static String removeFavoriteRealEstate = 'api/real_estate/removeFavoriteRealEstate';
  static String getListRealEstateFavorite({required int page, required int per_page}) => 'api/real_estate/getListRealEstateFavorite?page=$page&per_page=$per_page&order_by=';
  static String getListRealEstateOutstanding({required int page, required int per_page, required int type}) => 'api/real_estate/getListRealEstateOutstanding?page=$page&per_page=$per_page';
  static String getInformation = 'api/system/getInformation';
  static String getListRealEstateOfProject({required int page, required int per_page, required int type, required String project_id}) =>
      'api/real_estate/getListRealEstate?page=$page&per_page=$per_page&type=$type&category_id&project_id=$project_id';
  static String getListRealEstateSuggest({required int page, required int per_page, String? latitude, String? longtitude}) =>
      'api/real_estate/getListRealEstateSuggest?page=$page&per_page=$per_page&latitude=$latitude&longtitude=$longtitude&range=2000';
  static String extendRealEstate = 'api/real_estate/extendRealEstate';
  static String getListNotificationForMemberFilter({required int page, required int per_page, String? view_status, String? type}) =>
      'api/notification/getListNotificationForMember?order_by=latest&page=$page&per_page=$per_page&view_status=$view_status&type=$type';
  static String payment = 'api/real_estate/payment';
  static String getListPayment({required int page, required int per_page, String? real_estate_id}) => 'api/real_estate/getListPayment?real_estate_id=$real_estate_id&page=$page&per_page=$per_page';
  static String getTransactionContent = 'api/finance/getTransactionContent';
  static String getListTransactionForMember({required int page, required int per_page, String? accept_status, String? type, String? start_date, String? end_date, String? order_by}) =>
      'api/finance/getListTransactionForMember?page=$page&per_page=$per_page&accept_status=$accept_status&start_date=$start_date&end_date=$end_date&order_by=$order_by&type=$type';
  static String createTransaction = 'api/finance/createTransaction';
  static String addReferralCode = 'api/member/addReferralCode';
  static String getPositionGoong({required String latlng}) => 'api/common/getPositionGoong?latlng=$latlng';
  static String getEventForMember = 'api/system/getEventForMember';
  static String createEventsForMember({required String event_id}) => 'api/system/createEventsForMember?event_id=$event_id';
  static String getResultEvent({required String event_id, required String spiner_id}) => 'api/system/getResultEvent?event_id=$event_id&spiner_id=$spiner_id';
  static String checkEventResultForMember({required String reward_id}) => 'api/system/checkEventResultForMember?reward_id=$reward_id';
  static String getEventHistoryForMember({required int page, required int per_page}) => 'api/system/getEventHistoryForMember?order=latest&page=$page&per_page=$per_page';
  static String confirmReward = 'api/system/confirmReward';
  static String validOTPReward = 'api/system/validOTPReward';
  static String checkAuthAccountReward = 'api/system/checkAuthAccountReward';
}
