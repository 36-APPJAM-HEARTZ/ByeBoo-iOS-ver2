//
//  Feature.swift
//  Manifests
//
//  Created by 최주리 on 6/9/26.
//

import ProjectDescription

let nameAttribute = Template.Attribute.required("name")

let template = Template(
    description: "Feature 모듈 템플릿",
    attributes: [nameAttribute],
    items: [
        .file(
            path: "Projects/Features/\(nameAttribute)/Project.swift",
            templatePath: "Project.stencil"
        ),
        .file(
            path: "Projects/Features/\(nameAttribute)/Sources/\(nameAttribute).swift",
            templatePath: "Sources.stencil"
        ),
        .file(
            path: "Projects/Features/\(nameAttribute)/Interface/\(nameAttribute)Interface.swift",
            templatePath: "Interface.stencil"
        ),
        .file(
            path: "Projects/Features/\(nameAttribute)/Testing/\(nameAttribute)Testing.swift",
            templatePath: "Testing.stencil"
        ),
        .file(
            path: "Projects/Features/\(nameAttribute)/Tests/\(nameAttribute)Tests.swift",
            templatePath: "UnitTests.stencil"
        ),
        .file(
            path: "Projects/Features/\(nameAttribute)/Demo/AppDelegate.swift",
            templatePath: "DemoAppDelegate.stencil"
        ),
        .file(
            path: "Projects/Features/\(nameAttribute)/Resources/.gitkeep",
            templatePath: "Gitkeep.stencil"
        ),
    ]
)
