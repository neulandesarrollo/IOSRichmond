//
//  DetailUISegmentControl.swift
//  RichmondCatalog
//
//  Created by Yanku on 23/08/16.
//  Copyright © 2016 Yanku. All rights reserved.
//

import UIKit
import SwiftyJSON

class DetailUISegmentControl : UIViewController, UICollectionViewDataSource,UICollectionViewDelegate, UIGestureRecognizerDelegate{
    
    //MARK: - carga de valores para las El detalle de la series.
    
    var viaSegueCategoria   :Int!
    var viaSegueSerie       :Int!
    var viaNombreSerie      :String!
    var viaDescripcionSerie :String!
    var viaImagePathA       :String!
    var viaImagePathB       :String!
    var viaCEFR             :Bool!
    var viaCLIL             :Bool!
    var viaAnounced         :Bool!
    var viaApp              :Bool!
    var viaAudio            :Bool!
    var viaBritish          :Bool!
    var viaDigitalBook      :Bool!
    var viaDigitalResources :Bool!
    var viaDvd              :Bool!
    var viaExamFriendly     :Bool!
    var viaHours            :String!
    var viaIbook            :Bool!
    var viaLearning         :Bool!
    var viaLevels           :Int!
    var viaMicrosite        :Bool!
    var viaNew              :Bool!
    var viaSolution         :Bool!
    var viaSpiral           :Bool!
    var viaVideos           :Bool!
    var viaSampleunit       :String!
    var viaScope            :String!
    
    @IBOutlet weak var header: UIView!
    @IBOutlet weak var footer: UIView!
    
    // OUTLETS   
    @IBOutlet weak var collectionComplements: UICollectionView!
    @IBOutlet weak var collectionHrLevels: UICollectionView!
    @IBOutlet weak var SegmentDetail: UISegmentedControl!
    @IBOutlet weak var tableTeaches: UITableView!
    @IBOutlet weak var tableTeachesDos: UITableView!
    @IBOutlet weak var tableISBN: UITableView!
    @IBOutlet weak var vista1: UIView!
    @IBOutlet weak var vista2: UIView!
    @IBOutlet weak var vista3: UIView!
    @IBOutlet weak var vista4: UIView!
    @IBOutlet weak var imgIsnew: UIImageView!
    @IBOutlet weak var imgDetailSerie: UIImageView!
    @IBOutlet weak var imgSampleUnit: UIImageView!
    @IBOutlet weak var imgScope: UIImageView!
    @IBOutlet weak var txtTitleDetailSerie: UILabel!
    @IBOutlet weak var txtAuthDetailSerie: UILabel!
    @IBOutlet weak var txtDescriptionDetailSerie: UITextView!
    @IBOutlet weak var txtTitleComponents: UILabel!
    @IBOutlet weak var txtTitleComponentsTeachers: UILabel!
    @IBOutlet weak var txtTitleISBNStudents: UILabel!
    @IBOutlet weak var txtTitleISBNTeachers: UILabel!
    @IBOutlet weak var txtComponents: UITextView!
    @IBOutlet weak var txtComponentsTeachers: UITextView!
    @IBOutlet weak var txtMoreComponentsTeachers: UITextView!
    @IBOutlet weak var txtISBNStudents: UITextView!
    @IBOutlet weak var txtISBNTeachers: UITextView!
    @IBOutlet weak var imgDet1: UIImageView!
    @IBOutlet weak var imgDet2: UIImageView!
    @IBOutlet weak var imgDet3: UIImageView!
    @IBOutlet weak var txtDet1: UITextView!
    @IBOutlet weak var txtDet2: UITextView!
    @IBOutlet weak var txtDet3: UITextView!
    
    var colorsSegments = [
        UIColor(red:0.965,  green:0.585,  blue:0.116, alpha:1),
        UIColor(red:0.090,  green:0.677,  blue:0.753, alpha:1),
        UIColor(red:0.565,  green:0.255,  blue:0.580, alpha:1),
        UIColor(red:0.097,  green:0.706,  blue:0.580, alpha:1),
        UIColor(red:0.928,  green:0.331,  blue:0.345, alpha:1),
        UIColor(red:0.893,  green:0.718,  blue:0.035, alpha:1),
        UIColor(red:0.820,  green:0.885,  blue:0.208, alpha:1),
        UIColor(red:0.274,  green:0.507,  blue:0.710, alpha:1)
    ]
    var colorsSeriesSolid = [
        UIColor(red:0.965,  green:0.585,  blue:0.116, alpha:1),
        UIColor(red:0.090,  green:0.677,  blue:0.753, alpha:1),
        UIColor(red:0.565,  green:0.255,  blue:0.580, alpha:1),
        UIColor(red:0.097,  green:0.706,  blue:0.580, alpha:1),
        UIColor(red:0.928,  green:0.331,  blue:0.345, alpha:1),
        UIColor(red:0.893,  green:0.718,  blue:0.035, alpha:1),
        UIColor(red:0.820,  green:0.885,  blue:0.208, alpha:1),
        UIColor(red:0.274,  green:0.507,  blue:0.710, alpha:1)
    ]
    typealias tuplaStudents = (
        idResource: Int,
        serie_idSerie: Int,
        serieName: String,
        name:   String,
        type:   String,
        level:  String,
        isbn:   String
    )
    typealias tuplaTeachers = (
        idResource: Int,
        serie_idSerie: Int,
        serieName: String,
        name:   String,
        type:   String,
        level:  String,
        isbn:   String
    )
    typealias tuplaISBN = (
        idResource: Int,
        serie_idSerie: Int,
        category_idCategory: Int,
        serieName: String,
        name:   String,
        type:   String,
        level:  String,
        isbn:   String
    )
    //MARK: - ViewDidLoad Detalles
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // logo de richsmond en el Navigation Bar
        /*let logo = UIImage(named: "logoRichmondC")
        let imageView = UIImageView(image:logo)
        self.navigationItem.titleView = imageView*/
        
        /*navigationController?.navigationBar.barTintColor = colorsSeriesSolid[viaSegueCategoria-1]
        self.navigationController?.navigationBar.isTranslucent = false
        self.navigationController?.navigationBar.tintColor = UIColor.white
        self.navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.white]
        */
        // carga de colores dinamicos deacuerdo a su categoria
        /*self.tableTeaches.separatorStyle = .none
        self.tableTeachesDos.separatorStyle = .none
        self.tableISBN.separatorStyle = .none*/
        
        
        SegmentDetail.tintColor = UIColor(red: 0.9882, green: 0.9882, blue: 0.9882, alpha: 1.0)
        
        switch viaSegueCategoria {
        case 1:
            let color       = viaSegueCategoria - 1
            let colorSolid  = viaSegueCategoria - 1
            SegmentDetail.backgroundColor = colorsSegments[color]
            txtTitleDetailSerie.textColor = colorsSeriesSolid[colorSolid]
            txtTitleComponents.textColor = colorsSeriesSolid[colorSolid]
            txtTitleComponentsTeachers.textColor = colorsSeriesSolid[colorSolid]
            txtTitleISBNStudents.textColor = colorsSeriesSolid[colorSolid]
            txtTitleISBNTeachers.textColor = colorsSeriesSolid[colorSolid]
            self.header.backgroundColor = colorsSegments[color]
            self.footer.backgroundColor = colorsSegments[color]
        case 2:
            let color = viaSegueCategoria - 1
            let colorSolid  = viaSegueCategoria - 1
            SegmentDetail.backgroundColor = colorsSegments[color]
            txtTitleDetailSerie.textColor = colorsSeriesSolid[colorSolid]
            txtTitleComponents.textColor = colorsSeriesSolid[colorSolid]
            txtTitleComponentsTeachers.textColor = colorsSeriesSolid[colorSolid]
            txtTitleISBNStudents.textColor = colorsSeriesSolid[colorSolid]
            txtTitleISBNTeachers.textColor = colorsSeriesSolid[colorSolid]
            txtTitleDetailSerie.textColor = colorsSeriesSolid[colorSolid]
            self.header.backgroundColor = colorsSegments[color]
            self.footer.backgroundColor = colorsSegments[color]
        case 3:
            let color = viaSegueCategoria - 1
            let colorSolid  = viaSegueCategoria - 1
            SegmentDetail.backgroundColor = colorsSegments[color]
            txtTitleDetailSerie.textColor = colorsSeriesSolid[colorSolid]
            txtTitleDetailSerie.textColor = colorsSeriesSolid[colorSolid]
            txtTitleComponents.textColor = colorsSeriesSolid[colorSolid]
            txtTitleComponentsTeachers.textColor = colorsSeriesSolid[colorSolid]
            txtTitleISBNStudents.textColor = colorsSeriesSolid[colorSolid]
            txtTitleISBNTeachers.textColor = colorsSeriesSolid[colorSolid]
            self.header.backgroundColor = colorsSegments[color]
            self.footer.backgroundColor = colorsSegments[color]
        case 4:
            let color = viaSegueCategoria - 1
            let colorSolid  = viaSegueCategoria - 1
            SegmentDetail.backgroundColor = colorsSegments[color]
            txtTitleDetailSerie.textColor = colorsSeriesSolid[colorSolid]
            txtTitleDetailSerie.textColor = colorsSeriesSolid[colorSolid]
            txtTitleComponents.textColor = colorsSeriesSolid[colorSolid]
            txtTitleComponentsTeachers.textColor = colorsSeriesSolid[colorSolid]
            txtTitleISBNStudents.textColor = colorsSeriesSolid[colorSolid]
            txtTitleISBNTeachers.textColor = colorsSeriesSolid[colorSolid]
            self.header.backgroundColor = colorsSegments[color]
            self.footer.backgroundColor = colorsSegments[color]
        case 5:
            let color = viaSegueCategoria - 1
            let colorSolid  = viaSegueCategoria - 1
            SegmentDetail.backgroundColor = colorsSegments[color]
            txtTitleDetailSerie.textColor = colorsSeriesSolid[colorSolid]
            txtTitleDetailSerie.textColor = colorsSeriesSolid[colorSolid]
            txtTitleComponents.textColor = colorsSeriesSolid[colorSolid]
            txtTitleComponentsTeachers.textColor = colorsSeriesSolid[colorSolid]
            txtTitleISBNStudents.textColor = colorsSeriesSolid[colorSolid]
            txtTitleISBNTeachers.textColor = colorsSeriesSolid[colorSolid]
            self.header.backgroundColor = colorsSegments[color]
            self.footer.backgroundColor = colorsSegments[color]
        case 6:
            let color = viaSegueCategoria - 1
            let colorSolid  = viaSegueCategoria - 1
            SegmentDetail.backgroundColor = colorsSegments[color]
            txtTitleDetailSerie.textColor = colorsSeriesSolid[colorSolid]
            txtTitleDetailSerie.textColor = colorsSeriesSolid[colorSolid]
            txtTitleComponents.textColor = colorsSeriesSolid[colorSolid]
            txtTitleComponentsTeachers.textColor = colorsSeriesSolid[colorSolid]
            txtTitleISBNStudents.textColor = colorsSeriesSolid[colorSolid]
            txtTitleISBNTeachers.textColor = colorsSeriesSolid[colorSolid]
            self.header.backgroundColor = colorsSegments[color]
            self.footer.backgroundColor = colorsSegments[color]
        case 7:
            let color = viaSegueCategoria - 1
            let colorSolid  = viaSegueCategoria - 1
            SegmentDetail.backgroundColor = colorsSegments[color]
            txtTitleDetailSerie.textColor = colorsSeriesSolid[colorSolid]
            txtTitleDetailSerie.textColor = colorsSeriesSolid[colorSolid]
            txtTitleComponents.textColor = colorsSeriesSolid[colorSolid]
            txtTitleComponentsTeachers.textColor = colorsSeriesSolid[colorSolid]
            txtTitleISBNStudents.textColor = colorsSeriesSolid[colorSolid]
            txtTitleISBNTeachers.textColor = colorsSeriesSolid[colorSolid]
            self.header.backgroundColor = colorsSegments[color]
            self.footer.backgroundColor = colorsSegments[color]
        case 8:
            let color = viaSegueCategoria - 1
            let colorSolid  = viaSegueCategoria - 1
            SegmentDetail.backgroundColor = colorsSegments[color]
            txtTitleDetailSerie.textColor = colorsSeriesSolid[colorSolid]
            txtTitleDetailSerie.textColor = colorsSeriesSolid[colorSolid]
            txtTitleComponents.textColor = colorsSeriesSolid[colorSolid]
            txtTitleComponentsTeachers.textColor = colorsSeriesSolid[colorSolid]
            txtTitleISBNStudents.textColor = colorsSeriesSolid[colorSolid]
            txtTitleISBNTeachers.textColor = colorsSeriesSolid[colorSolid]
            self.header.backgroundColor = colorsSegments[color]
            self.footer.backgroundColor = colorsSegments[color]
        default:
            print("Error: no se econtro el color")
        }
        // MARK: - carga inicial de vistas del UISegmentedControl
        
        self.header.layer.shadowColor = UIColor.darkGray.cgColor
        self.header.layer.shadowOpacity = 0.8
        self.header.layer.shadowRadius = 3
        self.header.layer.shadowOffset = CGSize(width: 2.0, height: 2.0)
        
        vista1.isHidden = false
        vista2.isHidden = true
        vista3.isHidden = true
        vista4.isHidden = true
        imgSampleUnit.isHidden = true
        imgScope.isHidden = true
        
        txtTitleDetailSerie.text        = viaNombreSerie
        if obtenerAutores() == "no authors"{
            txtAuthDetailSerie.isHidden = true
        }else{
            txtAuthDetailSerie.text = obtenerAutores()
        }
        print(viaImagePathB)
        txtDescriptionDetailSerie.text  = viaDescripcionSerie.replacingOccurrences(of: obtenerAutores()+"\n", with: "")
        imgDetailSerie.image            = UIImage(named: viaImagePathB)
        
        if viaNew != true {
            imgIsnew.isHidden = true
        }
        if viaSampleunit != ""{
            imgSampleUnit.isHidden = false
            let tap = UITapGestureRecognizer.init(target: self, action: #selector(enviarLinkSample(sender:)))
            tap.delegate = self
            tap.numberOfTapsRequired = 1
            imgSampleUnit.addGestureRecognizer(tap)
            imgSampleUnit.isUserInteractionEnabled = true
            
        }else{
            imgSampleUnit.isHidden = true
        }
        if viaScope != ""{
            imgScope.isHidden = false
            let tapScope = UITapGestureRecognizer.init(target: self, action: #selector(enviarLinkScope(sender:)))
            tapScope.delegate = self
            tapScope.numberOfTapsRequired = 1
            imgScope.addGestureRecognizer(tapScope)
            imgScope.isUserInteractionEnabled = true
        }else{
            imgScope.isHidden = true
        }
        
        if viaSegueSerie == 1 {
            self.txtComponents.text = "- Student's Book\n\n- Student's CD"
            imgDet1.image = UIImage(named: "schoolcubbyhouse1.png")
            imgDet2.image = UIImage(named: "schoolcubbyhouses2.png")
            imgDet3.image = UIImage(named: "schoolcubbyhouse3.png")
            self.txtDet1.text = "Each unit ends with a page to review vocabulary and language."
            self.txtDet2.text = "CLIL lessons explore an area related to the topic of the lesson."
            self.txtDet3.text = "There are beautiful pop- outs in Level 1 and cut-outs in Levels 2 and 3 to complete some activities in the Student’s Book pages."
            self.txtComponentsTeachers.text = "- Guía del Maestro (In Spanish)\n\n- Class & Resource CD\n\n- Story Cards\n\n- Flashcards"
            self.txtMoreComponentsTeachers.text = "In the Teacher’s Guide, teacher’s will  nd instructions to build a play house—similar to those in the Values section—where students can develop their creativity and motor skills.\n\nTeachers will also  nd suggestions to use the cubby houses— children can keep their toys or school materials inside or get in to color and play.\n\nBy building their cubby houses, students will enjoy themselves while understanding and visualizing the value in a more memorable way!"
            self.txtISBNStudents.text = "Level 1          756009844452\nLevel 2          756009844469\nLevel 3          756009844476"
            self.txtISBNTeachers.text = "Level 1          756009845183\nLevel 2          756009845900\nLevel 3          756009845900"
            
        } else if viaSegueSerie == 2 {
            self.txtComponents.text = "-Student’s Book\n \n- Resource Booklet \n \n- Hands-on Activity Pad \n \n- Student’s CD"
            imgDet1.isHidden = true
            imgDet2.isHidden = true
            imgDet3.isHidden = true
            self.txtDet1.isHidden = true
            self.txtDet2.isHidden = true
            self.txtDet3.isHidden = true
            self.txtComponentsTeachers.text = "-Teacher’s Guide in Spanish\n \n-Class CD\n \n-Flashcards\n \n-Fun Activity Mat with Pebble Puppet\n \n"
            self.txtMoreComponentsTeachers.isHidden = true
            self.txtISBNStudents.text = "Level 1          7506009834934\nLevel 2          7506009834941\nLevel 3          7506009834958"
            self.txtISBNTeachers.text = "Level 1          7506009835405\nLevel 2          7506009835412\nLevel 3          7506009835429"
            
        } else if viaSegueSerie == 3 {
            self.txtComponents.text = "- Student’s Book Activity Pad\n \n-Student’s Audio CD (Level 1)\n \n-Student’s Audio/Interactive CD-ROM (Levels 2 and 3)\n \n-Student’s (Resource Pack)\n \n-Finger and Stick Puppets - Stickers\n \n-Mini- fashcards"
            imgDet1.isHidden = true
            imgDet2.isHidden = true
            imgDet3.isHidden = true
            self.txtDet1.isHidden = true
            self.txtDet2.isHidden = true
            self.txtDet3.isHidden = true
            self.txtComponentsTeachers.text = "- Teacher’s Guide\n \n-Big Books\n \n-Posters &amp; Cutouts\n \n-Teacher’s Resource CD-ROM\n \n-Class Audio\n \n-Classroom Language Cards\n \n-Digital Book\n \n"
            self.txtMoreComponentsTeachers.isHidden = true
            self.txtISBNStudents.text = "Level K          7506009837508\nLevel 1          7506009834934\nLevel 2          7506009834941\nLevel 3          7506009834958"
            self.txtISBNTeachers.text = "Level 1          7506009835405\nLevel 2          7506009835412\nLevel 3          7506009835429"
            
        } else if viaSegueSerie == 4 {
            self.txtComponents.text = "- Student’s Book\n \n-Stickers\n \n-Activity Book\n \n-Student’s CD\n \n-Interactive CD (Levels 2 and 3)\n \n-Tippy Toes App (Level 1)"
            imgDet1.image = UIImage(named: "schoolcricketss1.png")
            imgDet2.image = UIImage(named: "schoolcricketss2.png")
            imgDet3.isHidden = true
            self.txtDet1.text = "The pages of the lessons present the materials, objectives, structures and vocabulary."
            self.txtDet2.text = "Each lesson is divided into four sections."
            self.txtDet3.isHidden = true
            self.txtComponentsTeachers.text = "-Teacher’s Book \n \n-Class CD\n \n-Big Book\n \n-Posters &amp; Cutouts \n \n-Fun Activity Mat \n \n-Puppets (Level 3) \n \n-Digital Book\n \n"
            self.txtMoreComponentsTeachers.isHidden = true
            self.txtISBNStudents.text = "Level 1          7506009842755\nLevel 2          7506009842762\nLevel 3          7506009842779"
            self.txtISBNTeachers.isHidden = true
            
        } else if viaSegueSerie == 5 {
            self.txtComponents.text = "- Student’s Book\n \n-Stickers\n \n-Activity Book\n \n-Student’s CD\n \n-Interactive CD (Levels 2 and 3)\n \n-Tippy Toes App (Level 1)"
            imgDet1.image = UIImage(named: "schooltippytoess1.png")
            imgDet2.image = UIImage(named: "schooltippytoess2.png")
            imgDet3.isHidden = true
            self.txtDet1.text = "CLIL lessons explore an area related to the topic of the lesson."
            self.txtDet2.text = "The Student’s Book includes the Mini-  ashcards section, a mini reproduction of the  ashcards that students can also use as a picture dictionary."
            self.txtDet3.isHidden = true
            self.txtComponentsTeachers.text = "- Teacher’s Book \n \n-Class CD\n \n-Big Book\n \n-Posters &amp; Cutouts \n \n-Fun Activity Mat \n \n-Puppets (Level 3) \n \n-Digital Book\n \n"
            self.txtMoreComponentsTeachers.text = "THE CRICKETS METHODOLOGY\n\n\n" +
            "The 5 Es instructional model relies on the constructivist approach to learning, which proposes that students build their own understanding and knowledge of the world, through experiencing things and re ecting on those experiences by asking questions, exploring and assessing what they know.\n\n" +
            "The model enables preschool children to develop cognitive, language and metacognitive skills and represents  ve stages of a sequence for teaching and learning:\n\n" +
            "Engage:\n" +
            "This phase starts the process. Its purpose is to raise students’ interest and get them personally involved in the lesson and allows them to make connections between past and present learning experiences.\n\n" +
            "Explore:\n" +
            "Students actively explore concepts or manipulate materials.\n\n" +
            "Explain:\n" +
            "Students explain the concepts they have been exploring or demonstrate new skills and behaviors.\n\n" +
            "Elaborate:\n" +
            "Its purpose is to extend students’ conceptual understanding and allow them to practice skills and behaviors through new experiences.\n\n" +
            "Evaluate:\n" +
            "This stage encourages learners to assess their understanding and abilities."
            self.txtISBNStudents.text = "Level 1          7506009842489\nLevel 2          7506009842571\nLevel 3          7506009842588\nLevel 4          7506009842595"
            self.txtISBNTeachers.text = "Level 1          7506009842601\nLevel 2          7506009842618\nLevel 3          7506009842625"
            
        } else if viaSegueSerie == 8 {
            self.txtComponents.text = "- Student’s Book \n \n- Resource Pack \n \n- Student’s CD"
            imgDet1.isHidden = true
            imgDet2.isHidden = true
            imgDet3.isHidden = true
            self.txtDet1.isHidden = true
            self.txtDet2.isHidden = true
            self.txtDet3.isHidden = true
            self.txtComponentsTeachers.text = "- Teacher’s Guide with Pocket Cube\n \n- Resource Pack \n \n- Teacher’s Resource CD \n \n- Digital Book\n \n"
            self.txtMoreComponentsTeachers.isHidden = true
            self.txtISBNStudents.text = "Level 2          7506009842816\nLevel 3          7506009842823"
            self.txtISBNTeachers.text = "Level 2          7506009842359\nLevel 3          7506009842366"
            
        } else if viaSegueSerie == 9 {
            self.txtComponents.text = "- Student’s Book \n \n- Student’s CD"
            imgDet1.isHidden = true
            imgDet2.isHidden = true
            imgDet3.isHidden = true
            self.txtDet1.isHidden = true
            self.txtDet2.isHidden = true
            self.txtDet3.isHidden = true
            self.txtComponentsTeachers.text = "- Teacher’s Guide in Spanish\n \n- Flashcards\n \n- Teacher’s Resource CD with Audio\n \n- Digital Book\n \n"
            self.txtMoreComponentsTeachers.isHidden = true
            self.txtISBNStudents.text = "Level 1          7506009840263\nLevel 2          7506009840270\nLevel 3          7506009840287\nLevel 4          7506009840294\nLevel 5          7506009840300\nLevel 6          7506009840317\n"
            self.txtISBNTeachers.text = "Level 1          7506009840638\nLevel 2          7506009840645\nLevel 3          7506009840652\nLevel 4          7506009840676\nLevel 5          7506009840669\nLevel 6          7506009840683\n"
            
        } else if viaSegueSerie == 10 {
            self.txtComponents.text = "Student’s Book & Activity Book combo\n \n-Student’s Audio CD\n \n-Playing Cards & Stickers (Levels 1 and 2)\n \n-Playing Cards (Levels 3 and 4)"
            imgDet1.isHidden = true
            imgDet2.isHidden = true
            imgDet3.isHidden = true
            self.txtDet1.isHidden = true
            self.txtDet2.isHidden = true
            self.txtDet3.isHidden = true
            self.txtComponentsTeachers.text = "- Teacher’s Book \n \n-Posters \n \n-Flashcards\n \n-Puppet included in the  ashcards pack (Levels 1 and 2)\n \n-Class Audio & Resource CD\n \n-Digital Book\n \n"
            self.txtMoreComponentsTeachers.isHidden = true
            self.txtISBNStudents.text = "Level 1          7506009840102\nLevel 2          7506009840119\nLevel 3          7506009840324\nLevel 4          7506009840126\nLevel 5          7506009840331\nLevel 6          7506009840133\n"
            self.txtISBNTeachers.text = "Level 1          7506009840348\nLevel 2          7506009840355\nLevel 3          7506009840362\nLevel 4          7506009840379\nLevel 5          7506009840386\nLevel 6          7506009840393\n"
            
        } else if viaSegueSerie == 12 {
            self.txtComponents.text = "- Student’s Book \n \n- Workbook \n \n- Student’s CD \n \n- Cool Reading"
            imgDet1.isHidden = true
            imgDet2.isHidden = true
            imgDet3.isHidden = true
            self.txtDet1.isHidden = true
            self.txtDet2.isHidden = true
            self.txtDet3.isHidden = true
            self.txtComponentsTeachers.text = "- Teacher’s Guide (printed and digital)\n \n- Guía del Maestro (printed and digital)\n \n- Teacher’s Resource CD (with audio, crafts instructions, extra activities, tests and word lists)\n \n- Flashcards \n \n- Cool Reading\n \n"
            self.txtMoreComponentsTeachers.isHidden = true
            self.txtISBNStudents.isHidden = true
            self.txtISBNTeachers.isHidden = true
            
        } else if viaSegueSerie == 13 {
            self.txtComponents.text = "- Student’s Book\n \n- Student’s CD \n \n- Activity Book \n \n- Stickers"
            imgDet1.isHidden = true
            imgDet2.isHidden = true
            imgDet3.isHidden = true
            self.txtDet1.isHidden = true
            self.txtDet2.isHidden = true
            self.txtDet3.isHidden = true
            self.txtComponentsTeachers.text = "- Teacher’s Book\n \n- Class CD &amp; CD-ROM\n \n- Puzzles (levels 1-3)\n \n- Word Kits (levels 4-6) \n \n- Digital Book\n \n- Poster with Word Cards and Cutouts\n \n"
            self.txtMoreComponentsTeachers.isHidden = true
            self.txtISBNStudents.text = "Level 1          7506009805163\nLevel 2          7506009805170\nLevel 3          7506009805187\nLevel 4          7506009805194\nLevel 5          7506009805200\nLevel 6          7506009805217\n"
            self.txtISBNTeachers.isHidden = true
            
        } else if viaSegueSerie == 21 {
            self.txtComponents.text = "- Student’s Book with Audio CD"
            imgDet1.isHidden = true
            imgDet2.isHidden = true
            imgDet3.isHidden = true
            self.txtDet1.isHidden = true
            self.txtDet2.isHidden = true
            self.txtDet3.isHidden = true
            self.txtComponentsTeachers.text = "- Teacher’s Booklet\n \n"
            self.txtMoreComponentsTeachers.isHidden = true
            self.txtISBNStudents.text = "Level 1          7506009842830\nLevel 2          7506009842847\nLevel 3          7506009842854\nLevel 4          7506009842861\nLevel 5          7506009842878\nLevel 6          7506009842885\n"
            self.txtISBNTeachers.text = "Level 1          9786070610837\nLevel 2          9786070610981\nLevel 3          9786070610998\nLevel 4          9786070611001\nLevel 5          9786070611018\nLevel 6          9786070611025\n"
            
        } else if viaSegueSerie == 20 {
            self.txtComponents.text = "- Student’s Book with Activity Cards"
            imgDet1.isHidden = true
            imgDet2.isHidden = true
            imgDet3.isHidden = true
            self.txtDet1.isHidden = true
            self.txtDet2.isHidden = true
            self.txtDet3.isHidden = true
            self.txtComponentsTeachers.text = "- Teacher’s Guide\n \n- Reinforcement and Extension Worksheets\n \n- Evaluations \n \n- Digital Book\n \n"
            self.txtMoreComponentsTeachers.isHidden = true
            self.txtISBNStudents.isHidden = true
            self.txtISBNTeachers.isHidden = true
            
        } else if viaSegueSerie == 19 {
            self.txtComponents.text = "- Student’s Book with Activity Cards"
            imgDet1.isHidden = true
            imgDet2.isHidden = true
            imgDet3.isHidden = true
            self.txtDet1.isHidden = true
            self.txtDet2.isHidden = true
            self.txtDet3.isHidden = true
            self.txtComponentsTeachers.text = "- Teacher’s Guide\n \n- Reinforcement and Extension Worksheets\n \n- Evaluations \n \n- Digital Book\n \n"
            self.txtMoreComponentsTeachers.isHidden = true
            self.txtISBNStudents.text = "Level 1          9786070611087\nLevel 2          9786070611032\nLevel 3          9786070611094\nLevel 4          9786070611100\nLevel 5          976070611049\nLevel 6          9786070611056\n"
            self.txtISBNTeachers.text = "Level 1          7506009842403\nLevel 2          7506009842410\nLevel 3          7506009842427\nLevel 4          7506009842434\nLevel 5          7506009842441\nLevel 6          7506009842458\n"
            
        } else if viaSegueSerie == 18 {
            self.txtComponents.text = "- Student’s Book with Activity Cards"
            imgDet1.isHidden = true
            imgDet2.isHidden = true
            imgDet3.isHidden = true
            self.txtDet1.isHidden = true
            self.txtDet2.isHidden = true
            self.txtDet3.isHidden = true
            self.txtComponentsTeachers.text = "- Teacher’s Guide\n \n- Reinforcement and Extension Worksheets\n \n- Evaluations \n \n- Digital Book\n \n"
            self.txtMoreComponentsTeachers.isHidden = true
            self.txtISBNStudents.text = "Level 1          9786070611087\nLevel 2          9786070611032\nLevel 3          9786070611094\nLevel 4          9786070611100\nLevel 5          976070611049\nLevel 6          9786070611056\n"
            self.txtISBNTeachers.text = "Level 1          7506009842403\nLevel 2          7506009842410\nLevel 3          7506009842427\nLevel 4          7506009842434\nLevel 5          7506009842441\nLevel 6          7506009842458\n"
            
        } else if viaSegueSerie == 17 {
            self.txtComponents.text = "- Student’s Book"
            imgDet1.isHidden = true
            imgDet2.isHidden = true
            imgDet3.isHidden = true
            self.txtDet1.isHidden = true
            self.txtDet2.isHidden = true
            self.txtDet3.isHidden = true
            self.txtComponentsTeachers.text = "- Teacher’s Book \n \n- Resource Book \n \n- Posters\n \n"
            self.txtMoreComponentsTeachers.isHidden = true
            self.txtISBNStudents.text = "Level 1          9786076000465\nLevel 2          9786076000557\nLevel 3          9786076000502\nLevel 4          9786076000779\nLevel 5          9786076000472\nLevel 6          9786076000878\n"
            self.txtISBNTeachers.text = "Level 1          9786076000489\nLevel 2          9786076000526\nLevel 3          9786076000519\nLevel 4          9786076000496\nLevel 5          9786076000663\nLevel 6          9786076000670\n"
            
        } else if viaSegueSerie == 14 {
            self.txtComponents.text = "- Student’s Book\n \n- Practice Book\n \n- Student’s CD\n \n- Richmond Spiral Platform"
            imgDet1.image = UIImage(named: "primariaskyrockets1.png")
            imgDet2.image = UIImage(named: "primariaskyrockets2.png")
            imgDet3.isHidden = true
            self.txtDet1.text = "Nine units of 10 pages each, a review and a literature section every three units, dictionary and stickers."
            self.txtDet2.text = "Consolidates and reinforces grammar and vocabulary."
            self.txtDet3.isHidden = true
            self.txtComponentsTeachers.text = "- Teacher’s Guide\n \n- Class Audio CD\n \n- Teacher’s Resource CD\n \n- Posters and Word Cards\n \n- Digital Media Projects (Levels 3-6)\n \n- Digital Book\n \n- Richmond Spiral Platform\n \n"
            self.txtMoreComponentsTeachers.text = "Skyrocket is a sis-level grammar book that follows the syllabus of the primary school series Skyrocket. Each unit offers short grammar explanations of the main grammar points in a direct and open way. It includes entertaining activities for students to practice in class or at home. At the end of each unit, there is a two-page reading lesson where students can consolidate all the language points studied in the lesson." +
                "\n\n" +
            "Skyrocket Your Grammar also offers review lessons and grammar songs!\n\n\n\n\n\n\n\n"
            self.txtISBNStudents.text = "Level 1          7506009839908\nLevel 2          7506009839915\nLevel 3          7506009839922\nLevel 4          7506009839939\nLevel 5          7506009839946\nLevel 6          7506009839953"
            self.txtISBNTeachers.text = "Level 1          7506009839960\nLevel 2          7506009839984\nLevel 3          7506009840461\nLevel 4          7506009840478\nLevel 5          7506009840485\nLevel 6          7506009840492"
            
        } else if viaSegueSerie == 22 {
            self.txtComponents.text = "- Student’s Book \n \n- Practice Book \n \n- Assessments \n \n- Interactive CD-ROM \n \n- Thematic Library"
            imgDet1.isHidden = true
            imgDet2.isHidden = true
            imgDet3.isHidden = true
            self.txtDet1.isHidden = true
            self.txtDet2.isHidden = true
            self.txtDet3.isHidden = true
            self.txtComponentsTeachers.text = "- Teacher’s Guide\n \n- Assessments Teacher’s Manual\n \n- Blackline Masters\n \n- Audio CD\n \n- Photo Cards\n \n- Poster Cutouts (Level K)\n \n- Big Books (Level K)\n \n- Teacher’s Digital Resource Pack\n \n- Digital Book\n \n"
            self.txtMoreComponentsTeachers.isHidden = true
            self.txtISBNStudents.text = "Level K          7506009835900\nLevel 1          7506009835856\nLevel 2          7506009835863\nLevel 3          7506009835870\nLevel 4          7506009835887\nLevel 5          7506009835894\nLevel 6          7506009835900\n"
            self.txtISBNTeachers.text = "Level 1          7506009807983\nLevel 2          7506009807990\nLevel 3          7506009808003\nLevel 4          7506009808010\nLevel 5          7506009808027\nLevel 6          7506009808034\n"
            
        } else if viaSegueSerie == 27 {
            self.txtComponents.text = "- Student’s Book \n \n- Workbook \n \n- Audio CD \n \n- Richmond Spiral Platform"
            imgDet1.isHidden = true
            imgDet2.isHidden = true
            imgDet3.isHidden = true
            self.txtDet1.isHidden = true
            self.txtDet2.isHidden = true
            self.txtDet3.isHidden = true
            self.txtComponentsTeachers.text = "- Teacher’s Book\n \n- Teacher’s Resource Book\n \n- Teacher’s Digital Book\n \n- Teacher’s Audio Material Pack\n \n- Richmond Spiral Platform\n \n"
            self.txtMoreComponentsTeachers.isHidden = true
            self.txtISBNStudents.text = "Level 1          7506009840829\nLevel 2          7506009841086\nLevel 3          7506009841154\nLevel 4          7506009841161"
            self.txtISBNTeachers.text = "Level 1          7506009841178\nLevel 2          7506009841185\nLevel 3          7506009841192\nLevel 4          7506009841208"
            
        } else if viaSegueSerie == 26 {
            self.txtComponents.text = "- Student’s Book \n \n- Workbook \n \n- Audio CD \n \n- Richmond Spiral Platform"
            imgDet1.isHidden = true
            imgDet2.isHidden = true
            imgDet3.isHidden = true
            self.txtDet1.isHidden = true
            self.txtDet2.isHidden = true
            self.txtDet3.isHidden = true
            self.txtComponentsTeachers.text = "- Teacher’s Book\n \n- Resource Book\n \n- Class CDs\n \n- Tests\n \n- Posters\n \n- Digital Book\n \n"
            self.txtMoreComponentsTeachers.isHidden = true
            self.txtISBNStudents.text = "Level 1          7506009840829\nLevel 2          7506009841086\nLevel 3          7506009841154\nLevel 4          7506009841161"
            self.txtISBNTeachers.text = "Level 1          7506009841178\nLevel 2          7506009841185\nLevel 3          7506009841192\nLevel 4          7506009841208"
            
        } else if viaSegueSerie == 29 {
            self.txtComponents.text = "- Student’s Book \n \n- Practice Book\n \n- Reference Guide"
            imgDet1.isHidden = true
            imgDet2.isHidden = true
            imgDet3.isHidden = true
            self.txtDet1.isHidden = true
            self.txtDet2.isHidden = true
            self.txtDet3.isHidden = true
            self.txtComponentsTeachers.text = "- Online Teacher’s Guide and Videos\n \n"
            self.txtMoreComponentsTeachers.isHidden = true
            self.txtISBNStudents.text = "Level 1          Biology\nLevel 2          Physics\nLevel 3          Chemistry\n"
            self.txtISBNTeachers.text = "Level 1          7506009843349\nLevel 2          7506009843356\nLevel 3          7506009843363"
            
        } else if viaSegueSerie == 25 {
            self.txtComponents.text = "- Student’s Book\n \n- Workbook\n \n- Student’s Multi-ROM\n \n- My Portfolio downloadable online"
            imgDet1.isHidden = true
            imgDet2.isHidden = true
            imgDet3.isHidden = true
            self.txtDet1.isHidden = true
            self.txtDet2.isHidden = true
            self.txtDet3.isHidden = true
            self.txtComponentsTeachers.text = "- Teacher’s Book\n \n- Class CDs\n \n- Teacher’s all-in-one Book Tests Book\n \n- Test CD\n \n- DVD\n \n- Digital Book\n \n- Website\n \n"
            self.txtMoreComponentsTeachers.isHidden = true
            self.txtISBNStudents.text = "Level 1          7506009834149\nLevel 2          7506009834156\nLevel 3          7506009834163\nLevel 3          7506009834170\n"
            self.txtISBNTeachers.text = "Level 1          7506009838833\nLevel 2          7506009838840\nLevel 3          7506009838857\nLevel 3          7506009838864\n"
            
        } else if viaSegueSerie == 24 {
            self.txtComponents.text = "- Student’s Book \n \n- Practice Book \n \n- CD-ROM"
            imgDet1.isHidden = true
            imgDet2.isHidden = true
            imgDet3.isHidden = true
            self.txtDet1.isHidden = true
            self.txtDet2.isHidden = true
            self.txtDet3.isHidden = true
            self.txtComponentsTeachers.text = "- Teacher’s Book\n \n- Class CDs &amp; Tests\n \n- Tests (can be downloaded and adapted)\n \n- Posters Digital Book\n \n"
            self.txtMoreComponentsTeachers.isHidden = true
            self.txtISBNStudents.text = "Level 1          7506009831179\nLevel 2          7506009831186\nLevel 3          7506009831193\nLevel 3          7506009831353\n"
            self.txtISBNTeachers.text = "Level 1          9786070604201\nLevel 2          9786070604218\nLevel 3          9786070604225\nLevel 3          9786070604232\n"
            
        } else if viaSegueSerie == 28 {
            self.txtComponents.text = "- Student’s Book (with integrated workbook)"
            imgDet1.isHidden = true
            imgDet2.isHidden = true
            imgDet3.isHidden = true
            self.txtDet1.isHidden = true
            self.txtDet2.isHidden = true
            self.txtDet3.isHidden = true
            self.txtComponentsTeachers.text = "- Teacher’s Guide \n \n- Teacher’s CD-ROM\n \n"
            self.txtMoreComponentsTeachers.isHidden = true
            self.txtISBNStudents.text = "Level 1          9786070607943\nLevel 2          9786070607950\nLevel 3          9786070607967\nLevel 4          9786070607974\nLevel 5          9786070607981\nLevel 6          9786070607998\n"
            self.txtISBNTeachers.text = "Level 1          7506009838161\nLevel 2          7506009838178\nLevel 3          7506009838185\nLevel 4          7506009838192\nLevel 5          7506009838208\nLevel 6          7506009838215\n"
            
        } else if viaSegueSerie == 23 {
            self.txtComponents.text = "- Student’s Book with integrated Workbook and Audio CD\n\n- App"
            imgDet1.image = UIImage(named: "secundariastopwatchs1.png")
            imgDet2.image = UIImage(named: "secundariastopwatchs2.png")
            imgDet3.isHidden = true
            self.txtDet1.text = "New pages that introduce the vocabulary of each unit! " +
            "Attractive texts that help students develop their reading skills!"
            self.txtDet2.text = "Activities to help students develop listening and speaking skills! " +
            "Writing activities that take students step by step to create different pieces of writing!"
            self.txtDet3.isHidden = true
            self.txtComponentsTeachers.text = "- Teacher’s Guide\n \n- Teacher’s Toolkit (CD)\n \n- Class audio\n \n- Exams and exam audio\n \n- Additional readings with activities\n \n- Grammar worksheets\n \n- Vocabulary worksheets\n \n- Digital Book App\n \n"
            self.txtMoreComponentsTeachers.isHidden = true
            self.txtISBNStudents.isHidden = true
            self.txtISBNTeachers.isHidden = true
            
        } else if viaSegueSerie == 32 {
            self.txtComponents.text = "- Student’s Book\n \n- Workbook\n \n- Audio CD\n \n- Downloadable audio online\n \n- Split Edition Available\n \n- Interactive online activities\n \n- Learning Platform"
            imgDet1.isHidden = true
            imgDet2.isHidden = true
            imgDet3.isHidden = true
            self.txtDet1.isHidden = true
            self.txtDet2.isHidden = true
            self.txtDet3.isHidden = true
            self.txtComponentsTeachers.text = "- Teacher’s Book\n \n- Class Audio CD\n \n- Digital Book\n \n- Test Studio\n \n- Online videos and author interviews\n \n- Learning Platform\n \n"
            self.txtMoreComponentsTeachers.isHidden = true
            self.txtISBNStudents.text = "A1          7506009834965\nA2          7506009834972\nB1          7506009834989\nB1+         7506009834996\nB2          7506009835009\nC1          7506009835016\n"
            self.txtISBNTeachers.text = "A1          7506009835436\nA2          7506009835443\nB1          7506009835450\nB1+         7506009835467\nB2          7506009835474\nC1          7506009835481\n"
            
        } else if viaSegueSerie == 34 {
            self.txtComponents.text = "- Student’s Book with access code\n \n- Workbook \n \n- Audio CD \n \n- eWorkbook"
            imgDet1.isHidden = true
            imgDet2.isHidden = true
            imgDet3.isHidden = true
            self.txtDet1.isHidden = true
            self.txtDet2.isHidden = true
            self.txtDet3.isHidden = true
            self.txtComponentsTeachers.text = "- Teacher’s Book \n \n- Class Audio CD \n \n- Learning Platform \n \n- Digital book for IWB\n \n"
            self.txtMoreComponentsTeachers.isHidden = true
            self.txtISBNStudents.text = "Level 1          9788466813570\nLevel 2          9788466813631\nLevel 3          9788466814058\nLevel 4          9788466814119\n\n\nPack @work workbook\n\nLevel 1          7506009838888\nLevel 2          7506009841420\nLevel 3          7506009839632\nLevel 4          7506009841444\n"
            self.txtISBNTeachers.text = "Level 1          9788466813600\nLevel 2          9788466814027\nLevel 3          9788466814089\nLevel 4          9788466814157\n\n\nClass Audio CD\n\nLevel 1          8431300228405\nLevel 2          8431300228436\nLevel 3          8431300228467\nLevel 4          8431300228498\n"
            
        } else if viaSegueSerie == 30 {
            self.txtComponents.text = "- Student’s Book (with portal access code)\n \n- eWorkbook\n \n- Split editions (except for Starter)\n \n- Learning Platform extra practice, audio and video"
            imgDet1.isHidden = true
            imgDet2.isHidden = true
            imgDet3.isHidden = true
            self.txtDet1.isHidden = true
            self.txtDet2.isHidden = true
            self.txtDet3.isHidden = true
            self.txtComponentsTeachers.text = "- Teacher’s Book \n \n- Class CD\n \n- DVD (ID Café) \n \n- Digital Book\n \n- Learning Platform with a full range of digital resources\n \n"
            self.txtMoreComponentsTeachers.isHidden = true
            self.txtISBNStudents.text = "Level 1          7506009840829\nLevel 2          7506009841086\nLevel 3          7506009841154\nLevel 4          7506009841161\n"
            self.txtISBNTeachers.text = "Level 1          7506009841178\nLevel 2          7506009841185\nLevel 3          7506009841192\nLevel 4          7506009841208\n"
            
        } else if viaSegueSerie == 36 {
            self.txtComponents.text = "- Student’s Book \n \n- Student’s Audio CD\n \n"
            imgDet1.image = UIImage(named: "adultsgoingpros1.png")
            imgDet2.image = UIImage(named: "adultsgoingpros2.png")
            imgDet3.isHidden = true
            self.txtDet1.text = "Each block begins with an exciting opener including a separate fold-out spread in which students explore, discuss and solve a mystery or puzzle. Subsequent lessons cover listening and speaking activities thematically connected to the opener, followed by communicative grammar and vocabulary work and reading strategies."
            self.txtDet2.text = "Case studies to promote critical thinking. Reading and writing Tips in every block, students will find boxes with explanations and practical suggestions on how to become better readers and/or writers."
            self.txtDet3.isHidden = true
            self.txtComponentsTeachers.text = "- Teacher’s Guide\n \n- Teacher’s Resource CD\n \n- DVD\n \n- Digital Book\n \n"
            self.txtMoreComponentsTeachers.isHidden = true
            self.txtISBNStudents.text = "A1          7506009834965\nA2          7506009834972\nB1          7506009834989\nB1+         7506009834996\nB2          7506009835009\nC1          7506009835016\n"
            self.txtISBNTeachers.text = "A1          7506009835436\nA2          7506009835443\nB1          7506009835450\nB1+         7506009835467\nB2          7506009835474\nC1          7506009835481\n"
            
        } else if viaSegueSerie == 31 {
            self.txtComponents.text = "- Student’s Book (with portal access code)\n \n- eWorkbook\n \n- Split editions (except for Starter)\n \n- Learning Platform extra practice, audio and video"
            imgDet1.isHidden = true
            imgDet2.isHidden = true
            imgDet3.isHidden = true
            self.txtDet1.isHidden = true
            self.txtDet2.isHidden = true
            self.txtDet3.isHidden = true
            self.txtComponentsTeachers.text = "- Teacher’s Book \n \n- Class CD\n \n- DVD (ID Café) \n \n- Digital Book\n \n- Learning Platform with a full range of digital resources\n \n"
            self.txtMoreComponentsTeachers.isHidden = true
            self.txtISBNStudents.text = "Level 1          7506009840829\nLevel 2          7506009841086\nLevel 3          7506009841154\nLevel 4          7506009841161\n"
            self.txtISBNTeachers.text = "Level 1          7506009841178\nLevel 2          7506009841185\nLevel 3          7506009841192\nLevel 4          7506009841208\n"
            
        } else if viaSegueSerie == 66 {
            self.txtComponents.isHidden = true
            imgDet1.isHidden = true
            imgDet2.isHidden = true
            imgDet3.isHidden = true
            self.txtDet1.isHidden = true
            self.txtDet2.isHidden = true
            self.txtDet3.isHidden = true
            self.txtComponentsTeachers.isHidden = true
            self.txtMoreComponentsTeachers.isHidden = true
            self.txtISBNStudents.isHidden = true
            self.txtISBNTeachers.isHidden = true
            
        } else {
            self.txtComponents.text = "- Student’s Book \n \n- Student’s CD"
            imgDet1.isHidden = true
            imgDet2.isHidden = true
            imgDet3.isHidden = true
            self.txtDet1.isHidden = true
            self.txtDet2.isHidden = true
            self.txtDet3.isHidden = true
            self.txtComponentsTeachers.text = "-Teacher’s Guide in Spanish\n \n-Class CD\n \n-Flashcards\n \n-Fun Activity Mat with Pebble Puppet\n \n"
            self.txtMoreComponentsTeachers.isHidden = true
            self.txtISBNStudents.text = "Level 1          7506009834934\nLevel 2          7506009834941\nLevel 3          7506009834958"
            self.txtISBNTeachers.text = "Level 1          7506009835405\nLevel 2          7506009835412\nLevel 3          7506009835429"
        }
        
  
    }
    
    @IBAction func regresar(){
        let _ = self.navigationController?.popViewController(animated: true)
    }
    
    func enviarLinkScope(sender: UIGestureRecognizer){
        print("se dio el tap scope...")
        UIApplication.shared.openURL(URL(string: viaScope)!)
    }
    
    func enviarLinkSample(sender: UITapGestureRecognizer){
        print("se dio el tap hommie...")
        UIApplication.shared.openURL(URL(string: viaSampleunit)!)
    }
    override func viewWillAppear(_ animated: Bool) {
        
        self.tabBarController?.tabBar.barTintColor = colorsSeriesSolid[viaSegueCategoria-1]
        self.tabBarController?.tabBar.tintColor = UIColor.white
        if #available(iOS 10.0, *) {
            self.tabBarController?.tabBar.unselectedItemTintColor = UIColor.white
        } else {
            // Fallback on earlier versions
            self.tabBarController?.tabBar.tintColor = UIColor.white
        }
        
    }
    
    // MARK: - Swich de vistas del UISegmentedControl
    
    @IBAction func indexChanged(_ sender: UISegmentedControl) {
        
        switch SegmentDetail.selectedSegmentIndex {
            
        case 0:
            vista1.isHidden = false
            vista2.isHidden = true
            vista3.isHidden = true
            vista4.isHidden = true
        case 1:
            vista1.isHidden = true
            vista2.isHidden = false
            vista3.isHidden = true
            vista4.isHidden = true
        case 2:
            vista1.isHidden = true
            vista2.isHidden = true
            vista3.isHidden = false
            vista4.isHidden = true
        case 3:
            vista1.isHidden = true
            vista2.isHidden = true
            vista3.isHidden = true
            vista4.isHidden = false
        default:
            break;
        }
    }
    
    // MARK: - MIS FUNCIONES
    
    func obtenerAutores () -> String {
        
        var subtitleDescripcionSerie : String?
        
        if viaDescripcionSerie.contains("\n"){
            var arrayDescripcionSerie = viaDescripcionSerie.components(separatedBy: "\n")
            //print(arrayDescripcionSerie)
            subtitleDescripcionSerie = arrayDescripcionSerie[0]
            //arrayDescripcionSerie.remove(at: 0)
            //txtAuthDetailSerie.text = subtitleDescripcionSerie
            //txtDescriptionDetailSerie.text = viaDescripcionSerie.replacingOccurrences(of: "\n", with: "")
        }
        return subtitleDescripcionSerie!
    }
    func obtenerIconosComplementos() -> Array<UIImage>	{
        
        let arrayComplementos : [Bool] = [viaDigitalResources,viaDvd,viaAudio,viaApp,viaMicrosite,viaVideos,viaCLIL,viaDigitalBook,viaExamFriendly,viaIbook]
        
        var arrayImagenes : [UIImage] = []
        
        if arrayComplementos[0] == true {
            arrayImagenes.append(UIImage(named: "digital_resources.png")!)
        }
        if arrayComplementos[1] == true {
            arrayImagenes.append(UIImage(named: "dvd.png")!)
        }
        if arrayComplementos[2] == true {
            arrayImagenes.append(UIImage(named: "audio.png")!)
        }
        if arrayComplementos[3] == true {
            arrayImagenes.append(UIImage(named: "app.png")!)
        }
        if arrayComplementos[4] == true {
            arrayImagenes.append(UIImage(named: "microsite.png")!)
        }
        if arrayComplementos[5] == true {
            arrayImagenes.append(UIImage(named: "videos.png")!)
        }
        if arrayComplementos[6] == true {
            arrayImagenes.append(UIImage(named: "videos.png")!)
        }
        if arrayComplementos[7] == true {
            arrayImagenes.append(UIImage(named: "ibook.png")!)
        }
        if arrayComplementos[8] == true {
            arrayImagenes.append(UIImage(named: "exam_friendly.png")!)
        }
        if arrayComplementos[9] == true {
            arrayImagenes.append(UIImage(named: "digital_resources.png")!)
        }
        
        return arrayImagenes
    }
    func obtenerIconosHrLevel () -> Array<UIImage>{
        let arrayHrLevels : [Any] = [viaLevels,viaHours,viaBritish,viaSpiral,viaLearning,viaSolution]
        
        var arrayImagenes : [UIImage] = []
        
        if arrayHrLevels[0] as? Int == 2 {
            arrayImagenes.append(UIImage(named: "levels2.png")!)
        }
        if arrayHrLevels[0] as? Int == 3 {
            arrayImagenes.append(UIImage(named: "levels3.png")!)
        }
        if arrayHrLevels[0] as? Int == 4 {
            arrayImagenes.append(UIImage(named: "levels4.png")!)
        }
        if arrayHrLevels[0] as? Int == 5 {
            arrayImagenes.append(UIImage(named: "levels5.png")!)
        }
        if arrayHrLevels[0] as? Int == 6 {
            arrayImagenes.append(UIImage(named: "levels6.png")!)
        }
        if arrayHrLevels[0] as? Int == 7 {
            arrayImagenes.append(UIImage(named: "levels7.png")!)
        }
        if arrayHrLevels[1] as? String == "1/3" {
            arrayImagenes.append(UIImage(named: "hours1_3.png")!)
        }
        if arrayHrLevels[1] as? String == "2/4" {
            arrayImagenes.append(UIImage(named: "hours2_4.png")!)
        }
        if arrayHrLevels[1] as? String == "3/5" {
            arrayImagenes.append(UIImage(named: "hours3_5.png")!)
        }
        if arrayHrLevels[1] as? String == "3" {
            arrayImagenes.append(UIImage(named: "hours3.png")!)
        }
        if arrayHrLevels[1] as? String == "5/10" {
            arrayImagenes.append(UIImage(named: "hours5_10.png")!)
        }
        if arrayHrLevels[1] as? String == "5/7.5" {
            arrayImagenes.append(UIImage(named: "hours5_75.png")!)
        }
        if arrayHrLevels[1] as? String == "5" {
            arrayImagenes.append(UIImage(named: "hours5.png")!)
        }
        if arrayHrLevels[1] as? String == "7/10" {
            arrayImagenes.append(UIImage(named: "hours7_10.png")!)
        }
        if arrayHrLevels[1] as? String == "7" {
            arrayImagenes.append(UIImage(named: "hours7.png")!)
        }
        if arrayHrLevels[1] as? String == "10" {
            arrayImagenes.append(UIImage(named: "hours10.png")!)
        }
        if arrayHrLevels[1] as? String == "35" {
            arrayImagenes.append(UIImage(named: "hours35.png")!)
        }
        if arrayHrLevels[1] as? String == "45/60" {
            arrayImagenes.append(UIImage(named: "hours7.png")!)
        }
        if arrayHrLevels[1] as? String == "45" {
            arrayImagenes.append(UIImage(named: "hours45.png")!)
        }
        if arrayHrLevels[1] as? String == "80/100" {
            arrayImagenes.append(UIImage(named: "hours80_100.png")!)
        }
        if arrayHrLevels[1] as? String == "80/120" {
            arrayImagenes.append(UIImage(named: "hours80_120.png")!)
        }
        if arrayHrLevels[1] as? String == "90/120" {
            arrayImagenes.append(UIImage(named: "hours7.png")!)
        }
        if arrayHrLevels[2] as? Bool == true{
            arrayImagenes.append(UIImage(named: "british.png")!)
        }
        if arrayHrLevels[3] as? Bool == true{
            arrayImagenes.append(UIImage(named: "spiral.png")!)
        }
        if arrayHrLevels[4] as? Bool == true{
            arrayImagenes.append(UIImage(named: "learning.png")!)
        }
        if arrayHrLevels[5] as? Bool == true{
            arrayImagenes.append(UIImage(named: "solution.png")!)
        }
        return arrayImagenes
    }
    
    // MARK: - UICollectionView Protocol
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if collectionView == collectionComplements{
            return obtenerIconosComplementos().count
        }else{
            return obtenerIconosHrLevel().count
        }
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let row = indexPath.row
        //let section = indexPath.section
        
        let cell : DetailCollectionViewCell = (collectionView.dequeueReusableCell(withReuseIdentifier: "cellCollection", for: indexPath) as? DetailCollectionViewCell)!
        
        if collectionView == collectionComplements{
            cell.imgComplemento.image = obtenerIconosComplementos()[row]
        }else{
            cell.imgComplemento.image = obtenerIconosHrLevel()[row]
        }
        
        return cell
    }
    
    // MARK: - Funciones teachers students
    
    func obtenerResourcesStudents (idCategoria: Int, idSerie : Int) -> String {
        
        var resourceStudents = ""
        
        let path: String = Bundle.main.path(forResource: "cate\(idCategoria)F", ofType: "json")as String!
        let jsonData = try! Data(contentsOf: URL(fileURLWithPath: path))
        let readableJSON = JSON(data: jsonData, options: JSONSerialization.ReadingOptions.mutableContainers, error: nil)
        
        if let items = readableJSON.array{
            for item in items{
                if item["serie_idSerie"].intValue == idSerie {
                    resourceStudents = item["resources"].stringValue
                    print(item["resources"].stringValue)
                    print(resourceStudents)

                }
                
            }
            
        }
        
        return resourceStudents
        
    }
    
    func obtenerStudents (idCategoria: Int, idSerie : Int){
        
        let path: String = Bundle.main.path(forResource: "cate\(idCategoria)F", ofType: "json")as String!
        let jsonData = try! Data(contentsOf: URL(fileURLWithPath: path))
        let readableJSON = JSON(data: jsonData, options: JSONSerialization.ReadingOptions.mutableContainers, error: nil)
        
        if let items = readableJSON.array{
            for item in items{
                if item["serie_idSerie"].intValue == idSerie {
                    
                    self.txtComponents.text = item["resources"].stringValue
                    print(item["resources"].stringValue)
                    if item["image1"].stringValue.isEmpty == false {
                        imgDet1.image = UIImage(named: item["image1"].stringValue)
                        print(item["image1"].stringValue)
                        imgDet2.image = UIImage(named: item["image2"].stringValue)
                        print(item["image2"].stringValue)
                        imgDet3.image = UIImage(named: item["image3"].stringValue)
                        print(item["image3"].stringValue)
                        self.txtDet1.text = item["text1"].stringValue
                        print(item["text1"].stringValue)
                        self.txtDet2.text = item["text2"].stringValue
                        print(item["text2"].stringValue)
                        self.txtDet3.text = item["text3"].stringValue
                        print(item["text3"].stringValue)
                    } else {
                        imgDet1.isHidden = true
                        imgDet2.isHidden = true
                        imgDet3.isHidden = true
                        txtDet1.isHidden = true
                        txtDet2.isHidden = true
                        txtDet3.isHidden = true
                    }
                    
                    
                }
                    
            }
        }
            
    }
    /*func obtenerTeachers (idCategoria: Int, idSerie : Int) -> [tuplaStudents]{
        
        let path: String = Bundle.main.path(forResource: "cate\(idCategoria)F", ofType: "json")as String!
        let jsonData = try! Data(contentsOf: URL(fileURLWithPath: path))
        let readableJSON = JSON(data: jsonData, options: JSONSerialization.ReadingOptions.mutableContainers, error: nil)
        
        var contenidoTeacher : [tuplaTeachers] = []
        
        if let items = readableJSON.array{
            for item in items{
                if item["type"].stringValue == "t" && item["serie_idSerie"].intValue == idSerie && item["isbn"].stringValue.isEmpty == true {
                    
                    let idResource          : Int     = item["idResource"].intValue
                    let serie_idSerie       : Int     = item["serie_idSerie"].intValue
                    let serieName           : String  = item["serieName"].stringValue
                    let name                : String  = item["name"].stringValue
                    let type                : String  = item["type"].stringValue
                    let level               : String  = item["level"].stringValue
                    let isbn                : String  = item["isbn"].stringValue
                    
                    contenidoTeacher.append(idResource: idResource,serie_idSerie: serie_idSerie,serieName: serieName,name:   name,type:   type,level:  level,isbn:   isbn)
                }
            }
        }
        return contenidoTeacher
    }
    func obtenerISBN (idCategoria: Int, idSerie : Int) -> [tuplaISBN]{
        
        let path: String = Bundle.main.path(forResource: "cate\(idCategoria)F", ofType: "json")as String!
        let jsonData = try! Data(contentsOf: URL(fileURLWithPath: path))
        let readableJSON = JSON(data: jsonData, options: JSONSerialization.ReadingOptions.mutableContainers, error: nil)
        
        var contenidoISBN : [tuplaISBN] = []
        
        if let items = readableJSON.array{
            for item in items{
                if item["serie_idSerie"].intValue == idSerie && item["isbn"].stringValue.isEmpty == false {
                    
                    let idResource          : Int     = item["idResource"].intValue
                    let serie_idSerie       : Int     = item["serie_idSerie"].intValue
                    let category_idCategory : Int     = item["category_idCategory"].intValue
                    let serieName           : String  = item["serieName"].stringValue
                    let name                : String  = item["name"].stringValue
                    let type                : String  = item["type"].stringValue
                    let level               : String  = item["level"].stringValue
                    let isbn                : String  = item["isbn"].stringValue
                    
                    contenidoISBN.append(idResource: idResource,serie_idSerie: serie_idSerie,category_idCategory: category_idCategory,serieName: serieName,name:   name,type:   type,level:  level,isbn:   isbn)
                }
            }
        }
        return contenidoISBN
    }
    // MARK: - UITableView Protocol
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if tableView == tableTeaches{
            
            let nombreStudents : [tuplaStudents] = obtenerStudents(idCategoria: viaSegueCategoria, idSerie: viaSegueSerie)
            
            return nombreStudents.count
            
        }else if tableView == tableTeachesDos{
            
            let nombreTeachers : [tuplaTeachers] = obtenerTeachers(idCategoria: viaSegueCategoria, idSerie: viaSegueSerie)
            
            return nombreTeachers.count
        }else{
            let nombreISBN : [tuplaISBN] = obtenerISBN(idCategoria: viaSegueCategoria, idSerie: viaSegueSerie)
            
            return nombreISBN.count
        
        }
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "teachersCell", for: indexPath) as! ForTeachersViewCellTableViewCell
        let row = indexPath.row
        
        if tableView == tableTeaches{
            
            let arrayStudents = obtenerStudents(idCategoria: viaSegueCategoria, idSerie: viaSegueSerie)
            
            //cell.imgForTeachers.image       = UIImage(named: arrayStudents[row].imagePath)
            cell.titleTeachers.text         = arrayStudents[row].name
            cell.titleTeachers.textColor    = colorsSeriesSolid[viaSegueCategoria-1]
            //cell.descriptionTeachers.text   = "Name Serie: \(arrayStudents[row].serieName) \n Level: \(arrayStudents[row].level) \n ISBN: \(arrayStudents[row].isbn)"
            
        } else if tableView == tableTeachesDos {
        
            let arrayTeachers = obtenerTeachers(idCategoria: viaSegueCategoria, idSerie: viaSegueSerie)
            
            //cell.imgForTeachers.image       = UIImage(named: arrayTeachers[row].imagePath)
            cell.titleTeachers.text         = arrayTeachers[row].name
            cell.titleTeachers.textColor    = colorsSeriesSolid[viaSegueCategoria-1]
            //cell.descriptionTeachers.text   = "Name Serie: \(arrayTeachers[row].serieName) \n Level: \(arrayTeachers[row].level) \n ISBN: \(arrayTeachers[row].isbn)"
            
        } else{
            
            let arrayISBN = obtenerISBN(idCategoria: viaSegueCategoria, idSerie: viaSegueSerie)
            
            cell.titleISBN.text         = "\(arrayISBN[row].name) Level: \(arrayISBN[row].level)"
            cell.titleISBN.textColor    = colorsSeriesSolid[viaSegueCategoria-1]
            cell.subISBN.text           = arrayISBN[row].isbn
            
        }
        return cell
    }*/
}













