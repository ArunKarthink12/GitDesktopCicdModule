class Urls {
  static const baseUrl = "https://lims.yungtrepreneur.com/DAAPI/api/doctorApi/";
  // static const baseUrl = "http://uat.yungtrepreneur.com/DAAPI/api/doctorApi/";
  static const loginUrl = "${baseUrl}login";
  static const dash = '${baseUrl}dashboard';
  static const routeDetails = "${baseUrl}getCustomerAndRouteDetails";
  static const service = "${baseUrl}/getServiceDetails";
  static const pendinggetResult = "${baseUrl}getResults";
  // type - 1
  static const approve_recall_type_1 = "${baseUrl}insertResult";
  // type - 1
  static const approve_recall_type3_4 = "${baseUrl}insertTemplateResult";
  static const approve_recall_type_2 = "${baseUrl}insertResultMB";
  static const approvedTestDetails = "${baseUrl}getRecallVisit";
  static const get_recall_button = "${baseUrl}insertRecallVisit";
  static const pdfPreview = "${baseUrl}getMultiTemplate";
  static const patientGraph = "/GetDeltaResult";
  // static const converBaseUrlImage =
  //     "http://uat.yungtrepreneur.com/Service/api/FrontOffice/ConvertToBase64";
}
