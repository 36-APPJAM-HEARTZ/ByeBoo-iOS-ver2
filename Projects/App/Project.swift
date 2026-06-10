import ProjectDescription
import ProjectDescriptionHelpers
import DependencyPlugin

let project = Project.makeModule(
    name: "ByeBoo",
    targets: [.app],
    internalDependencies: [
        .Project.Module.Core,
        .Project.Features.feature(name: "Splash"),
        .Project.Features.feature(name: "MainTab"),
        .Project.Features.feature(name: "Onboarding")
    ],
    hasResources: true
)
