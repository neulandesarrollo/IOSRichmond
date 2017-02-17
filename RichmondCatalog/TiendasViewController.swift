//
//  TiendasViewController.swift
//  RichmondCatalog
//
//  Created by GrupoNeu on 04/10/16.
//  Copyright © 2016 Yanku. All rights reserved.
//

import UIKit
import SwiftyJSON
import MapKit
import CoreLocation

class TiendasViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate {
    
    @IBOutlet weak var mapView: MKMapView!
    
    @IBOutlet weak var header: UIView!
    @IBOutlet weak var footer: UIView!
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    let locationManager = CLLocationManager()
    
    typealias tuplaStores = (idStore: Int, name: String, address: String, phoneA: String,phoneB: String, website: String, emailA: String, emailB: String, geoState: Int, latitud: Double, longitud: Double)

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.locationManager.delegate = self
        self.locationManager.desiredAccuracy = kCLLocationAccuracyBest
        self.locationManager.requestWhenInUseAuthorization()
        self.locationManager.startUpdatingLocation()
        mapView.showsUserLocation = true
        
        let button = UIButton(type: .custom)
        button.frame = CGRect(x: 280, y: 510, width: 60, height: 60)
        button.layer.cornerRadius = 0.5 * button.bounds.size.width
        button.clipsToBounds = true
        button.setImage(UIImage(named:"search.png"), for: .normal)
        button.imageEdgeInsets = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        button.backgroundColor = UIColor(red:0.928,  green:0.331,  blue:0.345, alpha:1)
        button.addTarget(self, action: #selector(thumbsUpButtonPressed), for: .touchUpInside)
        view.addSubview(button)
    }
    
    func thumbsUpButtonPressed() {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "StoreListViewController") as! StoreListViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    // MARK: - Location Delegate Methods
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        let location                    = locations.last
        var index       : Int           = 0
        var distanceOne : Double        = 0
        var distanceTwo : Double        = 0
        var positionOne : CLLocation?   = nil
        var positionTwo : CLLocation?   = nil
        var markNear    : [Any]         = []
       
        // for para las marcas
        
        for locationMark in obtenerTodasTiendas() {
            
            let annotation = MKPointAnnotation()
            annotation.title = locationMark.name
            annotation.subtitle = locationMark.address
            annotation.coordinate = CLLocationCoordinate2D(latitude: CLLocationDegrees(locationMark.latitud) , longitude: CLLocationDegrees(locationMark.longitud))
            mapView.addAnnotation(annotation)
            
            if  index == 0{
                index += 1
                positionOne = CLLocation(latitude: annotation.coordinate.latitude , longitude: annotation.coordinate.longitude)
                distanceOne = round((location?.distance(from: positionOne!))!)
                
            }else{
                positionTwo = CLLocation(latitude: annotation.coordinate.latitude , longitude: annotation.coordinate.longitude)
                distanceTwo = round((location?.distance(from: positionTwo!))!)
                
                if distanceOne < distanceTwo{
                    markNear = [locationMark.latitud, locationMark.longitud, distanceOne]
                    index += 1
                }else{
                    distanceOne = distanceTwo
                    index += 1
                }
            }
            
        }
        print("latitude: \(markNear[0]) longitude: \(markNear[1]) distance: \(markNear[2])")
        //let nearLat = markNear[0]
        //let nearLon = markNear[1]
        //let nearLat = self.locationManager.location?.coordinate.latitude
        //let nearLon = self.locationManager.location?.coordinate.longitude
        // inicializar mapa
        
        let center = self.locationManager.location?.coordinate
        let span     = MKCoordinateSpan(latitudeDelta: 1,longitudeDelta: 1)
        let region   = MKCoordinateRegion(center: center!, span:span)
        
        mapView.setRegion(region, animated: true)
        self.locationManager.stopUpdatingLocation()
        
    }
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("Error: \(error.localizedDescription)")
    }
    
    @IBAction func regresar(){
        let _ = self.navigationController?.popViewController(animated: true)
    }
    
    func obtenerTodasTiendas() -> [tuplaStores]{
        
        let path: String = Bundle.main.path(forResource: "stores", ofType: "json")as String!
        let jsonData = try! Data(contentsOf: URL(fileURLWithPath: path))
        let readableJSON = JSON(data: jsonData, options: JSONSerialization.ReadingOptions.mutableContainers, error: nil)
        
        var pinsArray: [tuplaStores] = []
        
        if let items = readableJSON.array {
            
            for item in items {
                
                let idStore  :Int       = item["idStore"].intValue
                let name     :String    = item["name"].stringValue
                let address  :String    = item["address"].stringValue
                let phoneA   :String    = item["phoneA"].stringValue
                let phoneB   :String    = item["phoneB"].stringValue
                let website  :String    = item["website"].stringValue
                let emailA   :String    = item["emailA"].stringValue
                let emailB   :String    = item["emailB"].stringValue
                let geoState :Int       = item["geoState"].intValue
                let latitud  :Double    = item["latitud"].doubleValue
                let longitud :Double    = item["longitud"].doubleValue
                
                pinsArray.append((idStore: idStore, name: name, address: address, phoneA: phoneA,phoneB: phoneB, website: website, emailA: emailA, emailB: emailB, geoState: geoState, latitud: latitud, longitud: longitud))
            }
        }
        return pinsArray
    }

}
