import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:miztli/ui/app.dart';

void main() => runApp(
      ProviderScope(
        child: Miztli(),
      ),
    );
