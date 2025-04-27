import java.util.Properties
import java.io.FileInputStream

val keystoreProperties = Properties()
val keystorePropertiesFile = rootProject.file("key.properties")
if (keystorePropertiesFile.exists()) {
    keystoreProperties.load(FileInputStream(keystorePropertiesFile))
}

plugins {
    id("com.android.application")
    id("kotlin-android")
    // The Flutter Gradle Plugin must be applied after the Android and Kotlin Gradle plugins.
    id("dev.flutter.flutter-gradle-plugin")
}

// App signing by Google Play
extra["googlePlayAppSigningEnabled"] = false

android {
    namespace = "de.transfairs.nt_unlock"
    compileSdk = flutter.compileSdkVersion
    //ndkVersion = flutter.ndkVersion
    ndkVersion = "27.0.12077973"

    compileOptions {
        sourceCompatibility = JavaVersion.VERSION_11
        targetCompatibility = JavaVersion.VERSION_11
    }

    kotlinOptions {
        jvmTarget = JavaVersion.VERSION_11.toString()
    }

    defaultConfig {
        // TODO: Specify your own unique Application ID (https://developer.android.com/studio/build/application-id.html).
        applicationId = "de.transfairs.nt_unlock"
        // You can update the following values to match your application needs.
        // For more information, see: https://flutter.dev/to/review-gradle-config.
        minSdk = flutter.minSdkVersion
        targetSdk = flutter.targetSdkVersion
        versionCode = flutter.versionCode
        versionName = flutter.versionName
    }

//    signingConfigs {
//        create("release") {
//            keyAlias = keystoreProperties["keyAlias"] as String
//            keyPassword = keystoreProperties["keyPassword"] as String
//            storeFile = file(keystoreProperties["storeFile"] as String)
//            storePassword = keystoreProperties["storePassword"] as String
//        }
//    }

    buildTypes {
        release {
            // signingConfig = signingConfigs.getByName("release") // Own signing
            isMinifyEnabled = false
            isShrinkResources = false
            if (project.hasProperty("googlePlayAppSigningEnabled") && project.extra["googlePlayAppSigningEnabled"].toString().toBoolean()) {
                // Google Play signs
                signingConfig = null
            } else {
                // Signing with the debug keys for now, so `flutter run --release` works.
                signingConfig = signingConfigs.getByName("debug")
            }
             proguardFiles(
                getDefaultProguardFile("proguard-android-optimize.txt"),
                "proguard-rules.pro"
            )
        }
    }
}

flutter {
    source = "../.."
}
