# Useful Commands for Flutter & CMD

## Command Line (CMD) Commands
| Command | Description |
|---------|-------------|
| `cd..` | Remove last path |
| `cd path` | Add path |
| `mkdir folder_name` | Make a new folder |
| `mkdir folder_name1 folder_name2 folder_name3` | Make multiple folders |
| `code .` | Open VS Code |

---

## Flutter Commands

### Create & Analyze
| Command | Description |
|---------|-------------|
| `flutter create my_app` | Create a new Flutter app |
| `flutter analyze` | Analyze project for errors |
| `flutter test` | Run tests |
| `flutter clean` | Clean build cache |

### Fix Issues
| Command | Description |
|---------|-------------|
| `dart fix --dry-run` | Preview proposed fixes |
| `dart fix --apply` | Apply proposed fixes |

### Package Management
| Command | Description |
|---------|-------------|
| `flutter pub get` | Fetch dependencies |
| `flutter pub outdated` | Check outdated dependencies |
| `flutter pub upgrade` | Upgrade dependencies |

### Running & Building for Web
| Command | Description |
|---------|-------------|
| `flutter run -d chrome` | Run in Chrome (default renderer) |
| `flutter build web --release` | Build web app in release mode (default renderer) |
| `flutter build web --web-renderer canvaskit --release` | Build web app with CanvasKit renderer |
| `flutter run -d chrome --web-renderer html --profile` | Run in profile mode using HTML renderer |

### Package Installation & Removal
| Command | Description |
|---------|-------------|
| `flutter pub add [package_name]` | Add a package |
| `flutter pub remove [package_name]` | Remove a package |
| `flutter pub add --dev [package_name]` | Add a dev dependency |
| `flutter pub add --dev hive_generator` | Add Hive Generator as a dev dependency |
| `flutter pub add --dev json_serializable` | Add JSON Generator as a dev dependency |

### Build Runner
| Command | Description |
|---------|-------------|
| `flutter packages pub run build_runner build` | Run build runner |
| `flutter pub run build_runner build --delete-conflicting-outputs` | Run build runner and delete conflicting outputs |

### Directory Creation Using CMD
| Command | Description |
|---------|-------------|
| `mkdir assets/images` | Create an images folder in assets |
| `mkdir assets/fonts` | Create a fonts folder in assets |

---

This structured format ensures readability and easy reference for developers working with Flutter and command-line tools.

