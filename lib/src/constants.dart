import 'package:uuid/uuid.dart';

/// The UUID generator to use.
const _uuid = Uuid();

/// Generate a new id.
String newId() => _uuid.v7();
