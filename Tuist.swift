import ProjectDescription

let tuist = Tuist(
    project: .tuist(
        plugins: [
            .local(path: .relativeToRoot("Plugin/DependencyPlugin")),
            .local(path: .relativeToRoot("Plugin/ConfigPlugin")),
            .local(path: .relativeToRoot("Plugin/EnvPlugin")),
            .local(path: .relativeToRoot("Plugin/UtilityPlugin"))
        ]
    )
)
