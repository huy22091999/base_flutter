class Department {
  Department({
    required this.id,
    required this.parent,
    required this.icon,
    required this.text,
  });

  late final String? id;
  late final String? parent;
  late final String? icon;
  late final String? text;

  Department.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    parent = json['parent'];
    icon = json['icon'];
    text = json['text'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['parent'] = parent;
    _data['icon'] = icon;
    _data['text'] = text;
    return _data;
  }
}
