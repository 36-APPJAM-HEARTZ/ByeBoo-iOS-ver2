
import ProjectDescription
import ProjectDescriptionHelpers
import DependencyPlugin

let project = Project.makeModule(
    name: "OnboardingFeature",
    targets: [.framework, .interface, .testing, .unitTest, .demo],
    internalDependencies: [
        .Project.Module.Core,
        .Project.Module.DesignSystem,
    ],
    externalDependencies: [
        .SPM.SnapKit,
        .SPM.Then,
        .SPM.Lottie,
        .SPM.Mixpanel
    ],
    interfaceDependencies: [
        .Project.Module.DomainInterface,
        .Project.Module.PresentationKit
    ],
    hasResources: true
)
