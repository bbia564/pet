import 'dart:math';

import 'package:pet_manager/app/customs/pet_model.dart';
import 'package:pet_manager/app/customs/pm_share_per.dart';
import 'package:pet_manager/app/modules/detailList/detail_list_controller.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:get/get.dart';

class PMDBTool extends GetxService {
  late Database db;

  Future<PMDBTool> init() async {
    await initDB();
    return this;
  }

  initDB() async {
    var databasesPath = await getDatabasesPath();
    String path = join(databasesPath, 'pm_db.db');

    db = await openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
      await createTable(db);
    });

    refreshHomeData();
  }

  void refreshHomeData() async {
    final hasData = PMSharedPreferences.getBool("has_initail_pet") ?? false;
    if (hasData) {
      if (Get.isRegistered<DetailListController>()) {
        Get.find<DetailListController>().loadAllDatas();
      }
      return;
    }

    await Future.delayed(const Duration(milliseconds: 300));

    final newModel = PetModel();
    newModel.name = "Kitty";
    newModel.photo = "";
    newModel.birth = DateTime(2023, 10, 23).millisecondsSinceEpoch;
    newModel.createTime = DateTime.now().millisecondsSinceEpoch;
    await insertPetDate(newModel);

    final newModel1 = PetModel();
    newModel1.name = "Tom";
    newModel1.photo = "Tom";
    newModel1.birth = DateTime(2022, 9, 11).millisecondsSinceEpoch;
    newModel1.createTime = DateTime.now().millisecondsSinceEpoch;
    await insertPetDate(newModel1);

    for (var i = 0; i < 2; i++) {
      final photo = i == 0 ? "" : "Tom";
      final pid = 1 + i;

      final PetModel tempmodel = i == 0 ? newModel : newModel1;

      

      final eventModel = PMEventModel();
      eventModel.event = "Pet vaccine";
      eventModel.petId = pid;
      eventModel.name = tempmodel.name;
      eventModel.birth = tempmodel.birth;
      eventModel.photo = photo;
      eventModel.eventTime =
          DateTime(2024, 7 + Random().nextInt(5), 3 + Random().nextInt(28))
              .millisecondsSinceEpoch;
      eventModel.createTime = tempmodel.createTime;
      await PMDBTool().insertEventModel(eventModel);

      final eventModel2 = PMEventModel();
      eventModel2.event = "Expelling parasite";
      eventModel2.petId = pid;
      eventModel2.name = tempmodel.name;
      eventModel2.birth = tempmodel.birth;
      eventModel2.photo = photo;
      eventModel2.eventTime =
          DateTime(2024, 7 + Random().nextInt(5), 3 + Random().nextInt(28))
              .millisecondsSinceEpoch;
      eventModel2.createTime = tempmodel.createTime;
      await PMDBTool().insertEventModel(eventModel2);

      final eventModel3 = PMEventModel();
      eventModel3.event = "Pet Wash";
      eventModel3.petId = pid;
      eventModel3.name = tempmodel.name;
      eventModel3.birth = tempmodel.birth;
      eventModel3.photo = photo;
      eventModel3.eventTime =
          DateTime(2024, 7 + Random().nextInt(5), 3 + Random().nextInt(28))
              .millisecondsSinceEpoch;
      eventModel3.createTime = tempmodel.createTime;
      await PMDBTool().insertEventModel(eventModel3);
    }

    await PMSharedPreferences.putBool("has_initail_pet", true);

    if (Get.isRegistered<DetailListController>()) {
      Get.find<DetailListController>().loadAllDatas();
    }
  }

  createTable(Database db) async {
    await db.execute(
        'CREATE TABLE IF NOT EXISTS  pet_list (pet_id INTEGER PRIMARY KEY AUTOINCREMENT , name TEXT  , birth INT, photo TEXT, createTime INT)');
    await db.execute(
        'CREATE TABLE IF NOT EXISTS events_list (id INTEGER PRIMARY KEY AUTOINCREMENT, pet_id INT, event TEXT, eventTime INT,createTime INT,name TEXT  , birth INT, photo TEXT,FOREIGN KEY (pet_id) REFERENCES events_list(pet_id))');
  }

  insertPetDate(PetModel pet) async {
    var databasesPath = await getDatabasesPath();
    String path = join(databasesPath, 'pm_db.db');
    db = await openDatabase(path,
        version: 1, onCreate: (Database db, int version) async {});
    await db.insert('pet_list', {
      'name': pet.name,
      'birth': pet.birth,
      'photo': pet.photo,
      'createTime': pet.createTime,
    });
  }

  insertEventModel(PMEventModel item) async {
    var databasesPath = await getDatabasesPath();
    String path = join(databasesPath, 'pm_db.db');
    db = await openDatabase(path,
        version: 1, onCreate: (Database db, int version) async {});
    await db.insert('events_list', {
      'pet_id': item.petId,
      'event': item.event,
      'eventTime': item.eventTime,
      'name': item.name,
      'birth': item.birth,
      'photo': item.photo,
      "createTime": item.createTime,
    });
  }

  updatePetModel(PetModel petModel) async {
    var databasesPath = await getDatabasesPath();
    String path = join(databasesPath, 'pm_db.db');

    db = await openDatabase(path,
        version: 1, onCreate: (Database db, int version) async {});
    await db.update(
        'pet_list',
        {
          'name': petModel.name,
          'birth': petModel.birth,
          'photo': petModel.photo,
          'createTime': petModel.createTime,
        },
        where: 'pet_id = ?',
        whereArgs: [
          petModel.id,
        ]);
  }

  deletePet(int id) async {
    var databasesPath = await getDatabasesPath();
    String path = join(databasesPath, 'pm_db.db');
    db = await openDatabase(path,
        version: 1, onCreate: (Database db, int version) async {});
    db.delete('pet_list', where: 'pet_id = ?', whereArgs: [id]);
  }

  deleteEvent(int id) async {
    var databasesPath = await getDatabasesPath();
    String path = join(databasesPath, 'pm_db.db');
    db = await openDatabase(path,
        version: 1, onCreate: (Database db, int version) async {});
    db.delete('events_list', where: 'id = ?', whereArgs: [id]);
  }

  clean() async {
    var databasesPath = await getDatabasesPath();
    String path = join(databasesPath, 'pm_db.db');
    db = await openDatabase(path,
        version: 1, onCreate: (Database db, int version) async {});
    // await db.delete('pet_list');
    await db.delete('events_list');
  }

  Future<List<PetModel>> getPetDatas() async {
    var databasesPath = await getDatabasesPath();
    String path = join(databasesPath, 'pm_db.db');

    db = await openDatabase(path,
        version: 1, onCreate: (Database db, int version) async {});
    var result = await db.query('pet_list', orderBy: 'pet_id DESC');
    print(result);
    return result.map((e) => PetModel.fromJson(e)).toList();
  }

  Future<List<PMEventModel>> getEvents({int? id}) async {
    var databasesPath = await getDatabasesPath();
    String path = join(databasesPath, 'pm_db.db');

    db = await openDatabase(path,
        version: 1, onCreate: (Database db, int version) async {});
    if (id != null) {
      var result = await db.query('events_list',
          where: 'pet_id = ?', whereArgs: [id], orderBy: 'id DESC');
      return result.map((e) => PMEventModel.fromJson(e)).toList();
    }
    var result = await db.query('events_list', orderBy: 'id DESC');

    return result.map((e) => PMEventModel.fromJson(e)).toList();
  }
}
