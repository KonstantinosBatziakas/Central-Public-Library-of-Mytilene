import SwiftUI

struct LibraryInfoView: View {
    @EnvironmentObject private var model: AppViewModel

    var body: some View {
        ZStack {
            Theme.background.ignoresSafeArea()
            ScrollView {
                VStack(alignment: .leading, spacing: 12) {
                    Text(model.content.aboutTitle.value(for: model.language))
                        .font(.title2.bold())
                        .foregroundStyle(.white)

                    ForEach(model.content.aboutParagraphs, id: \.self) { paragraph in
                        Text(paragraph.value(for: model.language))
                            .font(.body)
                            .foregroundStyle(.white.opacity(0.9))
                            .glassCard()
                    }
                }
                .padding()
            }
        }
        .navigationTitle(model.language == .greek ? "Πληροφορίες" : "Library Info")
        .navigationBarTitleDisplayMode(.inline)
    }
}
