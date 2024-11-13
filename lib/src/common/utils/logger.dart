import 'package:logger/logger.dart';


Logger getLogger() {

  const Level level = Level.all;

  final LogPrinter printer = PrettyPrinter(methodCount: 4);

  final LogOutput output = ConsoleOutput();

  return Logger(level: Logger.level != Level.off ? level : null, printer: printer, output: output);
}

// ignore: non_constant_identifier_names
Logger Log = getLogger();
