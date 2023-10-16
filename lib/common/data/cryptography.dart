// // Copyright 2022 QSoft, Ltd. All rights reserved.

// import 'package:encrypt/encrypt.dart' as encrypt;

// class Cryptography {
//   //For AES Encryption/Decryption
//   encrypt.Key? key;
//   encrypt.Encrypter? encrypter;
//   encrypt.IV? iv;
//   Cryptography({this.key, this.encrypter, this.iv});

//   String encryptAES(String plainText) {
//     if (plainText == '') {
//       return '';
//     } else {
//       final encrypted = encrypter!.encrypt(plainText, iv: iv);
//       return encrypted.base64;
//     }
//   }

//   String decryptAES(String cypherText) {
//     if (cypherText == '') {
//       return '';
//     } else {
//       final decrypted = encrypter!.decrypt64(cypherText, iv: iv);
//       return decrypted;
//     }
//   }

//   Map<String, Object?> encryptMap({
//     Map<String, Object?> map = const {},
//     List<String> cryptoFields = const [],
//   }) {
//     Map<String, Object?> encryptedMap = {};
//     for (var key in map.keys) {
//       var value = map[key];
//       if (cryptoFields.contains(key) && value != null && value != '') {
//         encryptedMap[key] = encryptAES(value.toString());
//       } else {
//         encryptedMap[key] = value;
//       }
//     }
//     return encryptedMap;
//   }

//   Map<String, Object?> decryptMap({
//     Map<String, Object?> map = const {},
//     List<String> cryptoFields = const [],
//   }) {
//     Map<String, Object?> decryptedMap = {};
//     for (var key in map.keys) {
//       var value = map[key];
//       if (cryptoFields.contains(key) && value != null && value != '') {
//         decryptedMap[key] = decryptAES(value.toString());
//       } else {
//         decryptedMap[key] = value;
//       }
//     }
//     return decryptedMap;
//   }

//   List<String> encryptStringList({
//     List<String>? stringList = const [],
//   }) {
//     List<String> encryptedList = [];
//     if (stringList != null) {
//       for (var value in stringList) {
//         if (value.isNotEmpty) {
//           encryptedList.add(encryptAES(value));
//         } else {
//           encryptedList.add(value);
//         }
//       }
//       return encryptedList;
//     }
//     return encryptedList;
//   }

//   List<String> decryptStringList({
//     List<String>? stringList = const [],
//   }) {
//     List<String> decryptedList = [];
//     if (stringList != null) {
//       for (var value in stringList) {
//         if (value.isNotEmpty) {
//           decryptedList.add(decryptAES(value));
//         } else {
//           decryptedList.add(value);
//         }
//       }
//       return decryptedList;
//     }
//     return decryptedList;
//   }
// }
