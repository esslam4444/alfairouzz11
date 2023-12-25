

 class Specimen {
  int? id;
  String? labQr;
  double? total;
  String? notes;
  String? createdBy;
  dynamic createdDate;
  dynamic receivingDate;
  dynamic contractType;
  String? lastModifiedBy;
  String? lastModifiedDate;
  String? specimenStatus;
  double? notPaid;
  double? price;
  ReferringDoctor? referringDoctor;
  Patient? patient;


  //String? name;


  //constructor فاضي
Specimen();
//
//   Specimen(_specimenStatus){
//     this._specimenStatus = _specimenStatus;
//   }
//   String? Specimen(){
//    return _specimenStatus;
//   }
  Specimen.fromJson(Map<String, dynamic> json) {
    createdBy = json['createdBy'] ?? '';
    createdDate = json['createdDate'] ?? '';
    contractType = json['contractType'] ?? '';
    receivingDate = json['receivingDate'] ?? '';
    lastModifiedBy = json['lastModifiedBy'] ?? '';
    lastModifiedDate = json['lastModifiedDate'] ?? '';
    id = json['id'] ?? null;
    total = json['total'] ?? 0.0;
    notes = json['notes'] ?? '';
    labQr = json['labQr'] ?? '';
    specimenStatus = json['specimenStatus'] ?? '';
    // as a jason object belongs to its seperate model Patient
    notPaid = json['notPaid'] ?? 0.0;
    price = json['price'] ?? 0.0;
    patient =  Patient.fromJson( json['patient']);

   // nameAr = json['patient']['nameAr']?? 'd';
   // nameAr = json['nameAr'] ?? 'f';
   // name = json['name'] ?? '';
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['createdBy'] = this.createdBy;
    data['createdDate'] = this.createdDate;
    data['contractType'] = this.contractType;
    data['receivingDate'] = this.receivingDate;
    data['lastModifiedBy'] = this.lastModifiedBy;
    data['lastModifiedDate'] = this.lastModifiedDate;
    data['id'] = this.id;
    data['total'] = this.total;
    data['notes'] = this.notes;
    data['labQr'] = this.labQr;
    data['notPaid'] = this.notPaid;
    data['price'] = this.price;
    data['specimenStatus'] = this.specimenStatus;

    data['patient'] = this.patient;


   // data['nameAr'] = this.nameAr;
    // if (this.size != null) {
    //   data['size'] = this.size!.toJson();
    // }
    return data;
  }

}


class Patient {
  int? id;
  String? nameAr;


  //constructor فاضي
  Patient();

  Patient.fromJson(Map<String, dynamic> json) {
    id = json['id'] ?? null;
    nameAr = json['nameAr'] ?? 'non';

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['nameAr'] = this.nameAr;
    data['id'] = this.id;
    // data['nameAr'] = this.nameAr;
    // if (this.size != null) {
    //   data['size'] = this.size!.toJson();
    // }

    return data;
  }

}


 class ReferringDoctor {
   String? name;

   String? nameAr;
   //constructor فاضي
   ReferringDoctor();

   ReferringDoctor.fromJson(Map<String, dynamic> json) {

     name = json['name'] ?? '';
     nameAr = json['nameAr'] ?? '';
   }

   Map<String, dynamic> toJson() {
     final Map<String, dynamic> data = new Map<String, dynamic>();
     data['name'] = this.name;
     data['nameAr'] = this.nameAr;
     // data['nameAr'] = this.nameAr;
     // if (this.size != null) {
     //   data['size'] = this.size!.toJson();
     // }

     return data;
   }

 }





