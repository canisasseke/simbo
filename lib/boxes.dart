import 'package:simbo_1/model/client.dart';
import 'package:hive/hive.dart';

class Boxes {
  static Box<Client> getClient() => Hive.box<Client>('client');
}
