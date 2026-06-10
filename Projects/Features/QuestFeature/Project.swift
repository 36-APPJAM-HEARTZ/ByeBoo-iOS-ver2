
import ProjectDescription
import ProjectDescriptionHelpers
import DependencyPlugin

let project = Project.makeModule(
    name: "QuestFeature",
    targets: [.framework, .interface, .testing, .unitTest, .demo],
    internalDependencies: [
        .Project.Module.DomainInterface,
        .Project.Module.Core,
        .Project.Module.DesignSystem
    ],
    externalDependencies: [
        .SPM.SnapKit,
        .SPM.Then,
        .SPM.Lottie
    ],
    hasResources: true
)
