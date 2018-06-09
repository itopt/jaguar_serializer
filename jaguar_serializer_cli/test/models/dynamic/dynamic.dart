import 'package:collection/collection.dart';
import 'package:jaguar_serializer/jaguar_serializer.dart';

part 'dynamic.jser.dart';

class DynamicModel {
  dynamic scalar;
  List<dynamic> list;
  Map<String, dynamic> map;

  DynamicModel({this.scalar, this.list, this.map});

  bool operator ==(other) {
    if (other is DynamicModel)
      return scalar == other.scalar &&
          new DeepCollectionEquality().equals(list, other.list) &&
          new DeepCollectionEquality().equals(map, other.map);
    return false;
  }
}

@GenSerializer()
class DynamicModelSerializer extends Serializer<DynamicModel>
    with _$DynamicModelSerializer {
  // TODO
}
