import SwiftUI

struct DynamicTypeSizeListView: View {
    let fontSizes: [(font: Font, name: String)] = [
        (.largeTitle, "Large Title"),
        (.title, "Title"),
        (.title2, "Title 2"),
        (.title3, "Title 3"),
        (.headline, "Headline"),
        (.body, "Body"),
        (.callout, "Callout"),
        (.subheadline, "Subheadline"),
        (.footnote, "Footnote"),
        (.caption, "Caption"),
        (.caption2, "Caption 2"),
    ]

    @State private var dynamicTypeSize: DynamicTypeSize = .large

    var body: some View {
        VStack {
            ScrollView {
                ForEach(fontSizes, id: \.self.font) {
                    Text($0.name)
                        .font($0.font)
                        .dynamicTypeSize(dynamicTypeSize)
                }
            }
            Divider()
            DynamicTypeSizeSliderView($dynamicTypeSize)
        }
    }
}

struct DynamicTypeSizeListView_Previews: PreviewProvider {
    static var previews: some View {
        DynamicTypeSizeListView()
    }
}
