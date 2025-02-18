import java.util.Properties
import com.android.build.gradle.internal.dsl.BaseAppModuleExtension

plugins {
    id("com.android.application")
    id("kotlin-android")
    id("dev.flutter.flutter-gradle-plugin")
}

val keystorePropertiesFile = rootProject.file("key.properties")
val keystoreProperties = Properties().apply {
    if (keystorePropertiesFile.exists()) {
        load(keystorePropertiesFile.reader())
    }
}

val flutterRoot = project.findProperty("flutter.sdk") ?: error("Flutter SDK not found.")

android {
    namespace = "com.rosanatravel.app"
    compileSdk = flutter.get("compileSdkVersion") as Int
    ndkVersion = flutter.get("ndkVersion") as String

    compileOptions {
        sourceCompatibility = JavaVersion.VERSION_11
        targetCompatibility = JavaVersion.VERSION_11
    }

    kotlinOptions {
        jvmTarget = JavaVersion.VERSION_11.toString()
    }

    defaultConfig {
        applicationId = "com.rosanatravel.app"
        minSdk = flutter.get("minSdkVersion") as Int
        targetSdk = flutter.get("targetSdkVersion") as Int
        versionCode = flutter.get("versionCode") as Int
        versionName = flutter.get("versionName") as String
    }
    
    signingConfigs.create("release") {
    keyAlias = keystoreProperties["keyAlias"] as String?
    keyPassword = keystoreProperties["keyPassword"] as String?
    storeFile = keystoreProperties["storeFile"]?.toString()?.let { file(it) }
    storePassword = keystoreProperties["storePassword"] as String?
    }


    buildTypes {
        release {
            signingConfig = signingConfigs.getByName("release")
        }
    }
}

flutter {
    source = "../.."
}
