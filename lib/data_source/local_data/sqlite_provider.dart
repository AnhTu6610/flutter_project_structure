import 'package:flutter/foundation.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class SqliteProvider {
  // ignore: non_constant_identifier_names
  final String _DBNAME = kReleaseMode ? "SQLDBPRO" : "SQLDBDEV";
  static const String TABLETRANSACTION = "TABLETRANSACTION";
  static Database? database;
  Future openDB() async {
    var databasesPath = await getDatabasesPath();
    String path = join(databasesPath, _DBNAME);
    database = await openDatabase(
      path,
      version: 1,
      onCreate: (Database db, int version) async {
        await db.execute(
            'CREATE TABLE $TABLETRANSACTION(hash TEXT PRIMARY KEY, isNatives INTEGER, blockHash TEXT, blockNumber TEXT, froms TEXT, gas TEXT, gasPrice TEXT, tos TEXT, value TEXT, amount TEXT, date TEXT, statuss INTEGER)');
      },
    );
  }

  // Future insertTransaction(TransactionDetail transaction) async {
  //   var value = {
  //     "isNatives": transaction.isNative ? 1 : 0,
  //     "blockHash": transaction.blockHash ?? "",

  //   };
  //   int result = await database.insert(TABLETRANSACTION, value);
  //   log(result, "Result insert");
  //   return result;
  // }

  // Future<List<TransactionDetail>> getTransactions() async {
  //   List<TransactionDetail> transactions = [];
  //   List<Map<String, Object>> result = await database.query(TABLETRANSACTION);
  //   result.forEach((e) {
  //     var newTransaction = Map<String, dynamic>.from(e);
  //     newTransaction['from'] = newTransaction['froms'];

  //     newTransaction.remove('statuss');
  //     transactions.add(TransactionDetail.fromJson(newTransaction));
  //   });
  //   return transactions;
  // }

  // Future<List<TransactionDetail>> getTransactionsByCoin(bool isNative, String token) async {
  //   List<TransactionDetail> transactions = [];

  //   List<Map<String, Object>> result = [];
  //   if (isNative) {
  //     result = await database.query(TABLETRANSACTION, where: "isNatives = ?", whereArgs: [1]);
  //   } else {
  //     result = await database.query(TABLETRANSACTION, where: "tos = ?", whereArgs: [token]);
  //   }
  //   result.forEach((e) {
  //     var newTransaction = Map<String, dynamic>.from(e);

  //     newTransaction.remove('statuss');
  //     transactions.add(TransactionDetail.fromJson(newTransaction));
  //   });
  //   return transactions;
  // }

  // Future updateTransaction(TransactionDetail transaction) async {
  //   var values = {
  //     "isNatives": transaction.isNative ? 1 : 0,

  //   };
  //   return await database.update(TABLETRANSACTION, values, where: 'hash = ?', whereArgs: [transaction.hash]);
  // }

  Future deleteDB(String table) async {
    database?.delete("$table");
  }

  Future close() async => database?.close();
}
