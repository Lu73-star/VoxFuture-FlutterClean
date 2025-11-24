# VoxFuture Flutter App

## Overview
VoxFuture is a Flutter web application for AI-powered predictions. The app features a dark theme with gold accents and includes user authentication, prediction services, history tracking, and subscription plans.

## Project Setup
- **Language**: Dart 3.8
- **Framework**: Flutter 3.32.0
- **Platform**: Web (configured for Replit environment)

## Recent Changes
- **2024-11-24**: Initial project import and setup
  - Extracted and reorganized Flutter project from GitHub import
  - Cleaned up deeply nested directory structure
  - Removed Firebase dependencies (simplified for initial deployment)
  - Fixed package naming inconsistencies
  - Configured Flutter web to run on port 5000 with 0.0.0.0 binding
  - Created simplified authentication (ready for backend integration)
  - Fixed splash screen to use icon instead of missing image assets

## Project Architecture

### Directory Structure
```
lib/
├── main.dart                 # App entry point
├── app_theme.dart           # Global theme configuration
├── config/
│   ├── app_routes.dart      # Route configuration
│   ├── config.dart          # App configuration
│   └── keys.dart            # API keys (use env vars in production)
├── models/
│   ├── prediction_model.dart
│   ├── subscription_model.dart
│   └── user_model.dart
├── navigation/
│   └── app_navigation.dart  # Navigation helpers
├── screens/
│   ├── home_screen.dart
│   ├── login_screen.dart
│   ├── register_screen.dart
│   ├── history_screen.dart
│   ├── prediction_screen.dart
│   ├── plans_screen.dart
│   └── splash_screen.dart
├── services/
│   ├── auth_service.dart
│   └── prediction_service.dart
├── utils/
│   └── custom_colors.dart
└── widgets/
    ├── input_field.dart
    └── primary_button.dart
```

### Key Features
- **Authentication**: Login and registration screens (currently simplified, ready for backend)
- **Navigation**: Route-based navigation with named routes
- **Theming**: Dark theme with gold (#FFA800) primary color
- **Screens**: Home, Login, Register, History, Predictions, Plans

## Development Workflow
- Run the app: The Flutter Web Server workflow automatically runs on port 5000
- The app uses hot reload for rapid development
- Access the app through the Replit webview

## Dependencies
- `http`: For API calls
- `flutter_lints`: Code quality and linting

## Security Configuration

### API Keys
The app uses Replit Secrets for secure API key management:

1. **OpenAI API Key Configuration**:
   - Go to the Secrets tab in Replit (🔒 icon in sidebar)
   - Add a new secret with key: `OPENAI_API_KEY`
   - Paste your OpenAI API key as the value
   - The workflow automatically passes this to Flutter via `--dart-define`

2. **How it works**:
   - The workflow command includes `--dart-define=OPENAI_API_KEY=${OPENAI_API_KEY:-}`
   - This passes the secret from Replit to the Flutter app at compile time
   - The deployment build also includes this configuration
   - The prediction service validates the key before making API calls

3. **Key Features**:
   - No API keys are committed to source code
   - Keys are injected at build/run time
   - Helpful error messages if key is not configured
   - Network error handling included

## Notes
- Firebase integration was removed for simplification - can be re-added later
- Image assets exist but were replaced with icons for splash screen
- The app is configured for web deployment with proper host settings for Replit
- All API keys use environment variables (Replit Secrets) - never commit keys to source code
- The splash screen automatically redirects to login after 3 seconds

## Future Enhancements
- Add Firebase authentication for real user management
- Integrate with prediction API (OpenAI key configuration ready)
- Implement subscription management
- Add persistent storage for prediction history
- Add user profile management
