load("@build_bazel_rules_apple//apple:ios.bzl", "ios_application", "ios_unit_test")
load("@build_bazel_rules_swift//swift:swift.bzl", "swift_library")

MINIMUM_OS_VERSION = "14.0"

swift_library(
    name = "tests",
    testonly = True, # Need this to run tests
    module_name = "BullseyeTests",
    srcs = glob(["BullseyeTests/*.swift"]),
    visibility = ["//visibility:private"],
    deps = [":sources"],
)

swift_library(
    name = "sources",
    module_name = "Bullseye",
    srcs = glob(["Bullseye/Sources/*.swift"]),
    visibility = ["//visibility:private"],
)


ios_unit_test(
    name = "iostests",
    minimum_os_version = MINIMUM_OS_VERSION,
    test_host = ":myfirstapp",
    platform_type = "ios",
    deps = [":tests"],
    visibility = ["//visibility:public"],
)

ios_application(
    name = "myfirstapp",
    bundle_id = "com.example.bullseye",
    families = ["iphone", "ipad"],
    infoplists = ["Bullseye/App/Info.plist"],
    resources = glob(["Bullseye/App/Assets.xcassets/**"]),
    minimum_os_version = MINIMUM_OS_VERSION,
    deps = [":sources"],
    visibility = ["//visibility:public"],
)