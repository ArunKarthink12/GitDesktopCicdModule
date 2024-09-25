// To parse this JSON data, do
//
//     final testDetailsmodel = testDetailsmodelFromJson(jsonString);

import 'dart:convert';

TestDetailsmodel testDetailsmodelFromJson(String str) =>
    TestDetailsmodel.fromJson(json.decode(str));

String testDetailsmodelToJson(TestDetailsmodel data) =>
    json.encode(data.toJson());

class TestDetailsmodel {
  int venueno;
  int venuebranchno;
  int userno;
  dynamic pagecode;
  dynamic action;
  List<Lstvisit> lstvisit;
  dynamic odxml;

  TestDetailsmodel({
    required this.venueno,
    required this.venuebranchno,
    required this.userno,
    required this.pagecode,
    required this.action,
    required this.lstvisit,
    required this.odxml,
  });

  factory TestDetailsmodel.fromJson(Map<String, dynamic> json) =>
      TestDetailsmodel(
        venueno: json["venueno"],
        venuebranchno: json["venuebranchno"],
        userno: json["userno"],
        pagecode: json["pagecode"] ?? "PCRA",
        action: json["action"] ?? "SV",
        lstvisit: List<Lstvisit>.from(
            json["lstvisit"].map((x) => Lstvisit.fromJson(x))),
        odxml: json["odxml"],
      );

  Map<String, dynamic> toJson() => {
        "venueno": venueno,
        "venuebranchno": venuebranchno,
        "userno": userno,
        "pagecode": pagecode,
        "action": action,
        "lstvisit": List<dynamic>.from(lstvisit.map((x) => x.toJson())),
        "odxml": odxml,
      };
}

class Lstvisit {
  int patientno;
  int patientvisitno;
  String patientid;
  String fullname;
  String agetype;
  String gender;
  String visitid;
  String extenalvisitid;
  String visitdttm;
  String referraltype;
  String customername;
  String physicianname;
  bool visstat;
  bool visremarks;
  String address;
  String dob;
  String urntype;
  String urnid;
  String samplecollectedon;
  String enteredon;
  String validatedon;
  String approvedon;
  List<Lstorderlist> lstorderlist;
  int notifyCount;
  String venueBranchName;
  int requestNo;
  dynamic diagnosis;
  dynamic icNo;
  dynamic subclinic;
  dynamic collectionDttm;
  dynamic regDttm;
  dynamic clinicname;

  Lstvisit({
    required this.patientno,
    required this.patientvisitno,
    required this.patientid,
    required this.fullname,
    required this.agetype,
    required this.gender,
    required this.visitid,
    required this.extenalvisitid,
    required this.visitdttm,
    required this.referraltype,
    required this.customername,
    required this.physicianname,
    required this.visstat,
    required this.visremarks,
    required this.address,
    required this.dob,
    required this.urntype,
    required this.urnid,
    required this.samplecollectedon,
    required this.enteredon,
    required this.validatedon,
    required this.approvedon,
    required this.lstorderlist,
    required this.notifyCount,
    required this.venueBranchName,
    required this.requestNo,
    required this.diagnosis,
    required this.icNo,
    required this.subclinic,
    required this.collectionDttm,
    required this.regDttm,
    required this.clinicname,
  });

  factory Lstvisit.fromJson(Map<String, dynamic> json) => Lstvisit(
        patientno: json["patientno"],
        patientvisitno: json["patientvisitno"],
        patientid: json["patientid"],
        fullname: json["fullname"],
        agetype: json["agetype"],
        gender: json["gender"],
        visitid: json["visitid"],
        extenalvisitid: json["extenalvisitid"],
        visitdttm: json["visitdttm"],
        referraltype: json["referraltype"],
        customername: json["customername"],
        physicianname: json["physicianname"],
        visstat: json["visstat"],
        visremarks: json["visremarks"],
        address: json["address"],
        dob: json["dob"],
        urntype: json["urntype"],
        urnid: json["urnid"],
        samplecollectedon: json["samplecollectedon"],
        enteredon: json["enteredon"],
        validatedon: json["validatedon"],
        approvedon: json["approvedon"],
        lstorderlist: List<Lstorderlist>.from(
            json["lstorderlist"].map((x) => Lstorderlist.fromJson(x))),
        notifyCount: json["notifyCount"],
        venueBranchName: json["venueBranchName"],
        requestNo: json["requestNo"],
        diagnosis: json["diagnosis"],
        icNo: json["icNo"],
        subclinic: json["subclinic"],
        collectionDttm: json["collectionDTTM"],
        regDttm: json["regDTTM"],
        clinicname: json["clinicname"],
      );

  Map<String, dynamic> toJson() => {
        "patientno": patientno,
        "patientvisitno": patientvisitno,
        "patientid": patientid,
        "fullname": fullname,
        "agetype": agetype,
        "gender": gender,
        "visitid": visitid,
        "extenalvisitid": extenalvisitid,
        "visitdttm": visitdttm,
        "referraltype": referraltype,
        "customername": customername,
        "physicianname": physicianname,
        "visstat": visstat,
        "visremarks": visremarks,
        "address": address,
        "dob": dob,
        "urntype": urntype,
        "urnid": urnid,
        "samplecollectedon": samplecollectedon,
        "enteredon": enteredon,
        "validatedon": validatedon,
        "approvedon": approvedon,
        "lstorderlist": List<dynamic>.from(lstorderlist.map((x) => x.toJson())),
        "notifyCount": notifyCount,
        "venueBranchName": venueBranchName,
        "requestNo": requestNo,
        "diagnosis": diagnosis,
        "icNo": icNo,
        "subclinic": subclinic,
        "collectionDTTM": collectionDttm,
        "regDTTM": regDttm,
        "clinicname": clinicname,
      };
}

class Lstorderlist {
  int patientvisitno;
  int orderlistno;
  int departmentno;
  String departmentname;
  int departmentseqno;
  String samplename;
  String barcodeno;
  String servicetype;
  int serviceno;
  String servicename;
  int serviceseqno;
  int resulttypeno;
  bool risrerun;
  bool risrecollect;
  bool risrecheck;
  bool isrecall;
  bool isoutsource;
  bool isoutsourceattachment;
  bool isattachment;
  bool isremarks;
  bool istat;
  bool iscontestinter;
  int groupinter;
  String internotes;
  bool ischecked;
  bool isrerun;
  bool isrecollect;
  bool isrecheck;
  bool isgrouptd;
  List<Lstorderdetail> lstorderdetail;
  int isMultiEditor;
  bool isabnormal;
  bool iscritical;
  dynamic icmrPatientId;
  dynamic srfNumber;
  int reportstatus;
  bool isnoresult;

  Lstorderlist({
    required this.patientvisitno,
    required this.orderlistno,
    required this.departmentno,
    required this.departmentname,
    required this.departmentseqno,
    required this.samplename,
    required this.barcodeno,
    required this.servicetype,
    required this.serviceno,
    required this.servicename,
    required this.serviceseqno,
    required this.resulttypeno,
    required this.risrerun,
    required this.risrecollect,
    required this.risrecheck,
    required this.isrecall,
    required this.isoutsource,
    required this.isoutsourceattachment,
    required this.isattachment,
    required this.isremarks,
    required this.istat,
    required this.iscontestinter,
    required this.groupinter,
    required this.internotes,
    required this.ischecked,
    required this.isrerun,
    required this.isrecollect,
    required this.isrecheck,
    required this.isgrouptd,
    required this.lstorderdetail,
    required this.isMultiEditor,
    required this.isabnormal,
    required this.iscritical,
    required this.icmrPatientId,
    required this.srfNumber,
    required this.reportstatus,
    required this.isnoresult,
  });

  factory Lstorderlist.fromJson(Map<String, dynamic> json) => Lstorderlist(
        patientvisitno: json["patientvisitno"],
        orderlistno: json["orderlistno"],
        departmentno: json["departmentno"],
        departmentname: json["departmentname"],
        departmentseqno: json["departmentseqno"],
        samplename: json["samplename"],
        barcodeno: json["barcodeno"],
        servicetype: json["servicetype"],
        serviceno: json["serviceno"],
        servicename: json["servicename"],
        serviceseqno: json["serviceseqno"],
        resulttypeno: json["resulttypeno"],
        risrerun: json["risrerun"],
        risrecollect: json["risrecollect"],
        risrecheck: json["risrecheck"],
        isrecall: json["isrecall"],
        isoutsource: json["isoutsource"],
        isoutsourceattachment: json["isoutsourceattachment"],
        isattachment: json["isattachment"],
        isremarks: json["isremarks"],
        istat: json["istat"],
        iscontestinter: json["iscontestinter"],
        groupinter: json["groupinter"],
        internotes: json["internotes"],
        ischecked: json["ischecked"],
        isrerun: json["isrerun"],
        isrecollect: json["isrecollect"],
        isrecheck: json["isrecheck"],
        isgrouptd: json["isgrouptd"],
        lstorderdetail: List<Lstorderdetail>.from(
            json["lstorderdetail"].map((x) => Lstorderdetail.fromJson(x))),
        isMultiEditor: json["isMultiEditor"],
        isabnormal: json["isabnormal"],
        iscritical: json["iscritical"],
        icmrPatientId: json["icmrPatientId"],
        srfNumber: json["srfNumber"],
        reportstatus: json["reportstatus"],
        isnoresult: json["isnoresult"],
      );

  Map<String, dynamic> toJson() => {
        "patientvisitno": patientvisitno,
        "orderlistno": orderlistno,
        "departmentno": departmentno,
        "departmentname": departmentname,
        "departmentseqno": departmentseqno,
        "samplename": samplename,
        "barcodeno": barcodeno,
        "servicetype": servicetype,
        "serviceno": serviceno,
        "servicename": servicename,
        "serviceseqno": serviceseqno,
        "resulttypeno": resulttypeno,
        "risrerun": risrerun,
        "risrecollect": risrecollect,
        "risrecheck": risrecheck,
        "isrecall": isrecall,
        "isoutsource": isoutsource,
        "isoutsourceattachment": isoutsourceattachment,
        "isattachment": isattachment,
        "isremarks": isremarks,
        "istat": istat,
        "iscontestinter": iscontestinter,
        "groupinter": groupinter,
        "internotes": internotes,
        "ischecked": ischecked,
        "isrerun": isrerun,
        "isrecollect": isrecollect,
        "isrecheck": isrecheck,
        "isgrouptd": isgrouptd,
        "lstorderdetail":
            List<dynamic>.from(lstorderdetail.map((x) => x.toJson())),
        "isMultiEditor": isMultiEditor,
        "isabnormal": isabnormal,
        "iscritical": iscritical,
        "icmrPatientId": icmrPatientId,
        "srfNumber": srfNumber,
        "reportstatus": reportstatus,
        "isnoresult": isnoresult,
      };
}

class Lstorderdetail {
  int id;
  int orderlistno;
  int orderdetailsno;
  String testtype;
  int testno;
  String testname;
  int tseqno;
  int subtestno;
  String subtestname;
  int sseqno;
  String resulttype;
  int mastermethodno;
  int masterunitno;
  String masterllcolumn;
  String masterhlcolumn;
  String masterdisplayrr;
  String crllcolumn;
  String crhlcolumn;
  dynamic displaycrrr;
  String minrange;
  String maxrange;
  dynamic displaymmrr;
  bool isnonmandatory;
  bool isdelta;
  bool istformula;
  bool issformula;
  int decimalpoint;
  bool isroundoff;
  bool isformulaparameter;
  int formulaserviceno;
  String formulaservicetype;
  List<Formulajson>? formulajson;
  List<Formulaparameterjson>? formulaparameterjson;
  List<Picklistjson>? picklistjson;
  int headerno;
  bool isedit;
  int testinter;
  int methodno;
  String methodname;
  int unitno;
  String unitname;
  String llcolumn;
  String hlcolumn;
  String displayrr;
  String result;
  String formularesult;
  String diresult;
  String resultflag;
  String resultcomments;
  String internotes;
  bool risrerunod;
  bool isrerunod;
  bool isUploadOption;
  String uploadedfile;
  int isMultiEditor;
  int approvalDoctor;
  String statusName;
  dynamic interNotesHigh;
  dynamic interNotesLow;
  bool noresult;
  dynamic oldresult;

  Lstorderdetail({
    required this.id,
    required this.orderlistno,
    required this.orderdetailsno,
    required this.testtype,
    required this.testno,
    required this.testname,
    required this.tseqno,
    required this.subtestno,
    required this.subtestname,
    required this.sseqno,
    required this.resulttype,
    required this.mastermethodno,
    required this.masterunitno,
    required this.masterllcolumn,
    required this.masterhlcolumn,
    required this.masterdisplayrr,
    required this.crllcolumn,
    required this.crhlcolumn,
    required this.displaycrrr,
    required this.minrange,
    required this.maxrange,
    required this.displaymmrr,
    required this.isnonmandatory,
    required this.isdelta,
    required this.istformula,
    required this.issformula,
    required this.decimalpoint,
    required this.isroundoff,
    required this.isformulaparameter,
    required this.formulaserviceno,
    required this.formulaservicetype,
    required this.formulajson,
    required this.formulaparameterjson,
    required this.picklistjson,
    required this.headerno,
    required this.isedit,
    required this.testinter,
    required this.methodno,
    required this.methodname,
    required this.unitno,
    required this.unitname,
    required this.llcolumn,
    required this.hlcolumn,
    required this.displayrr,
    required this.result,
    required this.formularesult,
    required this.diresult,
    required this.resultflag,
    required this.resultcomments,
    required this.internotes,
    required this.risrerunod,
    required this.isrerunod,
    required this.isUploadOption,
    required this.uploadedfile,
    required this.isMultiEditor,
    required this.approvalDoctor,
    required this.statusName,
    required this.interNotesHigh,
    required this.interNotesLow,
    required this.noresult,
    required this.oldresult,
  });

  factory Lstorderdetail.fromJson(Map<String, dynamic> json) => Lstorderdetail(
        id: json["id"],
        orderlistno: json["orderlistno"],
        orderdetailsno: json["orderdetailsno"],
        testtype: json["testtype"]!,
        testno: json["testno"],
        testname: json["testname"],
        tseqno: json["tseqno"],
        subtestno: json["subtestno"],
        subtestname: json["subtestname"],
        sseqno: json["sseqno"],
        resulttype: json["resulttype"]!,
        mastermethodno: json["mastermethodno"],
        masterunitno: json["masterunitno"],
        masterllcolumn: json["masterllcolumn"],
        masterhlcolumn: json["masterhlcolumn"],
        masterdisplayrr: json["masterdisplayrr"],
        crllcolumn: json["crllcolumn"],
        crhlcolumn: json["crhlcolumn"],
        displaycrrr: json["displaycrrr"],
        minrange: json["minrange"],
        maxrange: json["maxrange"],
        displaymmrr: json["displaymmrr"],
        isnonmandatory: json["isnonmandatory"],
        isdelta: json["isdelta"],
        istformula: json["istformula"],
        issformula: json["issformula"],
        decimalpoint: json["decimalpoint"],
        isroundoff: json["isroundoff"],
        isformulaparameter: json["isformulaparameter"],
        formulaserviceno: json["formulaserviceno"],
        formulaservicetype: json["formulaservicetype"]!,
        formulajson: json["formulajson"] == null
            ? []
            : List<Formulajson>.from(
                json["formulajson"]!.map((x) => Formulajson.fromJson(x))),
        formulaparameterjson: json["formulaparameterjson"] == null
            ? []
            : List<Formulaparameterjson>.from(json["formulaparameterjson"]!
                .map((x) => Formulaparameterjson.fromJson(x))),
        picklistjson: json["picklistjson"] == null
            ? []
            : List<Picklistjson>.from(
                json["picklistjson"]!.map((x) => Picklistjson.fromJson(x))),
        headerno: json["headerno"],
        isedit: json["isedit"],
        testinter: json["testinter"],
        methodno: json["methodno"],
        methodname: json["methodname"],
        unitno: json["unitno"],
        unitname: json["unitname"],
        llcolumn: json["llcolumn"],
        hlcolumn: json["hlcolumn"],
        displayrr: json["displayrr"],
        result: json["result"],
        formularesult: json["formularesult"],
        diresult: json["diresult"],
        resultflag: json["resultflag"]!,
        resultcomments: json["resultcomments"]!,
        internotes: json["internotes"],
        risrerunod: json["risrerunod"],
        isrerunod: json["isrerunod"],
        isUploadOption: json["isUploadOption"],
        uploadedfile: json["uploadedfile"],
        isMultiEditor: json["isMultiEditor"],
        approvalDoctor: json["approvalDoctor"],
        statusName: json["statusName"]!,
        interNotesHigh: json["interNotesHigh"],
        interNotesLow: json["interNotesLow"],
        noresult: json["noresult"],
        oldresult: json["oldresult"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "orderlistno": orderlistno,
        "orderdetailsno": orderdetailsno,
        "testtype": testtype,
        "testno": testno,
        "testname": testname,
        "tseqno": tseqno,
        "subtestno": subtestno,
        "subtestname": subtestname,
        "sseqno": sseqno,
        "resulttype": resulttype,
        "mastermethodno": mastermethodno,
        "masterunitno": masterunitno,
        "masterllcolumn": masterllcolumn,
        "masterhlcolumn": masterhlcolumn,
        "masterdisplayrr": masterdisplayrr,
        "crllcolumn": crllcolumn,
        "crhlcolumn": crhlcolumn,
        "displaycrrr": displaycrrr,
        "minrange": minrange,
        "maxrange": maxrange,
        "displaymmrr": displaymmrr,
        "isnonmandatory": isnonmandatory,
        "isdelta": isdelta,
        "istformula": istformula,
        "issformula": issformula,
        "decimalpoint": decimalpoint,
        "isroundoff": isroundoff,
        "isformulaparameter": isformulaparameter,
        "formulaserviceno": formulaserviceno,
        "formulaservicetype": formulaservicetype,
        "formulajson": formulajson == null
            ? []
            : List<dynamic>.from(formulajson!.map((x) => x.toJson())),
        "formulaparameterjson": formulaparameterjson == null
            ? []
            : List<dynamic>.from(formulaparameterjson!.map((x) => x.toJson())),
        "picklistjson": picklistjson == null
            ? []
            : List<dynamic>.from(picklistjson!.map((x) => x.toJson())),
        "headerno": headerno,
        "isedit": isedit,
        "testinter": testinter,
        "methodno": methodno,
        "methodname": methodname,
        "unitno": unitno,
        "unitname": unitname,
        "llcolumn": llcolumn,
        "hlcolumn": hlcolumn,
        "displayrr": displayrr,
        "result": result,
        "formularesult": formularesult,
        "diresult": diresult,
        "resultflag": resultflag,
        "resultcomments": resultcomments,
        "internotes": internotes,
        "risrerunod": risrerunod,
        "isrerunod": isrerunod,
        "isUploadOption": isUploadOption,
        "uploadedfile": uploadedfile,
        "isMultiEditor": isMultiEditor,
        "approvalDoctor": approvalDoctor,
        "statusName": statusName,
        "interNotesHigh": interNotesHigh,
        "interNotesLow": interNotesLow,
        "noresult": noresult,
        "oldresult": oldresult,
      };
}

class Formulajson {
  int parameterserviceno;
  String parameterservicetype;
  int calculateseqno;
  double value;
  String foperator;

  Formulajson({
    required this.parameterserviceno,
    required this.parameterservicetype,
    required this.calculateseqno,
    required this.value,
    required this.foperator,
  });

  factory Formulajson.fromJson(Map<String, dynamic> json) => Formulajson(
        parameterserviceno: json["parameterserviceno"],
        parameterservicetype: json["parameterservicetype"]!,
        calculateseqno: json["calculateseqno"],
        value: json["value"],
        foperator: json["foperator"]!,
      );

  Map<String, dynamic> toJson() => {
        "parameterserviceno": parameterserviceno,
        "parameterservicetype": parameterservicetype,
        "calculateseqno": calculateseqno,
        "value": value,
        "foperator": foperator,
      };
}

// enum Foperator {
//     EMPTY,
//     FLUFFY,
//     FOPERATOR,
//     PURPLE,
//     TENTACLED
// }

// final foperatorValues = EnumValues({
//     "": Foperator.EMPTY,
//     "/": Foperator.FLUFFY,
//     "+": Foperator.FOPERATOR,
//     "=": Foperator.PURPLE,
//     "-": Foperator.TENTACLED
// });

// enum Type {
//     EMPTY,
//     S,
//     T
// }

// final typeValues = EnumValues({
//     " ": Type.EMPTY,
//     "S": Type.S,
//     "T": Type.T
// });

class Formulaparameterjson {
  int serviceno;
  String servicetype;

  Formulaparameterjson({
    required this.serviceno,
    required this.servicetype,
  });

  factory Formulaparameterjson.fromJson(Map<String, dynamic> json) =>
      Formulaparameterjson(
        serviceno: json["serviceno"],
        servicetype: json["servicetype"]!,
      );

  Map<String, dynamic> toJson() => {
        "serviceno": serviceno,
        "servicetype": servicetype,
      };
}

class Picklistjson {
  String pickvalue;
  bool isdefault;
  bool isabnormal;

  Picklistjson({
    required this.pickvalue,
    required this.isdefault,
    required this.isabnormal,
  });

  factory Picklistjson.fromJson(Map<String, dynamic> json) => Picklistjson(
        pickvalue: json["pickvalue"],
        isdefault: json["isdefault"],
        isabnormal: json["isabnormal"],
      );

  Map<String, dynamic> toJson() => {
        "pickvalue": pickvalue,
        "isdefault": isdefault,
        "isabnormal": isabnormal,
      };
}

// enum Resultcomments {
//     EMPTY,
//     FDGD
// }

// final resultcommentsValues = EnumValues({
//     "": Resultcomments.EMPTY,
//     "FDGD": Resultcomments.FDGD
// });

// enum Resultflag {
//     CL,
//     EMPTY,
//     L
// }

// final resultflagValues = EnumValues({
//     "CL": Resultflag.CL,
//     "": Resultflag.EMPTY,
//     "L": Resultflag.L
// });

// enum Resulttype {
//     NU,
//     PL,
//     TX
// }

// final resulttypeValues = EnumValues({
//     "NU": Resulttype.NU,
//     "PL": Resulttype.PL,
//     "TX": Resulttype.TX
// });

// enum StatusName {
//     RESULT_VALIDATED
// }

// final statusNameValues = EnumValues({
//     "Result Validated": StatusName.RESULT_VALIDATED
// });

// class EnumValues<T> {
//     Map<String, T> map;
//     late Map<T, String> reverseMap;

//     EnumValues(this.map);

//     Map<T, String> get reverse {
//         reverseMap = map.map((k, v) => MapEntry(v, k));
//         return reverseMap;
//     }
// }
