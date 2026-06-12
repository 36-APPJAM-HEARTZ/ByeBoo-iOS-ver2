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
    
    // Features
    static let Home = feature(name: "Home")
    static let MainTab = feature(name: "MainTab")
    static let MyPage = feature(name: "MyPage")
    static let Onboarding = feature(name: "Onboarding")
    static let Quest = feature(name: "Quest")
    static let Splash = feature(name: "Splash")
    static let Tutorial = feature(name: "Tutorial")
}

public extension TargetDependency.Project.Module {
    static let DomainInterface = TargetDependency.project(target: "DomainInterface", path: .relativeToRoot("Projects/Domain"))
    static let Data = TargetDependency.project(target: "Data", path: .relativeToRoot("Projects/Data"))
    static let Core = TargetDependency.project(target: "Core", path: .relativeToRoot("Projects/Core"))
    static let DesignSystem = TargetDependency.project(target: "DesignSystem", path: .relativeToRoot("Projects/DesignSystem"))
    static let PresentationKit = TargetDependency.project(target: "PresentationKit", path: .relativeToRoot("Projects/PresentationKit"))
    static let Persistence = TargetDependency.project(target: "Persistence", path: .relativeToRoot("Projects/DataSource/Persistence"))
    static let Network = TargetDependency.project(target: "Network", path: .relativeToRoot("Projects/DataSource/Network"))
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

