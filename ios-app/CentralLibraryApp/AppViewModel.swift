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
        var issues: [String] = []
        if content.aboutParagraphs.isEmpty { issues.append("About section is empty.") }
        if content.collections.count < 6 { issues.append("Collections count is below expected website coverage.") }
        if content.hours.count < 3 { issues.append("Opening hours count is below expected website coverage.") }
        if content.events.count < 4 { issues.append("Events count is below expected website coverage.") }
        if content.contacts.count < 6 { issues.append("Contacts count is below expected website coverage.") }
        if content.modelViews.count < 6 { issues.append("3D view metadata is below expected website coverage.") }

        guard !issues.isEmpty else { return }
        let message = "Library content completeness warnings: " + issues.joined(separator: " ")
        print(message)
        assertionFailure(message)
    }
}
