import 'package:atitus_persistence_study/model/credit_card.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

Future<Database> getDatabase() async {
  return openDatabase(
    join(await getDatabasesPath(), 'cards.db'),
    onCreate: (db, version) {
      return db.execute(
        'CREATE TABLE cards(number TEXT PRIMARY KEY, flag TEXT)',
      );
    },
    version: 1,
  );
}

Future<void> insertCard(CreditCard card) async {
  final db = await getDatabase();

  await db.insert(
    'cards',
    card.toMap(),
    conflictAlgorithm: ConflictAlgorithm.replace,
  );
}

Future<List<CreditCard>> listCards() async {
  final db = await getDatabase();

  final List<Map<String, Object?>> cardMaps = await db.query('cards');

  return [
    for (final {'number': number as String, 'flag': flag as String} in cardMaps)
      CreditCard(number: number, flag: flag),
  ];
}
