
import ProjectDescription
import ProjectDescriptionHelpers
import DependencyPlugin

let project = Project.makeModule(
    name: "MainTabFeature",
    targets: [.framework, .interface, .testing, .unitTest, .demo],
    internalDependencies: [
        .Project.Module.Core,
        .Project.Module.DesignSystem,
    ],
    externalDependencies: [
        .SPM.SnapKit,
        .SPM.Then,
        .SPM.Lottie,
        .SPM.Mixpanel,
        .SPM.Needle
    ],
    interfaceDependencies: [
        .Project.Module.DomainInterface,
        .Project.Module.PresentationKit,
        
        .Project.Features.Home,
        .Project.Features.Quest,
        .Project.Features.MyPage,
        .Project.Features.Tutorial
    ],
    hasResources: true
)
