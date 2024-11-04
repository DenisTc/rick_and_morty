# RickAndMorty
<table>
 
  <tr>
    <td><img src="https://github.com/user-attachments/assets/57a77f0a-31e3-42cd-a0ee-94d05bb7d5d2" width=270></td>
    <td>Проект RickAndMorty — это приложение на Flutter, которое использует Rick and Morty API для получения данных о персонажах. Приложение построено с использованием архитектурных принципов и разделения на слои данных, домена и представления.</td>
  </tr>
</table>

## Скриншоты
<table>
  <tr>
    <td>Главный экран</td>
    <td>Экран описания персонажа</td>
  </tr>
  <tr>
    <td><img src="https://github.com/user-attachments/assets/3f635f08-8d95-47bd-8acd-c30ea1ed79d6" width=270></td>
    <td><img src="https://github.com/user-attachments/assets/78419154-17ab-4d52-92a7-f357dde082f1" width=270></td>
  </tr>
</table>


## Требования

- **Flutter SDK**: 3.24.4
- **Dart SDK**: 3.5.4

## Запуск проекта

1. Убедитесь, что у вас установлен Flutter SDK версии 3.24.4 и Dart SDK версии 3.5.4.
2. Установите зависимости, выполнив команду:
   ```bash
   flutter pub get
   ```
3. Запустите проект на эмуляторе или подключенном устройстве:
   ```bash
   flutter run
   ```
## Используемые плагины

### State Management
- `mobx: ^2.4.0`
- `flutter_mobx: ^2.2.1+1`
- `provider: ^6.1.2`

### Network
- `dio: ^5.7.0`
- `cached_network_image: ^3.4.1`

### UI
- `pull_to_refresh: ^2.0.0`
- `shimmer: ^3.0.0`

### Storage
- `shared_preferences: ^2.3.2`

### DI
- `get_it: ^8.0.2`
- `injectable: ^2.5.0`

## Структура проекта

```markdown
lib/
└── src/
    ├── core/
    │   ├── enums/
    │   ├── extension/
    │   ├── icons/gen/
    │   ├── localization/
    │   ├── network/
    │   ├── services/
    │   ├── theme/
    │   ├── utils/
    │   └── widgets/
    └── feature/
        ├── character_details/
        │   ├── data/
        │   │   ├── datasource/
        │   │   └── repos/
        │   ├── domain/
        │   │   ├── repository/
        │   │   └── usecases/
        │   ├── presentation/
        │   │   └── widgets/
        │   └── store/
        └── characters/
            ├── data/
            │   ├── datasource/
            │   ├── models/
            │   └── repos/
            ├── domain/
            │   ├── repository/
            │   └── usecases/
            ├── presentation/
            │   └── widgets/
            └── store/
