import SwiftUI

struct Loader: View {
    enum Size {
        case small, medium, large
        var scale: CGFloat {
            switch self {
            case .small: return 1.0
            case .medium: return 1.5
            case .large: return 2.0
            }
        }
    }
    let message: String?
    let size: Size

    init(message: String? = nil, size: Size = .medium) {
        self.message = message
        self.size = size
    }
    var body: some View {
        VStack(spacing: 8) {
            ProgressView()
                .progressViewStyle(CircularProgressViewStyle())
                .scaleEffect(size.scale)
                Text(message ?? "Loading")
                    .font(.caption)
                    .foregroundColor(.secondary)
        }
    }
}

#Preview {
        VStack(spacing: 20) {
            Loader()
            Loader(message: "Medium Loading…", size: .medium)
            Loader(message: "Large Loading…", size: .large)
        }
}
