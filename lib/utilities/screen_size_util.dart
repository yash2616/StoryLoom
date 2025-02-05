import 'package:flutter/cupertino.dart';

Size _getSize(BuildContext context) => MediaQuery.of(context).size;

double displayHeight(BuildContext context) => _getSize(context).height;

double displayWidth(BuildContext context) => _getSize(context).width;