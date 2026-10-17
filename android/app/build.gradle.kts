import java.util.Properties
import java.io.FileInputStream

plugins {
    id("com.android.application")
    // The Flutter Gradle Plugin must be applied after the Android and Kotlin Gradle plugins.
    id("dev.flutter.flutter-gradle-plugin")
}

// Yükleme anahtarı: android/key.properties (CI'da gizli değerlerden yazılır; depoya girmez). Yoksa debug anahtarıyla imzalanır.
val keyProps = Properties().apply { val f = rootProject.file("key.properties"); if (f.exists()) load(FileInputStream(f)) }

// mssql_connection bir Flutter eklentisi değil: FreeTDS .so dosyalarını pub cache'ten jniLibs olarak al
val mssqlJni: String? = rootProject.file("../.dart_tool/package_config.json").takeIf { it.exists() }?.let { cfg ->
    Regex("\"name\"\\s*:\\s*\"mssql_connection\"\\s*,\\s*\"rootUri\"\\s*:\\s*\"file://([^\"]+)\"").find(cfg.readText())
        ?.groupValues?.get(1)?.let { "$it/android/src/main/jniLibs" }
}

android {
    namespace = "download.mastertool.master_tool"
    compileSdk = flutter.compileSdkVersion
    ndkVersion = flutter.ndkVersion

    compileOptions {
        sourceCompatibility = JavaVersion.VERSION_17
        targetCompatibility = JavaVersion.VERSION_17
    }

    defaultConfig {
        applicationId = "download.mastertool.master_tool"
        // You can update the following values to match your application needs.
        // For more information, see: https://flutter.dev/to/review-gradle-config.
        minSdk = flutter.minSdkVersion
        targetSdk = flutter.targetSdkVersion
        // Uses the version code from pubspec.yaml. When using split APKs, 1000 * ABI_VERSION
        // is added automatically by Flutter. (https://developer.android.com/studio/build/configure-apk-splits#configure-APK-versions)
        // You can force using the value of versionCode by specifying the `-P force-version-code-ignoring-abi=true`
        // flag during build.
        versionCode = flutter.versionCode
        versionName = flutter.versionName
    }

    sourceSets { getByName("main") { if (mssqlJni != null) jniLibs.srcDir(mssqlJni) } }

    signingConfigs {
        if (keyProps.isNotEmpty()) {
            create("release") {
                storeFile = rootProject.file(keyProps["storeFile"] as String)
                storePassword = keyProps["storePassword"] as String
                keyAlias = keyProps["keyAlias"] as String
                keyPassword = keyProps["keyPassword"] as String
            }
        }
    }

    buildTypes {
        release {
            signingConfig = if (keyProps.isNotEmpty()) signingConfigs.getByName("release") else signingConfigs.getByName("debug")
            isMinifyEnabled = true
            isShrinkResources = true
            proguardFiles(getDefaultProguardFile("proguard-android-optimize.txt"), "proguard-rules.pro")
        }
    }
}

kotlin {
    compilerOptions {
        jvmTarget = org.jetbrains.kotlin.gradle.dsl.JvmTarget.JVM_17
    }
}

dependencies {
    // Convert Master OCR — ML Kit Text Recognition v2 betik modelleri (Latin modeli google_mlkit_text_recognition eklentisiyle gelir:
    // com.google.mlkit:text-recognition:16.0.1). Modeller uygulamaya gömülüdür (bundled); Play hizmeti indirmesi gerekmez.
    implementation("com.google.mlkit:text-recognition-chinese:16.0.1")
    implementation("com.google.mlkit:text-recognition-devanagari:16.0.1")
    implementation("com.google.mlkit:text-recognition-japanese:16.0.1")
    implementation("com.google.mlkit:text-recognition-korean:16.0.1")
}

flutter {
    source = "../.."
}
