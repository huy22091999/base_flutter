class AssetInfo {
  AssetInfo({
    this.createDate,
    this.createdBy,
    this.modifyDate,
    this.modifiedBy,
    required this.id,
    this.product,
    this.productCode,
    this.productName,
    this.productCategory,
    this.productType,
    this.countryOrigin,
    required this.name,
    required this.code,
    this.listCodes,
    required this.managementCode,
    this.qrcode,
    required this.originalCost,
    required this.unitPrice,
    required this.carryingAmount,
    this.depreciationPeriod,
    this.depreciationDate,
    required this.depreciationRate,
    this.accumulatedDepreciationAmount,
    this.assetSource,
    this.assetSources,
    this.assetSourceCode,
    required this.status,
    this.statusCode,
    this.statusName,
    this.receiverPerson,
    required this.usePerson,
    this.receiverPersonCode,
    this.assetGroup,
    this.assetGroupCode,
    required this.madeIn,
    this.allocationFor,
    required this.useDepartment,
    this.useDepartmentId,
    this.useDepartmentCode,
    this.useDepartmentName,
    required this.managementDepartment,
    this.useDepartmentLast,
    this.installationLocation,
    this.supplyUnit,
    required this.manufacturer,
    required this.yearOfManufacture,
    this.dayStartedUsing,
    this.warrantyExpiryDate,
    required this.serialNumber,
    required this.model,
    this.usedTime,
    this.warrantyMonth,
    this.note,
    this.attributes,
    required this.yearPutIntoUse,
    required this.isCheck,
    this.documents,
    required this.isTemporary,
    required this.isManageAccountant,
    this.store,
    required this.dateOfReception,
    this.managementDepartmentCode,
    this.managementPurchaseDepartmentCode,
    this.storeCode,
    this.manufacturerCode,
    this.listAssetDocumentId,
    this.isReceivingAsset,
    this.org,
    this.maintainPlanings,
    required this.depreciationValue,
    this.assetClass,
    this.quantity,
    this.lotNumber,
    this.riskClassification,
    required this.circulationNumber,
    this.invoiceNumber,
    required this.unit,
    this.contract,
    this.isBuyLocally,
    this.medicalEquipment,
    required this.shoppingForm,
    this.allocationPeriod,
    this.allocationPeriodValue,
    this.numberOfAllocations,
    this.numberOfAllocationsRemaining,
    this.biddingPackage,
    this.assetId,
  });

  late final Null createDate;
  late final Null createdBy;
  late final Null modifyDate;
  late final Null modifiedBy;
  late final String? id;
  late final Null product;
  late final Null productCode;
  late final Null productName;
  late final Null productCategory;
  late final Null productType;
  late final Null countryOrigin;
  late final String? name;
  late final String? code;
  late final Null listCodes;
  late final String? managementCode;
  late final Null qrcode;
  late final double? originalCost;
  late final double? unitPrice;
  late final double? carryingAmount;
  late final Null depreciationPeriod;
  late final Null depreciationDate;
  late final double? depreciationRate;
  late final Null accumulatedDepreciationAmount;
  late final Null assetSource;
  late final Null assetSources;
  late final Null assetSourceCode;
  late final Status? status;
  late final Null statusCode;
  late final Null statusName;
  late final Null receiverPerson;
  late final UsePerson? usePerson;
  late final Null receiverPersonCode;
  late final Null assetGroup;
  late final Null assetGroupCode;
  late final String? madeIn;
  late final Null allocationFor;
  late final UseDepartment? useDepartment;
  late final Null useDepartmentId;
  late final Null useDepartmentCode;
  late final Null useDepartmentName;
  late final ManagementDepartment? managementDepartment;
  late final Null useDepartmentLast;
  late final Null installationLocation;
  late final Null supplyUnit;
  late final Manufacturer? manufacturer;
  late final int? yearOfManufacture;
  late final Null dayStartedUsing;
  late final Null warrantyExpiryDate;
  late final String? serialNumber;
  late final String? model;
  late final Null usedTime;
  late final Null warrantyMonth;
  late final String? note ;
  late final Null attributes;
  late final int? yearPutIntoUse;
  late final bool isCheck;
  late final Null documents;
  late final bool isTemporary;
  late final bool isManageAccountant;
  late final Null store;
  late final DateTime? dateOfReception;
  late final Null managementDepartmentCode;
  late final Null managementPurchaseDepartmentCode;
  late final Null storeCode;
  late final Null manufacturerCode;
  late final Null listAssetDocumentId;
  late final Null isReceivingAsset;
  late final Null org;
  late final Null maintainPlanings;
  late final double? depreciationValue;
  late final Null assetClass;
  late final Null quantity;
  late final Null lotNumber;
  late final Null riskClassification;
  late final String? circulationNumber;
  late final Null invoiceNumber;
  late final Unit? unit;
  late final Null contract;
  late final Null isBuyLocally;
  late final Null medicalEquipment;
  late final ShoppingForm? shoppingForm;
  late final Null allocationPeriod;
  late final Null allocationPeriodValue;
  late final Null numberOfAllocations;
  late final Null numberOfAllocationsRemaining;
  late final Null biddingPackage;
  late final Null assetId;

  AssetInfo.fromJson(Map<String, dynamic> json) {
    createDate = null;
    createdBy = null;
    modifyDate = null;
    modifiedBy = null;
    id = json['id'];
    product = null;
    productCode = null;
    productName = null;
    productCategory = null;
    productType = null;
    countryOrigin = null;
    name = json['name'];
    code = json['code'];
    listCodes = null;
    managementCode = json['managementCode'];
    qrcode = null;
    originalCost = json['originalCost'];
    unitPrice = json['unitPrice'] ?? 0;
    carryingAmount = json['carryingAmount'];
    depreciationPeriod = null;
    depreciationDate = null;
    depreciationRate = json['depreciationRate'];
    accumulatedDepreciationAmount = null;
    assetSource = null;
    assetSources = null;
    assetSourceCode = null;
    status = Status.fromJson(json['status']);
    statusCode = null;
    statusName = null;
    receiverPerson = null;
    usePerson = json['usePerson'] != null ? UsePerson.fromJson(json['usePerson']) : null;
    receiverPersonCode = null;
    assetGroup = null;
    assetGroupCode = null;
    madeIn = json['madeIn'];
    allocationFor = null;
    useDepartment = json['useDepartment'] != null ? UseDepartment.fromJson(json['useDepartment']) : null;
    useDepartmentId = null;
    useDepartmentCode = null;
    useDepartmentName = null;
    managementDepartment =
        ManagementDepartment.fromJson(json['managementDepartment']);
    useDepartmentLast = null;
    installationLocation = null;
    supplyUnit = null;
    manufacturer = json['manufacturer'] != null ? Manufacturer.fromJson(json['manufacturer']) : null;
    yearOfManufacture = json['yearOfManufacture'];
    dayStartedUsing = null;
    warrantyExpiryDate = null;
    serialNumber = json['serialNumber'];
    model = json['model'] ?? null;
    usedTime = null;
    warrantyMonth = null;
    attributes = null;
    yearPutIntoUse = json['yearPutIntoUse'] ?? null;
    isCheck = json['isCheck'];
    documents = null;
    isTemporary = json['isTemporary'];
    isManageAccountant = json['isManageAccountant'];
    store = null;
    dateOfReception =
        DateTime.fromMicrosecondsSinceEpoch(json['dateOfReception']);
    managementDepartmentCode = null;
    managementPurchaseDepartmentCode = null;
    storeCode = null;
    manufacturerCode = null;
    listAssetDocumentId = null;
    isReceivingAsset = null;
    org = null;
    maintainPlanings = null;
    depreciationValue = json['depreciationValue'];
    assetClass = null;
    quantity = null;
    lotNumber = null;
    riskClassification = null;
    circulationNumber = json['circulationNumber'];
    invoiceNumber = null;
    unit = json['unit'] != null ?  Unit.fromJson(json['unit']) : null;
    contract = null;
    isBuyLocally = null;
    medicalEquipment = null;
    shoppingForm = json['shoppingForm'] != null
        ? ShoppingForm.fromJson(json['shoppingForm'])
        : null;
    allocationPeriod = null;
    allocationPeriodValue = null;
    numberOfAllocations = null;
    numberOfAllocationsRemaining = null;
    biddingPackage = null;
    assetId = null;
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['createDate'] = createDate;
    _data['createdBy'] = createdBy;
    _data['modifyDate'] = modifyDate;
    _data['modifiedBy'] = modifiedBy;
    _data['id'] = id;
    _data['product'] = product;
    _data['productCode'] = productCode;
    _data['productName'] = productName;
    _data['productCategory'] = productCategory;
    _data['productType'] = productType;
    _data['countryOrigin'] = countryOrigin;
    _data['name'] = name;
    _data['code'] = code;
    _data['listCodes'] = listCodes;
    _data['managementCode'] = managementCode;
    _data['qrcode'] = qrcode;
    _data['originalCost'] = originalCost;
    _data['unitPrice'] = unitPrice;
    _data['carryingAmount'] = carryingAmount;
    _data['depreciationPeriod'] = depreciationPeriod;
    _data['depreciationDate'] = depreciationDate;
    _data['depreciationRate'] = depreciationRate;
    _data['accumulatedDepreciationAmount'] = accumulatedDepreciationAmount;
    _data['assetSource'] = assetSource;
    _data['assetSources'] = assetSources;
    _data['assetSourceCode'] = assetSourceCode;
    _data['status'] = status?.toJson();
    _data['statusCode'] = statusCode;
    _data['statusName'] = statusName;
    _data['receiverPerson'] = receiverPerson;
    _data['usePerson'] = usePerson?.toJson();
    _data['receiverPersonCode'] = receiverPersonCode;
    _data['assetGroup'] = assetGroup;
    _data['assetGroupCode'] = assetGroupCode;
    _data['madeIn'] = madeIn;
    _data['allocationFor'] = allocationFor;
    _data['useDepartment'] = useDepartment?.toJson();
    _data['useDepartmentId'] = useDepartmentId;
    _data['useDepartmentCode'] = useDepartmentCode;
    _data['useDepartmentName'] = useDepartmentName;
    _data['managementDepartment'] = managementDepartment?.toJson();
    _data['useDepartmentLast'] = useDepartmentLast;
    _data['installationLocation'] = installationLocation;
    _data['supplyUnit'] = supplyUnit;
    _data['manufacturer'] = manufacturer?.toJson();
    _data['yearOfManufacture'] = yearOfManufacture;
    _data['dayStartedUsing'] = dayStartedUsing;
    _data['warrantyExpiryDate'] = warrantyExpiryDate;
    _data['serialNumber'] = serialNumber;
    _data['model'] = model;
    _data['usedTime'] = usedTime;
    _data['warrantyMonth'] = warrantyMonth;
    _data['note'] = note;
    _data['attributes'] = attributes;
    _data['yearPutIntoUse'] = yearPutIntoUse;
    _data['isCheck'] = isCheck;
    _data['documents'] = documents;
    _data['isTemporary'] = isTemporary;
    _data['isManageAccountant'] = isManageAccountant;
    _data['store'] = store;
    // _data['dateOfReception'] = dateOfReception !=null ?? ;
    _data['managementDepartmentCode'] = managementDepartmentCode;
    _data['managementPurchaseDepartmentCode'] =
        managementPurchaseDepartmentCode;
    _data['storeCode'] = storeCode;
    _data['manufacturerCode'] = manufacturerCode;
    _data['listAssetDocumentId'] = listAssetDocumentId;
    _data['isReceivingAsset'] = isReceivingAsset;
    _data['org'] = org;
    _data['maintainPlanings'] = maintainPlanings;
    _data['depreciationValue'] = depreciationValue;
    _data['assetClass'] = assetClass;
    _data['quantity'] = quantity;
    _data['lotNumber'] = lotNumber;
    _data['riskClassification'] = riskClassification;
    _data['circulationNumber'] = circulationNumber;
    _data['invoiceNumber'] = invoiceNumber;
    _data['unit'] = unit?.toJson();
    _data['contract'] = contract;
    _data['isBuyLocally'] = isBuyLocally;
    _data['medicalEquipment'] = medicalEquipment;
    _data['shoppingForm'] = shoppingForm;
    _data['allocationPeriod'] = allocationPeriod;
    _data['allocationPeriodValue'] = allocationPeriodValue;
    _data['numberOfAllocations'] = numberOfAllocations;
    _data['numberOfAllocationsRemaining'] = numberOfAllocationsRemaining;
    _data['biddingPackage'] = biddingPackage;
    _data['assetId'] = assetId;
    return _data;
  }
}

class Status {
  Status({
    this.createDate,
    this.createdBy,
    this.modifyDate,
    this.modifiedBy,
    required this.id,
    required this.name,
    required this.code,
    required this.indexOrder,
    required this.org,
  });

  late final Null createDate;
  late final Null createdBy;
  late final Null modifyDate;
  late final Null modifiedBy;
  late final String id;
  late final String name;
  late final String code;
  late final int indexOrder;
  late final Org org;

  Status.fromJson(Map<String, dynamic> json) {
    createDate = null;
    createdBy = null;
    modifyDate = null;
    modifiedBy = null;
    id = json['id'];
    name = json['name'];
    code = json['code'];
    indexOrder = json['indexOrder'];
    org = Org.fromJson(json['org']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['createDate'] = createDate;
    _data['createdBy'] = createdBy;
    _data['modifyDate'] = modifyDate;
    _data['modifiedBy'] = modifiedBy;
    _data['id'] = id;
    _data['name'] = name;
    _data['code'] = code;
    _data['indexOrder'] = indexOrder;
    _data['org'] = org.toJson();
    return _data;
  }
}

class Org {
  Org({
    this.createDate,
    this.createdBy,
    this.modifyDate,
    this.modifiedBy,
    required this.id,
    required this.name,
    required this.code,
    this.website,
    this.organizationType,
    this.level,
    this.parent,
    this.subDepartments,
    required this.isActive,
    this.parentId,
  });

  late final Null createDate;
  late final Null createdBy;
  late final Null modifyDate;
  late final Null modifiedBy;
  late final String id;
  late final String name;
  late final String code;
  late final Null website;
  late final Null organizationType;
  late final Null level;
  late final Null parent;
  late final Null subDepartments;
  late final bool isActive;
  late final Null parentId;

  Org.fromJson(Map<String, dynamic> json) {
    createDate = null;
    createdBy = null;
    modifyDate = null;
    modifiedBy = null;
    id = json['id'];
    name = json['name'];
    code = json['code'];
    website = null;
    organizationType = null;
    level = null;
    parent = null;
    subDepartments = null;
    isActive = json['isActive'];
    parentId = null;
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['createDate'] = createDate;
    _data['createdBy'] = createdBy;
    _data['modifyDate'] = modifyDate;
    _data['modifiedBy'] = modifiedBy;
    _data['id'] = id;
    _data['name'] = name;
    _data['code'] = code;
    _data['website'] = website;
    _data['organizationType'] = organizationType;
    _data['level'] = level;
    _data['parent'] = parent;
    _data['subDepartments'] = subDepartments;
    _data['isActive'] = isActive;
    _data['parentId'] = parentId;
    return _data;
  }
}

class UsePerson {
  UsePerson({
    required this.createdBy,
    required this.createDate,
    required this.modifiedBy,
    required this.modifyDate,
    required this.id,
    this.firstName,
    this.lastName,
    required this.displayName,
    this.shortName,
    this.birthDate,
    this.birthPlace,
    this.gender,
    this.startDate,
    this.endDate,
    this.phoneNumber,
    this.idNumber,
    this.idNumberIssueBy,
    this.idNumberIssueDate,
    this.email,
    this.nationality,
    this.nativeVillage,
    this.ethnics,
    this.religion,
    this.photo,
    this.photoCropped,
    this.imagePath,
    required this.addresses,
    required this.userId,
    this.communistYouthUnionJoinDate,
    this.communistPartyJoinDate,
    this.carrer,
    this.maritalStatus,
  });

  late final String createdBy;
  late final List<int> createDate;
  late final String modifiedBy;
  late final List<int> modifyDate;
  late final String id;
  late final Null firstName;
  late final Null lastName;
  late final String displayName;
  late final Null shortName;
  late final Null birthDate;
  late final Null birthPlace;
  late final Null gender;
  late final Null startDate;
  late final Null endDate;
  late final Null phoneNumber;
  late final Null idNumber;
  late final Null idNumberIssueBy;
  late final Null idNumberIssueDate;
  late final Null email;
  late final Null nationality;
  late final Null nativeVillage;
  late final Null ethnics;
  late final Null religion;
  late final Null photo;
  late final Null photoCropped;
  late final Null imagePath;
  late final List<dynamic> addresses;
  late final int userId;
  late final Null communistYouthUnionJoinDate;
  late final Null communistPartyJoinDate;
  late final Null carrer;
  late final Null maritalStatus;

  UsePerson.fromJson(Map<String, dynamic> json) {
    createdBy = json['createdBy'];
    createDate = List.castFrom<dynamic, int>(json['createDate']);
    modifiedBy = json['modifiedBy'];
    modifyDate = List.castFrom<dynamic, int>(json['modifyDate']);
    id = json['id'];
    firstName = null;
    lastName = null;
    displayName = json['displayName'];
    shortName = null;
    birthDate = null;
    birthPlace = null;
    gender = null;
    startDate = null;
    endDate = null;
    phoneNumber = null;
    idNumber = null;
    idNumberIssueBy = null;
    idNumberIssueDate = null;
    email = null;
    nationality = null;
    nativeVillage = null;
    ethnics = null;
    religion = null;
    photo = null;
    photoCropped = null;
    imagePath = null;
    addresses = List.castFrom<dynamic, dynamic>(json['addresses']);
    userId = json['userId'];
    communistYouthUnionJoinDate = null;
    communistPartyJoinDate = null;
    carrer = null;
    maritalStatus = null;
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['createdBy'] = createdBy;
    _data['createDate'] = createDate;
    _data['modifiedBy'] = modifiedBy;
    _data['modifyDate'] = modifyDate;
    _data['id'] = id;
    _data['firstName'] = firstName;
    _data['lastName'] = lastName;
    _data['displayName'] = displayName;
    _data['shortName'] = shortName;
    _data['birthDate'] = birthDate;
    _data['birthPlace'] = birthPlace;
    _data['gender'] = gender;
    _data['startDate'] = startDate;
    _data['endDate'] = endDate;
    _data['phoneNumber'] = phoneNumber;
    _data['idNumber'] = idNumber;
    _data['idNumberIssueBy'] = idNumberIssueBy;
    _data['idNumberIssueDate'] = idNumberIssueDate;
    _data['email'] = email;
    _data['nationality'] = nationality;
    _data['nativeVillage'] = nativeVillage;
    _data['ethnics'] = ethnics;
    _data['religion'] = religion;
    _data['photo'] = photo;
    _data['photoCropped'] = photoCropped;
    _data['imagePath'] = imagePath;
    _data['addresses'] = addresses;
    _data['userId'] = userId;
    _data['communistYouthUnionJoinDate'] = communistYouthUnionJoinDate;
    _data['communistPartyJoinDate'] = communistPartyJoinDate;
    _data['carrer'] = carrer;
    _data['maritalStatus'] = maritalStatus;
    return _data;
  }
}

class UseDepartment {
  UseDepartment({
    required this.id,
    required this.code,
    required this.name,
    required this.departmentType,
    this.parentId,
    this.parent,
    this.subDepartments,
    this.children,
    this.dupName,
    this.dupCode,
    this.displayOrder,
    this.level,
    this.linePath,
    this.shortName,
    this.isAssetManagement,
    this.viewIndex,
    this.parentDepartmentCode,
    this.quantity,
    this.remainQuantity,
    this.totalOriginalCost,
    this.totalDepreciationValue,
    this.listAssetDepartmentChild,
    this.text,
    required this.duplicate,
  });

  late final String id;
  late final String code;
  late final String name;
  late final int departmentType;
  late final Null parentId;
  late final Null parent;
  late final Null subDepartments;
  late final Null children;
  late final Null dupName;
  late final Null dupCode;
  late final Null displayOrder;
  late final Null level;
  late final Null linePath;
  late final Null shortName;
  late final Null isAssetManagement;
  late final Null viewIndex;
  late final Null parentDepartmentCode;
  late final Null quantity;
  late final Null remainQuantity;
  late final Null totalOriginalCost;
  late final Null totalDepreciationValue;
  late final Null listAssetDepartmentChild;
  late final Null text;
  late final bool duplicate;

  UseDepartment.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    code = json['code'];
    name = json['name'];
    departmentType = json['departmentType'];
    parentId = null;
    parent = null;
    subDepartments = null;
    children = null;
    dupName = null;
    dupCode = null;
    displayOrder = null;
    level = null;
    linePath = null;
    shortName = null;
    isAssetManagement = null;
    viewIndex = null;
    parentDepartmentCode = null;
    quantity = null;
    remainQuantity = null;
    totalOriginalCost = null;
    totalDepreciationValue = null;
    listAssetDepartmentChild = null;
    text = null;
    duplicate = json['duplicate'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['code'] = code;
    _data['name'] = name;
    _data['departmentType'] = departmentType;
    _data['parentId'] = parentId;
    _data['parent'] = parent;
    _data['subDepartments'] = subDepartments;
    _data['children'] = children;
    _data['dupName'] = dupName;
    _data['dupCode'] = dupCode;
    _data['displayOrder'] = displayOrder;
    _data['level'] = level;
    _data['linePath'] = linePath;
    _data['shortName'] = shortName;
    _data['isAssetManagement'] = isAssetManagement;
    _data['viewIndex'] = viewIndex;
    _data['parentDepartmentCode'] = parentDepartmentCode;
    _data['quantity'] = quantity;
    _data['remainQuantity'] = remainQuantity;
    _data['totalOriginalCost'] = totalOriginalCost;
    _data['totalDepreciationValue'] = totalDepreciationValue;
    _data['listAssetDepartmentChild'] = listAssetDepartmentChild;
    _data['text'] = text;
    _data['duplicate'] = duplicate;
    return _data;
  }
}

class ManagementDepartment {
  ManagementDepartment({
    required this.id,
    required this.code,
    required this.name,
    required this.departmentType,
    this.parentId,
    required this.parent,
    required this.subDepartments,
    required this.children,
    this.dupName,
    this.dupCode,
    this.displayOrder,
    this.level,
    this.linePath,
    this.shortName,
    required this.isAssetManagement,
    required this.viewIndex,
    this.parentDepartmentCode,
    this.quantity,
    this.remainQuantity,
    this.totalOriginalCost,
    this.totalDepreciationValue,
    this.listAssetDepartmentChild,
    required this.text,
    required this.duplicate,
  });

  late final String id;
  late final String code;
  late final String name;
  late final int departmentType;
  late final Null parentId;
  late final Parent parent;
  late final List<dynamic> subDepartments;
  late final List<dynamic> children;
  late final Null dupName;
  late final Null dupCode;
  late final Null displayOrder;
  late final Null level;
  late final Null linePath;
  late final Null shortName;
  late final bool isAssetManagement;
  late final String viewIndex;
  late final Null parentDepartmentCode;
  late final Null quantity;
  late final Null remainQuantity;
  late final Null totalOriginalCost;
  late final Null totalDepreciationValue;
  late final Null listAssetDepartmentChild;
  late final String text;
  late final bool duplicate;

  ManagementDepartment.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    code = json['code'];
    name = json['name'];
    departmentType = json['departmentType'];
    parentId = null;
    parent = Parent.fromJson(json['parent']);
    subDepartments = List.castFrom<dynamic, dynamic>(json['subDepartments']);
    children = List.castFrom<dynamic, dynamic>(json['children']);
    dupName = null;
    dupCode = null;
    displayOrder = null;
    level = null;
    linePath = null;
    shortName = null;
    isAssetManagement = json['isAssetManagement'];
    viewIndex = json['viewIndex'];
    parentDepartmentCode = null;
    quantity = null;
    remainQuantity = null;
    totalOriginalCost = null;
    totalDepreciationValue = null;
    listAssetDepartmentChild = null;
    text = json['text'];
    duplicate = json['duplicate'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['code'] = code;
    _data['name'] = name;
    _data['departmentType'] = departmentType;
    _data['parentId'] = parentId;
    _data['parent'] = parent.toJson();
    _data['subDepartments'] = subDepartments;
    _data['children'] = children;
    _data['dupName'] = dupName;
    _data['dupCode'] = dupCode;
    _data['displayOrder'] = displayOrder;
    _data['level'] = level;
    _data['linePath'] = linePath;
    _data['shortName'] = shortName;
    _data['isAssetManagement'] = isAssetManagement;
    _data['viewIndex'] = viewIndex;
    _data['parentDepartmentCode'] = parentDepartmentCode;
    _data['quantity'] = quantity;
    _data['remainQuantity'] = remainQuantity;
    _data['totalOriginalCost'] = totalOriginalCost;
    _data['totalDepreciationValue'] = totalDepreciationValue;
    _data['listAssetDepartmentChild'] = listAssetDepartmentChild;
    _data['text'] = text;
    _data['duplicate'] = duplicate;
    return _data;
  }
}

class Parent {
  Parent({
    required this.id,
    required this.code,
    required this.name,
    required this.departmentType,
    this.parentId,
    this.parent,
    this.subDepartments,
    this.children,
    this.dupName,
    this.dupCode,
    this.displayOrder,
    this.level,
    this.linePath,
    this.shortName,
    required this.duplicate,
  });

  late final String id;
  late final String code;
  late final String name;
  late final int departmentType;
  late final Null parentId;
  late final Null parent;
  late final Null subDepartments;
  late final Null children;
  late final Null dupName;
  late final Null dupCode;
  late final Null displayOrder;
  late final Null level;
  late final Null linePath;
  late final Null shortName;
  late final bool duplicate;

  Parent.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    code = json['code'];
    name = json['name'];
    departmentType = json['departmentType'];
    parentId = null;
    parent = null;
    subDepartments = null;
    children = null;
    dupName = null;
    dupCode = null;
    displayOrder = null;
    level = null;
    linePath = null;
    shortName = null;
    duplicate = json['duplicate'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['code'] = code;
    _data['name'] = name;
    _data['departmentType'] = departmentType;
    _data['parentId'] = parentId;
    _data['parent'] = parent;
    _data['subDepartments'] = subDepartments;
    _data['children'] = children;
    _data['dupName'] = dupName;
    _data['dupCode'] = dupCode;
    _data['displayOrder'] = displayOrder;
    _data['level'] = level;
    _data['linePath'] = linePath;
    _data['shortName'] = shortName;
    _data['duplicate'] = duplicate;
    return _data;
  }
}

class Manufacturer {
  Manufacturer({
    this.createDate,
    this.createdBy,
    this.modifyDate,
    this.modifiedBy,
    required this.id,
    required this.name,
    required this.code,
    this.type,
    this.parentId,
    this.parent,
    this.children,
  });

  late final Null createDate;
  late final Null createdBy;
  late final Null modifyDate;
  late final Null modifiedBy;
  late final String id;
  late final String name;
  late final String code;
  late final Null type;
  late final Null parentId;
  late final Null parent;
  late final Null children;

  Manufacturer.fromJson(Map<String, dynamic> json) {
    createDate = null;
    createdBy = null;
    modifyDate = null;
    modifiedBy = null;
    id = json['id'];
    name = json['name'];
    code = json['code'];
    type = null;
    parentId = null;
    parent = null;
    children = null;
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['createDate'] = createDate;
    _data['createdBy'] = createdBy;
    _data['modifyDate'] = modifyDate;
    _data['modifiedBy'] = modifiedBy;
    _data['id'] = id;
    _data['name'] = name;
    _data['code'] = code;
    _data['type'] = type;
    _data['parentId'] = parentId;
    _data['parent'] = parent;
    _data['children'] = children;
    return _data;
  }
}

class Unit {
  Unit({
    this.createDate,
    this.createdBy,
    this.modifyDate,
    this.modifiedBy,
    required this.id,
    required this.name,
    required this.code,
  });

  late final Null createDate;
  late final Null createdBy;
  late final Null modifyDate;
  late final Null modifiedBy;
  late final String id;
  late final String name;
  late final String code;

  Unit.fromJson(Map<String, dynamic> json) {
    createDate = null;
    createdBy = null;
    modifyDate = null;
    modifiedBy = null;
    id = json['id'];
    name = json['name'];
    code = json['code'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['createDate'] = createDate;
    _data['createdBy'] = createdBy;
    _data['modifyDate'] = modifyDate;
    _data['modifiedBy'] = modifiedBy;
    _data['id'] = id;
    _data['name'] = name;
    _data['code'] = code;
    return _data;
  }
}

class ShoppingForm {
  ShoppingForm({
    this.createDate,
    this.createdBy,
    this.modifyDate,
    this.modifiedBy,
    required this.id,
    required this.name,
    required this.code,
    required this.type,
    this.parentId,
    this.parent,
    this.children,
  });

  late final Null createDate;
  late final Null createdBy;
  late final Null modifyDate;
  late final Null modifiedBy;
  late final String id;
  late final String name;
  late final String code;
  late final Type type;
  late final Null parentId;
  late final Null parent;
  late final Null children;

  ShoppingForm.fromJson(Map<String, dynamic> json) {
    createDate = null;
    createdBy = null;
    modifyDate = null;
    modifiedBy = null;
    id = json['id'];
    name = json['name'];
    code = json['code'];
    type = Type.fromJson(json['type']);
    parentId = null;
    parent = null;
    children = null;
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['createDate'] = createDate;
    _data['createdBy'] = createdBy;
    _data['modifyDate'] = modifyDate;
    _data['modifiedBy'] = modifiedBy;
    _data['id'] = id;
    _data['name'] = name;
    _data['code'] = code;
    _data['type'] = type.toJson();
    _data['parentId'] = parentId;
    _data['parent'] = parent;
    _data['children'] = children;
    return _data;
  }
}

class Type {
  Type({
    this.createDate,
    this.createdBy,
    this.modifyDate,
    this.modifiedBy,
    required this.id,
    required this.name,
    required this.code,
  });

  late final Null createDate;
  late final Null createdBy;
  late final Null modifyDate;
  late final Null modifiedBy;
  late final String id;
  late final String name;
  late final String code;

  Type.fromJson(Map<String, dynamic> json) {
    createDate = null;
    createdBy = null;
    modifyDate = null;
    modifiedBy = null;
    id = json['id'];
    name = json['name'];
    code = json['code'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['createDate'] = createDate;
    _data['createdBy'] = createdBy;
    _data['modifyDate'] = modifyDate;
    _data['modifiedBy'] = modifiedBy;
    _data['id'] = id;
    _data['name'] = name;
    _data['code'] = code;
    return _data;
  }
}
