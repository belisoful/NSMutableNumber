// swift-tools-version:5.9
import PackageDescription

let package = Package(
    name: "NSMutableNumber",
    platforms: [
        .macOS(.v11),
        .iOS(.v12),
        .tvOS(.v12),
        .watchOS(.v4),
    ],
    products: [
        .library(name: "NSMutableNumber", targets: ["NSMutableNumber"]),
    ],
    targets: [
        .target(
            name: "NSMutableNumber",
            path: "Sources/NSMutableNumber"
            // Public header: include/NSMutableNumber.h (pure Objective-C).
            // NSMutableNumber.hpp stays a private C++ header, consumed only by the .mm.
        ),
        // The XCTest suite (Tests/NSMutableNumberTests.m) runs through the Xcode project
        // and CI via xcodebuild. It is not wired as a SwiftPM test target: a Swift test
        // target depending on this Objective-C++ target trips a SwiftPM build-cycle bug
        // in the current toolchain. `swift build` and Swift consumption are unaffected.
    ],
    cLanguageStandard: .gnu17,
    cxxLanguageStandard: .gnucxx20
)
