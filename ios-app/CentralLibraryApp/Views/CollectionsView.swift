import SwiftUI

struct CollectionsView: View {
    @EnvironmentObject private var model: AppViewModel

    var body: some View {
        ZStack {
            Theme.background.ignoresSafeArea()
            ScrollView {
                VStack(spacing: 12) {
                    ForEach(model.content.collections) { item in
                        VStack(alignment: .leading, spacing: 10) {
                            Text("\(item.icon)  \(item.title.value(for: model.language))")
                                .font(.headline)
                                .foregroundStyle(.white)
                            Text(item.description.value(for: model.language))
                                .font(.body)
                                .foregroundStyle(.white.opacity(0.9))
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .glassCard()
                    }
                }
                .padding()
            }
        }
        .navigationTitle(model.language == .greek ? "Συλλογές" : "Collections")
        .navigationBarTitleDisplayMode(.inline)
    }
}
