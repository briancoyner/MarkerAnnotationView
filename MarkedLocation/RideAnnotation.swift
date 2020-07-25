//
//  Created by Brian Coyner on 7/25/20.
//  Copyright © 2020 Brian Coyner. All rights reserved.
//

import Foundation
import MapKit

final class RideAnnotation: MKPointAnnotation {

    convenience init(title: String, coordinate: CLLocationCoordinate2D) {
        self.init()

        self.title = title
        self.coordinate = coordinate
    }
}
