import ProjectDescription
import ProjectDescriptionHelpers
import DependencyPlugin

let project = Project.makeModule(
    name: "ByeBoo",
    targets: [.app],
    internalDependencies: [
        .Project.Module.Core,
        .Project.Features.Splash,
        .Project.Features.MainTab,
        .Project.Features.Onboarding
    ],
    hasResources: true
)
