import ProjectDescription

public enum ConfigPlugin {
    public static let baseSettings: SettingsDictionary = [
        "SWIFT_VERSION": "6.0",
        "SWIFT_ACTIVE_COMPILATION_CONDITIONS": "$(inherited) SWIFT6",
        "KAKAO_NATIVE_APP_KEY": "$(KAKAO_NATIVE_APP_KEY)",
        "BASE_URL": "$(BASE_URL)"
    ]
    
    public static let projectSettings: Settings = .settings(
        base: baseSettings,
        configurations: [
            .debug(name: "Debug", xcconfig: .relativeToRoot("Shared/Configuration/DEV.xcconfig")),
            .release(name: "Release", xcconfig: .relativeToRoot("Shared/Configuration/PROD.xcconfig"))
        ],
        defaultSettings: .recommended
    )
}
