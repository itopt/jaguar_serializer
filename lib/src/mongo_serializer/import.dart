library serializer.mongo_serializer;

import 'package:mongo_dart/mongo_dart.dart' as mgo;
import 'package:serialize/src/map_serializer/import.dart';

abstract class SerializableToMongo {
  MapSerializer get mongoSerializer;
}

@DefineFieldProcessor()
class MongoId implements FieldProcessor {
  final Symbol field;

  const MongoId(this.field);

  String from(mgo.ObjectId input) {
    return input.toHexString();
  }

  mgo.ObjectId to(String value) {
    return new mgo.ObjectId.fromHexString(value);
  }
}

class MongoRefId {
  const MongoRefId();
}