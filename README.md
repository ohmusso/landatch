# landatch

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

## dev command

### flutter doctor

validate flutter development enviroment

### flutter run

run app

### flutter test

execute test/*_test.dart

### flutter pub run build_runner build --delete-conflicting-outputs

run packages: freezed, mockito, json_serializable

#### error log when execute without --delete-conflicting-outputs

[INFO] Checking for unexpected pre-existing outputs....
[INFO] Found 3 declared outputs which already exist on disk. This is likely because the`.dart_tool/build` folder was deleted, or you are submitting generated files to your source repository.
[SEVERE] Conflicting outputs were detected and the build is unable to prompt for permission to remove them. These outputs must be removed manually or the build can be run with `--delete-conflicting-outputs`. The outputs are: lib/web_api/webland.freezed.dart
test/webland_test.mocks.dart
lib/web_api/webland.g.dart
pub finished with exit code 78

### flutter gen-l10n

if add localization, execute this command
generate at /.dart_tool/flutter_gen/gen_l10n
