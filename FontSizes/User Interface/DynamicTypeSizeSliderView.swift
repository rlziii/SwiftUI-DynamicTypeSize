import SwiftUI

struct DynamicTypeSizeSliderView: View {
    static private let dynamicTypeSizes = DynamicTypeSize.allCases

    @Binding private var dynamicTypeSize: DynamicTypeSize
    private let sliderBounds = 0 ... Double(dynamicTypeSizes.count - 1)

    init(_ dynamicTypeSize: Binding<DynamicTypeSize>) {
        self._dynamicTypeSize = dynamicTypeSize
    }

    var body: some View {
        VStack {
            Text(dynamicTypeSize.description)
            Slider(
                value: sliderBinding(),
                in: sliderBounds
            )
        }
    }

    private func sliderBinding() -> Binding<Double> {
        .init(
            get: {
                let index = Self.dynamicTypeSizes.firstIndex(of: dynamicTypeSize) ?? 0
                return Double(index)
            }, set: {
                let index = Int($0)
                self.dynamicTypeSize = Self.dynamicTypeSizes[index]
            }
        )
    }
}

struct DynamicTypeSizeSliderView_Previews: PreviewProvider {
    struct Container: View {
        @State var dynamicTypeSize: DynamicTypeSize = .large

        var body: some View {
            DynamicTypeSizeSliderView($dynamicTypeSize)
        }
    }

    static var previews: some View {
        Container()
    }
}
