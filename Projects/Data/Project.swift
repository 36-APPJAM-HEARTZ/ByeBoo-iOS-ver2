import ProjectDescription
import ProjectDescriptionHelpers
import DependencyPlugin

let project = Project.makeModule(
    name: "Data",
    targets: [.framework, .interface, .testing],
    internalDependencies: [
        .Project.Module.DomainInterface,
        .Project.Module.Core
    ],
    externalDependencies: [
        .SPM.Alamofire,
        .SPM.KakaoSDKUser,
        .SPM.FirebaseMessaging
    ]
)

