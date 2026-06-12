import ProjectDescription

let workspace = Workspace(
    name: "ByeBoo",
    projects: [
        "Projects/App",
        "Projects/Features/**",
        "Projects/Domain",
        "Projects/Data",
        "Projects/Core",
        "Projects/DesignSystem",
        "Projects/PresentationKit",
        "Projects/DataSource/Persistence",
        "Projects/DataSource/Network",
    ]
)
