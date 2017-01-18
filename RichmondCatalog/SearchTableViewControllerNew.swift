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

class SearchTableViewControllerNew: UIViewController,UITableViewDelegate,UITableViewDataSource, UISearchBarDelegate {
    
    typealias tuplaSeries = (idSeries:Int,
        category_idCategory: Int,
        nombreSerie:String,
        descripcionSerie:String,
        imagePathA:String,
        imagePathB: String,
        CEFR: Bool,
        CLIL: Bool,
        announced: Bool,
        app: Bool,
        audio: Bool,
        british: Bool,
        digitalBook: Bool,
        digitalResources: Bool,
        dvd: Bool,
        examFriendly: Bool,
        hours: String,
        iBook: Bool,
        learning: Bool,
        levels: Int,
        microsite: Bool,
        new: Bool,
        solution: Bool,
        spiral: Bool,
        videos: Bool)
    
    // MARK - Variables de la clase.
    let searchbar = UISearchBar()
    var filterSearch : Bool = false
    
    var filterTupla : [tuplaSeries] = []
    var data_serie : [tuplaSeries] = []
    
    @IBOutlet weak var header: UIView!
    @IBOutlet weak var footer: UIView!
    @IBOutlet weak var tableView: UITableView!
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createSearchBar()
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
        self.tableView.reloadData()
        
        data_serie = obtenerSerie()
        
        self.header.layer.shadowColor = UIColor.darkGray.cgColor
        self.header.layer.shadowOpacity = 0.8
        self.header.layer.shadowRadius = 3
        self.header.layer.shadowOffset = CGSize(width: 2.0, height: 2.0)
    }
    
    func createSearchBar() {
        
        searchbar.showsCancelButton = false
        searchbar.placeholder = "Enter you search here!"
        searchbar.delegate = self
        
        //self.navigationItem.titleView = searchbar
        
        
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        filterSearch = true
        searchbar.endEditing(true)
        self.tableView.reloadData()
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        let arraySerie = obtenerSerie()
        
        filterTupla = arraySerie.filter({ (texto) -> Bool in
            let tmp: NSString = texto.nombreSerie as NSString
            let range = tmp.range(of: searchText, options: NSString.CompareOptions.caseInsensitive)
            return range.location != NSNotFound
        })
        if (filterTupla.count == 0){
            filterSearch = false
            self.tableView.reloadData()
        }else{
            filterSearch = true
            self.tableView.reloadData()
        }
    }
    
    @IBAction func regresar(){
        let _ = self.navigationController?.popViewController(animated: true)
    }
    
    // MARK: - Table View Methods
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UIScreen.main.bounds.height * 0.2
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0.0000000001
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 0.0000000001
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filterTupla.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SerieSearch", for: indexPath)
        
        if filterSearch {
            
            cell.textLabel?.text = filterTupla[(indexPath.row)].nombreSerie
            cell.detailTextLabel?.text = "Delicious!"
            cell.imageView?.image = UIImage(named: "\(filterTupla[(indexPath.row)].imagePathA).png")
            
        }else{
            cell.textLabel?.text = data_serie[(indexPath.row)].nombreSerie
            cell.detailTextLabel?.text = "Delicious!"
            cell.imageView?.image = UIImage(named: "\(data_serie[(indexPath.row)].imagePathA).png")
        }
        
        
        return cell
    }
    
    func obtenerSerie() -> [tuplaSeries]{
        
        let path: String = Bundle.main.path(forResource: "series", ofType: "json")as String!
        let jsonData = try! Data(contentsOf: URL(fileURLWithPath: path))
        let readableJSON = JSON(data: jsonData, options: JSONSerialization.ReadingOptions.mutableContainers, error: nil)
        
        var contenidoSerie : [tuplaSeries] = []
        
        if let items = readableJSON.array {
            
            for item in items {
                
                let idSerie             :Int        = item["idSerie"].intValue
                let category_idCategory :Int        = item["category_idCategory"].intValue
                let nombreSerie         :String     = item["name"].stringValue
                let descripcionSerie    :String     = item["description"].stringValue
                let imagePathA          :String     = item["imagePathA"].stringValue
                let imagePathB          :String     = item["imagePathB"].stringValue
                let CEFR                :Bool       = item["CEFR"].boolValue
                let CLIL                :Bool       = item["CLIL"].boolValue
                let announced           :Bool       = item["announced"].boolValue
                let app                 :Bool       = item["app"].boolValue
                let audio               :Bool       = item["audio"].boolValue
                let british             :Bool       = item["british"].boolValue
                let digitalBook         :Bool       = item["digitalBook"].boolValue
                let digitalResources    :Bool       = item["digitalResources"].boolValue
                let dvd                 :Bool       = item["dvd"].boolValue
                let examFriendly        :Bool       = item["examFriendly"].boolValue
                let hours               :String     = item["hours"].stringValue
                let iBook               :Bool       = item["iBook"].boolValue
                let learning            :Bool       = item["learning"].boolValue
                let levels              :Int        = item["levels"].intValue
                let microsite           :Bool       = item["microsite"].boolValue
                let new                 :Bool       = item["new"].boolValue
                let solution            :Bool       = item["solution"].boolValue
                let spiral              :Bool       = item["spiral"].boolValue
                let videos              :Bool       = item["videos"].boolValue
                
                contenidoSerie.append((idSeries:idSerie,category_idCategory: category_idCategory,nombreSerie:nombreSerie,
                                       descripcionSerie:descripcionSerie,imagePathA:imagePathA,imagePathB: imagePathB,CEFR: CEFR,CLIL: CLIL,announced: announced,app: app,audio: audio,british: british,digitalBook: digitalBook,digitalResources: digitalResources,dvd: dvd,examFriendly: examFriendly,hours: hours,iBook: iBook,learning: learning,levels: levels,microsite: microsite,new: new,solution: solution,spiral: spiral,videos: videos))
            }
        }
        return contenidoSerie
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let path = self.tableView.indexPathForSelectedRow
        
        if segue.identifier == "segueSearchDetailSerie"{
            if let destino = segue.destination as? DetailUISegmentControl{
                
                destino.viaSegueCategoria         = filterTupla[((path as NSIndexPath?)?.section)!].category_idCategory
                destino.viaSegueSerie             = filterTupla[((path as NSIndexPath?)?.section)!].idSeries
                destino.viaNombreSerie            = filterTupla[((path as NSIndexPath?)?.section)!].nombreSerie
                destino.viaDescripcionSerie       = filterTupla[((path as NSIndexPath?)?.section)!].descripcionSerie
                destino.viaImagePathA             = filterTupla[((path as NSIndexPath?)?.section)!].imagePathA
                destino.viaImagePathB             = filterTupla[((path as NSIndexPath?)?.section)!].imagePathB
                destino.viaCEFR                   = filterTupla[((path as NSIndexPath?)?.section)!].CEFR
                destino.viaCLIL                   = filterTupla[((path as NSIndexPath?)?.section)!].CLIL
                destino.viaAnounced               = filterTupla[((path as NSIndexPath?)?.section)!].announced
                destino.viaApp                    = filterTupla[((path as NSIndexPath?)?.section)!].app
                destino.viaAudio                  = filterTupla[((path as NSIndexPath?)?.section)!].audio
                destino.viaBritish                = filterTupla[((path as NSIndexPath?)?.section)!].british
                destino.viaDigitalBook            = filterTupla[((path as NSIndexPath?)?.section)!].digitalBook
                destino.viaDigitalResources       = filterTupla[((path as NSIndexPath?)?.section)!].digitalResources
                destino.viaDvd                    = filterTupla[((path as NSIndexPath?)?.section)!].dvd
                destino.viaExamFriendly           = filterTupla[((path as NSIndexPath?)?.section)!].examFriendly
                destino.viaHours                  = filterTupla[((path as NSIndexPath?)?.section)!].hours
                destino.viaIbook                  = filterTupla[((path as NSIndexPath?)?.section)!].iBook
                destino.viaLearning               = filterTupla[((path as NSIndexPath?)?.section)!].learning
                destino.viaLevels                 = filterTupla[((path as NSIndexPath?)?.section)!].levels
                destino.viaMicrosite              = filterTupla[((path as NSIndexPath?)?.section)!].microsite
                destino.viaNew                    = filterTupla[((path as NSIndexPath?)?.section)!].new
                destino.viaSolution               = filterTupla[((path as NSIndexPath?)?.section)!].solution
                destino.viaSpiral                 = filterTupla[((path as NSIndexPath?)?.section)!].spiral
                destino.viaVideos                 = filterTupla[((path as NSIndexPath?)?.section)!].videos
            }
        }
    }
    
}

