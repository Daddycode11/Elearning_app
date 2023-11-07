import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:mobile_reviewer/models/questions.dart';
import 'package:mobile_reviewer/models/quiz.dart';

import 'package:uuid/uuid.dart';

class QuizRepository {
  final FirebaseFirestore _firestore;
  final FirebaseStorage _storage;
  late CollectionReference collectionReference;
  List<Quiz> _quizList = [];
  QuizRepository({FirebaseFirestore? firestore, FirebaseStorage? storage})
      : _firestore = firestore ?? FirebaseFirestore.instance,
        _storage = storage ?? FirebaseStorage.instance {
    collectionReference = _firestore.collection('quiz');
  }

  Stream<List<Quiz>> getAllQuiz() {
    return _firestore
        .collection('quiz')
        .orderBy('createdAt', descending: true)
        .snapshots()
        .map((QuerySnapshot<Map<String, dynamic>> snapshot) {
      return snapshot.docs.map((DocumentSnapshot<Map<String, dynamic>> doc) {
        return Quiz.fromJson(doc.data() ?? {});
      }).toList();
    });
  }

  Future<void> addQuiz(Quiz quiz) async {
    quiz.id = collectionReference.doc().id;
    await collectionReference.doc(quiz.id).set(quiz.toJson());
  }

  Future<String?> uploadFile(File file) async {
    try {
      final Reference storageRef = _storage
          .ref()
          .child('quiz')
          .child('${DateTime.now().millisecondsSinceEpoch}');
      final UploadTask uploadTask = storageRef.putFile(file);
      await uploadTask.whenComplete(() => null);
      final imageUrl = await storageRef.getDownloadURL();
      return imageUrl;
    } catch (e) {
      print('Error uploading file: $e');
      return null;
    }
  }

  Future<void> addQuestion(String quizID, Questions questions) async {
    questions.id = const Uuid().v4();
    await collectionReference.doc(quizID).update({
      'questions': FieldValue.arrayUnion([questions.toJson()])
    });
  }

  void setQuiz(List<Quiz> quizList) {
    _quizList = quizList;
  }

  List<Quiz> getQuiz() {
    return _quizList;
  }
}
