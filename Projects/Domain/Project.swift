import ProjectDescription
import ProjectDescriptionHelpers
import DependencyPlugin

let project = Project.makeModule(
    name: "Domain",
    targets: [.framework, .interface, .unitTest],
    internalDependencies: [
        .Project.Module.Core,
    ],
    unitTestDependencies: [
        .Project.Module.DataTesting
    ]
)

