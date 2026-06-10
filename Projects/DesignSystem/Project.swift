import ProjectDescription
import ProjectDescriptionHelpers
import DependencyPlugin

let project = Project.makeModule(
    name: "DesignSystem",
    targets: [.framework],
    internalDependencies: [
        .Project.Module.Core,
    ],
    externalDependencies: [
        .SPM.SnapKit,
        .SPM.Then,
        .SPM.Lottie,
    ],
    hasResources: true
)

