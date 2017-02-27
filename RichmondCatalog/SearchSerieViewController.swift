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

class SearchSerieViewController: UIViewController,UITableViewDelegate,UITableViewDataSource, UISearchBarDelegate {
    
    @IBOutlet weak var header: UIView!
    @IBOutlet weak var footer: UIView!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    typealias tuplaSeries = (idSeries:Int,
        category_idCategory: Int,
        nombreSerie:String,
        author:String,
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
    
    var data_serie : [tuplaSeries] = []
    
    var searchActive : Bool = false
    
    var filtered:[String] = []
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    let section = ["PRESCHOOL", "PRIMARY", "SECONDARY", "YOUNG ADULTS", "SUPLEMENTARY", "EXAMS", "READERS"]
    let titles = [["CUBBY HOUSE", "PEBBLES", "GUMDROPS", "TIPPY TOES", "MY FIRST LETTERS AND SOUNDS", "CRICKETS","M@TH ADVENTURES"],["ABRACADABRA", "BEEP", "COOL KIDS", "LIGHTHOUSE", "PATHWAY TO GRAMMAR", "PATHWAY TO LITERATURE", "PATHWAY TO MATH", "PATHWAY TO SCIENCE", "SCIENCE AND GEOGRAPHY", "SKYROCKET", "SPOTLIGHT ON ENGLISH"], ["ACHIEVERS", "AWESOME", "COMBINED SCIENCES", "ENGLISH IN MOTION", "NEXT STEP", "SPOTLIGHT ON LITERATURE", "STOPWATCH"], ["AMERICAN BIG PICTURE", "@WORK", "ENGLISH ID", "GOING PRO", "IDENTITIES", "RICHMOND MAZES", "THE BIG PICTURE"], ["BUSINESS SKILLS", "BUSINESS THEORIES", "ENGLISH GRAMMAR IN STEPS", "PRIMARY METHODOLOGY HANDBOOK", "RICHMOND COMPACT DICTIONARY", "RICHMOND MINI DICTIONARY", "RICHMOND POCKET DICTIONARY", "AN INTRODUCTION TO TEACHING ENGLISH TO CHILDREN", "VISUAL GRAMMAR", "RICHMOND VOCABULARY BUILDER"], ["DELTA's KEY TO THE NEXT GENERATION TOELF TEST", "TARGET KET FOR SCHOOLS", "TARGET PET", "RICHMOND PRACTICE TESTS FOR CAMBRIDGE ENGLISH: ADVANCED", "RICHMOND PRACTICE TESTS FOR CAMBRIDGE ENGLISH: FIRST", "RICHMOND PRACTICE TESTS FOR IELTS", "PASS THE TOEIC TEST: INTRODUCTORY COURSE", "RICHMOND PRACTICE TEST - MOVERS"], ["READY, SET, GO!", "INFOQUEST", "LITTLE READERS", "SUPER STARS", "POPCORN READERS", "MEDIA READERS", "RICHMOND READERS", "DVD READERS"]]
    
    let titles_one = ["CUBBY HOUSE", "PEBBLES", "GUMDROPS", "TIPPY TOES", "MY FIRST LETTERS AND SOUNDS", "CRICKETS","M@TH ADVENTURES", "ABRACADABRA", "BEEP", "COOL KIDS", "LIGHTHOUSE", "PATHWAY TO GRAMMAR", "PATHWAY TO LITERATURE", "PATHWAY TO MATH", "PATHWAY TO SCIENCE", "SCIENCE AND GEOGRAPHY", "SKYROCKET", "SPOTLIGHT ON ENGLISH", "ACHIEVERS", "AWESOME", "COMBINED SCIENCES", "ENGLISH IN MOTION", "NEXT STEP", "SPOTLIGHT ON LITERATURE", "STOPWATCH", "AMERICAN BIG PICTURE", "@WORK", "ENGLISH ID", "GOING PRO", "IDENTITIES", "RICHMOND MAZES", "THE BIG PICTURE", "BUSINESS SKILLS", "BUSINESS THEORIES", "VISUAL GRAMMAR", "VOCABULARY BUILDER", "ENGLISH GRAMMAR IN STEPS", "PRIMARY METHODOLOGY HANDBOOK", "LESSONS LEARNED", "PRIMARY HANDBOOK FOR TEACHERS", "RICHMOND PICTURE DICTIONARY", "RICHMOND FIRST DICTIONARY", "RICHMOND DICTIONARY FULLY ILLUSTRATED", "RICHMOND DICTIONARIES", "DELTA's KEY TO THE NEXT GENERATION TOELF TEST", "TARGET KET FOR SCHOOLS", "TARGET PET", "RICHMOND PRACTICE TESTS FOR CAMBRIDGE ENGLISH: ADVANCED", "RICHMOND PRACTICE TESTS FOR CAMBRIDGE ENGLISH: FIRST", "RICHMOND PRACTICE TESTS FOR IELTS", "PASS THE TOEIC TEST", "RICHMOND PRACTICE TESTS: YLE", "RICHMOND PRACTICE TESTS: KET AND PET", "TARGET CAMBRIDGE ENGLISH: FIRST", "READY, SET, GO!", "INFOQUEST", "LITTLE READERS", "SUPER STARS", "POPCORN READERS", "MEDIA READERS", "RICHMOND READERS", "DVD READERS"]
    
    let authors = [["Fanny Riva Palacio - Stefania Villareal", "Marlina Bahena", "Gabriela Zatain", "Rebecca Williams Salvador", "Rachel Gonia - Rebecca Williams Salvador", "Annette Flavel - Isabel Moreno", "Rebecca Lee Williams"],["Lenore Cohen", "Brendan Dunne - Robin", "Gabriela Zapiain - Silvia\nZapiain - Joep van der Werff\n- Andrew Starling - Jeanette", "Michael Downie - David\nGray - Juan M. Jiménez", "Noelle Child", "Elizabeth Rodriguez -\n Stefania Villarreal - Aaron\nBurkholder", "", "", "", "Sarah Conway", ""], ["Leanne Gray - Ken Wilson", "Carol Lethaby - Simon Brewster", "Hina Hashmi - Bernice Richter", "Robert Campbell - Gill Holley - Rob Metcalf", "Carol Lethaby - Simon Brewster", "", "Simon Brewster - Viviane Kirmeline and Alastair Lane"], ["Simon Brewster - Alastair Lane", "Anna Cowper - James Greenan", "Paul Seligson - Luis Otávio Barros", "Simon Brewster - Alastair Lane", "Paul Seligson - Luis Otávio Barros", "Alastair Lane - James Styring", "Ben Goldsteing Ceri Jones"], ["Jon Marks", "Angela Lilley", "Jim Scrivener", "Elizabeth Walter - Kate Woodford", "David Bolton - Noel Goodey", "Patricia Grounds - Suzanne Guerrero - Carol Lethaby - Caroline Moore - Joep van der Werff", "Gabriel Díaz Maggioli - Lesley Painter-Farrell", "Paul Seligson - Andy Baxter - Amanda Cant - Emma Dafouz - Michele C. Guerrini - Susan House - Ricky Lowes - Genevieve Roth - Wendy Superfine - Francesca Target  -  Julie Tice", "", "", "", ""], ["Nancy Gallagher", "Sue Ireland - Joanna Kosta", "Sue Ireland - Joanna Kosta", "Language Testing 123", "Diana L. Fried-Booth", "Language Testing 123", "Miles Craven", "", "Sue Elliott - Sue Irelan - Karen Saxby - Diana L. Fried-Booth", "Bess Bradfield - Caroline Krantz"], ["Lenore Cohen", "Brendan Dunne - Robin Newton", "Michael Downiw - David Gray - Juan M Jimenez", "", "Aaron Burkholder", "", "", ""]]
    
    let images = [["cubbyhouse.png", "pebbles.png", "gumdrops.png", "tippy_toes.png", "mfls.png", "crickets.png", "math_adventures"],["abracadabra.png", "beep.png", "thumbs_cool_kids_second.png", "lighthouse.png", "pt_grammar.png", "pt_literature.png", "pt_math.png", "pt_science.png", "s_g.png", "skyrocket.png", "sp_english.png"], ["achievers.png", "awesome.png", "combined_science.png", "english_motion.png", "next_step.png", "sp_literature.png", "stopwatch.png"], ["abp.png", "work.png", "id.png", "going_pro.png", "identities.png", "mazes.png", "the_big_picture.png"], [ "bussinessskill.png", "businesstheory.png", "visual_grammar.png", "vocabulary_builder.png", "english_grammar.png", "primary_methodology_handbook.jpg", "thumbs_lessons_learned.png", "handbooks_for_teachers.png", "thumbs_richmond_picture_dictionary.png", "thumbs_richmond_first_dictionary.png","thumbs_dictionary_fully_illustrated.png", "thumbs_richmond_com_poc_min_dictionary.png"], ["toefl_ibt.png", "ket_schools.png", "pet.png", "cambridge_advanced.png", "cambridge_fist.png", "ielts.png", "toeic_introductory.jpg", "rpt_movers_sb.jpg", "thumbs_practice_tests_ket_pet.png", "thumb_target_cambridge_english_first.png"], ["thumbs_ready_set_go.jpg", "thumb_infoquest.jpg", "thumb_little_readers.jpg", "thumb_super_stars.jpg", "thumbs_popcorn_readers.jpg", "media_readers.jpg", "thumb_richmond_readers.jpg", "thumb_dvd_readers.jpg"]]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.searchBar.delegate = self
        
        let path: String = Bundle.main.path(forResource: "series", ofType: "json")as String!
        let jsonData = try! Data(contentsOf: URL(fileURLWithPath: path))
        let readableJSON = JSON(data: jsonData, options: JSONSerialization.ReadingOptions.mutableContainers, error: nil)
        
        if let items = readableJSON.array {
            
            for item in items {
                
                let idSerie             :Int        = item["idSerie"].intValue
                let category_idCategory :Int        = item["category_idCategory"].intValue
                let nombreSerie         :String     = item["name"].stringValue
                let author              :String     = item["author"].stringValue
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
                
                data_serie.append((idSeries:idSerie,category_idCategory: category_idCategory,nombreSerie:nombreSerie, author:author,
                                       descripcionSerie:descripcionSerie,imagePathA:imagePathA,imagePathB: imagePathB,CEFR: CEFR,CLIL: CLIL,announced: announced,app: app,audio: audio,british: british,digitalBook: digitalBook,digitalResources: digitalResources,dvd: dvd,examFriendly: examFriendly,hours: hours,iBook: iBook,learning: learning,levels: levels,microsite: microsite,new: new,solution: solution,spiral: spiral,videos: videos))
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
        if(searchActive) {
            return 1
        }
        return self.section.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return self.section[section]
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if(searchActive) {
            return filtered.count
        }
        return self.titles[section].count
    }
    
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        searchActive = true;
    }
    
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        searchActive = false;
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchActive = false;
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchActive = false;
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        filtered = titles_one.filter({ (text) -> Bool in
            let tmp: NSString = text as NSString
            let range = tmp.range(of: searchText, options: NSString.CompareOptions.caseInsensitive)
            return range.location != NSNotFound
        })
        if(filtered.count == 0){
            searchActive = false;
        } else {
            searchActive = true;
        }
        self.tableView.reloadData()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SerieSearch", for: indexPath)
        
        if(searchActive){
            cell.textLabel?.text = filtered[indexPath.row]
        } else {
            cell.textLabel?.text = titles[(indexPath.section)][(indexPath.row)]
            cell.detailTextLabel?.text = authors[(indexPath.section)][(indexPath.row)]
            cell.imageView?.image = UIImage(named: images[(indexPath.section)][(indexPath.row)])
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath.row)
        let serie = self.titles[(indexPath.section)][(indexPath.row)]
        print(serie)
        let path: String = Bundle.main.path(forResource: "series", ofType: "json")as String!
        let jsonData = try! Data(contentsOf: URL(fileURLWithPath: path))
        let readableJSON = JSON(data: jsonData, options: JSONSerialization.ReadingOptions.mutableContainers, error: nil)
        
        
        if let items = readableJSON.array{
            for item in items{
                if item["name"].stringValue.uppercased() == serie{
                    
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
