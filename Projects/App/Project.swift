import ProjectDescription
import ProjectDescriptionHelpers
import DependencyPlugin

let project = Project.makeModule(
    name: "ByeBoo",
    targets: [.app],
    internalDependencies: [
        .Project.Module.Core,
        .Project.Module.DomainInterface,
        .Project.Module.Domain,
        .Project.Module.Data,
        
        .Project.Features.Splash,

        .Project.Features.MainTab,
        .Project.Features.Onboarding,
    ],
    hasResources: true
)
