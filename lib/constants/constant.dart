 import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

import '../model/model.dart';

const Color kprimaryColor=Color(0xff62FCD7);
const String boxName="NoteBoxName";
var NoteBox=Hive.box<NoteModel>(boxName);