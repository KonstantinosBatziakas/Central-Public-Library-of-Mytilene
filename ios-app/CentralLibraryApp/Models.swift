import Foundation

struct LocalizedText: Codable, Hashable {
    let en: String
    let gr: String

    func value(for language: AppLanguage) -> String {
        language == .greek ? gr : en
    }
}

struct LibraryStat: Codable, Identifiable {
    let id: UUID
    let value: String
    let label: LocalizedText

    init(id: UUID = UUID(), value: String, label: LocalizedText) {
        self.id = id
        self.value = value
        self.label = label
    }
}

struct CollectionItem: Codable, Identifiable {
    let id: UUID
    let icon: String
    let title: LocalizedText
    let description: LocalizedText

    init(id: UUID = UUID(), icon: String, title: LocalizedText, description: LocalizedText) {
        self.id = id
        self.icon = icon
        self.title = title
        self.description = description
    }
}

struct OpeningHour: Codable, Identifiable {
    let id: UUID
    let day: LocalizedText
    let time: LocalizedText
    let closed: Bool

    init(id: UUID = UUID(), day: LocalizedText, time: LocalizedText, closed: Bool) {
        self.id = id
        self.day = day
        self.time = time
        self.closed = closed
    }
}

struct ContactItem: Codable, Identifiable {
    let id: UUID
    let label: LocalizedText
    let value: LocalizedText

    init(id: UUID = UUID(), label: LocalizedText, value: LocalizedText) {
        self.id = id
        self.label = label
        self.value = value
    }
}

struct EventItem: Codable, Identifiable {
    let id: UUID
    let date: LocalizedText
    let title: LocalizedText
    let summary: LocalizedText
    let tag: LocalizedText

    init(id: UUID = UUID(), date: LocalizedText, title: LocalizedText, summary: LocalizedText, tag: LocalizedText) {
        self.id = id
        self.date = date
        self.title = title
        self.summary = summary
        self.tag = tag
    }
}

struct ModelViewDescription: Codable, Identifiable {
    let id: UUID
    let title: LocalizedText
    let description: LocalizedText

    init(id: UUID = UUID(), title: LocalizedText, description: LocalizedText) {
        self.id = id
        self.title = title
        self.description = description
    }
}

struct LibraryContent: Codable {
    let appTitle: LocalizedText
    let aboutTitle: LocalizedText
    let aboutParagraphs: [LocalizedText]
    let stats: [LibraryStat]
    let collections: [CollectionItem]
    let hours: [OpeningHour]
    let events: [EventItem]
    let contacts: [ContactItem]
    let modelIntro: LocalizedText
    let modelViews: [ModelViewDescription]

    static let fallback = LibraryContent(
        appTitle: LocalizedText(en: "Public Central Library of Mytilene", gr: "Δημόσια Κεντρική Βιβλιοθήκη Μυτιλήνης"),
        aboutTitle: LocalizedText(en: "Over a Century of Knowledge", gr: "Πάνω από Έναν Αιώνα Γνώσης"),
        aboutParagraphs: [
            LocalizedText(
                en: "The Public Central Library of Mytilene was founded in 1913 and became a public institution in 1952.",
                gr: "Η Δημόσια Κεντρική Βιβλιοθήκη Μυτιλήνης ιδρύθηκε το 1913 και έγινε δημόσια το 1952."
            )
        ],
        stats: [
            LibraryStat(value: "55,000+", label: LocalizedText(en: "Volumes", gr: "Τόμοι"))
        ],
        collections: [],
        hours: [],
        events: [],
        contacts: [],
        modelIntro: LocalizedText(
            en: "Explore the building in 3D.",
            gr: "Εξερευνήστε το κτήριο σε 3D."
        ),
        modelViews: []
    )
}
