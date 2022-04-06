import ProjectDescription
import ProjectDescriptionHelpers

let targetActions = [ 
    TargetScript.pre(
        path: "Scripts/SwiftLintRun.sh",
        arguments: [],
        name: "SwiftLint"
    )
]

let baseSettings = SettingsDictionary()
    .currentProjectVersion("30.0.0")
    .bitcodeEnabled(false)
    .swiftVersion("4.2")


let istTarget = Target(
    name: "IST",
    platform: .iOS,
    product: .app,
    bundleId: "com.test.ist",
    deploymentTarget: .iOS(targetVersion: "10.0", devices: .iphone),
    infoPlist:.file(path: "Plists/Prod-Info.plist"), //"Plists/Prod-Info.plist",
    sources: ["Targets/IST/Sources/*.swift"],
    resources: [
        "Targets/IST/Resources/LaunchScreen.storyboard",
        "Targets/IST/Resources/*.xcassets",
        "Targets/IST/Resources/**"
    ] 
    //scripts: targetActions
)

let project = Project(
    
    name: "App",
    organizationName: "IST",
    settings: .settings(base: baseSettings),
    targets : [  istTarget  ]

)
