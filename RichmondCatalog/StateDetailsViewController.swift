//
//  SeriesTableViewController.swift
//  RichmondCatalog
//
//  Created by Yanku on 08/08/16.
//  Copyright © 2016 Yanku. All rights reserved.
//

import Foundation
import UIKit
import SwiftyJSON

class StateDetailsViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    @IBOutlet weak var header: UIView!
    @IBOutlet weak var footer: UIView!
    @IBOutlet weak var tableView: UITableView!
    
    var stateid: Int = 0
    var statenew: Int = 0
    
    typealias tuplaStores = (idStore: Int, name: String, address: String, phoneA: String,phoneB: String, website: String, emailA: String, emailB: String, geoState: Int, latitud: Double, longitud: Double)
    
    var storesArray: [tuplaStores] = []
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
        switch stateid {
        case 1:
            statenew = 2
        case 2:
            statenew = 3
        case 3:
            statenew = 4
        case 4:
            statenew = 5
        case 5:
            statenew = 6
        case 6:
            statenew = 9
        case 9:
            statenew = 10
        case 10:
            statenew = 15
        case 11:
            statenew = 11
        case 12:
            statenew = 12
        case 14:
            statenew = 14
        case 15:
            statenew = 16
        case 17:
            statenew = 18
        case 18:
            statenew = 19
        case 19:
            statenew = 20
        case 20:
            statenew = 21
        case 21:
            statenew = 22
        case 22:
            statenew = 23
        case 23:
            statenew = 24
        case 24:
            statenew = 25
        case 25:
            statenew = 26
        case 26:
            statenew = 27
        case 27:
            statenew = 28
        case 29:
            statenew = 30
        case 30:
            statenew = 31
        case 31:
            statenew = 32
        default:
            statenew = 1
        }
        
        let path: String = Bundle.main.path(forResource: "stores", ofType: "json")as String!
        let jsonData = try! Data(contentsOf: URL(fileURLWithPath: path))
        let readableJSON = JSON(data: jsonData, options: JSONSerialization.ReadingOptions.mutableContainers, error: nil)
        
        if let items = readableJSON.array {
            
            for item in items {
                
                if (item["geoState"].intValue == statenew) {
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
                    
                    storesArray.append((idStore: idStore, name: name, address: address, phoneA: phoneA,phoneB: phoneB, website: website, emailA: emailA, emailB: emailB, geoState: geoState, latitud: latitud, longitud: longitud))
                }
                
                
            }
        }

        
        self.tableView.reloadData()
        
        self.header.layer.shadowColor = UIColor.darkGray.cgColor
        self.header.layer.shadowOpacity = 0.8
        self.header.layer.shadowRadius = 3
        self.header.layer.shadowOffset = CGSize(width: 2.0, height: 2.0)
    }
    
    @IBAction func regresar(){
        let _ = self.navigationController?.popViewController(animated: true)
    }
    
    // MARK: - Table View Methods
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return storesArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "storeDetailCell", for: indexPath) as! StoresTableViewCell
        
        let store = self.storesArray[indexPath.row]
        
        cell.lblStoreTitle.text = store.name
        cell.lblStoreAddress.text = store.address
        cell.lblStorePhone.text = store.phoneA
        cell.lblStoreWebsite.text = store.website
        
        return cell
    }
    
}
