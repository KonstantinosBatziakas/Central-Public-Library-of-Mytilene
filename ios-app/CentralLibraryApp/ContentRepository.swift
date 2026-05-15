import Foundation

enum ContentRepository {
    static func loadContent() -> LibraryContent {
        guard let url = Bundle.main.url(forResource: "library_content", withExtension: "json") else {
            return .fallback
        }

        do {
            let data = try Data(contentsOf: url)
            let decoder = JSONDecoder()
            return try decoder.decode(LibraryContent.self, from: data)
        } catch {
            return .fallback
        }
    }
}
