import SwiftUI

struct VisitContactView: View {
    @EnvironmentObject private var model: AppViewModel

    var body: some View {
        ZStack {
            Theme.background.ignoresSafeArea()
            ScrollView {
                VStack(alignment: .leading, spacing: 14) {
                    Text(model.language == .greek ? "Ωράριο" : "Opening Hours")
                        .font(.title3.bold())
                        .foregroundStyle(.white)

                    ForEach(model.content.hours) { hour in
                        HStack(alignment: .top) {
                            Text(hour.day.value(for: model.language))
                                .font(.body.weight(.semibold))
                                .foregroundStyle(.white)
                            Spacer()
                            Text(hour.time.value(for: model.language))
                                .font(.body)
                                .foregroundStyle(hour.closed ? .white.opacity(0.5) : Theme.warmAccent)
                        }
                        .glassCard()
                    }

                    Text(model.language == .greek ? "Επικοινωνία" : "Contact")
                        .font(.title3.bold())
                        .foregroundStyle(.white)
                        .padding(.top, 4)

                    ForEach(model.content.contacts) { item in
                        VStack(alignment: .leading, spacing: 6) {
                            Text(item.label.value(for: model.language))
                                .font(.caption.weight(.semibold))
                                .foregroundStyle(Theme.warmAccent)
                            Text(item.value.value(for: model.language))
                                .font(.body)
                                .foregroundStyle(.white)
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .glassCard()
                    }
                }
                .padding()
            }
        }
        .navigationTitle(model.language == .greek ? "Επίσκεψη" : "Visit")
        .navigationBarTitleDisplayMode(.inline)
    }
}
