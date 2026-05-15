import Foundation

enum AppLanguage: String, CaseIterable, Identifiable {
    case english = "en"
    case greek = "gr"

    var id: String { rawValue }

    var label: String {
        switch self {
        case .english: return "EN"
        case .greek: return "ΕΛ"
        }
    }
}

@MainActor
final class AppViewModel: ObservableObject {
    @Published var language: AppLanguage {
        didSet {
            UserDefaults.standard.set(language.rawValue, forKey: Self.languageKey)
        }
    }

    @Published private(set) var content: LibraryContent

    private static let languageKey = "library.app.language"

    init() {
        let saved = UserDefaults.standard.string(forKey: Self.languageKey)
        self.language = AppLanguage(rawValue: saved ?? "en") ?? .english
        self.content = ContentRepository.loadContent()
        validateCompleteness(content: content)
    }

    func toggleLanguage() {
        language = language == .english ? .greek : .english
    }

    private func validateCompleteness(content: LibraryContent) {
        assert(!content.aboutParagraphs.isEmpty, "About section must not be empty")
        assert(content.collections.count >= 6, "Collections should include all website entries")
        assert(content.hours.count >= 3, "Hours should include all website rows")
        assert(content.events.count >= 4, "Events should include all website events")
        assert(content.contacts.count >= 6, "Contacts should include all website items")
        assert(content.modelViews.count >= 6, "3D view descriptions should include all camera presets")
    }
}
