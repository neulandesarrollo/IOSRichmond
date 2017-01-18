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

class SeriesTableViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    @IBOutlet weak var header: UIView!
    @IBOutlet weak var footer: UIView!
    @IBOutlet weak var tableView: UITableView!
    
    var menu: Menu!
    var subcategorias = [Subcategoria]()
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.header.backgroundColor = self.menu.background
        self.footer.backgroundColor = self.menu.background
        
        self.subcategorias = Subcategoria.getSubcategoriasPorId(id: self.menu.idMenu)
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
        return self.subcategorias.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath.row)
        let serie = self.subcategorias[indexPath.row]
        print(serie.titulo)
        let path: String = Bundle.main.path(forResource: "series", ofType: "json")as String!
        let jsonData = try! Data(contentsOf: URL(fileURLWithPath: path))
        let readableJSON = JSON(data: jsonData, options: JSONSerialization.ReadingOptions.mutableContainers, error: nil)
        
        
        if let items = readableJSON.array{
            for item in items{
                if item["name"].stringValue.uppercased() == serie.titulo{
                    
                    let vc = self.storyboard?.instantiateViewController(withIdentifier: "DetailUIController") as! DetailUISegmentControl
                    vc.viaSegueCategoria = item["category_idCategory"].intValue
                    vc.viaNombreSerie = item["name"].stringValue
                    vc.viaSegueSerie = item["idSerie"].intValue
                    vc.viaDescripcionSerie = item["description"].stringValue
                    vc.viaImagePathA = item["imagePathA"].stringValue
                    vc.viaImagePathB = item["imagePathB"].stringValue
                    vc.viaCEFR = item["CEFR"].boolValue
                    vc.viaCLIL = item["CLIL"].boolValue
                    vc.viaAnounced = item["announced"].boolValue
                    vc.viaApp = item["app"].boolValue
                    vc.viaAudio = item["audio"].boolValue
                    vc.viaBritish = item["british"].boolValue
                    vc.viaDigitalBook = item["description"].boolValue
                    vc.viaDigitalResources = item["digitalResources"].boolValue
                    vc.viaDvd = item["dvd"].boolValue
                    vc.viaExamFriendly = item["examFriendly"].boolValue
                    vc.viaHours = item["hours"].stringValue
                    vc.viaIbook = item["iBook"].boolValue
                    vc.viaLearning = item["learning"].boolValue
                    vc.viaLevels = item["levels"].intValue
                    vc.viaMicrosite = item["microsite"].boolValue
                    vc.viaNew = item["new"].boolValue
                    vc.viaSolution = item["solution"].boolValue
                    vc.viaSpiral = item["spiral"].boolValue
                    vc.viaVideos = item["videos"].boolValue
                    vc.viaSampleunit = item["sampleunit"].stringValue
                    vc.viaScope = item["scope"].stringValue
                    self.navigationController?.pushViewController(vc, animated: true)
                    
                }
            }
        }
        //let menu = self.menu[indexPath.row]
        //let vc = self.storyboard?.instantiateViewController(withIdentifier: "SeriesTableViewController") as! SeriesTableViewController
        //vc.menu = menu
        //self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "seriesCell", for: indexPath) as! SerieTableViewCell
        
        let serie = self.subcategorias[indexPath.row]
        
        cell.lblSerieTitle.text     = serie.titulo
        cell.imgSerie.image         = serie.icono
        cell.lblDesSerie.text       = serie.subtitulo
        cell.imgFlechaSerie.image   = menu.iconoFlecha
        return cell
    }
    
    @IBAction func tiendas(){
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "MapStores") as! TiendasViewController
        self.navigationController?.pushViewController(vc, animated: true)
        //print("Tiendas")
    }
    
    @IBAction func buscar(){
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "SearchView") as! SearchSerieViewController
        self.navigationController?.pushViewController(vc, animated: true)
        //print("Tiendas")
    }
    
    @IBAction func home(){
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "CategoriasTableViewController") as! CategoriasTableViewController
        self.navigationController?.pushViewController(vc, animated: true)
        //print("Tiendas")
    }

}
