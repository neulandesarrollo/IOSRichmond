//
//  SeriesTableViewController.swift
//  RichmondCatalog
//
//  Created by Yanku on 08/08/16.
//  Copyright © 2016 Yanku. All rights reserved.
//

import Foundation
import UIKit

class StoreListViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    @IBOutlet weak var header: UIView!
    @IBOutlet weak var footer: UIView!
    @IBOutlet weak var tableView: UITableView!
    
    var items = ["Baja California", "Baja California Sur", "Campeche", "Chiapas", "Chihuahua", "Ciudad de México", "Coahuila", "Colima", "Durango", "Estado de México", "Guanajuato", "Guerrero", "Hidalgo", "Jalisco", "Michoacán", "Morelos", "Nayarit", "Nuevo León", "Oaxaca", "Puebla", "Queretaro", "Quintana Roo", "San Luis Potosi", "Sinaloa", "Sonora", "Tabasco", "Tamaulipas", "Tlaxcala", "Veracruz", "Yucatán", "Zacatecas"]
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
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
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "stateCell", for: indexPath)
        
        cell.textLabel?.text = items[indexPath.row]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if(indexPath.row == 0 || indexPath.row == 7 || indexPath.row == 8 || indexPath.row == 13 || indexPath.row == 16 || indexPath.row == 28){
            let alert = UIAlertController(title: "Alert", message: "No hay tiendas disponibles", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        } else {
            print("You selected cell #\(indexPath.row)!")
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "StateDetailsViewController") as! StateDetailsViewController
            vc.stateid = indexPath.row
            self.navigationController?.pushViewController(vc, animated: true)
        }
        
    }
    
}
