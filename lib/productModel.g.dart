// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'productModel.dart';

// **************************************************************************
// RepositoryGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, duplicate_ignore

mixin $TodoLocalAdapter on LocalAdapter<Todo> {
  static final Map<String, RelationshipMeta> _kTodoRelationshipMetas = {
    'tenantId': RelationshipMeta<User>(
      name: 'user',
      inverseName: 'todos',
      type: 'users',
      kind: 'BelongsTo',
      instance: (_) => (_ as Todo).user,
    )
  };

  @override
  Map<String, RelationshipMeta> get relationshipMetas =>
      _kTodoRelationshipMetas;

  @override
  Todo deserialize(map) {
    map = transformDeserialize(map);
    return _$TodoFromJson(map);
  }

  @override
  Map<String, dynamic> serialize(model, {bool withRelationships = true}) {
    final map = _$TodoToJson(model);
    return transformSerialize(map, withRelationships: withRelationships);
  }
}

final _todosFinders = <String, dynamic>{};

// ignore: must_be_immutable
class $TodoHiveLocalAdapter = HiveLocalAdapter<Todo> with $TodoLocalAdapter;

class $TodoRemoteAdapter = RemoteAdapter<Todo>
    with JSONPlaceholderAdapter<Todo>;

final internalTodosRemoteAdapterProvider = Provider<RemoteAdapter<Todo>>(
    (ref) => $TodoRemoteAdapter(
        $TodoHiveLocalAdapter(ref), InternalHolder(_todosFinders)));

final todosRepositoryProvider =
    Provider<Repository<Todo>>((ref) => Repository<Todo>(ref));

extension TodoDataRepositoryX on Repository<Todo> {
  JSONPlaceholderAdapter<Todo> get jSONPlaceholderAdapter =>
      remoteAdapter as JSONPlaceholderAdapter<Todo>;
}

extension TodoRelationshipGraphNodeX on RelationshipGraphNode<Todo> {
  RelationshipGraphNode<User> get user {
    final meta = $TodoLocalAdapter._kTodoRelationshipMetas['tenantId']
        as RelationshipMeta<User>;
    return meta.clone(
        parent: this is RelationshipMeta ? this as RelationshipMeta : null);
  }
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Todo _$TodoFromJson(Map<String, dynamic> json) => Todo(
      id: json['id'] as int,
      description: json['title'] as String,
      isAvailable: json['isAvailable'] as bool? ?? false,
      user: json['tenantId'] == null
          ? null
          : BelongsTo<User>.fromJson(json['tenantId'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$TodoToJson(Todo instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.description,
      'isAvailable': instance.isAvailable,
      'tenantId': instance.user,
    };
