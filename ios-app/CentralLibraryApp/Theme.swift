import SwiftUI

enum Theme {
    static let background = LinearGradient(
        colors: [Color(red: 0.07, green: 0.09, blue: 0.16), Color(red: 0.03, green: 0.04, blue: 0.09)],
        startPoint: .topLeading,
        endPoint: .bottomTrailing
    )

    static let accentGlow = Color(red: 0.35, green: 0.78, blue: 1.0)
    static let warmAccent = Color(red: 0.9, green: 0.72, blue: 0.34)
}

struct GlassCardModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding()
            .background(.ultraThinMaterial)
            .overlay(
                RoundedRectangle(cornerRadius: 18)
                    .stroke(Color.white.opacity(0.15), lineWidth: 1)
            )
            .background(
                RoundedRectangle(cornerRadius: 18)
                    .fill(Theme.accentGlow.opacity(0.08))
                    .blur(radius: 12)
            )
            .clipShape(RoundedRectangle(cornerRadius: 18))
            .shadow(color: .black.opacity(0.25), radius: 10, x: 0, y: 4)
    }
}

extension View {
    func glassCard() -> some View {
        modifier(GlassCardModifier())
    }
}
