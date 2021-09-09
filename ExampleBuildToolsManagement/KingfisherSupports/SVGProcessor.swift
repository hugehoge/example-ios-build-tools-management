//
//  ExampleBuildToolsManagement
//

import Foundation

import Kingfisher
import SVGKit

struct SVGProcessor: ImageProcessor {
    let identifier = Bundle.main.bundleIdentifier! + ".svgprocessor"

    func process(item: ImageProcessItem, options _: KingfisherParsedOptionsInfo) -> KFCrossPlatformImage? {
        switch item {
        case let .image(image):
            return image

        case let .data(data):
            let svgkImage = SVGKImage(data: data)
            return svgkImage?.uiImage
        }
    }
}
