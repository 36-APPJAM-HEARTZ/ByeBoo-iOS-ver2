import ProjectDescription
import ProjectDescriptionHelpers
import DependencyPlugin

let project = Project.makeModule(
    name: "Data",
    targets: [.framework],
    internalDependencies: [
        .Project.Module.DomainInterface,
        .Project.Module.Core
    ],
    externalDependencies: [
        .SPM.Alamofire
    ]
)

