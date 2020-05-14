import 'dart:async';
import 'package:flutter/material.dart';
import 'package:vogu/core/models/task.dart';
import '../../locator.dart';
import '../services/api.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class TaskCRUD extends ChangeNotifier {
  Api _api = locator<Api>();

  String path = 'tasks';
  List<Task> tasks;

  Future<List<Task>> fetchTasks() async {
    var result = await _api.getDataCollection(this.path);
    tasks = result.documents
        .map((doc) => Task.fromMap(doc.data, doc.documentID))
        .toList();
    return tasks;
  }

  Stream<QuerySnapshot> fetchTasksAsStream() {
    return _api.streamDataCollection(this.path);
  }

  Future<Task> getTaskById(String id) async {
    var doc = await _api.getDocumentById(this.path, id);
    return Task.fromMap(doc.data, doc.documentID);
  }

  Future removeTask(String id) async {
    await _api.removeDocument(this.path, id);
    return;
  }

  Future updateTask(Task data, String id) async {
    await _api.updateDocument(this.path, data.toJson(), id);
    return;
  }

  Future addTask(Task data) async {
    var result = await _api.addDocument(this.path, data.toJson());

    return result;
  }
}
