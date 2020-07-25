//
//  Created by Brian Coyner on 7/25/20.
//  Copyright © 2020 Brian Coyner. All rights reserved.
//

import Foundation
import MapKit

final class RideAnnotationView: MKAnnotationView {

    override init(annotation: MKAnnotation?, reuseIdentifier: String?) {
        super.init(annotation: annotation, reuseIdentifier: reuseIdentifier)

        self.image = RideAnnotationView.makeImageView(withRadius: 11)
        self.displayPriority = .required
        self.zPriority = .min
        self.selectedZPriority = .min
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension RideAnnotationView {

    private static func makeImageView(withRadius radius: CGFloat) -> UIImage {
        let sideLength = radius * 2
        let rect = CGRect(origin: .zero, size: CGSize(width: sideLength, height: sideLength))
        let format = UIGraphicsImageRendererFormat.preferred()

        let renderer = UIGraphicsImageRenderer(bounds: rect, format: format)
        return renderer.image {
            let context = $0.cgContext

            context.saveGState()
            context.setShadow(offset: .zero, blur: sideLength * 0.2, color: UIColor.systemGray2.cgColor)
            context.setFillColor(UIColor.white.cgColor)
            context.fillEllipse(in: rect)
            context.restoreGState()

            context.setFillColor(UIColor.systemGreen.cgColor)

            let inset = sideLength * 0.15
            let insetRect = rect.insetBy(dx: inset, dy: inset)
            context.fillEllipse(in: insetRect)
        }
    }
}
