# Pokemon BLoC Flutter

A modern Flutter application demonstrating the implementation of BLoC pattern for state management while displaying a list of Pokemon from the PokeAPI.

## Features

- **Clean Architecture**: Implements Domain-Driven Design with clear separation of concerns
- **BLoC Pattern**: Uses flutter_bloc for predictable state management
- **Dependency Injection**: Get_it for service locator pattern
- **Error Handling**: Comprehensive error handling with retry functionality
- **Responsive UI**: Grid layout with Material Design 3
- **Network Images**: Loads Pokemon sprites with proper loading and error states

## Architecture

This project follows Clean Architecture principles with the following layers:

```
lib/
├── core/
│   └── di/                 # Dependency injection setup
├── data/
│   ├── repositories/       # Repository implementations
│   └── response/           # API response models
├── domain/
│   ├── entities/           # Business entities
│   ├── repositories/       # Repository contracts
│   └── use_cases/          # Business logic use cases
└── presentation/
    ├── bloc/               # BLoC state management
    └── pages/              # UI screens
```

## Dependencies

- **flutter_bloc**: ^8.1.3 - State management with BLoC pattern
- **http**: ^1.1.0 - HTTP client for API calls
- **get_it**: ^7.6.4 - Service locator for dependency injection
- **equatable**: ^2.0.5 - Value equality for state objects

## Getting Started

### Prerequisites

- Flutter SDK (>=3.5.4)
- Dart SDK
- Android Studio / VS Code
- An IDE with Flutter plugin

### Installation

1. Clone the repository:
```bash
git clone https://github.com/yourusername/pokemon_bloc_flutter.git
cd pokemon_bloc_flutter
```

2. Install dependencies:
```bash
flutter pub get
```

3. Run the app:
```bash
flutter run
```

## API

This app uses the [PokeAPI](https://pokeapi.co/) to fetch Pokemon data. No API key required.

**Endpoints used:**
- `GET /api/v2/pokemon?limit=20&offset=0` - Fetch list of Pokemon

## Project Structure

### Core
- **Service Locator**: Manages dependency injection using get_it

### Data Layer
- **PokemonRepositoryImpl**: Implements the repository interface with HTTP calls
- **PokemonResponse**: Models for API response parsing

### Domain Layer
- **Pokemon Entity**: Core business model
- **PokemonRepository**: Repository contract/interface
- **FetchPokemonListUseCase**: Business logic for fetching Pokemon list

### Presentation Layer
- **PokemonListBloc**: Manages the state of Pokemon list
- **PokemonListScreen**: UI for displaying Pokemon grid
- **States**: Loading, Loaded, Error, Initial
- **Events**: LoadPokemonList, RetryLoadPokemonList

## State Management

The app uses BLoC pattern with the following states:

- **PokemonListInitial**: Initial state when the app starts
- **PokemonListLoading**: Shows loading indicator while fetching data
- **PokemonListLoaded**: Displays the Pokemon grid when data is successfully loaded
- **PokemonListError**: Shows error message with retry button when something goes wrong

## UI Features

- **Grid Layout**: Responsive 2-column grid of Pokemon cards
- **Loading States**: Shimmer effect and progress indicators
- **Error Handling**: User-friendly error messages with retry functionality
- **Image Loading**: Progressive image loading with fallback icons
- **Interactive Cards**: Tap feedback with snackbar messages

## Building

### Android
```bash
flutter build apk --release
```

### iOS
```bash
flutter build ios --release
```

### Web
```bash
flutter build web --release
```

## Testing

Run the tests:
```bash
flutter test
```

## Contributing

1. Fork the repository
2. Create your feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add some amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

## License

This project is open source and available under the [MIT License](LICENSE).

## Screenshots

| Pokemon List | Loading State | Error State |
|--------------|---------------|-------------|
| Grid of Pokemon cards | Loading spinner | Error with retry button |

## What's Next?

Potential enhancements:
- Pokemon detail screen
- Search and filter functionality
- Favorites system
- Offline caching
- Unit and integration tests
- CI/CD pipeline

## Learn More

- [Flutter Documentation](https://docs.flutter.dev/)
- [BLoC Pattern](https://bloc.dev/)
- [PokeAPI Documentation](https://pokeapi.co/docs/v2)
- [Clean Architecture](https://blog.cleancoder.com/uncle-bob/2012/08/13/the-clean-architecture.html)