import SwiftUI
import WebKit

struct Experience3DView: View {
    @EnvironmentObject private var model: AppViewModel

    var body: some View {
        ZStack {
            Theme.background.ignoresSafeArea()
            VStack(spacing: 12) {
                Text(model.content.modelIntro.value(for: model.language))
                    .font(.subheadline)
                    .foregroundStyle(.white.opacity(0.9))
                    .padding(.horizontal)
                    .frame(maxWidth: .infinity, alignment: .leading)

                LocalModelWebView(language: model.language)
                    .frame(minHeight: 320)
                    .clipShape(RoundedRectangle(cornerRadius: 18))
                    .overlay(
                        RoundedRectangle(cornerRadius: 18)
                            .stroke(.white.opacity(0.2), lineWidth: 1)
                    )
                    .padding(.horizontal)

                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 10) {
                        ForEach(model.content.modelViews) { view in
                            VStack(alignment: .leading, spacing: 6) {
                                Text(view.title.value(for: model.language))
                                    .font(.subheadline.bold())
                                    .foregroundStyle(.white)
                                Text(view.description.value(for: model.language))
                                    .font(.caption)
                                    .foregroundStyle(.white.opacity(0.85))
                                    .lineLimit(3)
                            }
                            .frame(width: 220, alignment: .leading)
                            .glassCard()
                        }
                    }
                    .padding(.horizontal)
                }
                Spacer(minLength: 0)
            }
            .padding(.vertical)
        }
        .navigationTitle(model.language == .greek ? "3D Εμπειρία" : "3D Experience")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct LocalModelWebView: UIViewRepresentable {
    let language: AppLanguage

    final class Coordinator {
        var webView: WKWebView?
        var hasLoaded = false
    }

    func makeCoordinator() -> Coordinator {
        Coordinator()
    }

    func makeUIView(context: Context) -> WKWebView {
        let config = WKWebViewConfiguration()
        let webView = WKWebView(frame: .zero, configuration: config)
        context.coordinator.webView = webView
        loadContentIfNeeded(webView: webView, coordinator: context.coordinator)
        return webView
    }

    func updateUIView(_ uiView: WKWebView, context: Context) {
        loadContentIfNeeded(webView: uiView, coordinator: context.coordinator)
        pushLanguage(to: uiView)
    }

    private func loadContentIfNeeded(webView: WKWebView, coordinator: Coordinator) {
        guard !coordinator.hasLoaded else { return }
        coordinator.hasLoaded = true

        guard let fileURL = Bundle.main.url(forResource: "library-3d", withExtension: "html") else {
            webView.loadHTMLString("<html><body style='background:#090d18;color:white;font-family:-apple-system;padding:24px;'>Missing local 3D resource.</body></html>", baseURL: nil)
            return
        }

        webView.loadFileURL(fileURL, allowingReadAccessTo: fileURL.deletingLastPathComponent())
    }

    private func pushLanguage(to webView: WKWebView) {
        let greek = language == .greek ? "true" : "false"
        let js = "window.dispatchEvent(new MessageEvent('message', { data: { type: 'setLanguage', greek: \(greek) } }));"
        webView.evaluateJavaScript(js, completionHandler: nil)
    }
}
