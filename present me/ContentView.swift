import SwiftUI

struct presentMe: View {
    @State private var searchText = ""
    @State private var selectedTab: LibraryTab = .library

    var body: some View {
        VStack(spacing: 0) {
            header

            Spacer(minLength: 20)

            emptyState

            Spacer(minLength: 20)

            tabBar
        }
        .padding(.horizontal, 28)
        .padding(.top, 8)
        .padding(.bottom, 24)
        .background(Color.white.ignoresSafeArea())
        .preferredColorScheme(.light)
    }

    private var header: some View {
        HStack(spacing: 18) {
            HStack(spacing: 10) {
                Image(systemName: "magnifyingglass")
                    .font(.system(size: 22, weight: .regular))
                    .foregroundStyle(.secondary)

                TextField("Search", text: $searchText)
                    .font(.system(size: 17))

                Button(action: {}) {
                    Image(systemName: "mic")
                        .font(.system(size: 20, weight: .regular))
                        .foregroundStyle(.secondary)
                }
                .buttonStyle(.plain)
            }
            .padding(.horizontal, 16)
            .frame(height: 52)
            .background(Color.white)
            .overlay(Capsule().stroke(Color(red: 0.88, green: 0.87, blue: 0.86), lineWidth: 1))

            Button(action: {}) {
                Image(systemName: "gearshape")
                    .font(.system(size: 25, weight: .regular))
                    .foregroundStyle(.black)
            }
            .buttonStyle(.plain)
        }
    }

    private var emptyState: some View {
        VStack(spacing: 0) {
            Image(systemName: "quote.opening")
                .font(.system(size: 78, weight: .heavy))
                .foregroundStyle(Color(red: 0.43, green: 0.41, blue: 0.37))
                .padding(.bottom, 52)

            Text("Your quotes is empty!")
                .font(.system(size: 21, weight: .bold))
                .foregroundStyle(Color(red: 0.18, green: 0.17, blue: 0.16))
                .padding(.bottom, 26)

            Text("Add your quotes, in Arabic or English; they\nstay on your phone.")
                .font(.system(size: 15))
                .lineSpacing(7)
                .multilineTextAlignment(.center)
                .foregroundStyle(Color(red: 0.22, green: 0.21, blue: 0.20))
                .padding(.bottom, 42)

            Button(action: {}) {
                Text("Add your first book")
                    .font(.system(size: 18, weight: .bold))
                    .foregroundStyle(.white)
                    .frame(maxWidth: .infinity)
                    .frame(height: 58)
                    .background(Color(red: 0.63, green: 0.28, blue: 0.24))
                    .clipShape(Capsule())
            }
            .buttonStyle(.plain)
            .frame(maxWidth: 294)
        }
        .frame(maxWidth: .infinity)
    }

    private var tabBar: some View {
        HStack(spacing: 0) {
            ForEach(LibraryTab.allCases) { tab in
                Button {
                    selectedTab = tab
                } label: {
                    VStack(spacing: 2) {
                        Image(systemName: selectedTab == tab ? tab.selectedSymbol : tab.symbol)
                            .font(.system(size: 25, weight: .bold))
                        Text(tab.title)
                            .font(.system(size: 12, weight: .medium))
                    }
                    .foregroundStyle(selectedTab == tab ? Color(red: 0.55, green: 0.16, blue: 0.13) : Color(red: 0.43, green: 0.41, blue: 0.37))
                    .frame(maxWidth: .infinity)
                    .frame(height: 68)
                    .background {
                        if selectedTab == tab {
                            Capsule().fill(Color(red: 0.92, green: 0.91, blue: 0.91))
                                .padding(.vertical, 4)
                        }
                    }
                }
                .buttonStyle(.plain)
            }
        }
        .padding(.horizontal, 5)
        .background(.white)
        .overlay(Capsule().stroke(Color(red: 0.94, green: 0.93, blue: 0.92), lineWidth: 1))
        .clipShape(Capsule())
    }
}

private enum LibraryTab: String, CaseIterable, Identifiable {
    case library, quotes, progress

    var id: String { rawValue }
    var title: String {
        switch self {
        case .library: "Library"
        case .quotes: "Quotes"
        case .progress: "Progress"
        }
    }
    var symbol: String {
        switch self {
        case .library: "books.vertical"
        case .quotes: "quote.opening"
        case .progress: "chart.bar"
        }
    }
    var selectedSymbol: String {
        switch self {
        case .library: "books.vertical.fill"
        case .quotes: "quote.opening"
        case .progress: "chart.bar.fill"
        }
    }
}

#Preview {
    presentMe()
}
