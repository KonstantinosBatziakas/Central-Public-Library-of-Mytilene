import SwiftUI

struct RootTabView: View {
    @EnvironmentObject private var model: AppViewModel

    var body: some View {
        NavigationStack {
            TabView {
                HomeView()
                    .tabItem { Label(tabTitle("Home", "Αρχική"), systemImage: "house.fill") }

                LibraryInfoView()
                    .tabItem { Label(tabTitle("Library Info", "Πληροφορίες"), systemImage: "building.columns.fill") }

                CollectionsView()
                    .tabItem { Label(tabTitle("Collections", "Συλλογές"), systemImage: "books.vertical.fill") }

                EventsView()
                    .tabItem { Label(tabTitle("Events", "Εκδηλώσεις"), systemImage: "calendar") }

                VisitContactView()
                    .tabItem { Label(tabTitle("Visit", "Επίσκεψη"), systemImage: "mappin.and.ellipse") }

                Experience3DView()
                    .tabItem { Label(tabTitle("3D", "3D"), systemImage: "cube.transparent.fill") }
            }
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button(action: model.toggleLanguage) {
                        Text(model.language == .english ? "EN / ΕΛ" : "ΕΛ / EN")
                            .font(.caption.bold())
                            .frame(minWidth: 64, minHeight: 44)
                    }
                    .buttonStyle(.borderedProminent)
                    .tint(Theme.warmAccent.opacity(0.85))
                    .accessibilityLabel(tabTitle("Switch language", "Αλλαγή γλώσσας"))
                    .accessibilityHint(tabTitle("Toggles between English and Greek", "Εναλλάσσει Αγγλικά και Ελληνικά"))
                    .accessibilityValue(model.language == .english ? "English" : "Ελληνικά")
                }
            }
        }
    }

    private func tabTitle(_ en: String, _ gr: String) -> String {
        model.language == .greek ? gr : en
    }
}
