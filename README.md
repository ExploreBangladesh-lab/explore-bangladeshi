# Explore Bangladesh — Android MVP

A Flutter Android app starter for exploring tourist destinations in Bangladesh.
This first version is offline-first and does not require Firebase or a website.

## Features
- Bengali / English language switch
- Home page with sample destinations
- Search by destination name, district, or division
- Destination detail page
- Favorites saved locally with SharedPreferences
- Responsive Material 3 UI

## Build requirements
Install Flutter SDK and Android Studio, then run:

```bash
flutter create explore_bangladesh
# Replace the generated pubspec.yaml and lib/ with the files in this package.
flutter pub get
flutter run
```

To build an APK:
```bash
flutter build apk --release
```

APK output:
`build/app/outputs/flutter-apk/app-release.apk`

## Notes
- This package is source code, not a prebuilt APK.
- Destination entries are starter sample data; confirm current fees, opening hours, access restrictions, and travel guidance before publishing.
- The app uses remote image URLs for illustrative photos, so photos require internet. Text data and favorites work locally.

## Build APK from an Android phone (GitHub Actions)
This repository includes `.github/workflows/build-apk.yml` so the APK can be built in GitHub's cloud runner without installing Flutter on your phone.

1. Sign in to GitHub in your phone browser and create a new repository named `explore-bangladesh`.
2. Upload the contents of this ZIP into the repository's `main` branch. Make sure `.github/workflows/build-apk.yml` is uploaded too.
3. Open the repository's **Actions** tab and select **Build Explore Bangladesh APK**.
4. Tap **Run workflow** (or wait for the workflow to run after the upload), then open the completed run.
5. Under **Artifacts**, download `explore-bangladesh-apk`. Extract the downloaded artifact ZIP to find `app-release.apk`.
6. Open the APK on your phone and allow installation from that source if Android asks. Only install APKs from repositories you control and trust.

The first build can take several minutes. GitHub may ask you to sign in or verify your account. This is a cloud build; the APK has not been built until the workflow completes successfully.
