import 'dart:io';
import 'package:path_provider/path_provider.dart';

class Daemon {
  static const BIN_PATH_DEBUG = '/Users/pierozi/Project/github/peervault/PeerVault-Client/build/macos/Build/Products/Debug/Peervault.app/Contents/MacOS/io.plab.peervault';
  static const BIN_PATH_MACOS = '/Applications/Peervault.app/Contents/MacOS/io.plab.peervault';
  static const BIN_PATH_LINUX = '';

  static const DEFAULT_RELAY = '/ip4/37.187.1.229/tcp/23003/ipfs/QmeFecyqtgzYx1TFN9vYTroMGNo3DELtDZ63FpjqUd6xfW';

  int _pid = 0;
  int exitCode = 0; // For debug purpose when process are stopped
  bool running = false;

  Future<String> get _appPath async {
    final directory = await getLibraryDirectory();

    return '${directory.path}/PeerVault';
  }

  Future<File> get _pidFile async {
    final path = await _appPath;
    return File('$path/peervault-daemon.pid');
  }

  Future<bool> start({int level: 3}) async {
    if (this.running) {
      return false;
    }

    String bin;
    List<String> options;
    final appPath = await _appPath;

    if (Platform.isMacOS) {
      bin = BIN_PATH_MACOS;
    }

    if (Platform.isLinux) {
      bin = BIN_PATH_LINUX;
    }

    options = [
      '--log', '$level',
      '--relay', DEFAULT_RELAY,
      '--bbolt', '$appPath/bbolt.db',
    ];

    // ONLY DURING DEV
    assert(() {
      bin = BIN_PATH_DEBUG;
      options = [
        '-dev',
        '--log', '9',
        '--relay', DEFAULT_RELAY,
        '--bbolt', '$appPath/bbolt.db',
      ];
      return true;
    }());

    var result = await Process.start(
      bin,
      options,
    );

    this.running = true;
    this._pid = result.pid;

    stdout.addStream(result.stdout);
    stderr.addStream(result.stderr);

    var pidFile = await _pidFile;
    await pidFile.writeAsString('${this._pid}');

    return true;
  }

  // TODO try to watch when flutter app close in order to SIGTERM the PeerVault Daemon
  watch() {
    //sleep(new Duration(seconds:5));
    print(pid);
    ProcessSignal.sighup.watch().listen((event) {
      print(event);
    });
    ProcessSignal.sigusr1.watch().listen((event) {
      print(event);
    });
    ProcessSignal.sigusr2.watch().listen((event) {
      print(event);
    });
    ProcessSignal.sigwinch.watch().listen((event) {
      print(event);
    });
  }

  Future<String> status() async {
    var pidFile = await _pidFile;
    if (!pidFile.existsSync()) {
      return 'stopped';
    }
    this._pid = int.parse(pidFile.readAsStringSync());
    return 'stopped';

    // TODO OPERATION NOT PERMITTED DUE TO SANDBOX MODE
    //var psResult = Process.runSync('/bin/ps', ['-p', '${this._pid}'], runInShell: true);
    //var psResult = Process.runSync('kill', ['-0', ' ${this._pid}'], runInShell: true);
    //var psResult = Process.runSync('kill', ['-0', '16029'], runInShell: true, includeParentEnvironment: false);

    /*if (0 == psResult.exitCode) {
      this.running = true;
      return 'running';
    } else {
      this.running = false;
      return 'stopped';
    }*/
  }

  stop() {
    // TODO OPERATION NOT PERMITTED DUE TO SANDBOX MODE
    if (this._pid > 0) {
      Process.killPid(this._pid, ProcessSignal.sigterm);
      this._pid = 0;
      this.running = false;

      _pidFile.then((pidFile) {
        pidFile.delete();
      });
    }
  }

  Future<bool> restart() async {
    this.stop();
    return await this.start();
  }
}