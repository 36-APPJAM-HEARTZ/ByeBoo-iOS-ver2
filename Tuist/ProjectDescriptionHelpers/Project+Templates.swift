//
//  Project+Templates.swift
//  Manifests
//
//  Created by 최주리 on 6/9/26.
//

import ProjectDescription
import EnvPlugin
import DependencyPlugin

public extension Project {
    private static let baseSettings: SettingsDictionary = [
        "SWIFT_VERSION": "6.0",
//        "SWIFT_UPCOMING_FEATURE_STRICT_CONCURRENCY": "complete", // 엄격한 동시성 체크 활성화
        "SWIFT_ACTIVE_COMPILATION_CONDITIONS": "$(inherited) SWIFT6"
    ]
    
    static func makeModule(
        name: String,
        targets: Set<FeatureTarget>,
        internalDependencies: [TargetDependency] = [],
        externalDependencies: [TargetDependency] = [],
        interfaceDependencies: [TargetDependency] = [],
        hasResources: Bool = false
    ) -> Project {
        
        let deploymentTargets: DeploymentTargets = .iOS(AppEnvironment.deploymentTarget)
        let bundlePrefix = AppEnvironment.bundlePrefix
        
        var projectTargets: [Target] = []
        
        // MARK: - Interface
        if targets.contains(.interface) {
            projectTargets.append(
                .target(
                    name: "\(name)Interface",
                    destinations: .iOS,
                    product: .staticFramework,
                    bundleId: "\(bundlePrefix).\(name)Interface",
                    deploymentTargets: deploymentTargets,
                    sources: ["Interface/**"],
                    dependencies: interfaceDependencies,
                    settings: .settings(base: baseSettings)
                )
            )
        }
        
        // MARK: - Framework
        if targets.contains(.framework) {
            projectTargets.append(
                .target(
                    name: name,
                    destinations: .iOS,
                    product: .staticFramework,
                    bundleId: "\(bundlePrefix).\(name)",
                    deploymentTargets: deploymentTargets,
                    sources: ["Sources/**"],
                    resources: hasResources ? ["Resources/**"] : [],
                    dependencies: internalDependencies + externalDependencies + (targets.contains(.interface) ? [.target(name: "\(name)Interface")] : []),
                    settings: .settings(base: baseSettings)
                )
            )
        }
        
        // MARK: - Testing
        if targets.contains(.testing) {
            projectTargets.append(
                .target(
                    name: "\(name)Testing",
                    destinations: .iOS,
                    product: .staticFramework,
                    bundleId: "\(bundlePrefix).\(name)Testing",
                    deploymentTargets: deploymentTargets,
                    sources: ["Testing/**"],
                    dependencies: targets.contains(.interface) ? [.target(name: "\(name)Interface")] : [],
                    settings: .settings(base: baseSettings)
                )
            )
        }
        
        // MARK: - Unit Test
        if targets.contains(.unitTest) {
            projectTargets.append(
                .target(
                    name: "\(name)Tests",
                    destinations: .iOS,
                    product: .unitTests,
                    bundleId: "\(bundlePrefix).\(name)Tests",
                    deploymentTargets: deploymentTargets,
                    sources: ["Tests/**"],
                    dependencies: [
                        .target(name: name),
                        targets.contains(.testing) ? .target(name: "\(name)Testing") : nil
                    ].compactMap { $0 },
                    settings: .settings(base: baseSettings)
                )
            )
        }
        
        // MARK: - Demo
        if targets.contains(.demo) {
            projectTargets.append(
                .target(
                    name: "\(name)Demo",
                    destinations: .iOS,
                    product: .app,
                    bundleId: "\(bundlePrefix).\(name)Demo",
                    deploymentTargets: deploymentTargets,
                    infoPlist: .extendingDefault(with: [
                        "UILaunchScreen": .dictionary([:]),
                        "UIApplicationSceneManifest": .dictionary([
                            "UIApplicationSupportsMultipleScenes": .boolean(false),
                            "UISceneConfigurations": .dictionary([
                                "UIWindowSceneSessionRoleApplication": .array([
                                    .dictionary([
                                        "UISceneConfigurationName": .string("Default Configuration"),
                                        "UISceneDelegateClassName": .string("$(PRODUCT_MODULE_NAME).SceneDelegate"),
                                    ])
                                ])
                            ])
                        ])
                    ]),
                    sources: ["Demo/**"],
                    resources: hasResources ? ["Demo/Resources/**"] : [],
                    dependencies: [
                        .target(name: name),
                        targets.contains(.testing) ? .target(name: "\(name)Testing") : nil
                    ].compactMap { $0 },
                    settings: .settings(base: baseSettings)
                )
            )
        }
        
        // MARK: - App
        if targets.contains(.app) {
            let needleScript = TargetScript.pre(
                script: "export PATH=$PATH:/opt/homebrew/bin; needle generate $SRCROOT/Sources/DI/NeedleGenerated.swift $SRCROOT/../../Projects/",
                name: "Needle Generate",
                basedOnDependencyAnalysis: false
            )
            
            projectTargets.append(
                .target(
                    name: name,
                    destinations: .iOS,
                    product: .app,
                    bundleId: "\(bundlePrefix).\(name)",
                    deploymentTargets: deploymentTargets,
                    infoPlist: .extendingDefault(with: [
                        "UILaunchScreen": .dictionary([:]),
                        "UIApplicationSceneManifest": .dictionary([
                            "UIApplicationSupportsMultipleScenes": .boolean(false),
                            "UISceneConfigurations": .dictionary([
                                "UIWindowSceneSessionRoleApplication": .array([
                                    .dictionary([
                                        "UISceneConfigurationName": .string("Default Configuration"),
                                        "UISceneDelegateClassName": .string("$(PRODUCT_MODULE_NAME).SceneDelegate"),
                                    ])
                                ])
                            ])
                        ]),
                        "UIDesignRequiresCompatibility": .boolean(true),
                    ]),
                    sources: ["Sources/**"],
                    resources: hasResources ? ["Resources/**"] : [],
                    scripts: [needleScript],
                    dependencies: internalDependencies + externalDependencies + [.SPM.Needle],
                    settings: .settings(base: baseSettings)
                )
            )
        }
        
        
        return Project(
            name: name,
            targets: projectTargets
        )
    }
}

