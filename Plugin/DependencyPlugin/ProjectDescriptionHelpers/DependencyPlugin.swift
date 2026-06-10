import ProjectDescription

public extension TargetDependency {
    struct Project {
        public struct Features {}
        public struct Module {}
    }
}

public extension TargetDependency.Project.Features {
    static func feature(name: String) -> TargetDependency {
        .project(target: "\(name)Feature", path: .relativeToRoot("Projects/Features/\(name)Feature"))
    }
    static func interface(name: String) -> TargetDependency {
        .project(target: "\(name)FeatureInterface", path: .relativeToRoot("Projects/Features/\(name)Feature"))
    }
    static func testing(name: String) -> TargetDependency {
        .project(target: "\(name)FeatureTesting", path: .relativeToRoot("Projects/Features/\(name)Feature"))
    }
}

public extension TargetDependency.Project.Module {
    static let Domain = TargetDependency.project(target: "Domain", path: .relativeToRoot("Projects/Domain"))
    static let Data = TargetDependency.project(target: "Data", path: .relativeToRoot("Projects/Data"))
    static let Core = TargetDependency.project(target: "Core", path: .relativeToRoot("Projects/Core"))
    static let DesignSystem = TargetDependency.project(target: "DesignSystem", path: .relativeToRoot("Projects/DesignSystem"))
}

public extension TargetDependency {
    enum SPM {}
}

public extension TargetDependency.SPM {
    static let Alamofire = TargetDependency.external(name: "Alamofire")
    static let Firebase = TargetDependency.external(name: "Firebase")
    static let FirebaseMessaging = TargetDependency.external(name: "FirebaseMessaging")
    static let KakaoSDKAuth = TargetDependency.external(name: "KakaoSDKAuth")
    static let KakaoSDKUser = TargetDependency.external(name: "KakaoSDKUser")
    static let Lottie = TargetDependency.external(name: "Lottie")
    static let SnapKit = TargetDependency.external(name: "SnapKit")
    static let Kingfisher = TargetDependency.external(name: "Kingfisher")
    static let Mixpanel = TargetDependency.external(name: "Mixpanel")
    static let Then = TargetDependency.external(name: "Then")
}

