import SwiftUI

struct EventsView: View {
    @EnvironmentObject private var model: AppViewModel

    var body: some View {
        ZStack {
            Theme.background.ignoresSafeArea()
            ScrollView {
                VStack(spacing: 12) {
                    ForEach(model.content.events) { event in
                        VStack(alignment: .leading, spacing: 8) {
                            HStack {
                                Text(event.date.value(for: model.language))
                                    .font(.caption.weight(.bold))
                                    .foregroundStyle(Theme.warmAccent)
                                Spacer()
                                Text(event.tag.value(for: model.language))
                                    .font(.caption2.weight(.semibold))
                                    .padding(.horizontal, 8)
                                    .padding(.vertical, 4)
                                    .background(.white.opacity(0.12), in: Capsule())
                                    .foregroundStyle(.white)
                            }

                            Text(event.title.value(for: model.language))
                                .font(.headline)
                                .foregroundStyle(.white)

                            Text(event.summary.value(for: model.language))
                                .font(.body)
                                .foregroundStyle(.white.opacity(0.9))
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .glassCard()
                        .accessibilityElement(children: .ignore)
                        .accessibilityLabel("\(event.date.value(for: model.language)). \(event.title.value(for: model.language)). \(event.summary.value(for: model.language)). \(event.tag.value(for: model.language))")
                    }
                }
                .padding()
            }
        }
        .dynamicTypeSize(.xSmall ... .accessibility3)
        .navigationTitle(model.language == .greek ? "Εκδηλώσεις" : "Events")
        .navigationBarTitleDisplayMode(.inline)
    }
}
