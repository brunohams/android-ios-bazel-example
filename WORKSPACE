# ---- Rules for building Bullseye for iOS ----

# Imports http_archive
load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

# Swift Stuff
http_archive(
    name = "build_bazel_rules_swift",
    sha256 = "51efdaf85e04e51174de76ef563f255451d5a5cd24c61ad902feeadafc7046d9", # SHA prevents we download different version of the same package
    url = "https://github.com/bazelbuild/rules_swift/releases/download/1.2.0/rules_swift.1.2.0.tar.gz",
)

load(
    "@build_bazel_rules_swift//swift:repositories.bzl",
    "swift_rules_dependencies",
)

swift_rules_dependencies()

load(
    "@build_bazel_rules_swift//swift:extras.bzl",
    "swift_rules_extra_dependencies",
)

swift_rules_extra_dependencies()

# Apple Stuff
http_archive(
    name = "build_bazel_rules_apple",
    sha256 = "90e3b5e8ff942be134e64a83499974203ea64797fd620eddeb71b3a8e1bff681",
    url = "https://github.com/bazelbuild/rules_apple/releases/download/1.1.2/rules_apple.1.1.2.tar.gz",
)

load(
    "@build_bazel_rules_apple//apple:repositories.bzl",
    "apple_rules_dependencies",
)

apple_rules_dependencies()




# ---- Rules for building Bullseye for Android ----

android_sdk_repository(
    name = "androidsdk",
    api_level = 33,
    path = "/Users/brunohammes/Library/Android/sdk",
    build_tools_version = "30.0.3",
)

TOOLS_ANDROID_VERSION = "0.1" # or the latest version

http_archive(
    name = "tools_android",
    strip_prefix = "tools_android-%s" % TOOLS_ANDROID_VERSION,
    url = "https://github.com/bazelbuild/tools_android/archive/%s.tar.gz" % TOOLS_ANDROID_VERSION,
)

http_archive(
    name = "build_bazel_rules_android",
    urls = ["https://github.com/bazelbuild/rules_android/archive/v0.1.1.zip"],
    sha256 = "cd06d15dd8bb59926e4d65f9003bfc20f9da4b2519985c27e190cddc8b7a7806",
    strip_prefix = "rules_android-0.1.1",
)

# JVM Rules
RULES_JVM_EXTERNAL_TAG = "4.2"
RULES_JVM_EXTERNAL_SHA = "cd1a77b7b02e8e008439ca76fd34f5b07aecb8c752961f9640dea15e9e5ba1ca"

http_archive(
    name = "rules_jvm_external",
    strip_prefix = "rules_jvm_external-%s" % RULES_JVM_EXTERNAL_TAG,
    sha256 = RULES_JVM_EXTERNAL_SHA,
    url = "https://github.com/bazelbuild/rules_jvm_external/archive/%s.zip" % RULES_JVM_EXTERNAL_TAG,
)

# Reference to maven-install function
load("@rules_jvm_external//:defs.bzl", "maven_install")
maven_install(
    artifacts = [
        "androidx.core:core-ktx:1.3.2",
        "androidx.core:core:1.3.2",
        "androidx.appcompat:appcompat:1.4.1",
        "com.google.android.material:material:1.5.0",
        "androidx.constraintlayout:constraintlayout:2.1.3",
        "junit:junit:4.13.2",
        "androidx.test.ext:junit:1.1.3",
        "org.jetbrains.kotlinx:kotlinx-coroutines-android:1.4.1",
        "org.jetbrains.kotlinx:kotlinx-coroutines-core:1.4.1",
        "androidx.test.espresso:espresso-core:3.4.0",
        "androidx.lifecycle:lifecycle-runtime:2.2.0",
        "androidx.lifecycle:lifecycle-viewmodel-ktx:2.2.0",
        "androidx.lifecycle:lifecycle-common:2.2.0",
        "androidx.databinding:viewbinding:7.0.0-alpha02",
    ],
    repositories = [
        "https://maven.google.com",
        "https://jcenter.bintray.com",
        "https://repo1.maven.org/maven2",
    ],
    fetch_sources = True,
)

# Kotlin rules
rules_kotlin_version = "1.6.0"
rules_kotlin_sha = "a57591404423a52bd6b18ebba7979e8cd2243534736c5c94d35c89718ea38f94"
http_archive(
    name = "io_bazel_rules_kotlin",
    urls = ["https://github.com/bazelbuild/rules_kotlin/releases/download/v%s/rules_kotlin_release.tgz" % rules_kotlin_version],
    sha256 = rules_kotlin_sha,
)

load("@io_bazel_rules_kotlin//kotlin:repositories.bzl", "kotlin_repositories")
kotlin_repositories()

load("@io_bazel_rules_kotlin//kotlin:core.bzl", "kt_register_toolchains")
kt_register_toolchains()

# Remote stuff
http_archive(
    name = "io_buildbuddy_buildbuddy_toolchain",
    sha256 = "a2a5cccec251211e2221b1587af2ce43c36d32a42f5d881737db3b546a536510",
    strip_prefix = "buildbuddy-toolchain-829c8a574f706de5c96c54ca310f139f4acda7dd",
    urls = ["https://github.com/buildbuddy-io/buildbuddy-toolchain/archive/829c8a574f706de5c96c54ca310f139f4acda7dd.tar.gz"],
)

load("@io_buildbuddy_buildbuddy_toolchain//:deps.bzl", "buildbuddy_deps")

buildbuddy_deps()

load("@io_buildbuddy_buildbuddy_toolchain//:rules.bzl", "buildbuddy")

buildbuddy(name = "buildbuddy_toolchain")