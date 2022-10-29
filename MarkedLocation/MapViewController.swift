//
//  Created by Brian Coyner on 7/25/20.
//  Copyright © 2020 Brian Coyner. All rights reserved.
//

import Foundation
import UIKit
import MapKit

/// See the `readme` file for testing instructions.

final class MapViewController: UIViewController, MKMapViewDelegate {

    private lazy var annotations = lazyMagicKingdomAnnotations()
    private lazy var mapView = lazyMapView()
}

extension MapViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Y-Offset Bug"

        view.addSubview(mapView)
        NSLayoutConstraint.activate([
            mapView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            mapView.topAnchor.constraint(equalTo: view.topAnchor),
            mapView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            mapView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])

        mapView.addAnnotations(annotations)
        mapView.showAnnotations(annotations, animated: false)
    }
}

// MARK: MKMapViewDelegate (Annotation View)

extension MapViewController {

    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        switch annotation {
        case let rideAnnotation as RideAnnotation:
            return RideAnnotationView(annotation: rideAnnotation, reuseIdentifier: String(describing: RideAnnotation.self))
        default:
            let view = mapView.dequeueReusableAnnotationView(withIdentifier: MKMapViewDefaultAnnotationViewReuseIdentifier, for: annotation)
            view.displayPriority = .required
            view.zPriority = .max
            view.selectedZPriority = .max

            return view
        }
    }
}

// MARK: Hacks To Fix User Perceived Center

// Uncomment this code to force adjust the annotation view's center y-offset.

//extension MapViewController {
//
//    private enum HackValue {
//        static let yOffSetFudgeFactor: CGFloat = 3.5
//    }
//
//    func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {
//        guard let view = view as? MKMarkerAnnotationView else {
//            return
//        }
//
//        var centerOffset = view.centerOffset
//        centerOffset.y += HackValue.yOffSetFudgeFactor
//
//        view.centerOffset = centerOffset
//    }
//
//    func mapView(_ mapView: MKMapView, didDeselect view: MKAnnotationView) {
//        guard let view = view as? MKMarkerAnnotationView else {
//            return
//        }
//
//        var centerOffset = view.centerOffset
//        centerOffset.y -= HackValue.yOffSetFudgeFactor
//
//        view.centerOffset = centerOffset
//    }
//}

extension MapViewController {

    private func lazyMapView() -> MKMapView {
        let view = MKMapView()
        view.translatesAutoresizingMaskIntoConstraints = false

        view.mapType = .satellite
        view.delegate = self

        return view
    }
}

extension MapViewController {

    private func lazyMagicKingdomAnnotations() -> [MKAnnotation] {
        let rideAnnotations = makeMagicKingdomRideAnnotations()
        let pointAnnotations: [MKAnnotation] = rideAnnotations.map { MKPointAnnotation(coordinate: $0.coordinate) }
        return pointAnnotations + rideAnnotations
    }

    private func makeMagicKingdomRideAnnotations() -> [MKAnnotation] {
        return [
            RideAnnotation(
                title: "It's a Small World",
                coordinate: CLLocationCoordinate2D(latitude: 28.420827, longitude: -81.581957)
            ),
            RideAnnotation(
                title: "Splash Mountain",
                coordinate: CLLocationCoordinate2D(latitude: 28.419215, longitude: -81.585046)
            ),
            RideAnnotation(
                title: "Seven Dwarfs Mine Train",
                coordinate: CLLocationCoordinate2D(latitude: 28.4205, longitude: -81.5801)
            ),
            RideAnnotation(
                title: "Under the Sea",
                coordinate: CLLocationCoordinate2D(latitude: 28.421199, longitude: -81.579966)
            ),
            RideAnnotation(
                title: "Space Mountain",
                coordinate: CLLocationCoordinate2D(latitude: 28.4191, longitude: -81.5771)
            ),
            RideAnnotation(
                title: "Pirates of the Caribbean",
                coordinate: CLLocationCoordinate2D(latitude: 28.4181, longitude: -81.5846)
            )
        ]
    }
}


extension MKPointAnnotation {

    convenience init(coordinate: CLLocationCoordinate2D) {
        self.init()

        self.coordinate = coordinate
    }
}
