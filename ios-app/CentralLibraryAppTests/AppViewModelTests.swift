import XCTest
@testable import CentralLibraryApp

@MainActor
final class AppViewModelTests: XCTestCase {
    private let languageKey = "library.app.language"

    func testLanguageTogglePersistsAcrossInstances() {
        let suiteName = "AppViewModelTests.\(UUID().uuidString)"
        guard let defaults = UserDefaults(suiteName: suiteName) else {
            XCTFail("Unable to create test defaults suite")
            return
        }
        defer { defaults.removePersistentDomain(forName: suiteName) }

        let content = completeContentFixture()
        let first = AppViewModel(defaults: defaults, contentLoader: { content })
        XCTAssertEqual(first.language, .english)

        first.toggleLanguage()
        XCTAssertEqual(defaults.string(forKey: languageKey), AppLanguage.greek.rawValue)

        let second = AppViewModel(defaults: defaults, contentLoader: { content })
        XCTAssertEqual(second.language, .greek)
    }

    func testUsesInjectedContentLoader() {
        let suiteName = "AppViewModelTests.\(UUID().uuidString)"
        guard let defaults = UserDefaults(suiteName: suiteName) else {
            XCTFail("Unable to create test defaults suite")
            return
        }
        defer { defaults.removePersistentDomain(forName: suiteName) }

        let content = completeContentFixture()
        let viewModel = AppViewModel(defaults: defaults, contentLoader: { content })

        XCTAssertEqual(viewModel.content.collections.count, 6)
        XCTAssertEqual(viewModel.content.events.count, 4)
        XCTAssertEqual(viewModel.content.modelViews.count, 6)
    }

    private func completeContentFixture() -> LibraryContent {
        let text = LocalizedText(en: "EN", gr: "GR")
        return LibraryContent(
            appTitle: text,
            aboutTitle: text,
            aboutParagraphs: [text, text],
            stats: [
                LibraryStat(value: "55,000+", label: text),
                LibraryStat(value: "1913", label: text),
                LibraryStat(value: "2", label: text),
                LibraryStat(value: "4", label: text)
            ],
            collections: Array(repeating: CollectionItem(icon: "📚", title: text, description: text), count: 6),
            hours: Array(repeating: OpeningHour(day: text, time: text, closed: false), count: 3),
            events: Array(repeating: EventItem(date: text, title: text, summary: text, tag: text), count: 4),
            contacts: Array(repeating: ContactItem(label: text, value: text), count: 6),
            modelIntro: text,
            modelViews: Array(repeating: ModelViewDescription(title: text, description: text), count: 6)
        )
    }
}
