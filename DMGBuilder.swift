import Foundation

class AppBuilder {

    static func buildApp(from path: String) -> String {

        guard !path.isEmpty else {
            return "Nenhuma pasta selecionada"
        }

        let appName = "MyApp"
        let appPath = "\(path)/\(appName).app"

        do {
            try FileManager.default.createDirectory(
                atPath: "\(appPath)/Contents/MacOS",
                withIntermediateDirectories: true
            )

            return "APP criado com sucesso!"
        } catch {
            return error.localizedDescription
        }
    }
}

class DMGBuilder {

    static func buildDMG(from path: String) -> String {

        let process = Process()

        process.executableURL = URL(fileURLWithPath: "/usr/bin/hdiutil")

        process.arguments = [
            "create",
            "-volname",
            "BuildHappy",
            "-srcfolder",
            path,
            "\(path)/BuildHappy.dmg"
        ]

        do {
            try process.run()
            process.waitUntilExit()

            return "DMG criado com sucesso!"
        } catch {
            return error.localizedDescription
        }
    }
}
