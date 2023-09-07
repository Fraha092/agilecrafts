import 'package:agilecrafts/productModel.dart';
import 'package:flutter_data/flutter_data.dart';
import 'package:json_annotation/json_annotation.dart';

import 'adapter.dart';
part 'authModel.g.dart';

@JsonSerializable()
@DataRepository([JSONPlaceholderAdapter])
class User extends DataModel<User>{
  @override
  final int id;
  final String username;
  final String password;
  late final HasMany<Todo> todos;

  User({
    required this.id,
   required this.username,
   required this.password,
    HasMany<Todo>? todos,
}):todos=todos?? HasMany();

  // factory User.fromJson(Map<String, dynamic>json)=>$UserFromJson(json);
  // Map<String, dynamic> toJson() => _$UserToJson(this);

}