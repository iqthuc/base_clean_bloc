plugins {
    id("com.android.application")
    id("kotlin-android")
    // The Flutter Gradle Plugin must be applied after the Android and Kotlin Gradle plugins.
    id("dev.flutter.flutter-gradle-plugin")
    id ("com.google.gms.google-services")
}

android {
    namespace = "com.example.base_clean_bloc"
    compileSdk = flutter.compileSdkVersion
    ndkVersion = "27.0.12077973"

    compileOptions {
        isCoreLibraryDesugaringEnabled = true
        sourceCompatibility = JavaVersion.VERSION_11
        targetCompatibility = JavaVersion.VERSION_11
    }

    kotlinOptions {
        jvmTarget = JavaVersion.VERSION_11.toString()
    }

    defaultConfig {
        // TODO: Specify your own unique Application ID (https://developer.android.com/studio/build/application-id.html).
        applicationId = "com.example.base_clean_bloc"
        // You can update the following values to match your application needs.
        // For more information, see: https://flutter.dev/to/review-gradle-config.
        minSdk = flutter.minSdkVersion
        targetSdk = flutter.targetSdkVersion
        versionCode = flutter.versionCode
        versionName = flutter.versionName
    }

    buildTypes {
        release {
            // TODO: Add your own signing config for the release build.
            // Signing with the debug keys for now, so `flutter run --release` works.
            signingConfig = signingConfigs.getByName("debug")
        }
    }
    flavorDimensions += "app" // Sử dụng += để thêm vào danh sách

    productFlavors {
        create("dev") {
            dimension = "app"
            resValue("string", "app_name", "Base Bloc Flutter 3 Dev")
            applicationId = "com.example.base_clean_bloc.dev"
        }
        create("staging") {
            dimension = "app"
            resValue("string", "app_name", "Base Bloc Flutter 3 Staging")
            applicationId = "com.example.base_clean_bloc.staging"
        }
        create("production") {
            dimension = "app" // Nên thêm dimension cho production flavor để nhất quán
            resValue("string", "app_name", "Base Bloc Flutter 3")
        }
    }
}

flutter {
    source = "../.."
}

dependencies {
    // implementation "org.jetbrains.kotlin:kotlin-stdlib-jdk7:$kotlin_version"
    implementation(platform("com.google.firebase:firebase-bom:33.15.0"))
    implementation("com.google.firebase:firebase-analytics-ktx")
    implementation("com.android.support:multidex:2.0.1")
    coreLibraryDesugaring("com.android.tools:desugar_jdk_libs:2.1.4")
}