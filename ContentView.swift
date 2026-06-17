import SwiftUI

struct ContentView: View {
    @State private var selectedFolder = ""
    @State private var status = "Pronto"

    var body: some View {
        VStack(spacing: 20) {
            Text("BuildHappy")
                .font(.largeTitle)

            Text(selectedFolder)
                .lineLimit(2)

            Button("Selecionar Projeto") {
                let panel = NSOpenPanel()
                panel.canChooseDirectories = true
                panel.canChooseFiles = false

                if panel.runModal() == .OK {
                    selectedFolder = panel.url?.path ?? ""
                }
            }

            Button("Gerar APP") {
                status = AppBuilder.buildApp(from: selectedFolder)
            }

            Button("Gerar DMG") {
                status = DMGBuilder.buildDMG(from: selectedFolder)
            }

            Text(status)
        }
        .padding()
        .frame(width: 500, height: 300)
    }
}
