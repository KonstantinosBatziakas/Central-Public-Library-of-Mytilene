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
    private static let minimumCollectionsCount = 6
    private static let minimumHoursCount = 3
    private static let minimumEventsCount = 4
    private static let minimumContactsCount = 6
    private static let minimumModelViewsCount = 6

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
        if content.collections.count < Self.minimumCollectionsCount { issues.append("Collections count is below expected website coverage.") }
        if content.hours.count < Self.minimumHoursCount { issues.append("Opening hours count is below expected website coverage.") }
        if content.events.count < Self.minimumEventsCount { issues.append("Events count is below expected website coverage.") }
        if content.contacts.count < Self.minimumContactsCount { issues.append("Contacts count is below expected website coverage.") }
        if content.modelViews.count < Self.minimumModelViewsCount { issues.append("3D view metadata is below expected website coverage.") }

        guard !issues.isEmpty else { return }
        let message = "Library content completeness warnings: " + issues.joined(separator: " ")
        print(message)
        assertionFailure(message)
    }
}
