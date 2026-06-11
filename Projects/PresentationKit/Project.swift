import ProjectDescription
import ProjectDescriptionHelpers
import DependencyPlugin

let project = Project.makeModule(
    name: "PresentationKit",
    targets: [.framework],
    internalDependencies: [
        .Project.Module.Core,
        .Project.Module.DomainInterface
    ],
    externalDependencies: [
        .SPM.SnapKit,
        .SPM.Then,
        .SPM.Mixpanel
    ],
    hasResources: false
)
