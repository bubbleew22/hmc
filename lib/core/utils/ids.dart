import 'package:uuid/uuid.dart';

const _uuid = Uuid();

/// Internal record identities are UUID v4 strings.
String newId() => _uuid.v4();

/// Idempotency keys for sale submission (prevents duplicate saves on
/// double-tap / rotation / process death).
String newIdempotencyKey() => 'op_${_uuid.v4()}';
