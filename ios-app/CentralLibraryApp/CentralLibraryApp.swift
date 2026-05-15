import SwiftUI

@main
struct CentralLibraryApp: App {
    @StateObject private var viewModel = AppViewModel()

    var body: some Scene {
        WindowGroup {
            RootTabView()
                .environmentObject(viewModel)
        }
    }
}
