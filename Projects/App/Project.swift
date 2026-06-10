import ProjectDescription
import ProjectDescriptionHelpers
import DependencyPlugin

let project = Project.makeModule(
    name: "ByeBoo",
    targets: [.app],
    internalDependencies: [
        .Project.Module.Core,
    ],
    hasResources: true
)
