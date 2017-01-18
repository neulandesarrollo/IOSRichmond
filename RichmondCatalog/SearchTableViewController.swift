//
//  SearchTableViewController.swift
//  RichmondCatalog
//
//  Created by GrupoNeu on 11/10/16.
//  Copyright © 2016 Yanku. All rights reserved.
//

import UIKit
import SwiftyJSON

class SearchTableViewController: UITableViewController, UISearchBarDelegate {
    
    
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
    
    @IBOutlet weak var header: UIView!
    @IBOutlet weak var footer: UIView!
   
    var filterTupla : [tuplaSeries] = []
    
    // MARK - INIT
    override func viewDidLoad() {
        super.viewDidLoad()
        createSearchBar()
    }
    
    // MARK - Funciones para SearchBar
    
    func createSearchBar() {
        
        searchbar.showsCancelButton = false
        searchbar.placeholder = "Enter you serach here!"
        searchbar.delegate = self
        
        self.navigationItem.titleView = searchbar
        
    }
    
    override func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        searchbar.endEditing(true)
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
    
    // MARK - funcion obtener series
    
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

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        if  filterSearch{
            return filterTupla.count
        }else {
            return 0
        }
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "searchCell", for: indexPath) as? SearchTableViewCell
       
        if filterSearch {
            
            cell?.titleSearch.text  = filterTupla[(indexPath.row)].nombreSerie
            cell?.imgSearch.image   = UIImage(named: "\(filterTupla[(indexPath.row)].imagePathA).png")
        }
        
        
        return cell!
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
