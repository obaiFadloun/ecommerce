class CryptoModel {
  Data data;

  CryptoModel({this.data});

  CryptoModel.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data.toJson();
    }
    return data;
  }
}

class Data {
  String id;
  String description;
  bool descHash;
  int createdAt;
  String status;
  int amount;
  String callbackUrl;
  String successUrl;
  String hostedCheckoutUrl;
  String orderId;
  String currency;
  int sourceFiatValue;
  double fiatValue;
  bool autoSettle;
  String notifEmail;
  String address;
  ChainInvoice chainInvoice;
  String uri;
  int ttl;
  LightningInvoice lightningInvoice;

  Data({
    this.id,
    this.description,
    this.descHash,
    this.createdAt,
    this.status,
    this.amount,
    this.callbackUrl,
    this.successUrl,
    this.hostedCheckoutUrl,
    this.orderId,
    this.currency,
    this.sourceFiatValue,
    this.fiatValue,
    this.autoSettle,
    this.notifEmail,
    this.address,
    this.chainInvoice,
    this.uri,
    this.ttl,
    this.lightningInvoice,
  });

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    description = json['description'];
    descHash = json['desc_hash'];
    createdAt = json['created_at'];
    status = json['status'];
    amount = json['amount'];
    callbackUrl = json['callback_url'];
    successUrl = json['success_url'];
    hostedCheckoutUrl = json['hosted_checkout_url'];
    orderId = json['order_id'];
    currency = json['currency'];
    sourceFiatValue = json['source_fiat_value'];
    fiatValue = json['fiat_value'];
    autoSettle = json['auto_settle'];
    notifEmail = json['notif_email'];
    address = json['address'];
    chainInvoice = json['chain_invoice'] != null ? ChainInvoice.fromJson(json['chain_invoice']) : null;
    uri = json['uri'];
    ttl = json['ttl'];
    lightningInvoice = json['lightning_invoice'] != null ? LightningInvoice.fromJson(json['lightning_invoice']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id;
    data['description'] = description;
    data['desc_hash'] = descHash;
    data['created_at'] = createdAt;
    data['status'] = status;
    data['amount'] = amount;
    data['callback_url'] = callbackUrl;
    data['success_url'] = successUrl;
    data['hosted_checkout_url'] = hostedCheckoutUrl;
    data['order_id'] = orderId;
    data['currency'] = currency;
    data['source_fiat_value'] = sourceFiatValue;
    data['fiat_value'] = fiatValue;
    data['auto_settle'] = autoSettle;
    data['notif_email'] = notifEmail;
    data['address'] = address;
    if (chainInvoice != null) {
      data['chain_invoice'] = chainInvoice.toJson();
    }
    data['uri'] = uri;
    data['ttl'] = ttl;
    if (lightningInvoice != null) {
      data['lightning_invoice'] = lightningInvoice.toJson();
    }
    return data;
  }
}

class ChainInvoice {
  String address;

  ChainInvoice({this.address});

  ChainInvoice.fromJson(Map<String, dynamic> json) {
    address = json['address'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['address'] = address;
    return data;
  }
}

class LightningInvoice {
  int expiresAt;
  String payreq;

  LightningInvoice({this.expiresAt, this.payreq});

  LightningInvoice.fromJson(Map<String, dynamic> json) {
    expiresAt = json['expires_at'];
    payreq = json['payreq'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['expires_at'] = expiresAt;
    data['payreq'] = payreq;
    return data;
  }
}
