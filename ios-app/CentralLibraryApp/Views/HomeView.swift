import SwiftUI

struct HomeView: View {
    @EnvironmentObject private var model: AppViewModel

    var body: some View {
        ZStack {
            Theme.background.ignoresSafeArea()
            ScrollView {
                VStack(alignment: .leading, spacing: 16) {
                    Text(model.content.appTitle.value(for: model.language))
                        .font(.largeTitle.bold())
                        .foregroundStyle(.white)
                        .minimumScaleFactor(0.7)

                    Text(model.content.aboutTitle.value(for: model.language))
                        .font(.title2.weight(.semibold))
                        .foregroundStyle(Theme.warmAccent)

                    ForEach(model.content.aboutParagraphs, id: \.self) { paragraph in
                        Text(paragraph.value(for: model.language))
                            .font(.body)
                            .foregroundStyle(.white.opacity(0.92))
                    }

                    LazyVGrid(columns: [GridItem(.adaptive(minimum: 140), spacing: 12)], spacing: 12) {
                        ForEach(model.content.stats) { stat in
                            VStack(alignment: .leading, spacing: 8) {
                                Text(stat.value)
                                    .font(.title.weight(.bold))
                                    .foregroundStyle(Theme.warmAccent)
                                Text(stat.label.value(for: model.language))
                                    .font(.subheadline)
                                    .foregroundStyle(.white.opacity(0.9))
                            }
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .glassCard()
                        }
                    }
                }
                .padding()
            }
        }
        .navigationTitle(model.language == .greek ? "Αρχική" : "Home")
        .navigationBarTitleDisplayMode(.inline)
    }
}
