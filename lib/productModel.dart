import 'package:flutter_data/flutter_data.dart';
import 'package:json_annotation/json_annotation.dart';

import 'adapter.dart';
import 'authModel.dart';
part 'productModel.g.dart';

@JsonSerializable()
@DataRepository([JSONPlaceholderAdapter])
class Todo extends DataModel<Todo> {
  @override
  final int id;

  @JsonKey(name: 'title')
  final String description;

  final bool isAvailable;

  @JsonKey(name: 'tenantId')
  late final BelongsTo<User> user;

  Todo({
    required this.id,
    required this.description,
    this.isAvailable = false,
    BelongsTo<User>? user,
  }) : user = user ?? BelongsTo();

  @override
  String toString() => 'Todo(id: $id, text: $description, completed: $isAvailable)';
}

//flutter pub run build_runner watch
