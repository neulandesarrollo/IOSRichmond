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
    
    @IBOutlet weak var heightConstraint: NSLayoutConstraint!
    
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
    
    @IBOutlet weak var unoImg: UIImageView!
    @IBOutlet weak var dosImg: UIImageView!
    @IBOutlet weak var tresImg: UIImageView!
    @IBOutlet weak var cuatroImg: UIImageView!
    @IBOutlet weak var cincoImg: UIImageView!
    @IBOutlet weak var seisImg: UIImageView!
    @IBOutlet weak var sieteImg: UIImageView!
    @IBOutlet weak var ochoImg: UIImageView!
    @IBOutlet weak var nueveImg: UIImageView!
    @IBOutlet weak var diezImg: UIImageView!
    @IBOutlet weak var onceImg: UIImageView!
    @IBOutlet weak var doceImg: UIImageView!
    
    @IBOutlet weak var unoBtn: UIButton!
    @IBOutlet weak var dosBtn: UIButton!
    @IBOutlet weak var tresBtn: UIButton!
    @IBOutlet weak var cuatroBtn: UIButton!
    @IBOutlet weak var cincoBtn: UIButton!
    @IBOutlet weak var seisBtn: UIButton!
    @IBOutlet weak var sieteBtn: UIButton!
    @IBOutlet weak var ochoBtn: UIButton!
    @IBOutlet weak var nueveBtn: UIButton!
    @IBOutlet weak var diezBtn: UIButton!
    @IBOutlet weak var onceBtn: UIButton!
    @IBOutlet weak var doceBtn: UIButton!
    
    @IBOutlet weak var imgDetailSerie: UIImageView!
    @IBOutlet weak var imgSampleUnit: UIImageView!
    @IBOutlet weak var imgScope: UIImageView!
    
    @IBOutlet weak var imgCEFR: UIImageView!
    
    @IBOutlet weak var txtTitleDetailSerie: UILabel!
    @IBOutlet weak var txtAuthDetailSerie: UILabel!
    @IBOutlet weak var txtDescriptionDetailSerie: UITextView!
    
    @IBOutlet weak var txtTitleDetailReaders: UILabel!
    @IBOutlet weak var txtAuthDetailReaders: UILabel!
    @IBOutlet weak var txtDescriptionDetailReaders: UILabel!
    
    @IBOutlet weak var txtTitleComponents: UILabel!
    @IBOutlet weak var txtTitleComponentsTeachers: UILabel!
    @IBOutlet weak var txtTitleISBNStudents: UILabel!
    @IBOutlet weak var txtTitleISBNTeachers: UILabel!
    @IBOutlet weak var txtTitleISBNMore: UILabel!
    @IBOutlet weak var txtComponents: UILabel!
    @IBOutlet weak var txtComponentsTeachers: UILabel!
    @IBOutlet weak var txtMoreComponentsTeachers: UILabel!
    @IBOutlet weak var txtISBNStudents: UILabel!
    @IBOutlet weak var txtISBNTeachers: UILabel!
    @IBOutlet weak var txtISBNMore: UILabel!
    @IBOutlet weak var imgDet1: UIImageView!
    @IBOutlet weak var imgDet2: UIImageView!
    @IBOutlet weak var imgDet3: UIImageView!
    @IBOutlet weak var imgDet4: UIImageView!
    @IBOutlet weak var imgDet5: UIImageView!
    @IBOutlet weak var imgDet6: UIImageView!
    
    @IBOutlet weak var txtDet1: UILabel!
    @IBOutlet weak var txtDet2: UILabel!
    @IBOutlet weak var txtDet3: UILabel!
    @IBOutlet weak var txtDet4: UILabel!
    @IBOutlet weak var txtDet5: UILabel!
    @IBOutlet weak var txtDet6: UILabel!
    
    @IBOutlet weak var imgDetT1: UIImageView!
    @IBOutlet weak var imgDetT2: UIImageView!
    @IBOutlet weak var imgDetT3: UIImageView!
    @IBOutlet weak var imgDetT4: UIImageView!
    @IBOutlet weak var imgDetT5: UIImageView!
    @IBOutlet weak var imgDetT6: UIImageView!
    @IBOutlet weak var imgDetT7: UIImageView!
    @IBOutlet weak var imgDetT8: UIImageView!
    
    @IBOutlet weak var txtDetT1: UILabel!
    @IBOutlet weak var txtDetT2: UILabel!
    @IBOutlet weak var txtDetT3: UILabel!
    @IBOutlet weak var txtDetT4: UILabel!
    @IBOutlet weak var txtDetT5: UILabel!
    @IBOutlet weak var txtDetT6: UILabel!
    @IBOutlet weak var txtDetT7: UILabel!
    @IBOutlet weak var txtDetT8: UILabel!
    
    @IBOutlet weak var imgTable: UIImageView!
    
    @IBOutlet weak var imgPortada: UIImageView!
    
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
        
        txtTitleDetailReaders.isHidden = true
        txtAuthDetailReaders.isHidden = true
        txtDescriptionDetailReaders.isHidden = true
        
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
        imgTable.isHidden = true;
        imgPortada.isHidden = true;
        
        unoBtn.isHidden = true
        dosBtn.isHidden = true
        tresBtn.isHidden = true
        cuatroBtn.isHidden = true
        cincoBtn.isHidden = true
        seisBtn.isHidden = true
        sieteBtn.isHidden = true
        ochoBtn.isHidden = true
        
        imgDet1.isHidden = true;
        imgDet2.isHidden = true;
        imgDet3.isHidden = true;
        imgDet4.isHidden = true;
        imgDet5.isHidden = true;
        imgDet6.isHidden = true;
        
        txtDet1.isHidden = true;
        txtDet2.isHidden = true;
        txtDet3.isHidden = true;
        txtDet4.isHidden = true;
        txtDet5.isHidden = true;
        txtDet6.isHidden = true;
        
        imgDetT1.isHidden = true;
        imgDetT2.isHidden = true;
        imgDetT3.isHidden = true;
        imgDetT4.isHidden = true;
        imgDetT5.isHidden = true;
        imgDetT6.isHidden = true;
        imgDetT7.isHidden = true;
        imgDetT8.isHidden = true;
        
        txtDetT1.isHidden = true;
        txtDetT2.isHidden = true;
        txtDetT3.isHidden = true;
        txtDetT4.isHidden = true;
        txtDetT5.isHidden = true;
        txtDetT6.isHidden = true;
        txtDetT7.isHidden = true;
        txtDetT8.isHidden = true;
        
        let font = UIFont(name: "Helvetica", size: 14.0)
        
        self.txtTitleISBNMore.isHidden = true
        self.txtISBNMore.isHidden = true
        
        /* Edition start */
        if viaSegueSerie == 1 {
            self.txtComponents.isHidden = true
            self.txtComponentsTeachers.isHidden = true
            self.txtMoreComponentsTeachers.isHidden = true
            
            imgTable.isHidden = false
            imgPortada.isHidden = false
            
            imgDet1.isHidden = false;
            imgDet2.isHidden = false;
            
            txtDet1.isHidden = false;
            txtDet2.isHidden = false;
            
            imgDet1.image = UIImage(named: "student_book_cubby.png")
            imgDet2.image = UIImage(named: "student_cd_cubby.png")
            
            unoImg.image = UIImage(named: "levels3.png")
            dosImg.image = UIImage(named: "hours1_3.png")
            tresImg.image = UIImage(named: "audio.png")
            cuatroImg.image = UIImage(named: "digital_resources.png")
            
            unoBtn.isHidden = false
            dosBtn.isHidden = false
            tresBtn.isHidden = false
            cuatroBtn.isHidden = false
            
            self.txtDet1.text = "Student’s Book\n\n El Student’s Book contiene páginas con ilustraciones o fotografías a todo color para representar el léxico y las estructuras de forma más clara, memorable y atractiva."
            self.txtDet2.text = "Student’s CD\n\n Cubby House incluye un CD con las canciones, cantos, rimas e historias de la serie, para que los alumnos pueden escucharlos cuantas veces quieran y consoliden lo aprendido en clase."
            
            imgDetT1.isHidden = false;
            imgDetT2.isHidden = false;
            imgDetT3.isHidden = false;
            imgDetT4.isHidden = false;
            
            txtDetT1.isHidden = false;
            txtDetT2.isHidden = false;
            txtDetT3.isHidden = false;
            txtDetT4.isHidden = false;
            
            imgDetT1.image = UIImage(named: "guia_maestro_cubby.png")
            imgDetT2.image = UIImage(named: "cd_class_resource_cubby.png")
            imgDetT3.image = UIImage(named: "story_cards_cubby.png")
            imgDetT4.image = UIImage(named: "flash_cards_cubby.png")
            
            self.txtDetT1.text = "Guía del Maestro (In Spanish)\n\nLa Guía del Maestro incluye notas detalladas para desarrollar cada lección, las actividades de valores, habilidades motrices, la revisión y el ciclo de lectura."
            self.txtDetT2.text = "Class & Resource CD\n\nIncluye un CD de Recursos para el profesor, donde encontrará las grabaciones de las canciones, cantos, rimas e historias, así como los worksheets y assessments, actividades de festividades (Holidays) y la Unidad Cero."
            self.txtDetT3.text = "Story Cards\n\nCubby House incluye una historia por unidad, ilustrada en tarjetas de gran tamaño o Story Cards. Las historiasse relacionan con el tema y las estructuras de cada unidad, de modo que los alumnos puedan repasarlas en contextos y situaciones que les sean atractivos y significativos."
            self.txtDetT4.text = "Flashcards\n\nCubby House contiene flashcards que ilustran las palabras de uso más frecuente en cada unidad."
            
            let string = "Pack Cubby House (SB+CD)\n    Level 1          7506009844452\n    Level 2          7506009844469\n    Level 3          7506009844476"
            
            let attributedString = NSMutableAttributedString(string: string as String, attributes: [NSFontAttributeName:UIFont.systemFont(ofSize: 14.0)])
            
            let boldFontAttribute = [NSFontAttributeName: UIFont.boldSystemFont(ofSize: 14.0)]
            
            // Part of string to be bold
            let str = NSString(string: string)
            
            let range1 = str.range(of:"Pack Cubby House (SB+CD)")
            //let range1 = string.range(of:"Pack Cubby House (SB+CD)")
            
            attributedString.addAttributes(boldFontAttribute, range: range1)
            
            let stringT = "Pack Cubby House (GUIA+CLASS +FLASH)\n Level 1          7506009845176\n Level 2          7506009845206\n Level 3          7506009845183\n\nStory Cards\n    Level 1          7506009843745\n    Level 2          7506009843752\n   Level 3          7506009843769"
            
            let attributedStringT = NSMutableAttributedString(string: stringT as String, attributes: [NSFontAttributeName:UIFont.systemFont(ofSize: 14.0)])
            
            // Part of string to be bold
            let strT = NSString(string: stringT)
            
            let rangeT1 = strT.range(of:"Pack Cubby House (GUIA+CLASS +FLASH)")
            let rangeT2 = strT.range(of:"Story Cards")
            //let range1 = string.range(of:"Pack Cubby House (SB+CD)")
            
            attributedStringT.addAttributes(boldFontAttribute, range: rangeT1)
            attributedStringT.addAttributes(boldFontAttribute, range: rangeT2)
            
            self.txtISBNStudents.attributedText = attributedString
            self.txtISBNTeachers.isHidden = false
            self.txtISBNTeachers.attributedText = attributedStringT
            
        } else if viaSegueSerie == 2 {
            self.txtComponents.isHidden = true
            self.txtComponentsTeachers.isHidden = true
            self.txtMoreComponentsTeachers.isHidden = true
            
            imgDet1.isHidden = false
            imgDet2.isHidden = false
            imgDet3.isHidden = false
            imgDet4.isHidden = false
            
            txtDet1.isHidden = false
            txtDet2.isHidden = false
            txtDet3.isHidden = false
            txtDet4.isHidden = false
            
            imgDet1.image = UIImage(named: "student_book_pebbles.png")
            imgDet2.image = UIImage(named: "resourse_booklet.png")
            imgDet3.image = UIImage(named: "hans_on_activity_pad_pebbles.png")
            imgDet4.image = UIImage(named: "student_cd_pebbles.png")
            
            self.txtDet1.text = "Student’s Book\n\nPebbles Student’s Book consta de nueve unidades temáticas con actividades variadas y divertidas para aprender el idioma inglés."
            self.txtDet2.text = "Resource Booklet\n\nPebbles Resource Booklet contiene los siguientes elementos:\n Pop-outs, Pictionary Puzzles, Números para trazar"
            self.txtDet3.text = "Hands-on Activity Pad\n\nPebbles Hands-on Activity Pad incluye dos actividades manuales para cada unidad."
            self.txtDet4.text = "Student’s CD\n\nIncluyen las grabaciones de todas las canciones, rimas, así como de las palabras del vocabulario de cada nivel"
            
            unoImg.image = UIImage(named: "levels3.png")
            dosImg.image = UIImage(named: "hours1_3.png")
            tresImg.image = UIImage(named: "audio.png")
            
            unoBtn.isHidden = false
            dosBtn.isHidden = false
            tresBtn.isHidden = false
            
            imgDetT1.isHidden = false;
            imgDetT2.isHidden = false;
            imgDetT3.isHidden = false;
            imgDetT4.isHidden = false;
            
            txtDetT1.isHidden = false;
            txtDetT2.isHidden = false;
            txtDetT3.isHidden = false;
            txtDetT4.isHidden = false;
            
            imgDetT1.image = UIImage(named: "guia_del_maestro_pebbles.png")
            imgDetT2.image = UIImage(named: "class_cd_pebbles.png")
            imgDetT3.image = UIImage(named: "flash_cards_pebbles.png")
            imgDetT4.image = UIImage(named: "hans_on_activity_pad_pebbles.png")
            
            self.txtDetT1.text = "Teacher’s Guide in Spanish\n\nLa Guía del Maestro de Pebbles cuenta con instrucciones para el maestro sobre el manejo de cada lección y con las páginas del Student’s Book intercaladas, para una rápida referencia"
            self.txtDetT2.text = "Class CD\n\nIncluyen las grabaciones de todas las canciones, rimas, así como de las palabras del vocabulario de cada nivel"
            self.txtDetT3.text = "Flashcards\n\nPebbles cuenta con un número de tarjetas para cada unidad, las cuales son un útil y atractivo apoyo visual para presentar y practicar el vocabulario y las estructuras."
            self.txtDetT4.text = "Fun Activity Mat with Pebble Puppet"
            
            let string = "Pack Pebbles (SB+CD+RSC Booklet+AP)\n    Level 1          7506009834934\n    Level 2          7506009834941\n    Level 3          7506009834958"
            
            let attributedString = NSMutableAttributedString(string: string as String, attributes: [NSFontAttributeName:UIFont.systemFont(ofSize: 14.0)])
            
            let boldFontAttribute = [NSFontAttributeName: UIFont.boldSystemFont(ofSize: 14.0)]
            
            // Part of string to be bold
            let str = NSString(string: string)
            
            let range1 = str.range(of:"Pack Pebbles (SB+CD+RSC Booklet+AP)")
            
            attributedString.addAttributes(boldFontAttribute, range: range1)
            
            let stringT = "Pack Pebbles (Guia + Class CD)\n    Level 1          7506009835405\n    Level 2          7506009835412\n    Level 3          7506009835429\n\nFlashcards\n    Level 1          9786070605161\n    Level 2          9786070605208\n    Level 3          9786070605246\n\nFun Activity Mat (Level 1,2 and 3)\n    Level 1          9786070606649\n    Level 2          9786070606656\n    Level 3          9786070606663"
            
            let attributedStringT = NSMutableAttributedString(string: stringT as String, attributes: [NSFontAttributeName:UIFont.systemFont(ofSize: 14.0)])
            
            // Part of string to be bold
            let strT = NSString(string: stringT)
            
            let rangeT1 = strT.range(of:"Pack Pebbles (Guia + Class CD)")
            let rangeT2 = strT.range(of:"Flashcards")
            let rangeT3 = strT.range(of:"Fun Activity Mat (Level 1,2 and 3)")
            
            attributedStringT.addAttributes(boldFontAttribute, range: rangeT1)
            attributedStringT.addAttributes(boldFontAttribute, range: rangeT2)
            attributedStringT.addAttributes(boldFontAttribute, range: rangeT3)
            
            self.txtISBNStudents.attributedText = attributedString
            self.txtISBNTeachers.isHidden = false
            self.txtISBNTeachers.attributedText = attributedStringT
            
        } else if viaSegueSerie == 3 {
            self.txtComponents.isHidden = true
            self.txtComponentsTeachers.isHidden = true
            self.txtMoreComponentsTeachers.isHidden = true
            
            imgDet1.isHidden = false
            imgDet2.isHidden = false
            imgDet3.isHidden = false
            imgDet4.isHidden = false
            imgDet5.isHidden = false
            
            txtDet1.isHidden = false
            txtDet2.isHidden = false
            txtDet3.isHidden = false
            txtDet4.isHidden = false
            txtDet5.isHidden = false
            
            imgDet1.image = UIImage(named: "student_book_gumdrops.png")
            imgDet2.image = UIImage(named: "activity_pad_gumdrops.png")
            imgDet3.image = UIImage(named: "student_audio_gumdrops.png")
            imgDet4.image = UIImage(named: "student_interactive_cd.png")
            imgDet5.image = UIImage(named: "student_resource_pack_gumdrops.png")
            
            self.txtDet1.text = "Student’s Book\n\nThe Student’s Book contains full-colored pages with a variety of fun activities."
            self.txtDet2.text = "Activity Pad\n\nThe Activity Pad contains detachable pages of stimulating activities that provide extra hands-on practice for developing essential readiness skills and concepts, such as drawing, coloring, fi nger-painting, and assembling."
            self.txtDet3.text = "Student’s Audio CD (Level 1)\n\nThe Student’s Audio contains all the songs, rhymes, chants and stories from Level 1 recorded by native English Speakers for students to listen to outside the classroom."
            self.txtDet4.text = "Student’s Audio/Interactive CD-ROM (Levels 2 and 3)"
            self.txtDet5.text = "Student’s (Resource Pack)\n\n- Finger and Stick Puppets\n- Stickers\n- Mini-flashcards"
            
            imgDetT1.isHidden = false;
            imgDetT2.isHidden = false;
            imgDetT3.isHidden = false;
            imgDetT4.isHidden = false;
            imgDetT5.isHidden = false;
            imgDetT6.isHidden = false;
            imgDetT7.isHidden = false;
            
            txtDetT1.isHidden = false;
            txtDetT2.isHidden = false;
            txtDetT3.isHidden = false;
            txtDetT4.isHidden = false;
            txtDetT5.isHidden = false;
            txtDetT6.isHidden = false;
            txtDetT7.isHidden = false;
            
            imgDetT1.image = UIImage(named: "teacher_guide_gumdrops.png")
            imgDetT2.image = UIImage(named: "big_book_gumdrops.png")
            imgDetT3.image = UIImage(named: "posters_cutouts_gumdrops.png")
            imgDetT4.image = UIImage(named: "teacher_cd_rom1_gumdrops.png")
            imgDetT5.image = UIImage(named: "class_audio_gumdrops1.png")
            imgDetT6.image = UIImage(named: "classroom_lenguage_cards_gumdrops.png")
            imgDetT7.image = UIImage(named: "digital_book_gumdrops.png")
            
            self.txtDetT1.text = "Teacher’s Guide\n\nGumdrops Teacher’s Guide offers comprehensive, step-by-step notes that are interleaved with the Student’s Book and Activity Pad pages."
            self.txtDetT2.text = "Big Books\n\nThe Big Book is a beautifully illustrated collection of original and traditional stories and chants that will delight and animate " +
            "students while exposing them to natural language."
            self.txtDetT3.text = "Posters & Cutouts\n\nGumdrops posters provide the teacher with an eff ective visual tool to introduce and reinforce target vocabulary and language. Each unit comes with large, theme-related cut-out cards."
            self.txtDetT4.text = "Teacher’s Resource CD-ROM\n\nThis includes the Gumdrops Support Booklet, which contains the series philosophy and methodology, as well as valuable tips for " +
            "presenting language and vocabulary, developing skills and making the most of all of the Gumdrops components."
            self.txtDetT5.text = "Class Audio\n\nThe Class Audio includes recordings by native English speakers of all the songs chants, rhymes and stories."
            self.txtDetT6.text = "Classroom Language Cards\n\nThese visual cue cards vividly illustrate common classroom commands. Use them when you are giving students instructions along with the English command."
            self.txtDetT7.text = "Digital Book"
            
            unoImg.image = UIImage(named: "richmondsolution.png")
            dosImg.image = UIImage(named: "levels4.png")
            tresImg.image = UIImage(named: "hours3_5.png")
            cuatroImg.image = UIImage(named: "digital_book.png")
            cincoImg.image = UIImage(named: "audio.png")
            seisImg.image = UIImage(named: "digital_resources.png")
            
            unoBtn.isHidden = false
            dosBtn.isHidden = false
            tresBtn.isHidden = false
            cuatroBtn.isHidden = false
            cincoBtn.isHidden = false
            seisBtn.isHidden = false
            
            let string = "Pack Gumdrops (SB&TN+CD&CLASS CD)\n   Level 1          N/A\n   Level 2          N/A\n   Level 3          N/A\n   Level N          7506009837508\n\nPack Gumdrops (SB+CD+RSC Pack)\n   Level 1          7506009837515\n   Level 2          7506009837522\n   Level 3          7506009837539\n   Level N          N/A\n\nActivity Pad\n   Level 1          9786070607394\n   Level 2          9786070607400\n   Level 3          9786070607417\n   Level N          N/A"
            
            let attributedString = NSMutableAttributedString(string: string as String, attributes: [NSFontAttributeName:UIFont.systemFont(ofSize: 14.0)])
            
            let boldFontAttribute = [NSFontAttributeName: UIFont.boldSystemFont(ofSize: 14.0)]
            
            // Part of string to be bold
            let str = NSString(string: string)
            
            let range1 = str.range(of:"Pack Gumdrops (SB&TN+CD&CLASS CD)")
            let range2 = str.range(of:"Pack Gumdrops (SB+CD+RSC Pack)")
            let range3 = str.range(of:"Activity Pad")
            
            attributedString.addAttributes(boldFontAttribute, range: range1)
            attributedString.addAttributes(boldFontAttribute, range: range2)
            attributedString.addAttributes(boldFontAttribute, range: range3)
            
            let stringT = "Pack Gumdrops (TG+Class CD)\n   Level 1          7506009837546\n   Level 2          7506009837553\n   Level 3          7506009837560\n   Level N          N/A\n\nBig Book\n   Level 1          9786070607424\n   Level 2          9786070607431\n   Level 3          9786070607448\n   Level N          N/A\n\nPosters & Posters Cutouts\n   Level 1          7506009836471\n   Level 2          7506009836488\n   Level 3          7506009836495\n   Level N          N/A\n\nTeacher's Resource CD-ROM\n   Level 1          7506009836402\n   Level 2          7506009836433\n   Level 3          7506009836464\n   Level N          N/A\n\nClassroom Language Cards (Level 1,2 and 3)\n   Level 1          9786070607455\n   Level 2          9786070607455\n   Level 3          9786070607455\n   Level N          N/A\n\nDigital Book DVD (Level 1,2 and 3)\n   Level 1          7506009844179\n   Level 2          7506009844179\n   Level 3          7506009844179\n   Level N          N/A"
            
            let attributedStringT = NSMutableAttributedString(string: stringT as String, attributes: [NSFontAttributeName:UIFont.systemFont(ofSize: 14.0)])
            
            // Part of string to be bold
            let strT = NSString(string: stringT)
            
            let rangeT1 = strT.range(of:"Pack Gumdrops (TG+Class CD)")
            let rangeT2 = strT.range(of:"Big Book")
            let rangeT3 = strT.range(of:"Posters & Posters Cutouts")
            let rangeT4 = strT.range(of:"Teacher's Resource CD-ROM")
            let rangeT5 = strT.range(of:"Classroom Language Cards (Level 1,2 and 3)")
            let rangeT6 = strT.range(of:"Digital Book DVD (Level 1,2 and 3)")
            
            attributedStringT.addAttributes(boldFontAttribute, range: rangeT1)
            attributedStringT.addAttributes(boldFontAttribute, range: rangeT2)
            attributedStringT.addAttributes(boldFontAttribute, range: rangeT3)
            attributedStringT.addAttributes(boldFontAttribute, range: rangeT4)
            attributedStringT.addAttributes(boldFontAttribute, range: rangeT5)
            attributedStringT.addAttributes(boldFontAttribute, range: rangeT6)
            
            self.txtISBNStudents.attributedText = attributedString
            self.txtISBNTeachers.isHidden = false
            self.txtISBNTeachers.attributedText = attributedStringT
            
        } else if viaSegueSerie == 4 {
            self.txtComponents.isHidden = true
            self.txtComponentsTeachers.isHidden = true
            self.txtMoreComponentsTeachers.isHidden = true
            
            imgDet1.isHidden = false
            imgDet2.isHidden = false
            imgDet3.isHidden = false
            imgDet4.isHidden = false
            imgDet5.isHidden = false
            imgDet6.isHidden = false
            
            txtDet1.isHidden = false
            txtDet2.isHidden = false
            txtDet3.isHidden = false
            txtDet4.isHidden = false
            txtDet5.isHidden = false
            txtDet6.isHidden = false
            
            imgDet1.image = UIImage(named: "student_book_tippy_toes.png")
            imgDet2.image = UIImage(named: "stickers_tippy_toes.png")
            imgDet3.image = UIImage(named: "activity_book_tippy_toes.png")
            imgDet4.image = UIImage(named: "student_cd_tippy_toes.png")
            imgDet5.image = UIImage(named: "interactive_cd_rom_tippy_toes.png")
            imgDet6.image = UIImage(named: "app_tippy_toes.png")
            
            self.txtDet1.text = "Student’s Book\n\nThe Student’s Book contains 152 full-color pages with a variety of fun and beautiful illustrations."
            self.txtDet2.text = "Stickers\n\nTippy Toes off ers colorful and fun Stickers that are used in every unit along with the Student’s Book. Th ey off er a motivational element to the course."
            self.txtDet3.text = "Activity Book\n\nThe Activity Book reinforces what students learn in the classroom through a wide variety of activities."
            self.txtDet4.text = "Student’s CD\n\nThe Student’s CD contains all the songs, rhymes, chants and stories from Level 1 for students to listen outside the classroom."
            self.txtDet5.text = "Interactive CD (Levels 2 and 3)"
            self.txtDet6.text = "Tippy Toes App (Level 1)"
            
            unoImg.image = UIImage(named: "richmondsolution.png")
            dosImg.image = UIImage(named: "levels3.png")
            tresImg.image = UIImage(named: "hours7.png")
            cuatroImg.image = UIImage(named: "digital_book.png")
            cincoImg.image = UIImage(named: "audio.png")
            seisImg.image = UIImage(named: "digital_resources.png")
            sieteImg.image = UIImage(named: "app.png")
            
            unoBtn.isHidden = false
            dosBtn.isHidden = false
            tresBtn.isHidden = false
            cuatroBtn.isHidden = false
            cincoBtn.isHidden = false
            seisBtn.isHidden = false
            sieteBtn.isHidden = false
            ochoBtn.isHidden = false
            
            imgDetT1.isHidden = false;
            imgDetT2.isHidden = false;
            imgDetT3.isHidden = false;
            imgDetT4.isHidden = false;
            imgDetT5.isHidden = false;
            imgDetT6.isHidden = false;
            imgDetT7.isHidden = false;
            
            txtDetT1.isHidden = false;
            txtDetT2.isHidden = false;
            txtDetT3.isHidden = false;
            txtDetT4.isHidden = false;
            txtDetT5.isHidden = false;
            txtDetT6.isHidden = false;
            txtDetT7.isHidden = false;
            
            imgDetT1.image = UIImage(named: "teachers_book_tippy_toes.png")
            imgDetT2.image = UIImage(named: "class_cd_tippy_toes.png")
            imgDetT3.image = UIImage(named: "big_book_tippy_toes.png")
            imgDetT4.image = UIImage(named: "poster_tippy_toes.png")
            imgDetT5.image = UIImage(named: "fun_activity_mat_tippy_toes.png")
            imgDetT6.image = UIImage(named: "puppet_tippy.png")
            imgDetT7.image = UIImage(named: "digital_book_tippy.png")
            
            self.txtDetT1.text = "Teacher’s Guide\n\nThe Teacher’s Guide contains easy to follow teacher’s notes"
            self.txtDetT2.text = "Class CD\n\nThe Class CD includes recordings by native English speakers of all the songs, chants, rhymes, and stories."
            self.txtDetT3.text = "Big Book\n\nThe Big Book is a collection of original and traditional children’s literature that will delight and animate students."
            self.txtDetT4.text = "Posters & Cutouts\n\nThere is an interactive poster with cutouts for each unit. These large and colorful visual aids allow the teacher to present and practice language simply and clearly."
            self.txtDetT5.text = "Fun Activity Mat"
            self.txtDetT6.text = "Puppets (Level 3)"
            self.txtDetT7.text = "Digital Book"
            
            let string = "Pack Tippy Toes (SB+CD+STK+MY FIRST...)\n     Level 1          7506009842755\n     Level 2          7506009842762\n     Level 3          7506009842779\n\nActivity Book\n     Level 1          9786070602641\n     Level 2          9786070602658\n     Level 3          9786070602665"
            
            let attributedString = NSMutableAttributedString(string: string as String, attributes: [NSFontAttributeName:UIFont.systemFont(ofSize: 14.0)])
            
            let boldFontAttribute = [NSFontAttributeName: UIFont.boldSystemFont(ofSize: 14.0)]
            
            // Part of string to be bold
            let str = NSString(string: string)
            
            let range1 = str.range(of:"Pack Tippy Toes (SB+CD+STK+MY FIRST...)")
            let range2 = str.range(of:"Activity Book")
            
            attributedString.addAttributes(boldFontAttribute, range: range1)
            attributedString.addAttributes(boldFontAttribute, range: range2)
            
            let stringT = "Teacher’s Guide\n     Level 1          9786070602672\n     Level 2          9786070602689\n     Level 3          9786070602696\n\nClass CD\n     Level 1          7506009807518\n     Level 2          7506009807525\n     Level 3          7506009807532\n\nBig Book\n     Level 1          9786070602702\n     Level 2          9786070602719\n     Level 3          9786070602726\n\nPosters & Cutouts\n     Level 1          7506009807181\n     Level 2          7506009807198\n     Level 3          7506009807204\n\nFun Activity Mat (Level 1,2 and 3)\n     Level 1          9786070606649\n     Level 2          9786070606656\n     Level 3          9786070606663\n\nPuppets (Level 3)\n     Level 1          N/A\n     Level 2          N/A\n     Level 3          7506009807846\n\nDigital Book DVD (Level 1,2 and 3)\n     Level 1          7506009844162\n     Level 2          7506009844162\n     Level 3          7506009844162"
            
            let attributedStringT = NSMutableAttributedString(string: stringT as String, attributes: [NSFontAttributeName:UIFont.systemFont(ofSize: 14.0)])
            
            // Part of string to be bold
            let strT = NSString(string: stringT)
            
            let rangeT1 = strT.range(of:"Teacher’s Guide")
            let rangeT2 = strT.range(of:"Class CD")
            let rangeT3 = strT.range(of:"Big Book")
            let rangeT4 = strT.range(of:"Posters & Cutouts")
            let rangeT5 = strT.range(of:"Fun Activity Mat (Level 1,2 and 3)")
            let rangeT6 = strT.range(of:"Puppets (Level 3)")
            let rangeT7 = strT.range(of:"Digital Book DVD (Level 1,2 and 3)")
            
            attributedStringT.addAttributes(boldFontAttribute, range: rangeT1)
            attributedStringT.addAttributes(boldFontAttribute, range: rangeT2)
            attributedStringT.addAttributes(boldFontAttribute, range: rangeT3)
            attributedStringT.addAttributes(boldFontAttribute, range: rangeT4)
            attributedStringT.addAttributes(boldFontAttribute, range: rangeT5)
            attributedStringT.addAttributes(boldFontAttribute, range: rangeT6)
            attributedStringT.addAttributes(boldFontAttribute, range: rangeT7)
            
            self.txtISBNStudents.attributedText = attributedString
            self.txtISBNTeachers.isHidden = false
            self.txtISBNTeachers.attributedText = attributedStringT
            
            
        } else if viaSegueSerie == 11 {
            
            self.txtComponents.isHidden = true
            self.txtComponentsTeachers.isHidden = true
            self.txtMoreComponentsTeachers.isHidden = true
            
            imgDet1.isHidden = false
            imgDet2.isHidden = false
            imgDet3.isHidden = false
            
            txtDet1.isHidden = false
            txtDet2.isHidden = false
            txtDet3.isHidden = false
            
            imgDet1.image = UIImage(named: "student_book_mfls.png")
            imgDet2.image = UIImage(named: "student_cd_mfls.png")
            imgDet3.image = UIImage(named: "app_mfls.png")
            
            self.txtDet1.text = "Student’s Book"
            self.txtDet2.text = "Student’s CD"
            self.txtDet3.text = "App"
            
            unoImg.image = UIImage(named: "audio.png")
            dosImg.image = UIImage(named: "app.png")

            
            unoBtn.isHidden = false
            dosBtn.isHidden = false
            tresBtn.isHidden = false
            cuatroBtn.isHidden = false
            cincoBtn.isHidden = false
            seisBtn.isHidden = false
            
            imgDetT1.isHidden = false;
            
            txtDetT1.isHidden = false;
            
            imgDetT1.image = UIImage(named: "class_cd_mfls.png")
            
            self.txtDetT1.text = "Class CD"
            
            let string = "Pack My First Letters & Sounds (SB + CD)\n      Level A          7506009842786\n      Level B          7506009842793\n      Level C          7506009842809"
            
            let attributedString = NSMutableAttributedString(string: string as String, attributes: [NSFontAttributeName:UIFont.systemFont(ofSize: 14.0)])
            
            let boldFontAttribute = [NSFontAttributeName: UIFont.boldSystemFont(ofSize: 14.0)]
            
            // Part of string to be bold
            let str = NSString(string: string)
            
            let range1 = str.range(of:"Pack My First Letters & Sounds (SB + CD)")
            
            attributedString.addAttributes(boldFontAttribute, range: range1)
            
            self.txtISBNStudents.attributedText = attributedString
            self.txtISBNTeachers.isHidden = true
            
            
            
        } else if viaSegueSerie == 5 {
            
            self.txtComponents.isHidden = true
            self.txtComponentsTeachers.isHidden = true
            self.txtMoreComponentsTeachers.isHidden = true
            
            imgDet1.isHidden = false
            imgDet2.isHidden = false
            imgDet3.isHidden = false
            imgDet4.isHidden = false
            imgDet5.isHidden = false
            
            txtDet1.isHidden = false
            txtDet2.isHidden = false
            txtDet3.isHidden = false
            txtDet4.isHidden = false
            txtDet5.isHidden = false
            
            imgDet1.image = UIImage(named: "student_book_crickets.png")
            imgDet2.image = UIImage(named: "practice_book_crickets.png")
            imgDet3.image = UIImage(named: "students_cd_crickets.png")
            imgDet4.image = UIImage(named: "tales_students_crickets.png")
            imgDet5.image = UIImage(named: "app_crickets.png")
            
            self.txtDet1.text = "Student’s Book\n\nThe Student’s Book contains full-colored pages with both illustrations and photographs that represent concepts vividly and clearly."
            self.txtDet2.text = "Practice Book\n\nThe Crickets Practice Book is for use in the classroom or at home. Activities in the Practice Book correspond to the stages Explore, Explain and Evaluate of the 5Es methodology."
            self.txtDet3.text = "Student’s CD\n\nThe Student’s CD includes recordings by native English speakers of all the stories, songs and chants."
            self.txtDet4.text = "Cricket Tales\n\nThis useful component, for both students and teachers, features fun reading activities related to each of the stories from Crickets."
            self.txtDet5.text = "Crickets App\n\nCrickets Nursery and Level 1 feature an App with fun activities to review and practice everywhere children go!"
            
            unoImg.image = UIImage(named: "richmondsolution.png")
            dosImg.image = UIImage(named: "levels4.png")
            tresImg.image = UIImage(named: "hours10.png")
            cuatroImg.image = UIImage(named: "digital_book.png")
            cincoImg.image = UIImage(named: "audio.png")
            seisImg.image = UIImage(named: "app.png")
            sieteImg.image = UIImage(named: "microsite.png")
            ochoImg.image = UIImage(named: "clil.png")
            nueveImg.image = UIImage(named: "videos.png")
            
            unoBtn.isHidden = false
            dosBtn.isHidden = false
            tresBtn.isHidden = false
            cuatroBtn.isHidden = false
            cincoBtn.isHidden = false
            seisBtn.isHidden = false
            sieteBtn.isHidden = false
            ochoBtn.isHidden = false
            
            imgDetT1.isHidden = false;
            imgDetT2.isHidden = false;
            imgDetT3.isHidden = false;
            imgDetT4.isHidden = false;
            imgDetT5.isHidden = false;
            imgDetT6.isHidden = false;
            imgDetT7.isHidden = false;
            imgDetT8.isHidden = false;
            
            txtDetT1.isHidden = false;
            txtDetT2.isHidden = false;
            txtDetT3.isHidden = false;
            txtDetT4.isHidden = false;
            txtDetT5.isHidden = false;
            txtDetT6.isHidden = false;
            txtDetT7.isHidden = false;
            txtDetT8.isHidden = false;
            
            imgDetT1.image = UIImage(named: "teachers_guide_crickets.png")
            imgDetT2.image = UIImage(named: "teachers_resource_cd_class_cd_crickets.jpg")
            imgDetT3.image = UIImage(named: "teachers_class_cd_crickets.jpg")
            imgDetT4.image = UIImage(named: "teachers_story_cards_crickets.jpg")
            imgDetT5.image = UIImage(named: "teachers_flashcards_crickets.png")
            imgDetT6.image = UIImage(named: "teachers_classroom_languaje_flashcards_crickets.png")
            imgDetT7.image = UIImage(named: "tales_crickets.png")
            imgDetT8.image = UIImage(named: "digital_book_crickets.png")
            
            self.txtDetT1.text = "Teacher’s Guide\n\nThe Crickets Teacher’s Guide offers comprehensive, step-by-step notes that are interleaved with the Student’s Book pages."
            self.txtDetT2.text = "Teacher’s Resource CD\n\nYou can fi nd a variety of resources on this component"
            self.txtDetT3.text = "Class CD\n\nThe Class CD includes recordings of class activities and all the songs, chants, and stories."
            self.txtDetT4.text = "Story Cards\n\nCrickets stories expose children to authentic language used naturally. The stories are divided into scenes."
            self.txtDetT5.text = "Flashcards\n\nCrickets features 112 fl ashcards depicting the most frequent words used per unit. The flashcards include photographs to exemplify concepts vividly."
            self.txtDetT6.text = "Classroom Language Flashcards\n\nThese visual cue cards vividly illustrate common classroom commands. Use them when you are giving students instructions."
            self.txtDetT7.text = "Cricket Tales\n\nThis useful component, for both students and teachers, features fun reading activities related to each of the stories from Crickets."
            self.txtDetT8.text = "Digital Book"
            
            let string = "Pack Crickets Nursery (SB+CLASS & RCD)\n      Level 1          N/A\n      Level 2          N/A\n      Level 3          N/A\n      Level N          7506009842489\n\nPack Crickets (SB+CD+TALES)\n      Level 1          7506009842571\n      Level 2          7506009842588\n      Level 3          7506009842595\n      Level N          N/A\nPractice Book\n      Level 1          9786070610783\n      Level 2          9786070610738\n      Level 3          9786070610745\n      Level N          N/A"
            
            let attributedString = NSMutableAttributedString(string: string as String, attributes: [NSFontAttributeName:UIFont.systemFont(ofSize: 14.0)])
            
            let boldFontAttribute = [NSFontAttributeName: UIFont.boldSystemFont(ofSize: 14.0)]
            
            // Part of string to be bold
            let str = NSString(string: string)
            
            let range1 = str.range(of:"Pack Crickets Nursery (SB+CLASS & RCD)")
            let range2 = str.range(of:"Pack Crickets (SB+CD+TALES)")
            let range3 = str.range(of:"Practice Book")
            
            attributedString.addAttributes(boldFontAttribute, range: range1)
            attributedString.addAttributes(boldFontAttribute, range: range2)
            attributedString.addAttributes(boldFontAttribute, range: range3)
            
            let stringT = "Pack Crickets Teacher (TG+TR+SC+F+TA+CLF)\n      Level 1          7506009842601\n      Level 2          7506009842618\n      Level 3          7506009842625\n      Level N          N/A\n\nFlashcards (Level N)\n      Level 1          7506009842502\n      Level 2          N/A\n      Level 3          N/A\n      Level N          N/A\n\nDigital Book DVD (Level 1,2 and 3)\n      Level 1          N/A\n      Level 2          7506009844186\n      Level 3          7506009844186\n      Level N          7506009844186"
            
            let attributedStringT = NSMutableAttributedString(string: stringT as String, attributes: [NSFontAttributeName:UIFont.systemFont(ofSize: 14.0)])
            
            // Part of string to be bold
            let strT = NSString(string: stringT)
            
            let rangeT1 = strT.range(of:"Pack Crickets Teacher (TG+TR+SC+F+TA+CLF)")
            let rangeT2 = strT.range(of:"Flashcards (Level N)")
            let rangeT3 = strT.range(of:"Digital Book DVD (Level 1,2 and 3)")
            
            attributedStringT.addAttributes(boldFontAttribute, range: rangeT1)
            attributedStringT.addAttributes(boldFontAttribute, range: rangeT2)
            attributedStringT.addAttributes(boldFontAttribute, range: rangeT3)
            
            self.txtISBNStudents.attributedText = attributedString
            self.txtISBNTeachers.isHidden = false
            self.txtISBNTeachers.attributedText = attributedStringT
        
            
        } else if viaSegueSerie == 8 {
            
            self.txtComponents.isHidden = true
            self.txtComponentsTeachers.isHidden = true
            self.txtMoreComponentsTeachers.isHidden = true
            
            imgDet1.isHidden = false
            imgDet2.isHidden = false
            imgDet3.isHidden = false
            imgDet4.isHidden = false
            
            txtDet1.isHidden = false
            txtDet2.isHidden = false
            txtDet3.isHidden = false
            txtDet4.isHidden = false
            
            imgDet1.image = UIImage(named: "math_adventures_student_book.png")
            imgDet2.image = UIImage(named: "math_adventures_student_cd.png")
            imgDet3.image = UIImage(named: "pack_sb_resoruces_cd_math.png")
            imgDet4.image = UIImage(named: "microsite_students_math.png")
            
            self.txtDet1.text = "Student’s Book\n\nHas eight contextualized units. Each unit includes twelve core lesson pages and two review pages."
            self.txtDet2.text = "Student’s CD\n\nIncludes math-related songs and chants for students to listen to in and outside the classroom."
            self.txtDet3.text = "Resource Pack\n\nProvides a collection of manipulative materials for children’s use. These are different types of cutouts that are used repeatedly throughout the course."
            self.txtDet4.text = "Microsite\n\nwww.richmond.com.mx/mathadventures"
            
            dosImg.image = UIImage(named: "levels2.png")
            cincoImg.image = UIImage(named: "audio.png")
            seisImg.image = UIImage(named: "digital_resources.png")
            
            dosBtn.isHidden = false
            cincoBtn.isHidden = false
            seisBtn.isHidden = false
            
            imgDetT1.isHidden = false;
            imgDetT2.isHidden = false;
            imgDetT3.isHidden = false;
            imgDetT4.isHidden = false;
            imgDetT5.isHidden = false;
            
            txtDetT1.isHidden = false;
            txtDetT2.isHidden = false;
            txtDetT3.isHidden = false;
            txtDetT4.isHidden = false;
            txtDetT5.isHidden = false;
            
            imgDetT1.image = UIImage(named: "math_adventures_teacher_guide.png")
            imgDetT2.image = UIImage(named: "math_adventures_resource_pack.png")
            imgDetT3.image = UIImage(named: "math_adventures_teacher_resource_cd.png")
            imgDetT4.image = UIImage(named: "digital_book_math.png")
            imgDetT5.image = UIImage(named: "microsite_math.png")
            
            self.txtDetT1.text = "Teacher’s Guide with Pocket Cube\n\nOffers comprehensive, step-by-step notes that are interleaved with the Student’s Book pages."
            self.txtDetT2.text = "Resource Pack"
            self.txtDetT3.text = "Teacher’s Resource CD\n\nProvides teachers with additional resources to enrich their lessons."
            self.txtDetT4.text = "Digital Book"
            self.txtDetT5.text = "Microsite\n\nwww.richmond.com.mx/mathadventures"
            
            let string = "Pack Math A. (SB+RESOURCE+SRCD)\n     Level 2          7506009842816\n     Level 3          7506009842823"
            
            let attributedString = NSMutableAttributedString(string: string as String, attributes: [NSFontAttributeName:UIFont.systemFont(ofSize: 14.0)])
            
            let boldFontAttribute = [NSFontAttributeName: UIFont.boldSystemFont(ofSize: 14.0)]
            
            // Part of string to be bold
            let str = NSString(string: string)
            
            let range1 = str.range(of:"Pack Math A. (SB+RESOURCE+SRCD)")
            
            attributedString.addAttributes(boldFontAttribute, range: range1)
            
            let stringT = "Pack Math A. (TG+TCD+RES+CUBE)\n     Level 2          7506009842359\n     Level 3          7506009842366"
            
            let attributedStringT = NSMutableAttributedString(string: stringT as String, attributes: [NSFontAttributeName:UIFont.systemFont(ofSize: 14.0)])
            
            // Part of string to be bold
            let strT = NSString(string: stringT)
            
            let rangeT1 = strT.range(of:"Pack Math A. (TG+TCD+RES+CUBE)")
            
            attributedStringT.addAttributes(boldFontAttribute, range: rangeT1)
            
            self.txtISBNStudents.attributedText = attributedString
            self.txtISBNTeachers.isHidden = false
            self.txtISBNTeachers.attributedText = attributedStringT
            
        } else if viaSegueSerie == 9 {
            imgCEFR.image = UIImage(named: "abracadabra_cefr.png")
            
            unoImg.image = UIImage(named: "american_english.png")
            dosImg.image = UIImage(named: "levels6.png")
            tresImg.image = UIImage(named: "hours1_3.png")
            cuatroImg.image = UIImage(named: "digital_book.png")
            cincoImg.image = UIImage(named: "audio.png")
            seisImg.image = UIImage(named: "digital_resources.png")
            
            unoBtn.isHidden = false
            dosBtn.isHidden = false
            tresBtn.isHidden = false
            cuatroBtn.isHidden = false
            cincoBtn.isHidden = false
            seisBtn.isHidden = false
            
            self.txtComponents.text = "- Student’s Book \n \n- Student’s CD"
            imgDet1.isHidden = true
            imgDet2.isHidden = true
            imgDet3.isHidden = true
            self.txtDet1.isHidden = true
            self.txtDet2.isHidden = true
            self.txtDet3.isHidden = true
            self.txtComponentsTeachers.text = "- Teacher’s Guide in Spanish\n \n- Flashcards\n \n- Teacher’s Resource CD with Audio\n \n- Digital Book\n \n"
            self.txtMoreComponentsTeachers.isHidden = true
            
            let string = "Pack Abracadabra (SB + CD)\n      Level 1          7506009840263\n      Level 2          7506009840270\n      Level 3          7506009840287\n      Level 4          7506009840294\n      Level 5          7506009840300\n      Level 6          7506009840317"
            
            let attributedString = NSMutableAttributedString(string: string as String, attributes: [NSFontAttributeName:UIFont.systemFont(ofSize: 14.0)])
            
            let boldFontAttribute = [NSFontAttributeName: UIFont.boldSystemFont(ofSize: 14.0)]
            
            // Part of string to be bold
            let str = NSString(string: string)
            
            let range1 = str.range(of:"Pack Abracadabra (SB + CD)")
            
            attributedString.addAttributes(boldFontAttribute, range: range1)
            
            let stringT = "Pack Abracadabra (GM+TRCD)\n      Level 1          7506009840638\n      Level 2          7506009840645\n      Level 3          7506009840652\n      Level 4          7506009840676\n      Level 5          7506009840669\n      Level 6          7506009840683\n\nFlashcards\n      Level 1          9786070609350\n      Level 2          9786070609374\n      Level 3          9786070609367\n      Level 4          9786070609398\n      Level 5          9786070609381\n      Level 6          9786070610097\n\nDigital Book CD\n      Level 1          9786070612985\n      Level 2          9786070613005\n      Level 3          9786070613029\n      Level 4          9786070612749\n      Level 5          9786070612961\n      Level 6          9786070612954"
            
            let attributedStringT = NSMutableAttributedString(string: stringT as String, attributes: [NSFontAttributeName:UIFont.systemFont(ofSize: 14.0)])
            
            // Part of string to be bold
            let strT = NSString(string: stringT)
            
            let rangeT1 = strT.range(of:"Pack Abracadabra (GM+TRCD)")
            let rangeT2 = strT.range(of:"Flashcards")
            let rangeT3 = strT.range(of:"Digital Book CD")
            
            attributedStringT.addAttributes(boldFontAttribute, range: rangeT1)
            attributedStringT.addAttributes(boldFontAttribute, range: rangeT2)
            attributedStringT.addAttributes(boldFontAttribute, range: rangeT3)
            
            self.txtISBNStudents.attributedText = attributedString
            self.txtISBNTeachers.isHidden = false
            self.txtISBNTeachers.attributedText = attributedStringT
            
        } else if viaSegueSerie == 10 {
            imgCEFR.image = UIImage(named: "beep_cefr.png")
            
            unoImg.image = UIImage(named: "american_english.png")
            dosImg.image = UIImage(named: "levels6.png")
            tresImg.image = UIImage(named: "hours1_3.png")
            cuatroImg.image = UIImage(named: "digital_book.png")
            cincoImg.image = UIImage(named: "audio.png")
            seisImg.image = UIImage(named: "clil.png")
            
            unoBtn.isHidden = false
            dosBtn.isHidden = false
            tresBtn.isHidden = false
            cuatroBtn.isHidden = false
            cincoBtn.isHidden = false
            seisBtn.isHidden = false
            
            self.txtComponents.text = "Student’s Book & Activity Book combo\n \n-Student’s Audio CD\n \n-Playing Cards & Stickers (Levels 1 and 2)\n \n-Playing Cards (Levels 3 and 4)"
            imgDet1.isHidden = true
            imgDet2.isHidden = true
            imgDet3.isHidden = true
            self.txtDet1.isHidden = true
            self.txtDet2.isHidden = true
            self.txtDet3.isHidden = true
            self.txtComponentsTeachers.text = "- Teacher’s Book \n \n-Posters \n \n-Flashcards\n \n-Puppet included in the  ashcards pack (Levels 1 and 2)\n \n-Class Audio & Resource CD\n \n-Digital Book\n \n"
            self.txtMoreComponentsTeachers.isHidden = true
            
            let string = "Pack Beep (SB&AB+PC+ Stickers+CD)\n   Level 1          7506009840102\n   Level 2          7506009840119\n   Level 3          N/A\n   Level 4          N/A\n   Level 5          N/A\n   Level 6          N/A\n\nPack Beep (SB&AB+PlayingCards+CD)\n   Level 1          N/A\n   Level 2          N/A\n   Level 3          7506009840324\n   Level 4          7506009840126\n   Level 5          N/A\n   Level 6          N/A\n\nPack Beep (SB&AB+CD)\n   Level 1          N/A\n   Level 2          N/A\n   Level 3          N/A\n   Level 4          N/A\n   Level 5          7506009840331\n   Level 6          7506009840133"
            
            let attributedString = NSMutableAttributedString(string: string as String, attributes: [NSFontAttributeName:UIFont.systemFont(ofSize: 14.0)])
            
            let boldFontAttribute = [NSFontAttributeName: UIFont.boldSystemFont(ofSize: 14.0)]
            
            // Part of string to be bold
            let str = NSString(string: string)
            
            let range1 = str.range(of:"Pack Beep (SB&AB+PC+ Stickers+CD)")
            let range2 = str.range(of:"Pack Beep (SB&AB+PlayingCards+CD)")
            let range3 = str.range(of:"Pack Beep (SB&AB+CD)")
            
            attributedString.addAttributes(boldFontAttribute, range: range1)
            attributedString.addAttributes(boldFontAttribute, range: range2)
            attributedString.addAttributes(boldFontAttribute, range: range3)
            
            let stringT = "Pack Beep (TB + Class CD + Flashcards)\n   Level 1          7506009840348\n   Level 2          7506009840355\n   Level 3          7506009840362\n   Level 4          7506009840379\n   Level 5          7506009840386\n   Level 6          7506009840393\n\nPosters\n   Level 1          7506009839533\n   Level 2          7506009839540\n   Level 3          7506009839557\n   Level 4          7506009839564\n   Level 5          7506009839571\n   Level 6          7506009839588\n\nDigital Book CD\n   Level 1          9786070613036\n   Level 2          9786070612862\n   Level 3          9786070612909\n   Level 4          9786070612978\n   Level 5          9786070612886\n   Level 6          9786070612923"
            
            let attributedStringT = NSMutableAttributedString(string: stringT as String, attributes: [NSFontAttributeName:UIFont.systemFont(ofSize: 14.0)])
            
            // Part of string to be bold
            let strT = NSString(string: stringT)
            
            let rangeT1 = strT.range(of:"Pack Beep (TB + Class CD + Flashcards)")
            let rangeT2 = strT.range(of:"Posters")
            let rangeT3 = strT.range(of:"Digital Book CD")
            
            attributedStringT.addAttributes(boldFontAttribute, range: rangeT1)
            attributedStringT.addAttributes(boldFontAttribute, range: rangeT2)
            attributedStringT.addAttributes(boldFontAttribute, range: rangeT3)
            
            self.txtISBNStudents.attributedText = attributedString
            self.txtISBNTeachers.isHidden = false
            self.txtISBNTeachers.attributedText = attributedStringT
            
        } else if viaSegueSerie == 12 {
            imgCEFR.image = UIImage(named: "cool_kids_second_edition_cefr.png")
            
            unoImg.image = UIImage(named: "american_english.png")
            dosImg.image = UIImage(named: "levels6.png")
            tresImg.image = UIImage(named: "hours3_5.png")
            cuatroImg.image = UIImage(named: "digital_book.png")
            cincoImg.image = UIImage(named: "audio.png")
            seisImg.image = UIImage(named: "digital_resources.png")
            sieteImg.image = UIImage(named: "microsite.png")
            
            unoBtn.isHidden = false
            dosBtn.isHidden = false
            tresBtn.isHidden = false
            cuatroBtn.isHidden = false
            cincoBtn.isHidden = false
            seisBtn.isHidden = false
            sieteBtn.isHidden = false
            
            self.txtComponents.text = "- Student’s Book \n \n- Workbook \n \n- Student’s CD \n \n- Cool Reading"
            imgDet1.isHidden = true
            imgDet2.isHidden = true
            imgDet3.isHidden = true
            self.txtDet1.isHidden = true
            self.txtDet2.isHidden = true
            self.txtDet3.isHidden = true
            self.txtComponentsTeachers.text = "- Teacher’s Guide (printed and digital)\n \n- Guía del Maestro (printed and digital)\n \n- Teacher’s Resource CD (with audio, crafts instructions, extra activities, tests and word lists)\n \n- Flashcards \n \n- Cool Reading\n \n"
            self.txtMoreComponentsTeachers.isHidden = true
            
            self.txtISBNStudents.isHidden = false
            
            let string = "Pack Cool Kids SE\n   Level 1          7506009846265\n   Level 2          7506009846272\n   Level 3          7506009846289\n   Level 4          7506009846296\n   Level 5          7506009846302\n   Level 6          7506009846319\n\nWorkbook\n   Level 1          *TBA\n   Level 2          *TBA\n   Level 3          *TBA\n   Level 4          *TBA\n   Level 5          *TBA\n   Level 6          *TBA"
            
            let attributedString = NSMutableAttributedString(string: string as String, attributes: [NSFontAttributeName:UIFont.systemFont(ofSize: 14.0)])
            
            let boldFontAttribute = [NSFontAttributeName: UIFont.boldSystemFont(ofSize: 14.0)]
            
            // Part of string to be bold
            let str = NSString(string: string)
            
            let range1 = str.range(of:"Pack Cool Kids SE")
            let range2 = str.range(of:"Workbook")
            
            attributedString.addAttributes(boldFontAttribute, range: range1)
            attributedString.addAttributes(boldFontAttribute, range: range2)
            
            let stringT = "Pack Cool Kids SE (Teacher’s Guide)\n   Level 1          7506009846388\n   Level 2          7506009846395\n   Level 3          7506009846401\n   Level 4          7506009846418\n   Level 5          7506009846425\n   Level 6          7506009846432\n\nPack Cool Kids SE (Guía del Maestro)\n   Level 1          7506009846449\n   Level 2          7506009846456\n   Level 3          7506009846463\n   Level 4          7506009846470\n   Level 5          7506009846487\n   Level 6          7506009846494"
            
            let attributedStringT = NSMutableAttributedString(string: stringT as String, attributes: [NSFontAttributeName:UIFont.systemFont(ofSize: 14.0)])
            
            // Part of string to be bold
            let strT = NSString(string: stringT)
            
            let rangeT1 = strT.range(of:"Pack Cool Kids SE (Teacher’s Guide)")
            let rangeT2 = strT.range(of:"Pack Cool Kids SE (Guía del Maestro)")
            
            attributedStringT.addAttributes(boldFontAttribute, range: rangeT1)
            attributedStringT.addAttributes(boldFontAttribute, range: rangeT2)
            
            self.txtISBNStudents.attributedText = attributedString
            self.txtISBNTeachers.isHidden = false
            self.txtISBNTeachers.attributedText = attributedStringT
            
        } else if viaSegueSerie == 13 {
            imgCEFR.image = UIImage(named: "lighthouse_cefr.png")
            
            unoImg.image = UIImage(named: "american_english.png")
            dosImg.image = UIImage(named: "levels6.png")
            tresImg.image = UIImage(named: "hours3_5.png")
            cuatroImg.image = UIImage(named: "digital_book.png")
            cincoImg.image = UIImage(named: "audio.png")
            
            unoBtn.isHidden = false
            dosBtn.isHidden = false
            tresBtn.isHidden = false
            cuatroBtn.isHidden = false
            cincoBtn.isHidden = false
            
            self.txtComponents.text = "- Student’s Book\n \n- Student’s CD \n \n- Activity Book \n \n- Stickers"
            imgDet1.isHidden = true
            imgDet2.isHidden = true
            imgDet3.isHidden = true
            self.txtDet1.isHidden = true
            self.txtDet2.isHidden = true
            self.txtDet3.isHidden = true
            self.txtComponentsTeachers.text = "- Teacher’s Book\n \n- Class CD &amp; CD-ROM\n \n- Puzzles (levels 1-3)\n \n- Word Kits (levels 4-6) \n \n- Digital Book\n \n- Poster with Word Cards and Cutouts\n \n"
            self.txtMoreComponentsTeachers.isHidden = true
            
            let string = "Pack Lighthouse (SB + CD + Stickers)\n    Level 1          7506009805163\n    Level 2          7506009805170\n    Level 3          7506009805187\n    Level 4          7506009805194\n    Level 5          7506009805200\n    Level 6          7506009805217\n\nActivity Book\n    Level 1          9786076000427\n    Level 2          9786076000069\n    Level 3          9786076000700\n    Level 4          9786076000458\n    Level 5          9786076000403\n    Level 6          9786076000922"
            
            let attributedString = NSMutableAttributedString(string: string as String, attributes: [NSFontAttributeName:UIFont.systemFont(ofSize: 14.0)])
            
            let boldFontAttribute = [NSFontAttributeName: UIFont.boldSystemFont(ofSize: 14.0)]
            
            // Part of string to be bold
            let str = NSString(string: string)
            
            let range1 = str.range(of:"Pack Lighthouse (SB + CD + Stickers)")
            let range2 = str.range(of:"Activity Book")
            
            attributedString.addAttributes(boldFontAttribute, range: range1)
            attributedString.addAttributes(boldFontAttribute, range: range2)
            
            let stringT = "Teacher’s Book\n    Level 1          9786076000441\n    Level 2          9786076000090\n    Level 3          9786076000717\n    Level 4          9786076000106\n    Level 5          9786076000410\n    Level 6          9786076000946\n\nClass CDs & CR ROM\n    Level 1          7506009804371\n    Level 2          7506009804418\n    Level 3          7506009804456\n    Level 4          7506009804494\n    Level 5          7506009804531\n    Level 6          7506009804579\n\nPoster & Cutouts\n    Level 1          7506009802414\n    Level 2          7506009802421\n    Level 3          7506009802438\n    Level 4          7506009802445\n    Level 5          7506009802452\n    Level 6          7506009802469\n\nPuzzles\n    Level 1          9786076000144\n    Level 2          9786076000083\n    Level 3          9786076000885\n\nWord Kits\n    Level 4          9786076000076\n    Level 5          9786076000397\n    Level 6          9786076000953\n\nDigital Book CD\n    Level 1          9786070608643\n    Level 2          9786070608650\n    Level 3          9786070608667\n    Level 4          9786070608667\n    Level 5          9786070608681\n    Level 6          9786070608698"
            
            let attributedStringT = NSMutableAttributedString(string: stringT as String, attributes: [NSFontAttributeName:UIFont.systemFont(ofSize: 14.0)])
            
            // Part of string to be bold
            let strT = NSString(string: stringT)
            
            let rangeT1 = strT.range(of:"Teacher’s Book")
            let rangeT2 = strT.range(of:"Class CDs & CR ROM")
            let rangeT3 = strT.range(of:"Poster & Cutouts")
            let rangeT4 = strT.range(of:"Puzzles")
            let rangeT5 = strT.range(of:"Digital Book CD")
            
            attributedStringT.addAttributes(boldFontAttribute, range: rangeT1)
            attributedStringT.addAttributes(boldFontAttribute, range: rangeT2)
            attributedStringT.addAttributes(boldFontAttribute, range: rangeT3)
            attributedStringT.addAttributes(boldFontAttribute, range: rangeT4)
            attributedStringT.addAttributes(boldFontAttribute, range: rangeT5)
            
            self.txtISBNStudents.attributedText = attributedString
            self.txtISBNTeachers.isHidden = false
            self.txtISBNTeachers.attributedText = attributedStringT
            
        } else if viaSegueSerie == 21 {
            imgCEFR.image = UIImage(named: "oathway_to_grammar_cefr.png")
            
            unoImg.image = UIImage(named: "american_english.png")
            dosImg.image = UIImage(named: "levels6.png")
            tresImg.image = UIImage(named: "richmondsolution.png")
            cuatroImg.image = UIImage(named: "app.png")
            cincoImg.image = UIImage(named: "exam_friendly.png")
            seisImg.image = UIImage(named: "british.png")
            
            unoBtn.isHidden = false
            dosBtn.isHidden = false
            tresBtn.isHidden = false
            cuatroBtn.isHidden = false
            cincoBtn.isHidden = false
            seisBtn.isHidden = false
            
            self.txtComponents.text = "- Student’s Book with Audio CD"
            imgDet1.isHidden = true
            imgDet2.isHidden = true
            imgDet3.isHidden = true
            self.txtDet1.isHidden = true
            self.txtDet2.isHidden = true
            self.txtDet3.isHidden = true
            self.txtComponentsTeachers.text = "- Teacher’s Booklet\n \n"
            self.txtMoreComponentsTeachers.isHidden = true
            
            let string = "Pack Pathway to Grammar (SB + CD)\n   Level 1          7506009842830\n   Level 2          7506009842847\n   Level 3          7506009842854\n   Level 4          7506009842861\n   Level 5          7506009842878\n   Level 6          7506009842885"
            
            let attributedString = NSMutableAttributedString(string: string as String, attributes: [NSFontAttributeName:UIFont.systemFont(ofSize: 14.0)])
            
            let boldFontAttribute = [NSFontAttributeName: UIFont.boldSystemFont(ofSize: 14.0)]
            
            // Part of string to be bold
            let str = NSString(string: string)
            
            let range1 = str.range(of:"Pack Pathway to Grammar (SB + CD)")
            
            attributedString.addAttributes(boldFontAttribute, range: range1)
            
            let stringT = "Teacher’s Booklet\n   Level 1          9786070610837\n   Level 2          9786070610981\n   Level 3          9786070610998\n   Level 4          9786070611001\n   Level 5          9786070611018\n   Level 6          9786070611025"
            
            let attributedStringT = NSMutableAttributedString(string: stringT as String, attributes: [NSFontAttributeName:UIFont.systemFont(ofSize: 14.0)])
            
            // Part of string to be bold
            let strT = NSString(string: stringT)
            
            let rangeT1 = strT.range(of:"Teacher’s Booklet")
            
            attributedStringT.addAttributes(boldFontAttribute, range: rangeT1)
            
            self.txtISBNStudents.attributedText = attributedString
            self.txtISBNTeachers.isHidden = false
            self.txtISBNTeachers.attributedText = attributedStringT
            
        } else if viaSegueSerie == 20 {
            unoImg.image = UIImage(named: "richmondsolution.png")
            dosImg.image = UIImage(named: "levels6.png")
            tresImg.image = UIImage(named: "clil.png")
            cuatroImg.image = UIImage(named: "digital_book.png")
            cincoImg.image = UIImage(named: "american_english.png")
            seisImg.image = UIImage(named: "microsite.png")
            
            unoBtn.isHidden = false
            dosBtn.isHidden = false
            tresBtn.isHidden = false
            cuatroBtn.isHidden = false
            cincoBtn.isHidden = false
            seisBtn.isHidden = false
            
            self.txtComponents.text = "- Student’s Book with Activity Cards"
            imgDet1.isHidden = true
            imgDet2.isHidden = true
            imgDet3.isHidden = true
            self.txtDet1.isHidden = true
            self.txtDet2.isHidden = true
            self.txtDet3.isHidden = true
            self.txtComponentsTeachers.text = "- Teacher’s Guide\n \n- Reinforcement and Extension Worksheets\n \n- Evaluations \n \n- Digital Book\n \n"
            self.txtMoreComponentsTeachers.isHidden = true
            self.txtISBNStudents.isHidden = false
            
            let string = "Pack Pathway to Math (SB + AC)\n      Level 1          7506009844391\n      Level 2          N/A\n      Level 3          N/A\n      Level 4          7506009844421\n      Level 5          N/A\n      Level 6          N/A\n\nPathway to Math Student’s Book\n      Level 1          N/A\n      Level 2          9786070612565\n      Level 3          9786070612572\n      Level 4          N/A\n      Level 5          9786070612596\n      Level 6          9786070612602"
            
            let attributedString = NSMutableAttributedString(string: string as String, attributes: [NSFontAttributeName:UIFont.systemFont(ofSize: 14.0)])
            
            let boldFontAttribute = [NSFontAttributeName: UIFont.boldSystemFont(ofSize: 14.0)]
            
            // Part of string to be bold
            let str = NSString(string: string)
            
            let range1 = str.range(of:"Pack Pathway to Math (SB + AC)")
            let range2 = str.range(of:"Pathway to Math Student’s Book")
            
            attributedString.addAttributes(boldFontAttribute, range: range1)
            attributedString.addAttributes(boldFontAttribute, range: range2)
            
            let stringT = "Pack Pathway to Math (TG+R&E+EVAL+DB)\n      Level 1          7506009845244\n      Level 2          7506009845251\n      Level 3          7506009845268\n      Level 4          7506009845275\n      Level 5          7506009845282\n      Level 6          7506009845299"
            
            let attributedStringT = NSMutableAttributedString(string: stringT as String, attributes: [NSFontAttributeName:UIFont.systemFont(ofSize: 14.0)])
            
            // Part of string to be bold
            let strT = NSString(string: stringT)
            
            let rangeT1 = strT.range(of:"Pack Pathway to Math (TG+R&E+EVAL+DB)")
            
            attributedStringT.addAttributes(boldFontAttribute, range: rangeT1)
            
            self.txtISBNStudents.attributedText = attributedString
            self.txtISBNTeachers.isHidden = false
            self.txtISBNTeachers.attributedText = attributedStringT
            
            
        } else if viaSegueSerie == 15 {
            imgCEFR.image = UIImage(named: "thumb_up_second_edition_cefr.png")
            
            unoImg.image = UIImage(named: "richmondsolution.png")
            dosImg.image = UIImage(named: "levels6.png")
            tresImg.image = UIImage(named: "microsite.png")
            cuatroImg.image = UIImage(named: "american_english.png")
            cincoImg.image = UIImage(named: "hours7_10.png")
            seisImg.image = UIImage(named: "richmondspiral.png")
            sieteImg.image = UIImage(named: "digital_book.png")
            ochoImg.image = UIImage(named: "clil.png")
            nueveImg.image = UIImage(named: "audio.png")
            
            unoBtn.isHidden = false
            dosBtn.isHidden = false
            tresBtn.isHidden = false
            
            self.txtComponents.text = "- Student’s Book with Activity Cards"
            imgDet1.isHidden = true
            imgDet2.isHidden = true
            imgDet3.isHidden = true
            self.txtDet1.isHidden = true
            self.txtDet2.isHidden = true
            self.txtDet3.isHidden = true
            self.txtComponentsTeachers.text = "- Teacher’s Guide\n \n- Reinforcement and Extension Worksheets\n \n- Evaluations \n \n- Digital Book\n \n"
            self.txtMoreComponentsTeachers.isHidden = true
            
            let string = "Student’s Book\n       Level 1          9786070611087\n       Level 2          9786070611032\n       Level 3          9786070611094\n       Level 4          9786070611100\n       Level 5          976070611049\n       Level 6          9786070611056"
            
            let attributedString = NSMutableAttributedString(string: string as String, attributes: [NSFontAttributeName:UIFont.systemFont(ofSize: 14.0)])
            
            let boldFontAttribute = [NSFontAttributeName: UIFont.boldSystemFont(ofSize: 14.0)]
            
            // Part of string to be bold
            let str = NSString(string: string)
            
            let range1 = str.range(of:"Student’s Book")
            
            attributedString.addAttributes(boldFontAttribute, range: range1)
            
            let stringT = "Teacher’s Resource CD\n       Level 1          7506009842403\n       Level 2          7506009842410\n       Level 3          7506009842427\n       Level 4          7506009842434\n       Level 5          7506009842441\n       Level 6          7506009842458\n"
            
            let attributedStringT = NSMutableAttributedString(string: stringT as String, attributes: [NSFontAttributeName:UIFont.systemFont(ofSize: 14.0)])
            
            // Part of string to be bold
            let strT = NSString(string: stringT)
            
            let rangeT1 = strT.range(of:"Teacher’s Resource CD")
            
            attributedStringT.addAttributes(boldFontAttribute, range: rangeT1)
            
            self.txtISBNStudents.attributedText = attributedString
            self.txtISBNTeachers.isHidden = false
            self.txtISBNTeachers.attributedText = attributedStringT
            
            
        } else if viaSegueSerie == 19 {
            unoImg.image = UIImage(named: "richmondsolution.png")
            dosImg.image = UIImage(named: "levels6.png")
            tresImg.image = UIImage(named: "microsite.png")
            cuatroImg.image = UIImage(named: "american_english.png")
            
            unoBtn.isHidden = false
            dosBtn.isHidden = false
            tresBtn.isHidden = false
            cuatroBtn.isHidden = false
            
            self.txtComponents.text = "- Student’s Book with Activity Cards"
            imgDet1.isHidden = true
            imgDet2.isHidden = true
            imgDet3.isHidden = true
            self.txtDet1.isHidden = true
            self.txtDet2.isHidden = true
            self.txtDet3.isHidden = true
            self.txtComponentsTeachers.text = "- Teacher’s Guide\n \n- Reinforcement and Extension Worksheets\n \n- Evaluations \n \n- Digital Book\n \n"
            self.txtMoreComponentsTeachers.isHidden = true
            
            let string = "Student’s Book\n       Level 1          9786070611087\n       Level 2          9786070611032\n       Level 3          9786070611094\n       Level 4          9786070611100\n       Level 5          976070611049\n       Level 6          9786070611056"
            
            let attributedString = NSMutableAttributedString(string: string as String, attributes: [NSFontAttributeName:UIFont.systemFont(ofSize: 14.0)])
            
            let boldFontAttribute = [NSFontAttributeName: UIFont.boldSystemFont(ofSize: 14.0)]
            
            // Part of string to be bold
            let str = NSString(string: string)
            
            let range1 = str.range(of:"Student’s Book")
            
            attributedString.addAttributes(boldFontAttribute, range: range1)
            
            let stringT = "Teacher’s Resource CD\n       Level 1          7506009842403\n       Level 2          7506009842410\n       Level 3          7506009842427\n       Level 4          7506009842434\n       Level 5          7506009842441\n       Level 6          7506009842458\n"
            
            let attributedStringT = NSMutableAttributedString(string: stringT as String, attributes: [NSFontAttributeName:UIFont.systemFont(ofSize: 14.0)])
            
            // Part of string to be bold
            let strT = NSString(string: stringT)
            
            let rangeT1 = strT.range(of:"Teacher’s Resource CD")
            
            attributedStringT.addAttributes(boldFontAttribute, range: rangeT1)
            
            self.txtISBNStudents.attributedText = attributedString
            self.txtISBNTeachers.isHidden = false
            self.txtISBNTeachers.attributedText = attributedStringT
            
            
        } else if viaSegueSerie == 18 {
            unoImg.image = UIImage(named: "richmondsolution.png")
            dosImg.image = UIImage(named: "levels6.png")
            tresImg.image = UIImage(named: "clil.png")
            cuatroImg.image = UIImage(named: "digital_book.png")
            cincoImg.image = UIImage(named: "american_english.png")
            seisImg.image = UIImage(named: "videos.png")
            
            unoBtn.isHidden = false
            dosBtn.isHidden = false
            tresBtn.isHidden = false
            cuatroBtn.isHidden = false
            cincoBtn.isHidden = false
            seisBtn.isHidden = false
            
            self.txtComponents.text = "- Student’s Book with Activity Cards"
            imgDet1.isHidden = true
            imgDet2.isHidden = true
            imgDet3.isHidden = true
            self.txtDet1.isHidden = true
            self.txtDet2.isHidden = true
            self.txtDet3.isHidden = true
            self.txtComponentsTeachers.text = "- Teacher’s Guide\n \n- Reinforcement and Extension Worksheets\n \n- Evaluations \n \n- Digital Book\n \n"
            self.txtMoreComponentsTeachers.isHidden = true
            
            let string = "Pack Pathway to Science (SB + SB/AC)\n    Level 1          7506009840041\n    Level 2          7506009840058\n    Level 3          7506009840065\n    Level 4          7506009840072\n    Level 5          7506009840089\n    Level 6          7506009840096\n"
            
            let attributedString = NSMutableAttributedString(string: string as String, attributes: [NSFontAttributeName:UIFont.systemFont(ofSize: 14.0)])
            
            let boldFontAttribute = [NSFontAttributeName: UIFont.boldSystemFont(ofSize: 14.0)]
            
            // Part of string to be bold
            let str = NSString(string: string)
            
            let range1 = str.range(of:"Pack Pathway to Science (SB + SB/AC)")
            
            attributedString.addAttributes(boldFontAttribute, range: range1)
            
            let stringT = "Pack Pathway to Science (Tg+Evaluations+R&E)\n    Level 1          7506009840409, 9786070613180\n    Level 2          7506009840416, 9786070613173\n    Level 3          7506009840423, 9786070613166\n    Level 4          7506009840430, 9786070613159\n    Level 5          7506009840447, 9786070613142\n    Level 6          7506009840454, 9786070613135"
            
            let attributedStringT = NSMutableAttributedString(string: stringT as String, attributes: [NSFontAttributeName:UIFont.systemFont(ofSize: 14.0)])
            
            // Part of string to be bold
            let strT = NSString(string: stringT)
            
            let rangeT1 = strT.range(of:"Pack Pathway to Science (Tg+Evaluations+R&E)")
            
            attributedStringT.addAttributes(boldFontAttribute, range: rangeT1)
            
            self.txtISBNStudents.attributedText = attributedString
            self.txtISBNTeachers.isHidden = false
            self.txtISBNTeachers.attributedText = attributedStringT
            
        } else if viaSegueSerie == 17 {
            imgCEFR.image = UIImage(named: "science_and_geography_cefr.png")
            
            unoImg.image = UIImage(named: "clil.png")
            dosImg.image = UIImage(named: "levels6.png")
            
            unoBtn.isHidden = false
            dosBtn.isHidden = false
            
            self.txtComponents.text = "- Student’s Book"
            imgDet1.isHidden = true
            imgDet2.isHidden = true
            imgDet3.isHidden = true
            self.txtDet1.isHidden = true
            self.txtDet2.isHidden = true
            self.txtDet3.isHidden = true
            self.txtComponentsTeachers.text = "- Teacher’s Book \n \n- Resource Book \n \n- Posters\n \n"
            self.txtMoreComponentsTeachers.isHidden = true
            
            let string = "Pack Science & Geography (SB+CD-ROM)\n     Level 1          7506009837447\n     Level 2          7506009837454\n     Level 3          7506009837461\n     Level 4          7506009837478\n     Level 5          7506009837485\n     Level 6          7506009837492\n"
            
            let attributedString = NSMutableAttributedString(string: string as String, attributes: [NSFontAttributeName:UIFont.systemFont(ofSize: 14.0)])
            
            let boldFontAttribute = [NSFontAttributeName: UIFont.boldSystemFont(ofSize: 14.0)]
            
            // Part of string to be bold
            let str = NSString(string: string)
            
            let range1 = str.range(of:"Pack Science & Geography (SB+CD-ROM)")
            
            attributedString.addAttributes(boldFontAttribute, range: range1)
            
            let stringT = "Science and Geography Teacher’s Book\n     Level 1          9786076000489\n     Level 2          9786076000526\n     Level 3          9786076000519\n     Level 4          9786076000496\n     Level 5          9786076000663\n     Level 6          9786076000670\n\nScience and Geography Posters\n     Level 1          7506009805668\n     Level 2          7506009805675\n     Level 3          7506009805682\n     Level 4          7506009805699\n     Level 5          7506009805705\n     Level 6          7506009805712\n\nScience and Geography Resource Book\n     Level 1          9786076001004\n     Level 2          9786076000540\n     Level 3          9786076000533\n     Level 4          9786076000892\n     Level 5          9786076001028\n     Level 6          9786076001011"
            
            let attributedStringT = NSMutableAttributedString(string: stringT as String, attributes: [NSFontAttributeName:UIFont.systemFont(ofSize: 14.0)])
            
            // Part of string to be bold
            let strT = NSString(string: stringT)
            
            let rangeT1 = strT.range(of:"Science and Geography Teacher’s Book")
            let rangeT2 = strT.range(of:"Science and Geography Posters")
            let rangeT3 = strT.range(of:"Science and Geography Resource Book")
            
            attributedStringT.addAttributes(boldFontAttribute, range: rangeT1)
            attributedStringT.addAttributes(boldFontAttribute, range: rangeT2)
            attributedStringT.addAttributes(boldFontAttribute, range: rangeT3)
            
            self.txtISBNStudents.attributedText = attributedString
            self.txtISBNTeachers.isHidden = false
            self.txtISBNTeachers.attributedText = attributedStringT
            
        } else if viaSegueSerie == 14 {
            imgCEFR.image = UIImage(named: "skyrocket_cefr.png")
            
            unoImg.image = UIImage(named: "richmondsolution.png")
            dosImg.image = UIImage(named: "levels6.png")
            tresImg.image = UIImage(named: "hours5_75.png")
            cuatroImg.image = UIImage(named: "digital_book.png")
            cincoImg.image = UIImage(named: "audio.png")
            seisImg.image = UIImage(named: "digital_resources.png")
            sieteImg.image = UIImage(named: "american_english.png")
            ochoImg.image = UIImage(named: "microsite.png")
            nueveImg.image = UIImage(named: "richmondspiral.png")
            
            unoBtn.isHidden = false
            dosBtn.isHidden = false
            tresBtn.isHidden = false
            cuatroBtn.isHidden = false
            cincoBtn.isHidden = false
            seisBtn.isHidden = false
            sieteBtn.isHidden = false
            ochoBtn.isHidden = false
            nueveBtn.isHidden = false
            
            self.txtComponents.text = "- Student’s Book\n \n- Practice Book\n \n- Student’s CD\n \n- Richmond Spiral Platform"
            imgDet1.image = UIImage(named: "primariaskyrockets1.png")
            imgDet2.image = UIImage(named: "primariaskyrockets2.png")
            imgDet3.isHidden = true
            self.txtDet1.text = "Nine units of 10 pages each, a review and a literature section every three units, dictionary and stickers."
            self.txtDet2.text = "Consolidates and reinforces grammar and vocabulary."
            self.txtDet3.isHidden = true
            self.txtComponentsTeachers.text = "- Teacher’s Guide\n \n- Class Audio CD\n \n- Teacher’s Resource CD\n \n- Posters and Word Cards\n \n- Digital Media Projects (Levels 3-6)\n \n- Digital Book\n \n- Richmond Spiral Platform\n \n\n\nSkyrocket is a sis-level grammar book that follows the syllabus of the primary school series Skyrocket. Each unit offers short grammar explanations of the main grammar points in a direct and open way. It includes entertaining activities for students to practice in class or at home. At the end of each unit, there is a two-page reading lesson where students can consolidate all the language points studied in the lesson." +
                "\n\n" +
            "Skyrocket Your Grammar also offers review lessons and grammar songs!\n\n\n\n\n\n\n\n"
            self.txtMoreComponentsTeachers.isHidden = true
            
            let string = "Student’s Book\n   Level 1          9786070608827\n   Level 2          9786070608834\n   Level 3          978607060884\n   Level 4          9786070609503\n   Level 5          9786070609510\n   Level 6          9786070608858\n\nPack Skyrocket (PB+CD)\n   Level 1          7506009839908\n   Level 2          7506009839915\n   Level 3          7506009839922\n   Level 4          7506009839939\n   Level 5          7506009839946\n   Level 6          7506009839953\n\nSkyrocket Your Grammar Student’s Book\n   Level 1          9786070608995\n   Level 2          7506009839915\n   Level 3          9786070608872\n   Level 4          9786070609541\n   Level 5          9786070609558\n   Level 6          9786070609008\n\nPack Skyrocket (SB+PRACTICE+CD+GRAMMAR)\n   Level 1          7506009841093\n   Level 2          7506009841109\n   Level 3          7506009841116\n   Level 4          7506009841123\n   Level 5          7506009841130\n   Level 6          7506009841147"
            
            let attributedString = NSMutableAttributedString(string: string as String, attributes: [NSFontAttributeName:UIFont.systemFont(ofSize: 14.0)])
            
            let boldFontAttribute = [NSFontAttributeName: UIFont.boldSystemFont(ofSize: 14.0)]
            
            // Part of string to be bold
            let str = NSString(string: string)
            
            let range1 = str.range(of:"Student’s Book")
            let range2 = str.range(of:"Pack Skyrocket (PB+CD)")
            let range3 = str.range(of:"Skyrocket Your Grammar Student’s Book")
            let range4 = str.range(of:"Pack Skyrocket (SB+PRACTICE+CD+GRAMMAR)")
            
            attributedString.addAttributes(boldFontAttribute, range: range1)
            attributedString.addAttributes(boldFontAttribute, range: range2)
            attributedString.addAttributes(boldFontAttribute, range: range3)
            attributedString.addAttributes(boldFontAttribute, range: range4)
            
            let stringT = "Pack Skyrocket (TG+CA+RCD)\n   Level 1          7506009839960\n   Level 2          7506009839984\n   Level 3          7506009840461\n   Level 4          7506009840478\n   Level 5          7506009840485\n   Level 6          7506009840492\n\nPack Skyrocket Your Grammar (TG+CA)\n   Level 1          7506009839977\n   Level 2          7506009839991\n   Level 3          7506009840003\n   Level 4          7506009840010\n   Level 5          7506009840027\n   Level 6          7506009840034\n\nPosters with Word Cards\n   Level 1          7506009836600\n   Level 2          7506009836617\n   Level 3          7506009836624\n   Level 4          7506009836631\n   Level 5          7506009836648\n   Level 6          7506009836655\n\nDigital Media Projects\n   Level 1          N/A\n   Level 2          N/A\n   Level 3          7506009839861\n   Level 4          7506009839878\n   Level 5          7506009839885\n   Level 6          7506009839892\n\nDigital Book DVD\n   Level 1          9786070612947\n   Level 2          9786070612848\n   Level 3          9786070612824\n   Level 4          9786070612756\n   Level 5          9786070612725\n   Level 6          9786070613043"
            
            let attributedStringT = NSMutableAttributedString(string: stringT as String, attributes: [NSFontAttributeName:UIFont.systemFont(ofSize: 14.0)])
            
            // Part of string to be bold
            let strT = NSString(string: stringT)
            
            let rangeT1 = strT.range(of:"Pack Skyrocket (TG+CA+RCD)")
            let rangeT2 = strT.range(of:"Pack Skyrocket Your Grammar (TG+CA)")
            let rangeT3 = strT.range(of:"Posters with Word Cards")
            let rangeT4 = strT.range(of:"Digital Media Projects")
            let rangeT5 = strT.range(of:"Digital Book DVD")
            
            attributedStringT.addAttributes(boldFontAttribute, range: rangeT1)
            attributedStringT.addAttributes(boldFontAttribute, range: rangeT2)
            attributedStringT.addAttributes(boldFontAttribute, range: rangeT3)
            attributedStringT.addAttributes(boldFontAttribute, range: rangeT4)
            attributedStringT.addAttributes(boldFontAttribute, range: rangeT5)
            
            self.txtISBNStudents.attributedText = attributedString
            self.txtISBNTeachers.isHidden = false
            self.txtISBNTeachers.attributedText = attributedStringT
            
        } else if viaSegueSerie == 22 {
            
            imgCEFR.image = UIImage(named: "spotlight_on_english_cefr.png")
            
            unoImg.image = UIImage(named: "american_english.png")
            dosImg.image = UIImage(named: "levels7.png")
            tresImg.image = UIImage(named: "hours10.png")
            cuatroImg.image = UIImage(named: "clil.png")
            cincoImg.image = UIImage(named: "audio.png")
            seisImg.image = UIImage(named: "digital_book.png")
            
            unoBtn.isHidden = false
            dosBtn.isHidden = false
            tresBtn.isHidden = false
            cuatroBtn.isHidden = false
            cincoBtn.isHidden = false
            seisBtn.isHidden = false
            
            
            self.txtComponents.text = "- Student’s Book \n \n- Practice Book \n \n- Assessments \n \n- Interactive CD-ROM \n \n- Thematic Library"
            imgDet1.isHidden = true
            imgDet2.isHidden = true
            imgDet3.isHidden = true
            self.txtDet1.isHidden = true
            self.txtDet2.isHidden = true
            self.txtDet3.isHidden = true
            self.txtComponentsTeachers.text = "- Teacher’s Guide\n \n- Assessments Teacher’s Manual\n \n- Blackline Masters\n \n- Audio CD\n \n- Photo Cards\n \n- Poster Cutouts (Level K)\n \n- Big Books (Level K)\n \n- Teacher’s Digital Resource Pack\n \n- Digital Book\n \n"
            self.txtMoreComponentsTeachers.isHidden = true
            
            let string = "Pack Student’s Spotlight\n     Level 1          7506009835856\n     Level 2          7506009835863\n     Level 3          7506009835870\n     Level 4          7506009835887\n     Level 5          7506009835894\n     Level 6          7506009835900\n     Level K          7506009835849\n\nStudent’s Book\n     Level 1          9786070601262\n     Level 2          9786070601316\n     Level 3          9786070601408\n     Level 4          9786070601453\n     Level 5          9786070601507\n     Level 6          9786070601545\n     Level K          9786070601255\n\nActivity Pad\n     Level 1          N/A\n     Level 2          N/A\n     Level 3          N/A\n     Level 4          N/A\n     Level 5          N/A\n     Level 6          N/A\n     Level K          9786070601361\n\nPractice Book\n     Level 1          9786070601279\n     Level 2          9786070601323\n     Level 3          9786070601415\n     Level 4          9786070601460\n     Level 5          9786070601514\n     Level 6          9786070601552\n     Level K          N/A\n\nAssessments\n     Level 1          9786070601286\n     Level 2          9786070601330\n     Level 3          9786070601422\n     Level 4          9786070601477\n     Level 5          9786070601521\n     Level 6          9786070601569\n     Level K          9786070601378\n\nPack Spotlight Thematic Library\n     Level 1          7506009807983\n     Level 2          7506009807990\n     Level 3          7506009808003\n     Level 4          7506009808010\n     Level 5          7506009808027\n     Level 6          7506009808034\n     Level K          N/A\n\nInteractive CD-ROM\n     Level 1          7506009807785\n     Level 2          7506009807792\n     Level 3          7506009807808\n     Level 4          7506009807815\n     Level 5          7506009807822\n     Level 6          7506009807839\n     Level K          7506009807716"
            
            let attributedString = NSMutableAttributedString(string: string as String, attributes: [NSFontAttributeName:UIFont.systemFont(ofSize: 14.0)])
            
            let boldFontAttribute = [NSFontAttributeName: UIFont.boldSystemFont(ofSize: 14.0)]
            
            // Part of string to be bold
            let str = NSString(string: string)
            
            let range1 = str.range(of:"Pack Student’s Spotlight")
            let range2 = str.range(of:"Student’s Book")
            let range3 = str.range(of:"Activity Pad")
            let range4 = str.range(of:"Practice Book")
            let range5 = str.range(of:"Assessments")
            let range6 = str.range(of:"Pack Spotlight Thematic Library")
            let range7 = str.range(of:"Interactive CD-ROM")
            
            attributedString.addAttributes(boldFontAttribute, range: range1)
            attributedString.addAttributes(boldFontAttribute, range: range2)
            attributedString.addAttributes(boldFontAttribute, range: range3)
            attributedString.addAttributes(boldFontAttribute, range: range4)
            attributedString.addAttributes(boldFontAttribute, range: range5)
            attributedString.addAttributes(boldFontAttribute, range: range6)
            attributedString.addAttributes(boldFontAttribute, range: range7)
            
            let stringT = "Teacher’s Guide\n     Level 1          9786070601309\n     Level 2          9786070601354\n     Level 3          9786070601439\n     Level 4          9786070601491\n     Level 5          9786070601668\n     Level 6          9786070601675\n     Level K          9786070601392\n\nAssessments Teacher’s Manual\n     Level 1          9786070601293\n     Level 2          9786070601347\n     Level 3          9786070601446\n     Level 4          9786070601484\n     Level 5          9786070601538\n     Level 6          9786070601576\n     Level K          9786070601385\n\nBlackline Masters\n     Level 1          7506009806658\n     Level 2          7506009806665\n     Level 3          7506009806672\n     Level 4          7506009806689\n     Level 5          7506009806696\n     Level 6          7506009806702\n     Level K          7506009806641\n\nTeacher’s Digital Resource\n     Level 1          7506009807723\n     Level 2          7506009807730\n     Level 3          7506009807747\n     Level 4          7506009807754\n     Level 5          7506009807761\n     Level 6          7506009807778\n     Level K          N/A\n\nAudio CD\n     Level 1          7506009806580\n     Level 2          7506009806597\n     Level 3          7506009806603\n     Level 4          7506009806610\n     Level 5          7506009806627\n     Level 6          7506009806634\n     Level K          7506009806573\n\nPoster with Cutouts\n     Level 1          N/A\n     Level 2          N/A\n     Level 3          N/A\n     Level 4          N/A\n     Level 5          N/A\n     Level 6          N/A\n     Level K          7506009806559"
            
            let attributedStringT = NSMutableAttributedString(string: stringT as String, attributes: [NSFontAttributeName:UIFont.systemFont(ofSize: 14.0)])
            
            // Part of string to be bold
            let strT = NSString(string: stringT)
            
            let rangeT1 = strT.range(of:"Teacher’s Guide")
            let rangeT2 = strT.range(of:"Assessments Teacher’s Manual")
            let rangeT3 = strT.range(of:"Blackline Masters")
            let rangeT4 = strT.range(of:"Teacher’s Digital Resource")
            let rangeT5 = strT.range(of:"Audio CD")
            let rangeT6 = strT.range(of:"Poster with Cutouts")
            
            attributedStringT.addAttributes(boldFontAttribute, range: rangeT1)
            attributedStringT.addAttributes(boldFontAttribute, range: rangeT2)
            attributedStringT.addAttributes(boldFontAttribute, range: rangeT3)
            attributedStringT.addAttributes(boldFontAttribute, range: rangeT4)
            attributedStringT.addAttributes(boldFontAttribute, range: rangeT5)
            attributedStringT.addAttributes(boldFontAttribute, range: rangeT6)
            
            self.txtISBNStudents.attributedText = attributedString
            self.txtISBNTeachers.isHidden = false
            self.txtISBNTeachers.attributedText = attributedStringT
            
            self.txtTitleISBNMore.text = "Big Book (Level K)"
            self.txtISBNMore.text = "A Trip to Mexico\n          9786070601644\n\nA Week Away         9786070601637\n\nBest Friends!          9786070601590\n\nNeeta Goes to...          9786070601583\n\nRobert’s Pet           9786070601620\n\nThe Outdoor...          9786070601613\n\nThe Seasons          9786070601651\n\nWhere’s My Cake?\n          9786070601606"
            
        } else if viaSegueSerie == 27 {
            imgCEFR.image = UIImage(named: "achievers_cefr.png")
            
            unoImg.image = UIImage(named: "richmondspiral.png")
            dosImg.image = UIImage(named: "levels6.png")
            tresImg.image = UIImage(named: "hours5_10.png")
            cuatroImg.image = UIImage(named: "digital_book.png")
            cincoImg.image = UIImage(named: "videos.png")
            seisImg.image = UIImage(named: "richmondsolution.png")
            sieteImg.image = UIImage(named: "american_english.png")
            ochoImg.image = UIImage(named: "exam_friendly.png")
            nueveImg.image = UIImage(named: "audio.png")
            
            unoBtn.isHidden = false
            dosBtn.isHidden = false
            tresBtn.isHidden = false
            cuatroBtn.isHidden = false
            cincoBtn.isHidden = false
            seisBtn.isHidden = false
            sieteBtn.isHidden = false
            ochoBtn.isHidden = false
            nueveBtn.isHidden = false
            
            self.txtComponents.text = "- Student’s Book \n \n- Workbook \n \n- Audio CD \n \n- Richmond Spiral Platform"
            imgDet1.isHidden = true
            imgDet2.isHidden = true
            imgDet3.isHidden = true
            self.txtDet1.isHidden = true
            self.txtDet2.isHidden = true
            self.txtDet3.isHidden = true
            self.txtComponentsTeachers.text = "- Teacher’s Book\n \n- Teacher’s Resource Book\n \n- Teacher’s Digital Book\n \n- Teacher’s Audio Material Pack\n \n- Richmond Spiral Platform\n \n"
            self.txtMoreComponentsTeachers.isHidden = true
            
            let string = "Achievers Student’s Book\n     Level 1          9788466829434\n     Level 2          9788466829069\n     Level 3          9788466829229\n     Level 4          9788466829137\n     Level 5          9788466829656\n     Level 6          9788466829335\n\nPack Achievers (WB+AUDIO CD)\n     Level 1          7506009843455\n     Level 2          7506009843462\n     Level 3          7506009843479\n     Level 4          7506009843486\n     Level 5          7506009843493\n     Level 6          7506009844315"
            
            let attributedString = NSMutableAttributedString(string: string as String, attributes: [NSFontAttributeName:UIFont.systemFont(ofSize: 14.0)])
            
            let boldFontAttribute = [NSFontAttributeName: UIFont.boldSystemFont(ofSize: 14.0)]
            
            // Part of string to be bold
            let str = NSString(string: string)
            
            let range1 = str.range(of:"Achievers Student’s Book")
            let range2 = str.range(of:"Pack Achievers (WB+AUDIO CD)")
            
            attributedString.addAttributes(boldFontAttribute, range: range1)
            attributedString.addAttributes(boldFontAttribute, range: range2)
            
            let stringT = "Pack Achievers (TG+TRB+AUDIO MATERIAL)\n     Level 1          7506009843646\n     Level 2          7506009843615\n     Level 3          7506009843622\n     Level 4          7506009843639\n     Level 5          7506009843653\n     Level 6          7506009844483\n\nTeacher’s l-Book\n     Level 1          9788466829571\n     Level 2          9788466829380\n     Level 3          9788466829106\n     Level 4          9788466829557\n     Level 5          9788466829915\n     Level 6          TBA"
            
            let attributedStringT = NSMutableAttributedString(string: stringT as String, attributes: [NSFontAttributeName:UIFont.systemFont(ofSize: 14.0)])
            
            // Part of string to be bold
            let strT = NSString(string: stringT)
            
            let rangeT1 = strT.range(of:"Pack Achievers (TG+TRB+AUDIO MATERIAL)")
            let rangeT2 = strT.range(of:"Teacher’s l-Book")
            
            attributedStringT.addAttributes(boldFontAttribute, range: rangeT1)
            attributedStringT.addAttributes(boldFontAttribute, range: rangeT2)
            
            self.txtISBNStudents.attributedText = attributedString
            self.txtISBNTeachers.isHidden = false
            self.txtISBNTeachers.attributedText = attributedStringT
            
        } else if viaSegueSerie == 26 {
            imgCEFR.image = UIImage(named: "achievers_cefr.png")
            
            unoImg.image = UIImage(named: "richmondspiral.png")
            dosImg.image = UIImage(named: "levels4.png")
            tresImg.image = UIImage(named: "hours5.png")
            cuatroImg.image = UIImage(named: "digital_book.png")
            cincoImg.image = UIImage(named: "audio.png")
            seisImg.image = UIImage(named: "digital_resources.png")
            sieteImg.image = UIImage(named: "british.png")
            ochoImg.image = UIImage(named: "microsite.png")
            nueveImg.image = UIImage(named: "richmondsolution.png")
            
            unoBtn.isHidden = false
            dosBtn.isHidden = false
            tresBtn.isHidden = false
            cuatroBtn.isHidden = false
            cincoBtn.isHidden = false
            seisBtn.isHidden = false
            sieteBtn.isHidden = false
            ochoBtn.isHidden = false
            nueveBtn.isHidden = false
            
            self.txtComponents.text = "- Student’s Book \n \n- Workbook \n \n- Audio CD \n \n- Richmond Spiral Platform"
            imgDet1.isHidden = true
            imgDet2.isHidden = true
            imgDet3.isHidden = true
            self.txtDet1.isHidden = true
            self.txtDet2.isHidden = true
            self.txtDet3.isHidden = true
            self.txtComponentsTeachers.text = "- Teacher’s Book\n \n- Resource Book\n \n- Class CDs\n \n- Tests\n \n- Posters\n \n- Digital Book\n \n"
            self.txtMoreComponentsTeachers.isHidden = true
            
            let string = "Awesome NE Student’s Book\n    Level 1          9786070609701\n    Level 2          9786070609831\n    Level 3          9786070609855\n    Level 4          9786070609848\n\nPack Awesome NE (PB+RG)\n    Level 1          7506009840829\n    Level 2          7506009841086\n    Level 3          7506009841154\n    Level 4          7506009841161"
            
            let attributedString = NSMutableAttributedString(string: string as String, attributes: [NSFontAttributeName:UIFont.systemFont(ofSize: 14.0)])
            
            let boldFontAttribute = [NSFontAttributeName: UIFont.boldSystemFont(ofSize: 14.0)]
            
            // Part of string to be bold
            let str = NSString(string: string)
            
            let range1 = str.range(of:"Awesome NE Student’s Book")
            let range2 = str.range(of:"Pack Awesome NE (PB+RG)")
            
            attributedString.addAttributes(boldFontAttribute, range: range1)
            attributedString.addAttributes(boldFontAttribute, range: range2)
            
            let stringT = "Awesome NE Teacher’s Book\n    Level 1          9786070609909\n    Level 2          9786070609916\n    Level 3          9786070609923\n    Level 4          9786070609930\n\nAwesome NE Resource Book\n    Level 1          9786070609985\n    Level 2          9786070609992\n    Level 3          9786070610004\n    Level 4          9786070610011\n\nAwesome NE Teacher’s CD Pack (Class+Interactive)\n    Level 1          7506009841178\n    Level 2          7506009841185\n    Level 3          7506009841192\n    Level 4          7506009841208\n\nAwesome NE Poster\n    Level 1          7506009840782\n    Level 2          7506009840799\n    Level 3          7506009840805\n    Level 4          7506009840812\n\nAwesome NE Digital Book DVD\n    Level 1          9786070613067\n    Level 2          9786070613098\n    Level 3          9786070613128\n    Level 4          9786070613111"
            
            let attributedStringT = NSMutableAttributedString(string: stringT as String, attributes: [NSFontAttributeName:UIFont.systemFont(ofSize: 14.0)])
            
            // Part of string to be bold
            let strT = NSString(string: stringT)
            
            let rangeT1 = strT.range(of:"Awesome NE Teacher’s Book")
            let rangeT2 = strT.range(of:"Awesome NE Teacher’s CD Pack (Class+Interactive)")
            let rangeT3 = strT.range(of:"Awesome NE Poster")
            let rangeT4 = strT.range(of:"Awesome NE Digital Book DVD")
            
            attributedStringT.addAttributes(boldFontAttribute, range: rangeT1)
            attributedStringT.addAttributes(boldFontAttribute, range: rangeT2)
            attributedStringT.addAttributes(boldFontAttribute, range: rangeT3)
            attributedStringT.addAttributes(boldFontAttribute, range: rangeT4)
            
            self.txtISBNStudents.attributedText = attributedString
            self.txtISBNTeachers.isHidden = false
            self.txtISBNTeachers.attributedText = attributedStringT
            
        } else if viaSegueSerie == 29 {
            imgCEFR.image = UIImage(named: "combined_sciences_cefr.png")
            
            unoImg.image = UIImage(named: "richmondsolution.png")
            dosImg.image = UIImage(named: "levels3.png")
            tresImg.image = UIImage(named: "microsite.png")
            cuatroImg.image = UIImage(named: "digital_book.png")
            cincoImg.image = UIImage(named: "clil.png")
            seisImg.image = UIImage(named: "videos.png")
            sieteImg.image = UIImage(named: "ibook.png")
            ochoImg.image = UIImage(named: "american_english.png")
            
            unoBtn.isHidden = false
            dosBtn.isHidden = false
            tresBtn.isHidden = false
            cuatroBtn.isHidden = false
            cincoBtn.isHidden = false
            seisBtn.isHidden = false
            sieteBtn.isHidden = false
            ochoBtn.isHidden = false
            
            self.txtComponents.text = "- Student’s Book \n \n- Digital Book with Videos"
            imgDet1.isHidden = true
            imgDet2.isHidden = true
            imgDet3.isHidden = true
            self.txtDet1.isHidden = true
            self.txtDet2.isHidden = true
            self.txtDet3.isHidden = true
            self.txtComponentsTeachers.text = "- Online Teacher’s Guide and Videos\n \n"
            self.txtMoreComponentsTeachers.isHidden = true
            
            let string = "Pack Pathway to... (Sb+Digital Book)\n      Biology              7506009843349\n      Physics              7506009843356\n      Chemistry          7506009843363"
            
            let attributedString = NSMutableAttributedString(string: string as String, attributes: [NSFontAttributeName:UIFont.systemFont(ofSize: 14.0)])
            
            let boldFontAttribute = [NSFontAttributeName: UIFont.boldSystemFont(ofSize: 14.0)]
            
            // Part of string to be bold
            let str = NSString(string: string)
            
            let range1 = str.range(of:"Pack Pathway to... (Sb+Digital Book)")
            
            attributedString.addAttributes(boldFontAttribute, range: range1)
            
            self.txtISBNStudents.attributedText = attributedString
            
            self.txtISBNTeachers.isHidden = true
            self.txtTitleISBNTeachers.isHidden = true
            
        } else if viaSegueSerie == 25 {
            imgCEFR.image = UIImage(named: "english_in_motion_cefr.png")
            
            unoImg.image = UIImage(named: "richmondsolution.png")
            dosImg.image = UIImage(named: "levels4.png")
            tresImg.image = UIImage(named: "hours3_5.png")
            cuatroImg.image = UIImage(named: "digital_book.png")
            cincoImg.image = UIImage(named: "audio.png")
            seisImg.image = UIImage(named: "dvd.png")
            sieteImg.image = UIImage(named: "clil.png")
            ochoImg.image = UIImage(named: "microsite.png")
            nueveImg.image = UIImage(named: "british.png")
            diezImg.image = UIImage(named: "videos.png")
            
            unoBtn.isHidden = false
            dosBtn.isHidden = false
            tresBtn.isHidden = false
            cuatroBtn.isHidden = false
            cincoBtn.isHidden = false
            seisBtn.isHidden = false
            sieteBtn.isHidden = false
            ochoBtn.isHidden = false
            nueveBtn.isHidden = false
            diezBtn.isHidden = false
            
            self.txtComponents.text = "- Student’s Book\n \n- Workbook\n \n- Student’s Multi-ROM\n \n- My Portfolio downloadable online"
            imgDet1.isHidden = true
            imgDet2.isHidden = true
            imgDet3.isHidden = true
            self.txtDet1.isHidden = true
            self.txtDet2.isHidden = true
            self.txtDet3.isHidden = true
            self.txtComponentsTeachers.text = "- Teacher’s Book\n \n- Class CDs\n \n- Teacher’s all-in-one Book \n\n - Tests Book\n \n- Test CD\n \n- DVD\n \n- Digital Book\n \n- Website\n \n"
            self.txtMoreComponentsTeachers.isHidden = true
            
            let string = "English In motion Students Book\n      Level 1          9788466810029\n      Level 2          9788466814928\n      Level 3          9788466815123\n      Level 4          9788466815147\n\nPack English In motion (Wb+M-ROM)\n      Level 1          7506009834149\n      Level 2          7506009834156\n      Level 3          7506009834163\n      Level 4          7506009834170"
            
            let attributedString = NSMutableAttributedString(string: string as String, attributes: [NSFontAttributeName:UIFont.systemFont(ofSize: 14.0)])
            
            let boldFontAttribute = [NSFontAttributeName: UIFont.boldSystemFont(ofSize: 14.0)]
            
            // Part of string to be bold
            let str = NSString(string: string)
            
            let range1 = str.range(of:"English In motion Students Book")
            let range2 = str.range(of:"Pack English In motion (Wb+M-ROM)")
            
            attributedString.addAttributes(boldFontAttribute, range: range1)
            attributedString.addAttributes(boldFontAttribute, range: range2)
            
            let stringT = "English In motion Teacher’s Book\n      Level 1          9788466808538\n      Level 2          9788466813594\n      Level 3          9788466813884\n      Level 4          9788466814072\n\nEnglish In motion Class CD\n      Level 1          8431300228733\n      Level 2          8431300228740\n      Level 3          8431300228757\n      Level 4          8431300228771\n\nPack English In motion (Test Book + CD Audio)\n      Level 1          7506009838833\n      Level 2          7506009838840\n      Level 3          7506009838857\n      Level 4          7506009838864\n\nEnglish In motion Test Pack+CD\n      Level 1          7506009838833\n      Level 2          7506009838840\n      Level 3          7506009838857\n      Level 4          7506009838864\n\nEnglish In motion DVD\n      Level 1          8431300228788\n      Level 2          8431300228801\n      Level 3          8431300228818\n      Level 4          8431300228825\n\nEnglish In motion Digital CD-ROM\n      Level 1          8431300230415\n      Level 2          8431300230422\n      Level 3          8431300230439\n      Level 4          8431300230446\n\nEnglish In motion All-In-One Resource Book\n      Level 1          9788466812856\n      Level 2          9788466813624\n      Level 3          9788466814041\n      Level 4          9788466814102"
            
            let attributedStringT = NSMutableAttributedString(string: stringT as String, attributes: [NSFontAttributeName:UIFont.systemFont(ofSize: 14.0)])
            
            // Part of string to be bold
            let strT = NSString(string: stringT)
            
            let rangeT1 = strT.range(of:"English In motion Teacher’s Book")
            let rangeT2 = strT.range(of:"English In motion Class CD")
            let rangeT3 = strT.range(of:"Pack English In motion (Test Book + CD Audio)")
            let rangeT4 = strT.range(of:"English In motion Test Pack+CD")
            let rangeT5 = strT.range(of:"English In motion DVD")
            let rangeT6 = strT.range(of:"English In motion Digital CD-ROM")
            let rangeT7 = strT.range(of:"English In motion All-In-One Resource Book")
            
            attributedStringT.addAttributes(boldFontAttribute, range: rangeT1)
            attributedStringT.addAttributes(boldFontAttribute, range: rangeT2)
            attributedStringT.addAttributes(boldFontAttribute, range: rangeT3)
            attributedStringT.addAttributes(boldFontAttribute, range: rangeT4)
            attributedStringT.addAttributes(boldFontAttribute, range: rangeT5)
            attributedStringT.addAttributes(boldFontAttribute, range: rangeT6)
            attributedStringT.addAttributes(boldFontAttribute, range: rangeT7)
            
            self.txtISBNStudents.attributedText = attributedString
            self.txtISBNTeachers.isHidden = false
            self.txtISBNTeachers.attributedText = attributedStringT
            
        } else if viaSegueSerie == 24 {
            imgCEFR.image = UIImage(named: "next_step_cefr.png")
            
            unoImg.image = UIImage(named: "american_english.png")
            dosImg.image = UIImage(named: "levels4.png")
            tresImg.image = UIImage(named: "hours3_5.png")
            cuatroImg.image = UIImage(named: "digital_book.png")
            cincoImg.image = UIImage(named: "audio.png")
            seisImg.image = UIImage(named: "digital_resources.png")
            sieteImg.image = UIImage(named: "richmondsolution.png")
            
            unoBtn.isHidden = false
            dosBtn.isHidden = false
            tresBtn.isHidden = false
            cuatroBtn.isHidden = false
            cincoBtn.isHidden = false
            seisBtn.isHidden = false
            sieteBtn.isHidden = false
            
            self.txtComponents.text = "- Student’s Book \n \n- Practice Book \n \n- CD-ROM"
            imgDet1.isHidden = true
            imgDet2.isHidden = true
            imgDet3.isHidden = true
            self.txtDet1.isHidden = true
            self.txtDet2.isHidden = true
            self.txtDet3.isHidden = true
            self.txtComponentsTeachers.text = "- Teacher’s Book\n \n- Class CDs &amp; Tests\n \n- Tests (can be downloaded and adapted)\n \n- Posters\n\n - Digital Book\n \n"
            self.txtMoreComponentsTeachers.isHidden = true
            
            let string = "Pack Next Step (SB+CD-ROM)\n      Level 1          7506009831179\n      Level 2          7506009831186\n      Level 3          7506009831193\n      Level 4          7506009831353\n\nNext Step Practice Book\n      Level 1          9786070604164\n      Level 2          9786070604171\n      Level 3          9786070604188\n      Level 4          9786070604195"
            
            let attributedString = NSMutableAttributedString(string: string as String, attributes: [NSFontAttributeName:UIFont.systemFont(ofSize: 14.0)])
            
            let boldFontAttribute = [NSFontAttributeName: UIFont.boldSystemFont(ofSize: 14.0)]
            
            // Part of string to be bold
            let str = NSString(string: string)
            
            let range1 = str.range(of:"Pack Next Step (SB+CD-ROM)")
            let range2 = str.range(of:"Next Step Practice Book")
            
            attributedString.addAttributes(boldFontAttribute, range: range1)
            attributedString.addAttributes(boldFontAttribute, range: range2)
            
            let stringT = "Next Step Teacher’s Book\n      Level 1          9786070604201\n      Level 2          9786070604218\n      Level 3          9786070604225\n      Level 4          9786070604232\n\nNext Step Posters\n      Level 1          7506009808454\n      Level 2          7506009808461\n      Level 3          7506009808478\n      Level 4          7506009831032\n\nNext Step Teacher’s CD Pack\n      Level 1          7506009809185\n      Level 2          7506009809192\n      Level 3          7506009809208\n      Level 4          7506009809215"
            
            let attributedStringT = NSMutableAttributedString(string: stringT as String, attributes: [NSFontAttributeName:UIFont.systemFont(ofSize: 14.0)])
            
            // Part of string to be bold
            let strT = NSString(string: stringT)
            
            let rangeT1 = strT.range(of:"Next Step Teacher’s Book")
            let rangeT2 = strT.range(of:"Next Step Posters")
            let rangeT3 = strT.range(of:"Next Step Teacher’s CD Pack")
            
            attributedStringT.addAttributes(boldFontAttribute, range: rangeT1)
            attributedStringT.addAttributes(boldFontAttribute, range: rangeT2)
            attributedStringT.addAttributes(boldFontAttribute, range: rangeT3)
            
            self.txtISBNStudents.attributedText = attributedString
            self.txtISBNTeachers.isHidden = false
            self.txtISBNTeachers.attributedText = attributedStringT
            
        } else if viaSegueSerie == 28 {
            imgCEFR.image = UIImage(named: "spotlight_on_literature_new_edition_cefr.png")
            
            unoImg.image = UIImage(named: "american_english.png")
            dosImg.image = UIImage(named: "levels6.png")
            tresImg.image = UIImage(named: "digital_resources.png")
            
            unoBtn.isHidden = false
            dosBtn.isHidden = false
            tresBtn.isHidden = false
            
            self.txtComponents.text = "- Student’s Book (with integrated workbook)"
            imgDet1.isHidden = true
            imgDet2.isHidden = true
            imgDet3.isHidden = true
            self.txtDet1.isHidden = true
            self.txtDet2.isHidden = true
            self.txtDet3.isHidden = true
            self.txtComponentsTeachers.text = "- Teacher’s Guide \n \n- Teacher’s CD-ROM\n \n"
            self.txtMoreComponentsTeachers.isHidden = true
            
            let string = "Spotlight On Literature Student’s Book NE\n    Level A          9786070607943\n    Level B          9786070607950\n    Level C          9786070607967\n    Level D          9786070607974\n    Level E          9786070607981\n    Level F          9786070607998\n"
            
            let attributedString = NSMutableAttributedString(string: string as String, attributes: [NSFontAttributeName:UIFont.systemFont(ofSize: 14.0)])
            
            let boldFontAttribute = [NSFontAttributeName: UIFont.boldSystemFont(ofSize: 14.0)]
            
            // Part of string to be bold
            let str = NSString(string: string)
            
            let range1 = str.range(of:"Spotlight On Literature Student’s Book NE")
            
            attributedString.addAttributes(boldFontAttribute, range: range1)
            
            let stringT = "Pack Spotlight On Literature (Tch+CD-ROM) NE\n    Level A          7506009838161\n    Level B          7506009838178\n    Level C          7506009838185\n    Level D          7506009838192\n    Level E          7506009838208\n    Level F          7506009838215"
            
            let attributedStringT = NSMutableAttributedString(string: stringT as String, attributes: [NSFontAttributeName:UIFont.systemFont(ofSize: 14.0)])
            
            // Part of string to be bold
            let strT = NSString(string: stringT)
            
            let rangeT1 = strT.range(of:"Pack Spotlight On Literature (Tch+CD-ROM) NE")
            
            attributedStringT.addAttributes(boldFontAttribute, range: rangeT1)
            
            self.txtISBNStudents.attributedText = attributedString
            self.txtISBNTeachers.isHidden = false
            self.txtISBNTeachers.attributedText = attributedStringT
            
            
        } else if viaSegueSerie == 23 {
            imgCEFR.image = UIImage(named: "stopwatch_cefr.png")
            
            unoImg.image = UIImage(named: "app.png")
            dosImg.image = UIImage(named: "levels6.png")
            tresImg.image = UIImage(named: "hours3_5.png")
            cuatroImg.image = UIImage(named: "digital_book.png")
            cincoImg.image = UIImage(named: "american_english.png")
            
            unoBtn.isHidden = false
            dosBtn.isHidden = false
            tresBtn.isHidden = false
            cuatroBtn.isHidden = false
            cincoBtn.isHidden = false
            
            self.txtComponents.text = "- Student’s Book with integrated Workbook and Audio CD\n\n- App"
            imgDet1.image = UIImage(named: "secundariastopwatchs1.png")
            imgDet2.image = UIImage(named: "secundariastopwatchs2.png")
            imgDet3.isHidden = true
            self.txtDet1.text = "New pages that introduce the vocabulary of each unit! " +
            "Attractive texts that help students develop their reading skills!"
            self.txtDet2.text = "Activities to help students develop listening and speaking skills! " +
            "Writing activities that take students step by step to create different pieces of writing!"
            self.txtDet3.isHidden = true
            self.txtComponentsTeachers.text = "- Teacher’s Guide\n \n- Teacher’s Toolkit (CD):\n    - Class audio\n    - Exams and exam audio\n    - Additional readings with activities\n    - Grammar worksheets\n    - Vocabulary worksheets\n \n- Digital Book\n \n- App\n \n"
            self.txtMoreComponentsTeachers.isHidden = true
            self.txtISBNStudents.isHidden = false
            
            let string = "Pack Stopwatch (SB&WB+CD)\n    Level 1          7506009844360\n    Level 2          7506009844377\n    Level 3          7506009844384\n    Level 4          7506009845305\n    Level 5          7506009845312\n    Level 6          7506009845329"
            
            let attributedString = NSMutableAttributedString(string: string as String, attributes: [NSFontAttributeName:UIFont.systemFont(ofSize: 14.0)])
            
            let boldFontAttribute = [NSFontAttributeName: UIFont.boldSystemFont(ofSize: 14.0)]
            
            // Part of string to be bold
            let str = NSString(string: string)
            
            let range1 = str.range(of:"Pack Stopwatch (SB&WB+CD)")
            
            attributedString.addAttributes(boldFontAttribute, range: range1)
            
            let stringT = "Pack Stopwatch (TCH+TOOLKIT CD+DB)\n    Level 1          7506009845213\n    Level 2          7506009845220\n    Level 3          7506009845237\n    Level 4          7506009846111\n    Level 5          7506009846128\n    Level 6          7506009846135"
            
            let attributedStringT = NSMutableAttributedString(string: stringT as String, attributes: [NSFontAttributeName:UIFont.systemFont(ofSize: 14.0)])
            
            // Part of string to be bold
            let strT = NSString(string: stringT)
            
            let rangeT1 = strT.range(of:"Pack Stopwatch (TCH+TOOLKIT CD+DB)")
            
            attributedStringT.addAttributes(boldFontAttribute, range: rangeT1)
            
            self.txtISBNStudents.attributedText = attributedString
            self.txtISBNTeachers.isHidden = false
            self.txtISBNTeachers.attributedText = attributedStringT
            
        } else if viaSegueSerie == 32 {
            imgCEFR.image = UIImage(named: "american_big_picture_cefr.png")
            
            unoImg.image = UIImage(named: "richmondlearning.png")
            dosImg.image = UIImage(named: "levels6.png")
            tresImg.image = UIImage(named: "hours90_120.png")
            cuatroImg.image = UIImage(named: "app.png")
            cincoImg.image = UIImage(named: "digital_book.png")
            seisImg.image = UIImage(named: "audio.png")
            sieteImg.image = UIImage(named: "digital_resources.png")
            ochoImg.image = UIImage(named: "american_english.png")
            nueveImg.image = UIImage(named: "videos.png")
            
            unoBtn.isHidden = false
            dosBtn.isHidden = false
            tresBtn.isHidden = false
            cuatroBtn.isHidden = false
            cincoBtn.isHidden = false
            seisBtn.isHidden = false
            sieteBtn.isHidden = false
            ochoBtn.isHidden = false
            nueveBtn.isHidden = false
            
            self.txtComponents.text = "- Student’s Book\n \n- Workbook\n \n- Audio CD\n \n- Downloadable audio online\n \n- Split Edition Available\n \n- Interactive online activities\n \n- Learning Platform"
            imgDet1.isHidden = true
            imgDet2.isHidden = true
            imgDet3.isHidden = true
            self.txtDet1.isHidden = true
            self.txtDet2.isHidden = true
            self.txtDet3.isHidden = true
            self.txtComponentsTeachers.text = "- Teacher’s Book\n \n- Class Audio CD\n \n- Digital Book\n \n- Test Studio\n \n- Online videos and author interviews\n \n- Learning Platform\n \n"
            self.txtMoreComponentsTeachers.isHidden = true
            
            let string = "American Big Picture Student’s Book\n      A1          9786070608704\n      A2          9786070605697\n      B1          9786070605772\n      B1+         9786070607066\n      B2          9786070607561\n      C1          9786070608728\n\nPack American Big Picture (Wb + CD)\n      A1          7506009834965\n      A2          7506009834972\n      B1          7506009834989\n      B1+         7506009834996\n      B2          7506009835009\n      C1          7506009835016"
            
            let attributedString = NSMutableAttributedString(string: string as String, attributes: [NSFontAttributeName:UIFont.systemFont(ofSize: 14.0)])
            
            let boldFontAttribute = [NSFontAttributeName: UIFont.boldSystemFont(ofSize: 14.0)]
            
            // Part of string to be bold
            let str = NSString(string: string)
            
            let range1 = str.range(of:"American Big Picture Student’s Book")
            let range2 = str.range(of:"Pack American Big Picture (Wb + CD)")
            
            attributedString.addAttributes(boldFontAttribute, range: range1)
            attributedString.addAttributes(boldFontAttribute, range: range2)
            
            let stringT = "Pack American Big Picture (Tch + CD)\n      A1          7506009835436\n      A2          7506009835443\n      B1          7506009835450\n      B1+         7506009835467\n      B2          7506009835474\n      C1          7506009835481\n\nAmerican Big Picture Digital Book CD-ROM\n      A1          9786070608742\n      A2          9786070607059\n      B1          9786070607356\n      B1+         9786070607363\n      B2          9786070608124\n      C1          9786070608759"
            
            let attributedStringT = NSMutableAttributedString(string: stringT as String, attributes: [NSFontAttributeName:UIFont.systemFont(ofSize: 14.0)])
            
            // Part of string to be bold
            let strT = NSString(string: stringT)
            
            let rangeT1 = strT.range(of:"Pack American Big Picture (Tch + CD)")
            let rangeT2 = strT.range(of:"American Big Picture Digital Book CD-ROM")
            
            attributedStringT.addAttributes(boldFontAttribute, range: rangeT1)
            attributedStringT.addAttributes(boldFontAttribute, range: rangeT2)
            
            self.txtISBNStudents.attributedText = attributedString
            self.txtISBNTeachers.isHidden = false
            self.txtISBNTeachers.attributedText = attributedStringT
            
        } else if viaSegueSerie == 34 {
            imgCEFR.image = UIImage(named: "a_work_cefr.png")
            
            unoImg.image = UIImage(named: "american_english.png")
            dosImg.image = UIImage(named: "levels4.png")
            tresImg.image = UIImage(named: "hours90_120.png")
            cuatroImg.image = UIImage(named: "videos.png")
            cincoImg.image = UIImage(named: "british.png")
            seisImg.image = UIImage(named: "digital_resources.png")
            sieteImg.image = UIImage(named: "audio.png")
            ochoImg.image = UIImage(named: "digital_book.png")
            nueveImg.image = UIImage(named: "richmondlearning.png")
            
            unoBtn.isHidden = false
            dosBtn.isHidden = false
            tresBtn.isHidden = false
            cuatroBtn.isHidden = false
            cincoBtn.isHidden = false
            seisBtn.isHidden = false
            sieteBtn.isHidden = false
            ochoBtn.isHidden = false
            nueveBtn.isHidden = false
            
            self.txtComponents.text = "- Student’s Book with access code\n \n- Workbook \n \n- Audio CD \n \n- eWorkbook"
            imgDet1.isHidden = true
            imgDet2.isHidden = true
            imgDet3.isHidden = true
            self.txtDet1.isHidden = true
            self.txtDet2.isHidden = true
            self.txtDet3.isHidden = true
            self.txtComponentsTeachers.text = "- Teacher’s Book \n \n- Class Audio CD \n \n- Learning Platform \n \n- Digital book for IWB\n \n"
            self.txtMoreComponentsTeachers.isHidden = true
            
            let string = "Student’s Book\n   Elementary                        9788466813570\n   Pre-intermediate              9788466813631\n   Intermediate                      9788466814058\n   Upper-intermediate          9788466814119\n\nPack @work Workbook\n   Elementary                      7506009838888\n   Pre-intermediate                7506009841420\n   Intermediate                      7506009839632\n   Upper-intermediate          7506009841444\n\n@Work Digital Workbook\n   Elementary          8431300228429\n   Pre-intermediate          8431300228450\n   Intermediate          8431300228481\n   Upper-intermediate          8431300228511"
            
            let attributedString = NSMutableAttributedString(string: string as String, attributes: [NSFontAttributeName:UIFont.systemFont(ofSize: 14.0)])
            
            let boldFontAttribute = [NSFontAttributeName: UIFont.boldSystemFont(ofSize: 14.0)]
            
            // Part of string to be bold
            let str = NSString(string: string)
            
            let range1 = str.range(of:"Student’s Book")
            let range2 = str.range(of:"Pack @work Workbook")
            let range3 = str.range(of:"@Work Digital Workbook")
            
            attributedString.addAttributes(boldFontAttribute, range: range1)
            attributedString.addAttributes(boldFontAttribute, range: range2)
            attributedString.addAttributes(boldFontAttribute, range: range3)
            
            let stringT = "Teacher’s Book\n   Elementary          9788466813600\n   Pre-intermediate          9788466814027\n   Intermediate          9788466814089\n   Upper-intermediate          9788466814157\n\nClass Audio CD\n   Elementary          8431300228405\n   Pre-intermediate          8431300228436\n   Intermediate          8431300228467\n   Upper-intermediate          8431300228498\n\n@Work Digital Book\n   Elementary          8431300228412\n   Pre-intermediate          8431300228443\n   Intermediate          8431300228474\n   Upper-intermediate          8431300228504"
            
            let attributedStringT = NSMutableAttributedString(string: stringT as String, attributes: [NSFontAttributeName:UIFont.systemFont(ofSize: 14.0)])
            
            // Part of string to be bold
            let strT = NSString(string: stringT)
            
            let rangeT1 = strT.range(of:"Teacher’s Book")
            let rangeT2 = strT.range(of:"Class Audio CD")
            let rangeT3 = strT.range(of:"@Work Digital Book")
            
            attributedStringT.addAttributes(boldFontAttribute, range: rangeT1)
            attributedStringT.addAttributes(boldFontAttribute, range: rangeT2)
            attributedStringT.addAttributes(boldFontAttribute, range: rangeT3)
            
            self.txtISBNStudents.attributedText = attributedString
            self.txtISBNTeachers.isHidden = false
            self.txtISBNTeachers.attributedText = attributedStringT
            
        } else if viaSegueSerie == 30 {
            imgCEFR.image = UIImage(named: "english_id_cefr.png")
            
            unoImg.image = UIImage(named: "american_english.png")
            dosImg.image = UIImage(named: "levels4.png")
            tresImg.image = UIImage(named: "hours80_120.png")
            cuatroImg.image = UIImage(named: "dvd.png")
            cincoImg.image = UIImage(named: "british.png")
            seisImg.image = UIImage(named: "videos.png")
            sieteImg.image = UIImage(named: "digital_book.png")
            ochoImg.image = UIImage(named: "audio.png")
            nueveImg.image = UIImage(named: "digital_resources.png")
            diezImg.image = UIImage(named: "richmondlearning.png")

            
            unoBtn.isHidden = false
            dosBtn.isHidden = false
            tresBtn.isHidden = false
            cuatroBtn.isHidden = false
            cincoBtn.isHidden = false
            seisBtn.isHidden = false
            sieteBtn.isHidden = false
            ochoBtn.isHidden = false
            nueveBtn.isHidden = false
            diezBtn.isHidden = false
            
            self.txtComponents.text = "- Student’s Book (with portal access code)\n \n- eWorkbook\n \n- Split editions (except for Starter)\n \n- Learning Platform extra practice, audio and video"
            imgDet1.isHidden = true
            imgDet2.isHidden = true
            imgDet3.isHidden = true
            self.txtDet1.isHidden = true
            self.txtDet2.isHidden = true
            self.txtDet3.isHidden = true
            self.txtComponentsTeachers.text = "- Teacher’s Book \n \n- Class CD\n \n- DVD (ID Café) \n \n- Digital Book\n \n- Learning Platform with a full range of digital resources\n \n"
            self.txtMoreComponentsTeachers.isHidden = true
            
            let string = "English ID Starter Student's & Workbook\n      Starter          9786070607776\n      Level 1          N/A\n      Level 2          N/A\n      Level 3          N/A\n\nEnglish ID Student’s Book\n      Starter          N/A\n      Level 1          9786070607615\n      Level 2          9786070607639\n      Level 3          9786070607653\n\nEnglish ID Workbook\n      Starter          N/A\n      Level 1          9786070607622\n      Level 2          9786070607646\n      Level 3          9786070607660"
            
            let attributedString = NSMutableAttributedString(string: string as String, attributes: [NSFontAttributeName:UIFont.systemFont(ofSize: 14.0)])
            
            let boldFontAttribute = [NSFontAttributeName: UIFont.boldSystemFont(ofSize: 14.0)]
            
            // Part of string to be bold
            let str = NSString(string: string)
            
            let range1 = str.range(of:"English ID Starter Student's & Workbook")
            let range2 = str.range(of:"English ID Student’s Book")
            let range3 = str.range(of:"English ID Workbook")
            
            attributedString.addAttributes(boldFontAttribute, range: range1)
            attributedString.addAttributes(boldFontAttribute, range: range2)
            attributedString.addAttributes(boldFontAttribute, range: range3)
            
            let stringT = "English ID Teacher’s Book\n      Starter          9786070607714\n      Level 1          9786070607752\n      Level 2          9786070607721\n      Level 3          9786070607738\n\nEnglish ID Class CD\n      Starter          7506009836716\n      Level 1          7506009836730\n      Level 2          7506009839137\n      Level 3          7506009839076\n\nEnglish ID DVD\n      Starter          7506009836723\n      Level 1          7506009836747\n      Level 2          7506009836761\n      Level 3          7506009836785\n\nEnglish ID Digital Book CD-ROM\n      Starter          9786070607899\n      Level 1          9786070607882\n      Level 2          9786070607905\n      Level 3          9786070607912"
            
            let attributedStringT = NSMutableAttributedString(string: stringT as String, attributes: [NSFontAttributeName:UIFont.systemFont(ofSize: 14.0)])
            
            // Part of string to be bold
            let strT = NSString(string: stringT)
            
            let rangeT1 = strT.range(of:"English ID Teacher’s Book")
            let rangeT2 = strT.range(of:"English ID Class CD")
            let rangeT3 = strT.range(of:"English ID DVD")
            let rangeT4 = strT.range(of:"English ID Digital Book CD-ROM")
            
            attributedStringT.addAttributes(boldFontAttribute, range: rangeT1)
            attributedStringT.addAttributes(boldFontAttribute, range: rangeT2)
            attributedStringT.addAttributes(boldFontAttribute, range: rangeT3)
            attributedStringT.addAttributes(boldFontAttribute, range: rangeT4)
            
            self.txtISBNStudents.attributedText = attributedString
            self.txtISBNTeachers.isHidden = false
            self.txtISBNTeachers.attributedText = attributedStringT
            
        } else if viaSegueSerie == 36 {
            imgCEFR.image = UIImage(named: "going_pro_cefr.png")
            
            unoImg.image = UIImage(named: "american_english.png")
            dosImg.image = UIImage(named: "levels6.png")
            tresImg.image = UIImage(named: "hours90_120.png")
            cuatroImg.image = UIImage(named: "dvd.png")
            cincoImg.image = UIImage(named: "videos.png")
            seisImg.image = UIImage(named: "audio.png")
            sieteImg.image = UIImage(named: "digital_book.png")
            
            unoBtn.isHidden = false
            dosBtn.isHidden = false
            tresBtn.isHidden = false
            cuatroBtn.isHidden = false
            cincoBtn.isHidden = false
            seisBtn.isHidden = false
            sieteBtn.isHidden = false
            
            self.txtComponents.text = "- Student’s Book \n \n- Student’s Audio CD\n \n"
            imgDet1.image = UIImage(named: "adultsgoingpros1.png")
            imgDet2.image = UIImage(named: "adultsgoingpros2.png")
            imgDet3.isHidden = true
            self.txtDet1.text = "Each block begins with an exciting opener including a separate fold-out spread in which students explore, discuss and solve a mystery or puzzle. Subsequent lessons cover listening and speaking activities thematically connected to the opener, followed by communicative grammar and vocabulary work and reading strategies."
            self.txtDet2.text = "Case studies to promote critical thinking. Reading and writing Tips in every block, students will find boxes with explanations and practical suggestions on how to become better readers and/or writers."
            self.txtDet3.isHidden = true
            self.txtComponentsTeachers.text = "- Teacher’s Guide\n \n- Teacher’s Resource CD\n \n- DVD\n \n- Digital Book\n \n"
            self.txtMoreComponentsTeachers.isHidden = true
            
            let string = "Pack Going Pro (SB+CD)\n   Level 1          7506009840188\n   Level 2          7506009839052\n   Level 3          7506009840201\n   Level 4         7506009839069\n   Level 5          7506009842069\n   Level 6          7506009842465"
            
            let attributedString = NSMutableAttributedString(string: string as String, attributes: [NSFontAttributeName:UIFont.systemFont(ofSize: 14.0)])
            
            let boldFontAttribute = [NSFontAttributeName: UIFont.boldSystemFont(ofSize: 14.0)]
            
            // Part of string to be bold
            let str = NSString(string: string)
            
            let range1 = str.range(of:"Pack Going Pro (SB+CD)")
            
            attributedString.addAttributes(boldFontAttribute, range: range1)
            
            let stringT = "Pack Going Pro (TB+TRCD+DVD)\n   Level 1          7506009843165\n   Level 2          7506009843172\n   Level 3          7506009843189\n   Level 4         7506009843196\n   Level 5          7506009843141\n   Level 6          7506009843295\n\nGoing Pro Digital Book CD\n   Level 1          9786070611520\n   Level 2          9786070611537\n   Level 3          9786070611544\n   Level 4         9786070611551\n   Level 5          9786070611568\n   Level 6          9786070611575"
            
            let attributedStringT = NSMutableAttributedString(string: stringT as String, attributes: [NSFontAttributeName:UIFont.systemFont(ofSize: 14.0)])
            
            // Part of string to be bold
            let strT = NSString(string: stringT)
            
            let rangeT1 = strT.range(of:"Pack Going Pro (TB+TRCD+DVD)")
            let rangeT2 = strT.range(of:"Going Pro Digital Book CD")
            
            attributedStringT.addAttributes(boldFontAttribute, range: rangeT1)
            attributedStringT.addAttributes(boldFontAttribute, range: rangeT2)
            
            self.txtISBNStudents.attributedText = attributedString
            self.txtISBNTeachers.isHidden = false
            self.txtISBNTeachers.attributedText = attributedStringT
            
        } else if viaSegueSerie == 31 {
            imgCEFR.image = UIImage(named: "identities_cefr.png")
            
            unoImg.image = UIImage(named: "american_english.png")
            dosImg.image = UIImage(named: "levels2.png")
            tresImg.image = UIImage(named: "hours90_120.png")
            cuatroImg.image = UIImage(named: "dvd.png")
            cincoImg.image = UIImage(named: "videos.png")
            seisImg.image = UIImage(named: "digital_book.png")
            sieteImg.image = UIImage(named: "digital_resources.png")
            ochoImg.image = UIImage(named: "audio.png")
            nueveImg.image = UIImage(named: "richmondlearning.png")
            
            unoBtn.isHidden = false
            dosBtn.isHidden = false
            tresBtn.isHidden = false
            cuatroBtn.isHidden = false
            cincoBtn.isHidden = false
            seisBtn.isHidden = false
            sieteBtn.isHidden = false
            ochoBtn.isHidden = false
            nueveBtn.isHidden = false
            
            self.txtComponents.text = "- Student’s Book (with portal access code)\n \n- eWorkbook\n \n- Split editions (except for Starter)\n \n- Learning Platform"
            imgDet1.isHidden = true
            imgDet2.isHidden = true
            imgDet3.isHidden = true
            self.txtDet1.isHidden = true
            self.txtDet2.isHidden = true
            self.txtDet3.isHidden = true
            self.txtComponentsTeachers.text = "- Teacher’s Book \n \n- Class CD\n \n- DVD \n \n- Digital Book\n \n- Learning Platform with a full range of digital resources\n \n"
            
            self.txtMoreComponentsTeachers.isHidden = true
            
            let string = "iDentities Student’s Book\n    Level 1          978846682083\n    Level 2          *TBA\n\niDentities Workbook\n    Level 1          9788466820851\n    Level 2          *TBA"
            
            let attributedString = NSMutableAttributedString(string: string as String, attributes: [NSFontAttributeName:UIFont.systemFont(ofSize: 14.0)])
            
            let boldFontAttribute = [NSFontAttributeName: UIFont.boldSystemFont(ofSize: 14.0)]
            
            // Part of string to be bold
            let str = NSString(string: string)
            
            let range1 = str.range(of:"iDentities Student’s Book")
            let range2 = str.range(of:"iDentities Workbook")
            
            attributedString.addAttributes(boldFontAttribute, range: range1)
            attributedString.addAttributes(boldFontAttribute, range: range2)
            
            let stringT = "iDentities Teacher’s Book\n    Level 1          9788466820844\n    Level 2          *TBA\n\niDentities Class CD\n    Level 1          9788466820806\n    Level 2          *TBA"
            
            let attributedStringT = NSMutableAttributedString(string: stringT as String, attributes: [NSFontAttributeName:UIFont.systemFont(ofSize: 14.0)])
            
            // Part of string to be bold
            let strT = NSString(string: stringT)
            
            let rangeT1 = strT.range(of:"iDentities Teacher’s Book")
            let rangeT2 = strT.range(of:"iDentities Class CD")
            
            attributedStringT.addAttributes(boldFontAttribute, range: rangeT1)
            attributedStringT.addAttributes(boldFontAttribute, range: rangeT2)
            
            self.txtISBNStudents.attributedText = attributedString
            self.txtISBNTeachers.isHidden = false
            self.txtISBNTeachers.attributedText = attributedStringT
            
        } else if viaSegueSerie == 58 {
            
            unoImg.image = UIImage(named: "exam_friendly.png")
            dosImg.image = UIImage(named: "audio.png")
            tresImg.image = UIImage(named: "digital_resources.png")
            cuatroImg.image = UIImage(named: "american_english.png")
            cincoImg.image = UIImage(named: "richmondlearning.png")
            
            unoBtn.isHidden = false
            dosBtn.isHidden = false
            tresBtn.isHidden = false
            cuatroBtn.isHidden = false
            cincoBtn.isHidden = false
            
            self.txtComponents.text = "- Student’s Book (with portal access code)\n \n- eWorkbook\n \n- Split editions (except for Starter)\n \n- Learning Platform extra practice, audio and video"
            imgDet1.isHidden = true
            imgDet2.isHidden = true
            imgDet3.isHidden = true
            self.txtDet1.isHidden = true
            self.txtDet2.isHidden = true
            self.txtDet3.isHidden = true
            self.txtComponentsTeachers.text = "- Teacher’s Book \n \n- Class CD\n \n- DVD (ID Café) \n \n- Digital Book\n \n- Learning Platform with a full range of digital resources\n \n"
            self.txtMoreComponentsTeachers.isHidden = true
            
            let string = "Essential Grammar for the iBT\n    7506009841765\n\nSEVEN Practice Tests - Revised Edition\n    9788466820851\n\nAdvanced Skill Practice - Revised Edition\n    7506009841758"
            
            let attributedString = NSMutableAttributedString(string: string as String, attributes: [NSFontAttributeName:UIFont.systemFont(ofSize: 14.0)])
            
            let boldFontAttribute = [NSFontAttributeName: UIFont.boldSystemFont(ofSize: 14.0)]
            
            // Part of string to be bold
            let str = NSString(string: string)
            
            let range1 = str.range(of:"Essential Grammar for the iBT")
            let range2 = str.range(of:"SEVEN Practice Tests - Revised Edition")
            let range3 = str.range(of:"Advanced Skill Practice - Revised Edition")
            
            attributedString.addAttributes(boldFontAttribute, range: range1)
            attributedString.addAttributes(boldFontAttribute, range: range2)
            attributedString.addAttributes(boldFontAttribute, range: range3)
            
            self.txtISBNStudents.attributedText = attributedString
            self.txtISBNTeachers.isHidden = true
            self.txtTitleISBNTeachers.isHidden = true
            
        } else if viaSegueSerie == 65 {
            imgCEFR.image = UIImage(named: "business_skills_cefr.png")
            
            unoImg.image = UIImage(named: "videos.png")
            dosImg.image = UIImage(named: "digital_resources.png")
            tresImg.image = UIImage(named: "learning.png")
            cuatroImg.image = UIImage(named: "british.png")
            cincoImg.image = UIImage(named: "levels2.png")
            seisImg.image = UIImage(named: "hours45.png")
            
            unoBtn.isHidden = false
            dosBtn.isHidden = false
            tresBtn.isHidden = false
            cuatroBtn.isHidden = false
            cincoBtn.isHidden = false
            seisBtn.isHidden = false
            
            self.txtComponents.text = "- Access to the Business Skills products\n \n- Student’s area with additional resources"
            imgDet1.isHidden = true
            imgDet2.isHidden = true
            imgDet3.isHidden = true
            self.txtDet1.isHidden = true
            self.txtDet2.isHidden = true
            self.txtDet3.isHidden = true
            self.txtComponentsTeachers.text = "- Teacher’s pack with class activities \n \n- Teacher’s area with additional resources"
            self.txtMoreComponentsTeachers.isHidden = true
            self.txtISBNStudents.isHidden = true
            self.txtISBNTeachers.isHidden = true
            
        } else if viaSegueSerie == 67 {
            imgCEFR.image = UIImage(named: "business_theories_cefr.png")
            
            unoImg.image = UIImage(named: "videos.png")
            dosImg.image = UIImage(named: "digital_resources.png")
            tresImg.image = UIImage(named: "british.png")
            cuatroImg.image = UIImage(named: "learning.png")
            cincoImg.image = UIImage(named: "hours35.png")
            
            unoBtn.isHidden = false
            dosBtn.isHidden = false
            tresBtn.isHidden = false
            cuatroBtn.isHidden = false
            cincoBtn.isHidden = false
            
            self.txtComponents.text = "- Access to the Business Skills products\n \n- Student’s area with additional resources"
            imgDet1.isHidden = true
            imgDet2.isHidden = true
            imgDet3.isHidden = true
            self.txtDet1.isHidden = true
            self.txtDet2.isHidden = true
            self.txtDet3.isHidden = true
            self.txtComponentsTeachers.text = "- Teacher’s pack with class activities \n \n- Teacher’s area with additional resources"
            self.txtMoreComponentsTeachers.isHidden = true
            self.txtISBNStudents.isHidden = true
            self.txtISBNTeachers.isHidden = true
            
        } else if viaSegueSerie == 39 {
            imgCEFR.image = UIImage(named: "visual_grammar_cefr.png")
            
            unoImg.image = UIImage(named: "digital_book.png")
            dosImg.image = UIImage(named: "app.png")
            tresImg.image = UIImage(named: "audio.png")
            cuatroImg.image = UIImage(named: "levels2.png")
            cincoImg.image = UIImage(named: "learning.png")
            
            unoBtn.isHidden = false
            dosBtn.isHidden = false
            tresBtn.isHidden = false
            cuatroBtn.isHidden = false
            cincoBtn.isHidden = false
            
            self.txtComponents.text = "- Student’s Book\n \n- Learning Platform\n \n- Downloadable MP3 Audios\n \n- App"
            imgDet1.isHidden = true
            imgDet2.isHidden = true
            imgDet3.isHidden = true
            self.txtDet1.isHidden = true
            self.txtDet2.isHidden = true
            self.txtDet3.isHidden = true
            self.txtComponentsTeachers.text = "- Digital Book\n\n- Website www.richmondvisualgrammar.com"
            self.txtMoreComponentsTeachers.isHidden = true
            
            let string = "Student’s Book with answers\n      Level A2          9788466815291\n      Level B1          9788466815291\n\nStudent’s Book without answers\n      Level A2          9788466815215\n      Level B1          9788466815246"
            
            let attributedString = NSMutableAttributedString(string: string as String, attributes: [NSFontAttributeName:UIFont.systemFont(ofSize: 14.0)])
            
            let boldFontAttribute = [NSFontAttributeName: UIFont.boldSystemFont(ofSize: 14.0)]
            
            // Part of string to be bold
            let str = NSString(string: string)
            
            let range1 = str.range(of:"Student’s Book with answers")
            let range2 = str.range(of:"Student’s Book without answers")
            
            attributedString.addAttributes(boldFontAttribute, range: range1)
            attributedString.addAttributes(boldFontAttribute, range: range2)
            
            self.txtISBNStudents.attributedText = attributedString
            self.txtISBNTeachers.isHidden = true
            self.txtTitleISBNTeachers.isHidden = true
            
        } else if viaSegueSerie == 40 {
            imgCEFR.image = UIImage(named: "vocabulary_builder_cefr.png")
            
            unoImg.image = UIImage(named: "audio.png")
            dosImg.image = UIImage(named: "british.png")
            tresImg.image = UIImage(named: "levels2.png")
            cuatroImg.image = UIImage(named: "learning.png")
            
            unoBtn.isHidden = false
            dosBtn.isHidden = false
            tresBtn.isHidden = false
            cuatroBtn.isHidden = false

            
            self.txtComponents.text = "- Student’s Book\n \n- Learning Platform www.richmondvocabularybuilder.com"
            imgDet1.isHidden = true
            imgDet2.isHidden = true
            imgDet3.isHidden = true
            self.txtDet1.isHidden = true
            self.txtDet2.isHidden = true
            self.txtDet3.isHidden = true
            self.txtComponentsTeachers.text = ""
            self.txtMoreComponentsTeachers.isHidden = true
            
            let string = "Student’s Book with answers\n      Level B1          9788466815277\n      Level B2          9788466815284\n\nStudent’s Book without answers\n      Level B1          9788466815260\n      Level B2          9788466815444"
            
            let attributedString = NSMutableAttributedString(string: string as String, attributes: [NSFontAttributeName:UIFont.systemFont(ofSize: 14.0)])
            
            let boldFontAttribute = [NSFontAttributeName: UIFont.boldSystemFont(ofSize: 14.0)]
            
            // Part of string to be bold
            let str = NSString(string: string)
            
            let range1 = str.range(of:"Student’s Book with answers")
            let range2 = str.range(of:"Student’s Book without answers")
            
            attributedString.addAttributes(boldFontAttribute, range: range1)
            attributedString.addAttributes(boldFontAttribute, range: range2)
            
            self.txtISBNStudents.attributedText = attributedString
            self.txtISBNTeachers.isHidden = true
            self.txtTitleISBNTeachers.isHidden = true
            
        } else if viaSegueSerie == 41 {
            imgCEFR.image = UIImage(named: "english_grammar_in_steps_cefr.png")
            
            unoImg.image = UIImage(named: "british.png")
            dosImg.image = UIImage(named: "levels2.png")
            
            unoBtn.isHidden = false
            dosBtn.isHidden = false

            self.txtComponents.text = ""
            imgDet1.isHidden = true
            imgDet2.isHidden = true
            imgDet3.isHidden = true
            self.txtDet1.isHidden = true
            self.txtDet2.isHidden = true
            self.txtDet3.isHidden = true
            self.txtComponentsTeachers.text = ""
            self.txtMoreComponentsTeachers.isHidden = true
            
            let string = "English Grammar in Steps with answers (New Edition)\n          9788466815284\n\nEnglish Grammar in Steps without answers (New Edition)\n          9788466817554\n\nEnglish Grammar in Steps Practice Book with answers (New Edition)\n          9788466817523\n\nEnglish Grammar in Steps Practice Book without answers (New Edition)\n          9788466817547"
            
            let attributedString = NSMutableAttributedString(string: string as String, attributes: [NSFontAttributeName:UIFont.systemFont(ofSize: 14.0)])
            
            let boldFontAttribute = [NSFontAttributeName: UIFont.boldSystemFont(ofSize: 14.0)]
            
            // Part of string to be bold
            let str = NSString(string: string)
            
            let range1 = str.range(of:"English Grammar in Steps with answers (New Edition)")
            let range2 = str.range(of:"English Grammar in Steps without answers (New Edition)")
            let range3 = str.range(of:"English Grammar in Steps Practice Book with answers (New Edition)")
            let range4 = str.range(of:"English Grammar in Steps Practice Book without answers (New Edition)")
            
            attributedString.addAttributes(boldFontAttribute, range: range1)
            attributedString.addAttributes(boldFontAttribute, range: range2)
            attributedString.addAttributes(boldFontAttribute, range: range3)
            attributedString.addAttributes(boldFontAttribute, range: range4)
            
            self.txtISBNStudents.attributedText = attributedString
            self.txtISBNTeachers.isHidden = true
            self.txtTitleISBNTeachers.isHidden = true
            
        } else if viaSegueSerie == 42 {
            unoImg.image = UIImage(named: "videos.png")
            dosImg.image = UIImage(named: "dvd.png")
            
            unoBtn.isHidden = false
            dosBtn.isHidden = false

            
            self.txtComponents.text = ""
            imgDet1.isHidden = true
            imgDet2.isHidden = true
            imgDet3.isHidden = true
            self.txtDet1.isHidden = true
            self.txtDet2.isHidden = true
            self.txtDet3.isHidden = true
            self.txtComponentsTeachers.text = ""
            self.txtMoreComponentsTeachers.isHidden = true
            self.txtISBNStudents.text = ""
            self.txtISBNTeachers.text = ""
            
        } else if viaSegueSerie == 78 {
            unoImg.image = UIImage(named: "british.png")
            dosImg.image = UIImage(named: "levels6.png")
            tresImg.image = UIImage(named: "hours90_120.png")
            cuatroImg.image = UIImage(named: "app.png")
            cincoImg.image = UIImage(named: "videos.png")
            seisImg.image = UIImage(named: "digital_book.png")
            sieteImg.image = UIImage(named: "digital_resources.png")
            ochoImg.image = UIImage(named: "audio.png")
            nueveImg.image = UIImage(named: "richmondlearning.png")

            unoBtn.isHidden = false
            dosBtn.isHidden = false
            tresBtn.isHidden = false
            cuatroBtn.isHidden = false
            cincoBtn.isHidden = false
            seisBtn.isHidden = false
            sieteBtn.isHidden = false
            ochoBtn.isHidden = false
            nueveBtn.isHidden = false

            
            self.txtComponents.text = "- Student’s Book\n \n- Workbook\n \n- Audio CD\n\n - Downloadable audio online\n \n- Split Edition Available\n \n- Interactive online activities\n \n- Learning Platform\n \n - App"
            imgDet1.isHidden = true
            imgDet2.isHidden = true
            imgDet3.isHidden = true
            self.txtDet1.isHidden = true
            self.txtDet2.isHidden = true
            self.txtDet3.isHidden = true
            self.txtComponentsTeachers.text = "- Teacher’s Book \n \n- Class Audio CD\n \n- Digital Book\n \n- Test Studio\n \n- Online videos and author interviews\n \n- Learning Platform"
            self.txtMoreComponentsTeachers.isHidden = true
            
            let string = "The BIG Picture Student’s Book\n      Level A1          9788466815673\n      Level A2          9788466815673\n      Level B1          9788466820776\n\nThe BIG Picture Pack (WB+CD)\n      Level A1          7506009839595\n      Level A2          7506009834248\n      Level B1          7506009834255"
            
            let attributedString = NSMutableAttributedString(string: string as String, attributes: [NSFontAttributeName:UIFont.systemFont(ofSize: 14.0)])
            
            let boldFontAttribute = [NSFontAttributeName: UIFont.boldSystemFont(ofSize: 14.0)]
            
            // Part of string to be bold
            let str = NSString(string: string)
            
            let range1 = str.range(of:"The BIG Picture Student’s Book")
            let range2 = str.range(of:"The BIG Picture Pack (WB+CD)")
            
            attributedString.addAttributes(boldFontAttribute, range: range1)
            attributedString.addAttributes(boldFontAttribute, range: range2)
            
            let stringT = "The BIG Picture Teacher’s Book\n      Level A1          9788466815697\n      Level A2          9788466810579\n      Level B1          9788466810609\n\nThe BIG Picture Class Audio CDs\n      Level A1          9788466815703\n      Level A2          9788466812801\n      Level B1          9788466812825\n\nThe BIG Picture Digital Book\nLevel A1          9788466815710\n      Level A2          9788466812818\n      Level B1          9788466812832"
            
            let attributedStringT = NSMutableAttributedString(string: stringT as String, attributes: [NSFontAttributeName:UIFont.systemFont(ofSize: 14.0)])
            
            // Part of string to be bold
            let strT = NSString(string: stringT)
            
            let rangeT1 = strT.range(of:"The BIG Picture Teacher’s Book")
            let rangeT2 = strT.range(of:"The BIG Picture Class Audio CDs")
            let rangeT3 = strT.range(of:"The BIG Picture Digital Book")
            
            attributedStringT.addAttributes(boldFontAttribute, range: rangeT1)
            attributedStringT.addAttributes(boldFontAttribute, range: rangeT2)
            attributedStringT.addAttributes(boldFontAttribute, range: rangeT3)
            
            self.txtISBNStudents.attributedText = attributedString
            self.txtISBNTeachers.isHidden = false
            self.txtISBNTeachers.attributedText = attributedStringT
            
        } else if viaSegueSerie == 43 {
            self.txtComponents.text = ""
            imgDet1.isHidden = true
            imgDet2.isHidden = true
            imgDet3.isHidden = true
            self.txtDet1.isHidden = true
            self.txtDet2.isHidden = true
            self.txtDet3.isHidden = true
            self.txtComponentsTeachers.text = ""
            self.txtMoreComponentsTeachers.isHidden = true
            
            let string = "CLIL Across Educational Levels\n          9788466802598\n\nHelping Students to Learn\n          9788429454475\n\nThe Mixed Ability Class\n          9788429449273\n\nAn Introduction to Teaching English to Children\n          9788429450682\n\nHelping Students to Speak\n          9788429449266\n\nEvaluating your Students\n          9788429450675\n\nDeveloping Resources for Primary\n          9788429450668\n\nDeveloping Resources for Primary (Español)\n          9788429450934\n\nTeaching Very Young Children\n          9788429454468\n\nThe Language In English Teaching\n          9789685699136"
            
            let attributedString = NSMutableAttributedString(string: string as String, attributes: [NSFontAttributeName:UIFont.systemFont(ofSize: 14.0)])
            
            let boldFontAttribute = [NSFontAttributeName: UIFont.boldSystemFont(ofSize: 14.0)]
            
            // Part of string to be bold
            let str = NSString(string: string)
            
            let range1 = str.range(of:"CLIL Across Educational Levels")
            let range2 = str.range(of:"The Mixed Ability Class")
            let range3 = str.range(of:"An Introduction to Teaching English to Children")
            let range4 = str.range(of:"Helping Students to Speak")
            let range5 = str.range(of:"Evaluating your Students")
            let range6 = str.range(of:"Developing Resources for Primary")
            let range7 = str.range(of:"Developing Resources for Primary (Español)")
            let range8 = str.range(of:"Teaching Very Young Children")
            let range9 = str.range(of:"The Language In English Teaching")
            
            attributedString.addAttributes(boldFontAttribute, range: range1)
            attributedString.addAttributes(boldFontAttribute, range: range2)
            attributedString.addAttributes(boldFontAttribute, range: range3)
            attributedString.addAttributes(boldFontAttribute, range: range4)
            attributedString.addAttributes(boldFontAttribute, range: range5)
            attributedString.addAttributes(boldFontAttribute, range: range6)
            attributedString.addAttributes(boldFontAttribute, range: range7)
            attributedString.addAttributes(boldFontAttribute, range: range8)
            attributedString.addAttributes(boldFontAttribute, range: range9)
            
            self.txtISBNStudents.attributedText = attributedString
            self.txtISBNTeachers.isHidden = true
            self.txtTitleISBNTeachers.isHidden = true
            
        } else if viaSegueSerie == 44 {
            self.txtComponents.text = ""
            imgDet1.isHidden = true
            imgDet2.isHidden = true
            imgDet3.isHidden = true
            self.txtDet1.isHidden = true
            self.txtDet2.isHidden = true
            self.txtDet3.isHidden = true
            self.txtComponentsTeachers.text = ""
            self.txtMoreComponentsTeachers.isHidden = true
            
            let string = "Richmond Picture Dictionary          ISBN: 9788466813143"
            
            let attributedString = NSMutableAttributedString(string: string as String, attributes: [NSFontAttributeName:UIFont.systemFont(ofSize: 14.0)])
            
            let boldFontAttribute = [NSFontAttributeName: UIFont.boldSystemFont(ofSize: 14.0)]
            
            // Part of string to be bold
            let str = NSString(string: string)
            
            let range1 = str.range(of:"Richmond Picture Dictionary")
            
            attributedString.addAttributes(boldFontAttribute, range: range1)
            
            self.txtISBNStudents.attributedText = attributedString
            self.txtISBNTeachers.isHidden = true
            self.txtTitleISBNTeachers.isHidden = true
            
        } else if viaSegueSerie == 45 {
            
            self.txtComponents.text = ""
            imgDet1.isHidden = true
            imgDet2.isHidden = true
            imgDet3.isHidden = true
            self.txtDet1.isHidden = true
            self.txtDet2.isHidden = true
            self.txtDet3.isHidden = true
            self.txtComponentsTeachers.text = ""
            self.txtMoreComponentsTeachers.isHidden = true
            
            let string = "Richmond First Dictionary          ISBN: 9789707395015"
            
            let attributedString = NSMutableAttributedString(string: string as String, attributes: [NSFontAttributeName:UIFont.systemFont(ofSize: 14.0)])
            
            let boldFontAttribute = [NSFontAttributeName: UIFont.boldSystemFont(ofSize: 14.0)]
            
            // Part of string to be bold
            let str = NSString(string: string)
            
            let range1 = str.range(of:"Richmond First Dictionary")
            
            attributedString.addAttributes(boldFontAttribute, range: range1)
            
            self.txtISBNStudents.attributedText = attributedString
            self.txtISBNTeachers.isHidden = true
            self.txtTitleISBNTeachers.isHidden = true
            
        } else if viaSegueSerie == 46 {
            
            self.txtComponents.text = ""
            imgDet1.isHidden = true
            imgDet2.isHidden = true
            imgDet3.isHidden = true
            self.txtDet1.isHidden = true
            self.txtDet2.isHidden = true
            self.txtDet3.isHidden = true
            self.txtComponentsTeachers.text = ""
            self.txtMoreComponentsTeachers.isHidden = true
            
            let string = "Richmond Dictionary Fully Illustrated          ISBN: 9789707394971"
            
            let attributedString = NSMutableAttributedString(string: string as String, attributes: [NSFontAttributeName:UIFont.systemFont(ofSize: 14.0)])
            
            let boldFontAttribute = [NSFontAttributeName: UIFont.boldSystemFont(ofSize: 14.0)]
            
            // Part of string to be bold
            let str = NSString(string: string)
            
            let range1 = str.range(of:"Richmond Dictionary Fully Illustrated")
            
            attributedString.addAttributes(boldFontAttribute, range: range1)
            
            self.txtISBNStudents.attributedText = attributedString
            self.txtISBNTeachers.isHidden = true
            self.txtTitleISBNTeachers.isHidden = true
            
        } else if viaSegueSerie == 47 {
            unoImg.image = UIImage(named: "app.png")
            
            unoBtn.isHidden = false

            
            self.txtComponents.text = ""
            imgDet1.isHidden = true
            imgDet2.isHidden = true
            imgDet3.isHidden = true
            self.txtDet1.isHidden = true
            self.txtDet2.isHidden = true
            self.txtDet3.isHidden = true
            self.txtComponentsTeachers.text = ""
            self.txtMoreComponentsTeachers.isHidden = true
            
            let string = "Richmond Mini Dictionary\n         ISBN: 9788466810333\n\nRichmond Pocket Dictionary\n          ISBN: 9788466814164\n\nRichmond Compact Dictionary\n          ISBN: 9788466810340"
            
            let attributedString = NSMutableAttributedString(string: string as String, attributes: [NSFontAttributeName:UIFont.systemFont(ofSize: 14.0)])
            
            let boldFontAttribute = [NSFontAttributeName: UIFont.boldSystemFont(ofSize: 14.0)]
            
            // Part of string to be bold
            let str = NSString(string: string)
            
            let range1 = str.range(of:"Richmond Mini Dictionary")
            let range2 = str.range(of:"Richmond Pocket Dictionary")
            let range3 = str.range(of:"Richmond Compact Dictionary")
            
            attributedString.addAttributes(boldFontAttribute, range: range1)
            attributedString.addAttributes(boldFontAttribute, range: range2)
            attributedString.addAttributes(boldFontAttribute, range: range3)
            
            self.txtISBNStudents.attributedText = attributedString
            self.txtISBNTeachers.isHidden = true
            self.txtTitleISBNTeachers.isHidden = true
            
        } else if viaSegueSerie == 51 {
            imgCEFR.image = UIImage(named: "target_ket_for_schools_cefr.png")
            
            unoImg.image = UIImage(named: "exam_friendly.png")
            dosImg.image = UIImage(named: "audio.png")
            tresImg.image = UIImage(named: "digital_resources.png")
            cuatroImg.image = UIImage(named: "british.png")
            
            unoBtn.isHidden = false
            dosBtn.isHidden = false
            tresBtn.isHidden = false
            cuatroBtn.isHidden = false
            
            self.txtComponents.text = "-Student’s Book\n \n-Workbook\n \n-CD-ROM"
            imgDet1.isHidden = true
            imgDet2.isHidden = true
            imgDet3.isHidden = true
            self.txtDet1.isHidden = true
            self.txtDet2.isHidden = true
            self.txtDet3.isHidden = true
            self.txtComponentsTeachers.text = "-Teacher’s Book \n \n-Class Audio CD\n \n"
            self.txtMoreComponentsTeachers.isHidden = true
            
            let string = "Target KET for Schools Student Pack (SB+CD-ROM)\n7506009832596\n\nTarget KET Workbook\n9788466806824"
            
            let attributedString = NSMutableAttributedString(string: string as String, attributes: [NSFontAttributeName:UIFont.systemFont(ofSize: 14.0)])
            
            let boldFontAttribute = [NSFontAttributeName: UIFont.boldSystemFont(ofSize: 14.0)]
            
            // Part of string to be bold
            let str = NSString(string: string)
            
            let range1 = str.range(of:"Target KET for Schools Student Pack (SB+CD-ROM)")
            let range2 = str.range(of:"Target KET Workbook")
            
            attributedString.addAttributes(boldFontAttribute, range: range1)
            attributedString.addAttributes(boldFontAttribute, range: range2)
            
            let stringT = "Target KET for Schools Teacher’s Pack (TB+Audio CD)\n7506009832619"
            
            let attributedStringT = NSMutableAttributedString(string: stringT as String, attributes: [NSFontAttributeName:UIFont.systemFont(ofSize: 14.0)])
            
            // Part of string to be bold
            let strT = NSString(string: stringT)
            
            let rangeT1 = strT.range(of:"Target KET for Schools Teacher’s Pack (TB+Audio CD)")
            
            attributedStringT.addAttributes(boldFontAttribute, range: rangeT1)
            
            self.txtISBNStudents.attributedText = attributedString
            self.txtISBNTeachers.isHidden = false
            self.txtISBNTeachers.attributedText = attributedStringT
            
        } else if viaSegueSerie == 52 {
            imgCEFR.image = UIImage(named: "richmond_practice_test_ket_and_pet_cefr.png")
            
            unoImg.image = UIImage(named: "exam_friendly.png")
            dosImg.image = UIImage(named: "audio.png")
            tresImg.image = UIImage(named: "digital_resources.png")
            cuatroImg.image = UIImage(named: "microsite.png")
            cincoImg.image = UIImage(named: "british.png")
            
            unoBtn.isHidden = false
            dosBtn.isHidden = false
            tresBtn.isHidden = false
            cuatroBtn.isHidden = false
            cincoBtn.isHidden = false
            
            self.txtComponents.text = "-Student’s Book\n \n-Workbook\n \n-CD-ROM"
            imgDet1.isHidden = true
            imgDet2.isHidden = true
            imgDet3.isHidden = true
            self.txtDet1.isHidden = true
            self.txtDet2.isHidden = true
            self.txtDet3.isHidden = true
            self.txtComponentsTeachers.text = "-Teacher’s Book\n \n-Class Audio CD\n \n"
            self.txtMoreComponentsTeachers.isHidden = true
            
            let string = "Student’s Book Pack (ST+CD-ROM)\n      Richmond KET Practice Tests          7506009835962\n      Richmond PET Practice Tests          7506009835979"
            
            let attributedString = NSMutableAttributedString(string: string as String, attributes: [NSFontAttributeName:UIFont.systemFont(ofSize: 14.0)])
            
            let boldFontAttribute = [NSFontAttributeName: UIFont.boldSystemFont(ofSize: 14.0)]
            
            // Part of string to be bold
            let str = NSString(string: string)
            
            let range1 = str.range(of:"Student’s Book Pack (ST+CD-ROM)")
            
            attributedString.addAttributes(boldFontAttribute, range: range1)
            
            let stringT = "Teacher’s Book\n      Richmond KET Practice Tests          9788466812450\n      Richmond PET Practice Tests          9788466812979\n\nAudio CDs\n      Richmond KET Practice Tests          9788466812993\n      Richmond PET Practice Tests          9788466813006"
            
            let attributedStringT = NSMutableAttributedString(string: stringT as String, attributes: [NSFontAttributeName:UIFont.systemFont(ofSize: 14.0)])
            
            // Part of string to be bold
            let strT = NSString(string: stringT)
            
            let rangeT1 = strT.range(of:"Teacher’s Book")
            let rangeT2 = strT.range(of:"Audio CDs")
            
            attributedStringT.addAttributes(boldFontAttribute, range: rangeT1)
            attributedStringT.addAttributes(boldFontAttribute, range: rangeT2)
            
            self.txtISBNStudents.attributedText = attributedString
            self.txtISBNTeachers.isHidden = false
            self.txtISBNTeachers.attributedText = attributedStringT
            
        } else if viaSegueSerie == 55 {
            imgCEFR.image = UIImage(named: "richmond_practice_test_for_cambridge_english_first_cefr.png")
            
            unoImg.image = UIImage(named: "exam_friendly.png")
            dosImg.image = UIImage(named: "audio.png")
            tresImg.image = UIImage(named: "digital_resources.png")
            cuatroImg.image = UIImage(named: "british.png")
            cincoImg.image = UIImage(named: "learning.png")
            
            unoBtn.isHidden = false
            dosBtn.isHidden = false
            tresBtn.isHidden = false
            cuatroBtn.isHidden = false
            cincoBtn.isHidden = false
            
            self.txtComponents.text = "-Student’s Book\n \n-Student’s Book with answers\n \n-Learning Platform"
            imgDet1.isHidden = true
            imgDet2.isHidden = true
            imgDet3.isHidden = true
            self.txtDet1.isHidden = true
            self.txtDet2.isHidden = true
            self.txtDet3.isHidden = true
            self.txtComponentsTeachers.text = "-Teacher’s Book\n \n-Class Audio CDs\n \n"
            self.txtMoreComponentsTeachers.isHidden = true
            
            let string = "Target First Student’s Book\n9788466817493\n\nPack Target First (WB+CD)\n7506009841789"
            
            let attributedString = NSMutableAttributedString(string: string as String, attributes: [NSFontAttributeName:UIFont.systemFont(ofSize: 14.0)])
            
            let boldFontAttribute = [NSFontAttributeName: UIFont.boldSystemFont(ofSize: 14.0)]
            
            // Part of string to be bold
            let str = NSString(string: string)
            
            let range1 = str.range(of:"Target First Student’s Book")
            let range2 = str.range(of:"Pack Target First (WB+CD)")
            
            attributedString.addAttributes(boldFontAttribute, range: range1)
            attributedString.addAttributes(boldFontAttribute, range: range2)
            
            let stringT = "Target First Teacher’s Pack (TB+CD)\n7506009841550"
            
            let attributedStringT = NSMutableAttributedString(string: stringT as String, attributes: [NSFontAttributeName:UIFont.systemFont(ofSize: 14.0)])
            
            // Part of string to be bold
            let strT = NSString(string: stringT)
            
            let rangeT1 = strT.range(of:"Target First Teacher’s Pack (TB+CD)")
            
            attributedStringT.addAttributes(boldFontAttribute, range: rangeT1)
            
            self.txtISBNStudents.attributedText = attributedString
            self.txtISBNTeachers.isHidden = false
            self.txtISBNTeachers.attributedText = attributedStringT
            
        } else if viaSegueSerie == 56 {
            imgCEFR.image = UIImage(named: "richmond_pratice_test_for_cambridge_english_advanced_cefr.png")
            
            unoImg.image = UIImage(named: "exam_friendly.png")
            dosImg.image = UIImage(named: "audio.png")
            tresImg.image = UIImage(named: "digital_resources.png")
            cuatroImg.image = UIImage(named: "british.png")
            cincoImg.image = UIImage(named: "learning.png")
            
            unoBtn.isHidden = false
            dosBtn.isHidden = false
            tresBtn.isHidden = false
            cuatroBtn.isHidden = false
            cincoBtn.isHidden = false
            
            self.txtComponents.text = "-Student’s Book with answers\n-Learning Platform"
            imgDet1.isHidden = true
            imgDet2.isHidden = true
            imgDet3.isHidden = true
            self.txtDet1.isHidden = true
            self.txtDet2.isHidden = true
            self.txtDet3.isHidden = true
            self.txtComponentsTeachers.isHidden = true
            self.txtComponentsTeachers.text = "- Teacher’s Book \n \n- Class CD\n \n- DVD (ID Café) \n \n- Digital Book\n \n- Learning Platform with a full range of digital resources\n \n"
            self.txtMoreComponentsTeachers.isHidden = true
            self.txtISBNStudents.text = "iDentities Student’s Book\nLevel 1          978846682083\nLevel 2          *TBA\n\niDentities Workbook\nLevel 1          9788466820851\nLevel 2          *TBA"
            self.txtISBNTeachers.text = "iDentities Teacher’s Book\nLevel 1          9788466820844\nLevel 2          *TBA\n\niDentities Class CD\nLevel 1          9788466820806\nLevel 2          *TBA"
            
        } else if viaSegueSerie == 57 {
            imgCEFR.image = UIImage(named: "richmond_pratice_test_for_cambridge_english_advanced_cefr.png")
            
            unoImg.image = UIImage(named: "exam_friendly.png")
            dosImg.image = UIImage(named: "audio.png")
            tresImg.image = UIImage(named: "digital_resources.png")
            cuatroImg.image = UIImage(named: "british.png")
            cincoImg.image = UIImage(named: "learning.png")

            unoBtn.isHidden = false
            dosBtn.isHidden = false
            tresBtn.isHidden = false
            cuatroBtn.isHidden = false
            cincoBtn.isHidden = false

            self.txtComponents.text = "-Student’s Book with answers\n \n-Learning Platform\n \n-CD-ROM"
            imgDet1.isHidden = true
            imgDet2.isHidden = true
            imgDet3.isHidden = true
            self.txtDet1.isHidden = true
            self.txtDet2.isHidden = true
            self.txtDet3.isHidden = true
            self.txtComponentsTeachers.text = "-NO APLICA"
            self.txtMoreComponentsTeachers.isHidden = true
            self.txtISBNStudents.text = "iDentities Student’s Book\nLevel 1          978846682083\nLevel 2          *TBA\n\niDentities Workbook\nLevel 1          9788466820851\nLevel 2          *TBA"
            self.txtISBNTeachers.text = "iDentities Teacher’s Book\nLevel 1          9788466820844\nLevel 2          *TBA\n\niDentities Class CD\nLevel 1          9788466820806\nLevel 2          *TBA"
            
        } else if viaSegueSerie == 61 {
            unoImg.image = UIImage(named: "exam_friendly.png")
            dosImg.image = UIImage(named: "audio.png")
            tresImg.image = UIImage(named: "digital_resources.png")
            cuatroImg.image = UIImage(named: "american_english.png")
            cincoImg.image = UIImage(named: "levels3.png")
            
            unoBtn.isHidden = false
            dosBtn.isHidden = false
            tresBtn.isHidden = false
            cuatroBtn.isHidden = false
            cincoBtn.isHidden = false
            
            self.txtComponents.text = "-Student’s Book\n \n-Audioscripts\n \n-Course CD\n \n-Online Practice Test"
            imgDet1.isHidden = true
            imgDet2.isHidden = true
            imgDet3.isHidden = true
            self.txtDet1.isHidden = true
            self.txtDet2.isHidden = true
            self.txtDet3.isHidden = true
            self.txtComponentsTeachers.text = "-NO APLICA\n \n"
            self.txtMoreComponentsTeachers.isHidden = true
            self.txtISBNStudents.text = "iDentities Student’s Book\nLevel 1          978846682083\nLevel 2          *TBA\n\niDentities Workbook\nLevel 1          9788466820851\nLevel 2          *TBA"
            self.txtISBNTeachers.text = "iDentities Teacher’s Book\nLevel 1          9788466820844\nLevel 2          *TBA\n\niDentities Class CD\nLevel 1          9788466820806\nLevel 2          *TBA"
            
        } else if viaSegueSerie == 50 {
            unoImg.image = UIImage(named: "exam_friendly.png")
            dosImg.image = UIImage(named: "audio.png")
            tresImg.image = UIImage(named: "british.png")
            cuatroImg.image = UIImage(named: "levels3.png")
            
            unoBtn.isHidden = false
            dosBtn.isHidden = false
            tresBtn.isHidden = false
            cuatroBtn.isHidden = false
            
            self.txtComponents.text = "- Student’s Book (with portal access code)\n \n- eWorkbook\n \n- Split editions (except for Starter)\n \n- Learning Platform extra practice, audio and video"
            imgDet1.isHidden = true
            imgDet2.isHidden = true
            imgDet3.isHidden = true
            self.txtDet1.isHidden = true
            self.txtDet2.isHidden = true
            self.txtDet3.isHidden = true
            self.txtComponentsTeachers.text = "- Teacher’s Book \n \n- Class CD\n \n- DVD (ID Café) \n \n- Digital Book\n \n- Learning Platform with a full range of digital resources\n \n"
            self.txtMoreComponentsTeachers.isHidden = true
            self.txtISBNStudents.text = "iDentities Student’s Book\nLevel 1          978846682083\nLevel 2          *TBA\n\niDentities Workbook\nLevel 1          9788466820851\nLevel 2          *TBA"
            self.txtISBNTeachers.text = "iDentities Teacher’s Book\nLevel 1          9788466820844\nLevel 2          *TBA\n\niDentities Class CD\nLevel 1          9788466820806\nLevel 2          *TBA"
            
        } else if viaSegueSerie == 53 {
            imgCEFR.image = UIImage(named: "richmond_practice_test_ket_and_pet_cefr.png")
            
            unoImg.image = UIImage(named: "exam_friendly.png")
            dosImg.image = UIImage(named: "audio.png")
            tresImg.image = UIImage(named: "digital_resources.png")
            cuatroImg.image = UIImage(named: "british.png")

            
            unoBtn.isHidden = false
            dosBtn.isHidden = false
            tresBtn.isHidden = false
            cuatroBtn.isHidden = false

            self.txtComponents.text = "-Student’s Book\n \n-Student’s CD-ROM"
            imgDet1.isHidden = true
            imgDet2.isHidden = true
            imgDet3.isHidden = true
            self.txtDet1.isHidden = true
            self.txtDet2.isHidden = true
            self.txtDet3.isHidden = true
            self.txtComponentsTeachers.text = "-Teacher’s Book\n \n-Class Audio CD\n \n-Website\n \n"
            self.txtMoreComponentsTeachers.isHidden = true
            self.txtISBNStudents.text = "iDentities Student’s Book\nLevel 1          978846682083\nLevel 2          *TBA\n\niDentities Workbook\nLevel 1          9788466820851\nLevel 2          *TBA"
            self.txtISBNTeachers.text = "iDentities Teacher’s Book\nLevel 1          9788466820844\nLevel 2          *TBA\n\niDentities Class CD\nLevel 1          9788466820806\nLevel 2          *TBA"
            
        } else if viaSegueSerie == 54 {
            unoImg.image = UIImage(named: "exam_friendly.png")
            dosImg.image = UIImage(named: "audio.png")
            tresImg.image = UIImage(named: "digital_resources.png")
            cuatroImg.image = UIImage(named: "british.png")
            cincoImg.image = UIImage(named: "learning.png")
            
            unoBtn.isHidden = false
            dosBtn.isHidden = false
            tresBtn.isHidden = false
            cuatroBtn.isHidden = false
            cincoBtn.isHidden = false
            
            self.txtComponents.text = "-Student’s Book\n \n-Workbook with Audio CD\n \n-Learning Platform"
            imgDet1.isHidden = true
            imgDet2.isHidden = true
            imgDet3.isHidden = true
            self.txtDet1.isHidden = true
            self.txtDet2.isHidden = true
            self.txtDet3.isHidden = true
            self.txtComponentsTeachers.text = "-Teacher’s Book\n \n-Class Audio CDs\n \n"
            self.txtMoreComponentsTeachers.isHidden = true
            self.txtISBNStudents.text = "iDentities Student’s Book\nLevel 1          978846682083\nLevel 2          *TBA\n\niDentities Workbook\nLevel 1          9788466820851\nLevel 2          *TBA"
            self.txtISBNTeachers.text = "iDentities Teacher’s Book\nLevel 1          9788466820844\nLevel 2          *TBA\n\niDentities Class CD\nLevel 1          9788466820806\nLevel 2          *TBA"
            
        }  else if viaSegueSerie == 70 {
            
            self.SegmentDetail.setEnabled(false, forSegmentAt: 1);
            self.SegmentDetail.setEnabled(false, forSegmentAt: 2);
            self.SegmentDetail.setEnabled(false, forSegmentAt: 3);
            
            txtTitleDetailReaders.isHidden = false
            txtAuthDetailReaders.isHidden = false
            txtDescriptionDetailReaders.isHidden = false
            
            txtTitleDetailSerie.isHidden = true
            txtAuthDetailSerie.isHidden = true
            txtDescriptionDetailSerie.isHidden = true
            
            txtTitleDetailReaders.text = txtTitleDetailSerie.text
            txtAuthDetailReaders.text = ""
            txtDescriptionDetailReaders.text = txtDescriptionDetailSerie.text
            txtDescriptionDetailReaders.sizeToFit()
            
            imgTable.isHidden = false
            
            let imageT = UIImage(named: "ready_set_go_table.png")
            
            let xPositionTable = imgTable.frame.origin.x
            
            //View will slide 20px up
            let yPositionTable = imgTable.frame.origin.y
            
            
            let heightImage = imageT?.size.height
            let widthImage = imageT?.size.width
            
            imgTable.frame = CGRect(x: xPositionTable, y: yPositionTable, width: widthImage!, height: heightImage! )
            
            imgTable.image = imageT
            
            imgPortada.isHidden = false
            
            let imageP = UIImage(named: "portadas_ready_set_go_new.jpg")
            
            imgPortada.image = imageP
            
            imgDetailSerie.isHidden = true
            self.txtComponents.text = "- Student’s Book (with portal access code)\n \n- eWorkbook\n \n- Split editions (except for Starter)\n \n- Learning Platform extra practice, audio and video"
            imgDet1.isHidden = true
            imgDet2.isHidden = true
            imgDet3.isHidden = true
            self.txtDet1.isHidden = true
            self.txtDet2.isHidden = true
            self.txtDet3.isHidden = true
            self.txtComponentsTeachers.text = "- Teacher’s Book \n \n- Class CD\n \n- DVD (ID Café) \n \n- Digital Book\n \n- Learning Platform with a full range of digital resources\n \n"
            self.txtMoreComponentsTeachers.isHidden = true
            
            let string = "Level 2(K1)\n      What Shape Is It? :9786070606038\n      Farm Animals : 9786070606021\n      My Clothes : 9786070606014\n      Helping My Family: 9786070606052\n\nLevel 3 (K2):\n      Everyday Jobs :9786070606403\n      Wild Animals: 9786070606045\n      My New School : 9786070606069\n      How Do We Get There?: 9786070606533 \n\nLevel 4 (K3):\n      Our Living Earth: 9786070606564\n      My Senses at Work: 9786070606311\n      Animals through the Seasons : 9786070606328\n      Take a Ride: 9786070606557 \n\n\n\n"
            
            let attributedString = NSMutableAttributedString(string: string as String, attributes: [NSFontAttributeName:UIFont.systemFont(ofSize: 14.0)])
            
            let boldFontAttribute = [NSFontAttributeName: UIFont.boldSystemFont(ofSize: 14.0)]
            
            // Part of string to be bold
            let str = NSString(string: string)
            
            let range1 = str.range(of:"Level 2(K1)")
            let range2 = str.range(of:"Level 3 (K2):")
            let range3 = str.range(of:"Level 4 (K3):")
            
            attributedString.addAttributes(boldFontAttribute, range: range1)
            attributedString.addAttributes(boldFontAttribute, range: range2)
            attributedString.addAttributes(boldFontAttribute, range: range3)
            
            self.txtISBNStudents.attributedText = attributedString
            self.txtISBNTeachers.isHidden = true
            self.txtTitleISBNStudents.isHidden = true
            self.txtTitleISBNTeachers.isHidden = true
            
            
        } else if viaSegueSerie == 71 {
            self.SegmentDetail.setEnabled(false, forSegmentAt: 1);
            self.SegmentDetail.setEnabled(false, forSegmentAt: 2);
            self.SegmentDetail.setEnabled(false, forSegmentAt: 3);
            
            txtTitleDetailReaders.isHidden = false
            txtAuthDetailReaders.isHidden = false
            txtDescriptionDetailReaders.isHidden = false
            
            txtTitleDetailSerie.isHidden = true
            txtAuthDetailSerie.isHidden = true
            txtDescriptionDetailSerie.isHidden = true
            
            txtTitleDetailReaders.text = txtTitleDetailSerie.text
            txtAuthDetailReaders.text = ""
            txtDescriptionDetailReaders.text = txtDescriptionDetailSerie.text
            txtDescriptionDetailReaders.sizeToFit()
            
            imgTable.isHidden = false
            
            let imageT = UIImage(named: "portadas_little_readers.jpg")
            
            let xPositionTable = imgTable.frame.origin.x
            
            //View will slide 20px up
            let yPositionTable = imgTable.frame.origin.y
            
            
            let heightImage = imageT?.size.height
            let widthImage = imageT?.size.width
            
            imgTable.frame = CGRect(x: xPositionTable, y: yPositionTable, width: widthImage!, height: heightImage! )
            
            imgTable.image = imageT
            
            imgDetailSerie.isHidden = true
            self.txtComponents.text = "- Student’s Book (with portal access code)\n \n- eWorkbook\n \n- Split editions (except for Starter)\n \n- Learning Platform extra practice, audio and video"
            imgDet1.isHidden = true
            imgDet2.isHidden = true
            imgDet3.isHidden = true
            self.txtDet1.isHidden = true
            self.txtDet2.isHidden = true
            self.txtDet3.isHidden = true
            self.txtComponentsTeachers.text = "- Teacher’s Book \n \n- Class CD\n \n- DVD (ID Café) \n \n- Digital Book\n \n- Learning Platform with a full range of digital resources\n \n"
            self.txtMoreComponentsTeachers.isHidden = true
            
            let string = "Level 1\n      Crickle, Crackle, Pop: 9789707392229\n\nLevel 2:\n      Shake and Shver : 9789707392236 \n\n\n\n"
            
            let attributedString = NSMutableAttributedString(string: string as String, attributes: [NSFontAttributeName:UIFont.systemFont(ofSize: 14.0)])
            
            let boldFontAttribute = [NSFontAttributeName: UIFont.boldSystemFont(ofSize: 14.0)]
            
            // Part of string to be bold
            let str = NSString(string: string)
            
            let range1 = str.range(of:"Level 1")
            let range2 = str.range(of:"Level 2")
            
            attributedString.addAttributes(boldFontAttribute, range: range1)
            attributedString.addAttributes(boldFontAttribute, range: range2)
            
            self.txtISBNStudents.attributedText = attributedString
            self.txtISBNTeachers.isHidden = true
            self.txtTitleISBNStudents.isHidden = true
            self.txtTitleISBNTeachers.isHidden = true
            
        } else if viaSegueSerie == 72 {
            self.SegmentDetail.setEnabled(false, forSegmentAt: 1);
            self.SegmentDetail.setEnabled(false, forSegmentAt: 2);
            self.SegmentDetail.setEnabled(false, forSegmentAt: 3);
            
            txtTitleDetailReaders.isHidden = false
            txtAuthDetailReaders.isHidden = false
            txtDescriptionDetailReaders.isHidden = false
            
            txtTitleDetailSerie.isHidden = true
            txtAuthDetailSerie.isHidden = true
            txtDescriptionDetailSerie.isHidden = true
            
            txtTitleDetailReaders.text = txtTitleDetailSerie.text
            txtAuthDetailReaders.text = ""
            txtDescriptionDetailReaders.text = txtDescriptionDetailSerie.text
            txtDescriptionDetailReaders.sizeToFit()
            
            imgTable.isHidden = false
            
            let imageT = UIImage(named: "portadas_infoquest.jpg")
            
            let xPositionTable = imgTable.frame.origin.x
            
            //View will slide 20px up
            let yPositionTable = imgTable.frame.origin.y
            
            
            let heightImage = imageT?.size.height
            let widthImage = imageT?.size.width
            
            imgTable.frame = CGRect(x: xPositionTable, y: yPositionTable, width: widthImage!, height: heightImage! )
            
            imgTable.updateConstraintsIfNeeded()
            
            print(heightImage!)
            
            imgTable.image = imageT
            
            
            
            imgDetailSerie.isHidden = true
            self.txtComponents.text = "- Student’s Book (with portal access code)\n \n- eWorkbook\n \n- Split editions (except for Starter)\n \n- Learning Platform extra practice, audio and video"
            imgDet1.isHidden = true
            imgDet2.isHidden = true
            imgDet3.isHidden = true
            self.txtDet1.isHidden = true
            self.txtDet2.isHidden = true
            self.txtDet3.isHidden = true
            self.txtComponentsTeachers.text = "- Teacher’s Book \n \n- Class CD\n \n- DVD (ID Café) \n \n- Digital Book\n \n- Learning Platform with a full range of digital resources\n \n"
            self.txtMoreComponentsTeachers.isHidden = true
            
            let string = "Level 1\n      In My Garden: 9789707392267\n      Down on the Farm : 9789707392281\n      Jeepers Creepers : 9789707392250\n\nLevel 2:\n      Fun and Games :9789707392311\n      Those Animals: 9789707392304\n      What´s Cooking?: 9789707392328\n\nLevel 3:\n      Tap into Sap: 9789707392366\n\nLevel 4\n      Grassland Safari :9789707392380\n      On the Wild Side : 9789707392403\n\nLevel 5:\n      A Way with Words:9789707392410\n      Getting Together: 99789707392441\n      Cell City: 9789707392434\n\nLevel 6:\n      Close Up on Careers: 9789707392458\n\n\n\n"
            
            let attributedString = NSMutableAttributedString(string: string as String, attributes: [NSFontAttributeName:UIFont.systemFont(ofSize: 14.0)])
            
            let boldFontAttribute = [NSFontAttributeName: UIFont.boldSystemFont(ofSize: 14.0)]
            
            // Part of string to be bold
            let str = NSString(string: string)
            
            let range1 = str.range(of:"Level 1")
            let range2 = str.range(of:"Level 2:")
            let range3 = str.range(of:"Level 3:")
            let range4 = str.range(of:"Level 4")
            let range5 = str.range(of:"Level 5:")
            let range6 = str.range(of:"Level 6:")
            
            attributedString.addAttributes(boldFontAttribute, range: range1)
            attributedString.addAttributes(boldFontAttribute, range: range2)
            attributedString.addAttributes(boldFontAttribute, range: range3)
            attributedString.addAttributes(boldFontAttribute, range: range4)
            attributedString.addAttributes(boldFontAttribute, range: range5)
            attributedString.addAttributes(boldFontAttribute, range: range6)
            
            self.txtISBNStudents.attributedText = attributedString
            self.txtISBNTeachers.isHidden = true
            self.txtTitleISBNStudents.isHidden = true
            self.txtTitleISBNTeachers.isHidden = true

            
        } else if viaSegueSerie == 73 {
            self.SegmentDetail.setEnabled(false, forSegmentAt: 1);
            self.SegmentDetail.setEnabled(false, forSegmentAt: 2);
            self.SegmentDetail.setEnabled(false, forSegmentAt: 3);
            
            txtTitleDetailReaders.isHidden = false
            txtAuthDetailReaders.isHidden = false
            txtDescriptionDetailReaders.isHidden = false
            
            txtTitleDetailSerie.isHidden = true
            txtAuthDetailSerie.isHidden = true
            txtDescriptionDetailSerie.isHidden = true
            
            txtTitleDetailReaders.text = txtTitleDetailSerie.text
            txtAuthDetailReaders.text = ""
            txtDescriptionDetailReaders.text = txtDescriptionDetailSerie.text
            txtDescriptionDetailReaders.sizeToFit()
            
            imgTable.isHidden = false
            
            let imageT = UIImage(named: "super_stars_table.png")
            
            let xPositionTable = imgTable.frame.origin.x
            
            //View will slide 20px up
            let yPositionTable = imgTable.frame.origin.y
            
            
            let heightImage = imageT?.size.height
            let widthImage = imageT?.size.width
            
            imgTable.frame = CGRect(x: xPositionTable, y: yPositionTable, width: widthImage!, height: heightImage! )
            
            imgTable.image = imageT
            
            imgPortada.isHidden = false
            
            let imageP = UIImage(named: "portadas_superstars.jpg")
            
            let xPositionPortada = imgPortada.frame.origin.x
            
            //View will slide 20px up
            let yPositionPortada = imgPortada.frame.origin.y
            
            
            let heightImageP = ((imageP?.size.height)!*0.8)
            let widthImageP = imageP?.size.width
            
            imgPortada.frame = CGRect(x: xPositionPortada, y: yPositionPortada, width: widthImageP!, height: heightImageP )
            
            imgPortada.image = imageP
            
            imgDetailSerie.isHidden = true
            self.txtComponents.text = "- Student’s Book (with portal access code)\n \n- eWorkbook\n \n- Split editions (except for Starter)\n \n- Learning Platform extra practice, audio and video"
            imgDet1.isHidden = true
            imgDet2.isHidden = true
            imgDet3.isHidden = true
            self.txtDet1.isHidden = true
            self.txtDet2.isHidden = true
            self.txtDet3.isHidden = true
            self.txtComponentsTeachers.text = "- Teacher’s Book \n \n- Class CD\n \n- DVD (ID Café) \n \n- Digital Book\n \n- Learning Platform with a full range of digital resources\n \n"
            self.txtMoreComponentsTeachers.isHidden = true
            
            let string = "Early Reader 1:\n      Be Healthy: 9786070606113\n      Butterfly Life Cycle : 9786070606168\n      Face Painting: 9786070606618\n      Meet a Beekeeper: 9786070606571\n      Meet an Astronaut: 9786070606144\n      Grow Grass Creatures: 9786070606199\n      My Community: 9786070606489\nOur Earth: 9786070606588\n      Why We Need Sleep: 9786070606601\n\nEarly Reader 2:\n      Tadpo le to Frog: 9786070606137\n      Water for Life : 9786070606472\n      School yard Games: 9786070606182\n      Monkeys and Apes: 9786070606076\n      Dangerous Jobs: 9786070606175\n      Explore Eclipses: 9786070606090\n      All about Sharks: 9786070606083\n      Melting Ice: 9786070606120\n\nSolo Reader 1:\n      Whales and Dolphins: 9786070606625\n      Wild Wind storms : 9786070606151\n      End angered Animals: 9786070606465\n      On Safari: 9786070606373\n      Recycling Race: 9786070606366\n      Space Junk: 9786070606106\n      Making Masks: 9786070606243\n      Experiment with magnets: 9786070606205\n\nSolo Reader 2:\n      Space Stations: 9786070606250\n      Puppets Making : 9786070606274\n      My Family Tree: 9786070606212\n      Desert Animals: 9786070606342\n      Why Volcanoes Erupt: 9786070606519\n      Working with Apes: 9786070606229\n      Radical Robos: 9786070606335\n      Animals in captivity: 9786070606236\n\nFluent Reader 1:\n      The Games: 9786070606540\n      Global Warming : 9786070606267\n      Our Greatest Inventions: 9786070606298\n      How Animals Defend Themselves: 9786070606359\n      Great Moments in History: 9786070606281\n      Super Science Experiments: 9786070606304\n      Magnificent Mummies: 9786070606526\n      Secret Codes: 9786070606397\n\nFluent Reader 2:\n      Creating Cool Gadgets: 9786070606632\n      Explore Extreme Sports:9786070606434\n      How the Brain Works: 9786070606427\n      It’s a Mystery: 9786070606595\n      Make Your Own Web Page: 9786070606441\n      How Aircraft Fly: 9786070606496\n      Reptiles and Amphibians: 9786070606380\n      Why Earth quakes Occur: 9786070606502\n      Body Smart: 9786070606458\n\n\n\n"
            
            let attributedString = NSMutableAttributedString(string: string as String, attributes: [NSFontAttributeName:UIFont.systemFont(ofSize: 14.0)])
            
            let boldFontAttribute = [NSFontAttributeName: UIFont.boldSystemFont(ofSize: 14.0)]
            
            // Part of string to be bold
            let str = NSString(string: string)
            
            let range1 = str.range(of:"Early Reader 1:")
            let range2 = str.range(of:"Early Reader 2:")
            let range3 = str.range(of:"Solo Reader 1:")
            let range4 = str.range(of:"Solo Reader 2:")
            let range5 = str.range(of:"Fluent Reader 1:")
            let range6 = str.range(of:"Fluent Reader 2:")
            
            attributedString.addAttributes(boldFontAttribute, range: range1)
            attributedString.addAttributes(boldFontAttribute, range: range2)
            attributedString.addAttributes(boldFontAttribute, range: range3)
            attributedString.addAttributes(boldFontAttribute, range: range4)
            attributedString.addAttributes(boldFontAttribute, range: range5)
            attributedString.addAttributes(boldFontAttribute, range: range6)
            
            self.txtISBNStudents.attributedText = attributedString
            self.txtISBNTeachers.isHidden = true
            self.txtTitleISBNStudents.isHidden = true
            self.txtTitleISBNTeachers.isHidden = true
            
        } else if viaSegueSerie == 74 {
            self.SegmentDetail.setEnabled(false, forSegmentAt: 1);
            self.SegmentDetail.setEnabled(false, forSegmentAt: 2);
            self.SegmentDetail.setEnabled(false, forSegmentAt: 3);
            
            txtTitleDetailReaders.isHidden = false
            txtAuthDetailReaders.isHidden = false
            txtDescriptionDetailReaders.isHidden = false
            
            txtTitleDetailSerie.isHidden = true
            txtAuthDetailSerie.isHidden = true
            txtDescriptionDetailSerie.isHidden = true
            
            txtTitleDetailReaders.text = txtTitleDetailSerie.text
            txtAuthDetailReaders.text = ""
            txtDescriptionDetailReaders.text = txtDescriptionDetailSerie.text
            txtDescriptionDetailReaders.sizeToFit()
            
            imgTable.isHidden = false
            
            let imageT = UIImage(named: "popcorn_readers_table.png")
            
            let xPositionTable = imgTable.frame.origin.x
            
            //View will slide 20px up
            let yPositionTable = imgTable.frame.origin.y
            
            
            let heightImage = imageT?.size.height
            let widthImage = imageT?.size.width
            
            imgTable.frame = CGRect(x: xPositionTable, y: yPositionTable, width: widthImage!, height: heightImage! )
            
            imgTable.image = imageT
            
            imgPortada.isHidden = false
            
            let imageP = UIImage(named: "portadas_popcorn.jpg")
            
            let xPositionPortada = imgPortada.frame.origin.x
            
            //View will slide 20px up
            let yPositionPortada = imgPortada.frame.origin.y
            
            
            let heightImageP = ((imageP?.size.height)!*0.8)
            let widthImageP = imageP?.size.width
            
            imgPortada.frame = CGRect(x: xPositionPortada, y: yPositionPortada, width: widthImageP!, height: heightImageP )
            
            imgPortada.image = imageP
            
            imgDetailSerie.isHidden = true
            self.txtComponents.text = "- Student’s Book (with portal access code)\n \n- eWorkbook\n \n- Split editions (except for Starter)\n \n- Learning Platform extra practice, audio and video"
            imgDet1.isHidden = true
            imgDet2.isHidden = true
            imgDet3.isHidden = true
            self.txtDet1.isHidden = true
            self.txtDet2.isHidden = true
            self.txtDet3.isHidden = true
            self.txtComponentsTeachers.text = "- Teacher’s Book \n \n- Class CD\n \n- DVD (ID Café) \n \n- Digital Book\n \n- Learning Platform with a full range of digital resources\n \n"
            self.txtMoreComponentsTeachers.isHidden = true
            
            let string = "Starter Level:\n   Meet the Turtles: 9781909221819\n   Meet the Smurfs!: 9781910173442\n   Who are the Smurfs?: 9781910173435\n   SpongeBob squarepants: Underwater Friends: 9781909221833\n   Mr. Bean: A day at the beach: 9781909221796\n   How to Tra in Your Dragon: Hic up and Friends: 9781910173756\n   SpongeBob squarepants : SpongeBob’s New Toy:  9781909221895\n   Mr. Bean: Guide to London : 9781910173046\n   Meet the Croods: 9781910173770\n   The Animals of Kung Fu Panda: 9781910173794\n\nLevel 1:\n   Ice Age 4: 9781407169910\n   The Jungle Book : Man Trap : 9781908351500\n   Mr. Bean Royal Bean: 9781906861469\n   Madagascar: 9781906861575\n   Shrek: 9781906861551\n   Over the Hedge: 9781909221291\n   Kung Fu Panda : Holidays: 9781909221284\n   Rio: Blu and Jewel: 9781908351258\n   The Penguins of Madagascar: 9781909221307\n   Gargamel’s Magic Spell : 9781910173558\n   SpongeBob Square Pants :Talent Show: 9781909221901\n   Cloudy with the Chane of Meatballs: 9781910173459\n   Rise of the Turtles: 9781909221888\n   Ice Age: 9781906861599\n   The Jungle Book :Cobra’s Egg: 9781908351524\n   Snoopy and Charlie Brown:The Peanuts Movie: 9781910173510\n   How to Train Your Dragon: 9781910173817\n\nLevel 2:\n   The little prince & the rose: 9781407169941\n   Angry Birds: 9781407169927\n   Madagascar: Escape Africa: 9781906861650\n   Mr. Bean: Toothache: 9781906861483\n   PUSS in boots : The Outlaw: 9781909221338\n   Shrek 2: 9781906861636\n   The Smurfs 2: 9781910173541\n   Rango: 9781906861995\n   Peanuts classic:Snoopy and Friends: 9781910173565\n   Cloudy with the Chance of Meatballs 2 : 9781910173466\n   Time Jump : Back to the Stone Age: 9781908351647\n   The Turtles : Kraang Attack!: 9781910173015\n   How to Train Your Dragon 2: 9781910173831\n   Turbo: 9781910173855\n   SpongeBob Square Pants : Wormy: 9781910173008\n\nLevel 3:\n   The Smurfs : The Lost Village: 9781407169958\n   Home: 9781910173879\n   SpongeBob Square Pants :DoodleBob: 9781909221826\n   Rio: Looking for Blu: 9781908351128\n   The Turtles : Donnie’s Robot: 9781910173022\n   Shrek Forever After: 9781906861308\n   Madagascar 3: Europe’s Most Wanted: 9781909221352\n   Peanuts classic: The Ice-Skating Competition: 9781910173572\n   Kung Fu Panda 2: 9781906861834\n   Shrek the Third : 9781906861735\n   Mr.Bean: The palace of bean: 9781906861506\n   Ice Age 3: Dawn of the Dinosaurs:9781906861773\n\n\n"
            
            let attributedString = NSMutableAttributedString(string: string as String, attributes: [NSFontAttributeName:UIFont.systemFont(ofSize: 14.0)])
            
            let boldFontAttribute = [NSFontAttributeName: UIFont.boldSystemFont(ofSize: 14.0)]
            
            // Part of string to be bold
            let str = NSString(string: string)
            
            let range1 = str.range(of:"Starter Level:")
            let range2 = str.range(of:"Level 1:")
            let range3 = str.range(of:"Level 2:")
            let range4 = str.range(of:"Level 2:")
            
            attributedString.addAttributes(boldFontAttribute, range: range1)
            attributedString.addAttributes(boldFontAttribute, range: range2)
            attributedString.addAttributes(boldFontAttribute, range: range3)
            attributedString.addAttributes(boldFontAttribute, range: range4)
            
            self.txtISBNStudents.attributedText = attributedString
            self.txtISBNTeachers.isHidden = true
            self.txtTitleISBNStudents.isHidden = true
            self.txtTitleISBNTeachers.isHidden = true
            
            
        } else if viaSegueSerie == 75 {
            self.SegmentDetail.setEnabled(false, forSegmentAt: 1);
            self.SegmentDetail.setEnabled(false, forSegmentAt: 2);
            self.SegmentDetail.setEnabled(false, forSegmentAt: 3);
            
            txtTitleDetailReaders.isHidden = false
            txtAuthDetailReaders.isHidden = false
            txtDescriptionDetailReaders.isHidden = false
            
            txtTitleDetailSerie.isHidden = true
            txtAuthDetailSerie.isHidden = true
            txtDescriptionDetailSerie.isHidden = true
            
            txtTitleDetailReaders.text = txtTitleDetailSerie.text
            txtAuthDetailReaders.text = ""
            txtDescriptionDetailReaders.text = txtDescriptionDetailSerie.text
            txtDescriptionDetailReaders.sizeToFit()
            
            imgTable.isHidden = false
            
            let imageT = UIImage(named: "media_readers_table.png")
            
            let xPositionTable = imgTable.frame.origin.x
            
            //View will slide 20px up
            let yPositionTable = imgTable.frame.origin.y
            
            
            let heightImage = imageT?.size.height
            let widthImage = imageT?.size.width
            
            imgTable.frame = CGRect(x: xPositionTable, y: yPositionTable, width: widthImage!, height: heightImage! )
            
            imgTable.image = imageT
            
            imgPortada.isHidden = false
            
            let imageP = UIImage(named: "portadas_media_readers_copia.jpg")
            
            let xPositionPortada = imgTable.frame.origin.x
            
            //View will slide 20px up
            let yPositionPortada = imgTable.frame.origin.y
            
            
            let heightImageP = imageP?.size.height
            
            imgPortada.frame = CGRect(x: xPositionPortada, y: yPositionPortada, width: imgPortada.frame.width, height: heightImageP! )
            
            print("height portada \(imgPortada.frame.height)")
            
            imgPortada.image = imageP
            
            imgDetailSerie.isHidden = true
            self.txtComponents.text = "- Student’s Book (with portal access code)\n \n- eWorkbook\n \n- Split editions (except for Starter)\n \n- Learning Platform extra practice, audio and video"
            imgDet1.isHidden = true
            imgDet2.isHidden = true
            imgDet3.isHidden = true
            self.txtDet1.isHidden = true
            self.txtDet2.isHidden = true
            self.txtDet3.isHidden = true
            self.txtComponentsTeachers.text = "- Teacher’s Book \n \n- Class CD\n \n- DVD (ID Café) \n \n- Digital Book\n \n- Learning Platform with a full range of digital resources\n \n"
            self.txtMoreComponentsTeachers.isHidden = true
            
            let string = "Starter Level:\n   Robin Hood: The Taxman: 9788466812214\n   Zoey 101: Dance Contest: 9781906861063\n   Blog Love: 9780956857705\n   Storm Hawks: 9781906861056\n\nLevel 1:\n   Malala: 9781910173602\n   Mr. Bean’s Holiday : 9788466810197\n   Buffy the vampire slayer: 9781904720331\n   Transformers: 9781905775446\n   Hotel for Dogs: 9781905775897\n   Monster House: 9788466808729\n   THE ADVENTURES OF MERLIN: Arthur and the Unicorn : 9781905775873\n   One Direct ion:Making the dream real: 9781909221864\n   The city of ember: 9781905775460\n   SMALLVILLE ARRIVAL: 9788466808668\n\nLevel 2:\n   Muhammad Ali: 9781407169972\n   Great Expectations: 9781909221994\n   Selma: 9781910173718\n   Sherlock :The Sign of Three: 9781910173497\n   The Pink Panther: 9788466818704, 9781904720751\n   Romeo and Juliet: 9781910173534\n   The In-Crowd: 9788466819046\n   Johnny English Reborn: 9781407133720\n   ABOUT TIME: 9781910173473\n   THE DEVIL WEARS PRADA: 9788466812245\n   STAR WARS: THE CLONE WARS : 9781905775521\n   SENSE AND SENSIBILITY: 9781905775620\n   GLEE: FOREING EXCHANGE: 9781909221215\n   HOOT: 9788466810241\n   NIGHT AT THE MUSEUM: SECRET OF THE TOMB: 9781910173589\n   The OC: The Outsider: 9781904720836\n   The Mask of Zorro: 9781906861162\n   Bandslam: 9781905775972\n   Jane Eyre: 9788466810227\n   Batman Begins: 9788466818698\n   Glee : The Beginning: 9781908351333\n   Senna: 9781909221192\n   Nelson Mandela: 9781908351166\n   TRANSFORMERS: Revenge of the Fallen: 9781909221222\n   ROBIN HOOD: The Silver Arrow and the Slaves: 9788466810234\n   DJ Ambition: 9788466819053\n\nLevel 3:\n   12 Years a Slave:  9781910173527\n   Suffragette: 9781910173398\n   The Imitation Game: 9781910173411\n   Black Gold: 9781905775569\n   Bob Marley: 9781908351982\n   MICHAEL JACKS ON : The Man, The Music, The Mystery: 9788466812771\n   Angela’s Ashes: 9788466810302\n   Made in Dagenham: 9781908351203\n   Glee : Summer Break: 9781909221253\n   TRANSFORMERS : THE DARK OF MOON : 9781909221260\n   Pride & Prejudice: 9788466810265\n   SHERLOCK: The Hounds of Basker ville: 9781909221246\n   Life of PI: 9781909221789\n   Touching the Void: 9781905775095\n   The Story of Chanel: 9781906861858\n   The Queen: 9788466812276\n   The OC: The Gambled : 9781904720850\n   The OC: The Misfits: 9781904720874\n   VANITY FAIR: 9781906861186\n\nLevel 4:\n   An Education: 9781906861018\n   Nowhere Boy: Before The Beatles– the story of John Lennon: 9781906861032\n   A Lion Called Christian: 9781906861223\n   Slumdog Millionaire: 9781906861216\n\n\n"
            
            let attributedString = NSMutableAttributedString(string: string as String, attributes: [NSFontAttributeName:UIFont.systemFont(ofSize: 14.0)])
            
            let boldFontAttribute = [NSFontAttributeName: UIFont.boldSystemFont(ofSize: 14.0)]
            
            // Part of string to be bold
            let str = NSString(string: string)
            
            let range1 = str.range(of:"Starter Level:")
            let range2 = str.range(of:"Level 1:")
            let range3 = str.range(of:"Level 2:")
            let range4 = str.range(of:"Level 3:")
            let range5 = str.range(of:"Level 4:")
            
            attributedString.addAttributes(boldFontAttribute, range: range1)
            attributedString.addAttributes(boldFontAttribute, range: range2)
            attributedString.addAttributes(boldFontAttribute, range: range3)
            attributedString.addAttributes(boldFontAttribute, range: range4)
            attributedString.addAttributes(boldFontAttribute, range: range5)
            
            self.txtISBNStudents.attributedText = attributedString
            self.txtISBNTeachers.isHidden = true
            self.txtTitleISBNStudents.isHidden = true
            self.txtTitleISBNTeachers.isHidden = true
            
        } else if viaSegueSerie == 76 {
            self.SegmentDetail.setEnabled(false, forSegmentAt: 1);
            self.SegmentDetail.setEnabled(false, forSegmentAt: 2);
            self.SegmentDetail.setEnabled(false, forSegmentAt: 3);
            
            txtTitleDetailReaders.isHidden = false
            txtAuthDetailReaders.isHidden = false
            txtDescriptionDetailReaders.isHidden = false
            
            txtTitleDetailSerie.isHidden = true
            txtAuthDetailSerie.isHidden = true
            txtDescriptionDetailSerie.isHidden = true
            
            txtTitleDetailReaders.text = txtTitleDetailSerie.text
            txtAuthDetailReaders.text = ""
            txtDescriptionDetailReaders.text = txtDescriptionDetailSerie.text
            txtDescriptionDetailReaders.sizeToFit()
            
            imgTable.isHidden = false
            
            let imageT = UIImage(named: "richmond_readers_table.png")
            
            let xPositionTable = imgTable.frame.origin.x
            
            //View will slide 20px up
            let yPositionTable = imgTable.frame.origin.y
            
            
            let heightImage = imageT?.size.height
            let widthImage = imageT?.size.width
            
            imgTable.frame = CGRect(x: xPositionTable, y: yPositionTable, width: widthImage!, height: heightImage! )
            
            imgTable.image = imageT
            
            imgPortada.isHidden = false
            
            let imageP = UIImage(named: "portadas_richmond_readers.jpg")
            
            let xPositionPortada = imgPortada.frame.origin.x
            
            //View will slide 20px up
            let yPositionPortada = imgPortada.frame.origin.y
            
            
            let heightImageP = ((imageP?.size.height)!*0.8)
            let widthImageP = imageP?.size.width
            
            imgPortada.frame = CGRect(x: xPositionPortada, y: yPositionPortada, width: widthImageP!, height: heightImageP )
            
            imgPortada.image = imageP
            
            imgDetailSerie.isHidden = true
            self.txtComponents.text = "- Student’s Book (with portal access code)\n \n- eWorkbook\n \n- Split editions (except for Starter)\n \n- Learning Platform extra practice, audio and video"
            imgDet1.isHidden = true
            imgDet2.isHidden = true
            imgDet3.isHidden = true
            self.txtDet1.isHidden = true
            self.txtDet2.isHidden = true
            self.txtDet3.isHidden = true
            self.txtComponentsTeachers.text = "- Teacher’s Book \n \n- Class CD\n \n- DVD (ID Café) \n \n- Digital Book\n \n- Learning Platform with a full range of digital resources\n \n"
            self.txtMoreComponentsTeachers.isHidden = true
            
            let string = "Level 3:\n     P.R. and Prejudice: 9788466817370\n     The Canterville Ghost: 9788466815987\n     Dr. Jekyll & Mr. Hyde: 9788466815963\n     Frankenstein: 9788466815970\n\nLevel 4:\n     Medical Match: 9788466817363\n     A Floral Arrangement : 9788466817387\n     Sense & Sensibility: 9788466816021\n     Dracula: 9788466816007\n     A Trip to London: 9788466815994\n\nLevel 5:\n     Elizabet h II:The Diamond Queen: 9788466816076\n     Steve Jobs : the man behind Apple: 9788466816069\n     SHERLOCK HOLMES: 9788466816113\n\n\n"
            
            let attributedString = NSMutableAttributedString(string: string as String, attributes: [NSFontAttributeName:UIFont.systemFont(ofSize: 14.0)])
            
            let boldFontAttribute = [NSFontAttributeName: UIFont.boldSystemFont(ofSize: 14.0)]
            
            // Part of string to be bold
            let str = NSString(string: string)
            
            let range1 = str.range(of:"Level 3:")
            let range2 = str.range(of:"Level 4:")
            let range3 = str.range(of:"Level 5:")
            
            attributedString.addAttributes(boldFontAttribute, range: range1)
            attributedString.addAttributes(boldFontAttribute, range: range2)
            attributedString.addAttributes(boldFontAttribute, range: range3)
            
            self.txtISBNStudents.attributedText = attributedString
            self.txtISBNTeachers.isHidden = true
            self.txtTitleISBNStudents.isHidden = true
            self.txtTitleISBNTeachers.isHidden = true
            
        } else if viaSegueSerie == 77 {
            self.SegmentDetail.setEnabled(false, forSegmentAt: 1);
            self.SegmentDetail.setEnabled(false, forSegmentAt: 2);
            self.SegmentDetail.setEnabled(false, forSegmentAt: 3);
            
            txtTitleDetailReaders.isHidden = false
            txtAuthDetailReaders.isHidden = false
            txtDescriptionDetailReaders.isHidden = false
            
            txtTitleDetailSerie.isHidden = true
            txtAuthDetailSerie.isHidden = true
            txtDescriptionDetailSerie.isHidden = true
            
            txtTitleDetailReaders.text = txtTitleDetailSerie.text
            txtAuthDetailReaders.text = ""
            txtDescriptionDetailReaders.text = txtDescriptionDetailSerie.text
            txtDescriptionDetailReaders.sizeToFit()
            
            imgTable.isHidden = false
            
            let imageT = UIImage(named: "dvd_readers_table.png")
            
            imgTable.image = imageT
            
            imgPortada.isHidden = false
            
            let imageP = UIImage(named: "portadas_dvd_readers.jpg")
            
            
            imgPortada.image = imageP
            
            imgDetailSerie.isHidden = true
            self.txtComponents.text = "- Student’s Book (with portal access code)\n \n- eWorkbook\n \n- Split editions (except for Starter)\n \n- Learning Platform extra practice, audio and video"
            imgDet1.isHidden = true
            imgDet2.isHidden = true
            imgDet3.isHidden = true
            self.txtDet1.isHidden = true
            self.txtDet2.isHidden = true
            self.txtDet3.isHidden = true
            self.txtComponentsTeachers.text = "- Teacher’s Book \n \n- Class CD\n \n- DVD (ID Café) \n \n- Digital Book\n \n- Learning Platform with a full range of digital resources\n \n"
            self.txtMoreComponentsTeachers.isHidden = true
            
            let string = "Level A2:\n    Brilliant Brita in: The Seaside: 9786070606915\n    Take Away My Takeaway : Hong Kong: 9786070606861\n    Take Away My Takeaway : Texas: 9786070606854\n999 Emergency: 9781909221383\n    The British Royal Family:9781909221390\n\nLevel B1:\n    Brilliant Britain: Tea: 9786070606908\n    Changing World : 9781909221413\n    Take Away My Takeaway : Italy: 9786070606878\n    Eccentric Britain: 9781909221406\n    Brilliant Britain: Breakfasts: 9786070606892\n    Take Away My Takeaway :New Orleans: 9786070606885\n\n\n"
            
            let attributedString = NSMutableAttributedString(string: string as String, attributes: [NSFontAttributeName:UIFont.systemFont(ofSize: 14.0)])
            
            let boldFontAttribute = [NSFontAttributeName: UIFont.boldSystemFont(ofSize: 14.0)]
            
            // Part of string to be bold
            let str = NSString(string: string)
            
            let range1 = str.range(of:"Level A2:")
            let range2 = str.range(of:"Level B1:")
            
            attributedString.addAttributes(boldFontAttribute, range: range1)
            attributedString.addAttributes(boldFontAttribute, range: range2)
            
            self.txtISBNStudents.attributedText = attributedString
            self.txtISBNTeachers.isHidden = true
            self.txtTitleISBNStudents.isHidden = true
            self.txtTitleISBNTeachers.isHidden = true
            
        } else if viaSegueSerie == 66 {
            imgCEFR.image = UIImage(named: "richmond_mazes_cefr.png")
            
            unoImg.image = UIImage(named: "british.png")
            dosImg.image = UIImage(named: "levels4.png")
            tresImg.image = UIImage(named: "app.png")
            
            unoBtn.isHidden = false
            dosBtn.isHidden = false
            tresBtn.isHidden = false
            
            self.txtComponents.text = "- App"
            imgDet1.isHidden = true
            imgDet2.isHidden = true
            imgDet3.isHidden = true
            self.txtDet1.isHidden = true
            self.txtDet2.isHidden = true
            self.txtDet3.isHidden = true
            self.txtComponentsTeachers.text = "- App"
            self.txtMoreComponentsTeachers.isHidden = true
            
            let string = "Richmond Mazes - Escape From Pizza Plaza       9788466817431\nRichmond Mazes - Trouble at Paradise         9788466817448\nRichmond Mazes - Crisis at Clifton       9788466818513\n\n"
            
            let attributedString = NSMutableAttributedString(string: string as String, attributes: [NSFontAttributeName:UIFont.systemFont(ofSize: 14.0)])
            
            let boldFontAttribute = [NSFontAttributeName: UIFont.boldSystemFont(ofSize: 14.0)]
            
            // Part of string to be bold
            let str = NSString(string: string)
            
            let range1 = str.range(of:"Richmond Mazes - Escape From Pizza Plaza")
            let range2 = str.range(of:"Richmond Mazes - Trouble at Paradise")
            let range3 = str.range(of:"Richmond Mazes - Crisis at Clifton")
            
            attributedString.addAttributes(boldFontAttribute, range: range1)
            attributedString.addAttributes(boldFontAttribute, range: range2)
            attributedString.addAttributes(boldFontAttribute, range: range3)
            
            self.txtISBNStudents.attributedText = attributedString
            self.txtISBNTeachers.isHidden = true
            self.txtTitleISBNStudents.isHidden = true
            self.txtTitleISBNTeachers.isHidden = true
            
            
        } else if viaSegueSerie == 78 {
            imgCEFR.image = UIImage(named: "the_big_picture_cefr.png")
            
            unoImg.image = UIImage(named: "richmondlearning.png")
            dosImg.image = UIImage(named: "american_english.png")
            tresImg.image = UIImage(named: "levels6.png")
            cuatroImg.image = UIImage(named: "hours90_120.png")
            cincoImg.image = UIImage(named: "videos.png")
            seisImg.image = UIImage(named: "app.png")
            sieteImg.image = UIImage(named: "digital_book.png")
            ochoImg.image = UIImage(named: "digital_resources.png")
            
            unoBtn.isHidden = false
            dosBtn.isHidden = false
            tresBtn.isHidden = false
            cuatroBtn.isHidden = false
            cincoBtn.isHidden = false
            seisBtn.isHidden = false
            sieteBtn.isHidden = false
            ochoBtn.isHidden = false
            
            self.txtComponents.text = "- Student's Book\n \n- Workbook\n \n- Audio CD\n \n- Downloadable audio online\n \n- Split Edition Available\n \n- Interactive online activities\n \n- Learning Platform App"
            imgDet1.isHidden = true
            imgDet2.isHidden = true
            imgDet3.isHidden = true
            self.txtDet1.isHidden = true
            self.txtDet2.isHidden = true
            self.txtDet3.isHidden = true
            self.txtComponentsTeachers.text = "- Teacher’s Book\n \n- Class Audio CD\n \n- Digital Book\n \n- Test Studio\n \n- Online videos and author interviews\n \n- Learning Platform\n \n"
            self.txtMoreComponentsTeachers.isHidden = true
            
            let string = "The BIG Picture Student’s Book\n   Level A1          9788466815673\n   Level A2          9788466820769\n   Level A3          9788466820776\n\nThe BIG Picture Pack (WB+CD)\n   Level A1          7506009839595\n   Level A2          7506009834248\n   Level A3          7506009834255"
            
            let attributedString = NSMutableAttributedString(string: string as String, attributes: [NSFontAttributeName:UIFont.systemFont(ofSize: 14.0)])
            
            let boldFontAttribute = [NSFontAttributeName: UIFont.boldSystemFont(ofSize: 14.0)]
            
            // Part of string to be bold
            let str = NSString(string: string)
            
            let range1 = str.range(of:"The BIG Picture Student’s Book")
            let range2 = str.range(of:"The BIG Picture Pack (WB+CD)")
            
            attributedString.addAttributes(boldFontAttribute, range: range1)
            attributedString.addAttributes(boldFontAttribute, range: range2)
            
            let stringT = "The BIG Picture Teacher’s Book\n   Level A1          9788466815697\n   Level A2          9788466810579\n   Level A3          9788466810609\n\nThe BIG Picture Class Audio CDs\n   Level A1          9788466815703\n   Level A2          9788466812801\n   Level A3          9788466812825\n\nThe BIG Picture Digital Book\n   Level A1          9788466815710\n   Level A2          9788466812818\n   Level A3          9788466812832"
            
            let attributedStringT = NSMutableAttributedString(string: stringT as String, attributes: [NSFontAttributeName:UIFont.systemFont(ofSize: 14.0)])
            
            // Part of string to be bold
            let strT = NSString(string: stringT)
            
            let rangeT1 = strT.range(of:"The BIG Picture Teacher’s Book")
            let rangeT2 = strT.range(of:"The BIG Picture Class Audio CDs")
            let rangeT3 = strT.range(of:"The BIG Picture Digital Book")
            
            attributedStringT.addAttributes(boldFontAttribute, range: rangeT1)
            attributedStringT.addAttributes(boldFontAttribute, range: rangeT2)
            attributedStringT.addAttributes(boldFontAttribute, range: rangeT3)
            
            self.txtISBNStudents.attributedText = attributedString
            self.txtISBNTeachers.isHidden = false
            self.txtISBNTeachers.attributedText = attributedStringT
            
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
            self.txtISBNStudents.text = "Pack Pebbles (SB+CD+RSC Booklet+AP)\nLevel 1          7506009834934\nLevel 2          7506009834941\nLevel 3          7506009834958"
            self.txtISBNTeachers.text = "Pack Pebbles (Guia + Class CD)\nLevel 1          7506009835405\nLevel 2          7506009835412\nLevel 3          7506009835429\n\nFlashcards\nLevel 1          9786070605161\nLevel 2          9786070605208\nLevel 3          9786070605246\n\nFun Activity Mat (Level 1,2 and 3)\nLevel 1          9786070606649\nLevel 2          9786070606656\nLevel 3          9786070606663"
        }
        
        self.txtComponents.sizeToFit()
        self.txtComponentsTeachers.sizeToFit()
        
        self.txtISBNStudents.sizeToFit()
        
        let heightISBNS = heightForView(text: self.txtISBNStudents.text!, font: font!, width: 360.0)
        
        let xPositionISBNTT = txtTitleISBNTeachers.frame.origin.x
        
        //View will slide 20px up
        let yPositionISBNTT = txtISBNStudents.frame.origin.y + heightISBNS + 75
        
        print(yPositionISBNTT)
        
        let heightISBNTT = txtTitleISBNTeachers.frame.size.height
        let widthISBNTT = txtTitleISBNTeachers.frame.size.width
        
        txtTitleISBNTeachers.frame = CGRect(x: xPositionISBNTT, y: yPositionISBNTT, width: widthISBNTT, height: heightISBNTT)
        
        self.txtISBNTeachers.sizeToFit()
        
        let xPositionISBNTXT = txtISBNTeachers.frame.origin.x
        
        //View will slide 20px up
        let yPositionISBNTXT = txtISBNStudents.frame.origin.y + heightISBNS + 50 + heightISBNTT + 50
        
        print(yPositionISBNTXT)
        
        let heightISBNTXT = txtISBNTeachers.frame.size.height
        let widthISBNTXT = txtISBNTeachers.frame.size.width
        
        txtISBNTeachers.frame = CGRect(x: xPositionISBNTXT, y: yPositionISBNTXT, width: widthISBNTXT, height: heightISBNTXT )
        
        let xPositionISBNMT = txtTitleISBNMore.frame.origin.x
        
        //View will slide 20px up
        let yPositionISBNMT = txtISBNTeachers.frame.origin.y + heightISBNTXT  + 75
        
        let heightISBNMT = txtTitleISBNMore.frame.size.height
        let widthISBNMT = txtTitleISBNMore.frame.size.width
        
        txtTitleISBNMore.frame = CGRect(x: xPositionISBNMT, y: yPositionISBNMT, width: widthISBNMT, height: heightISBNMT)
        
        let xPositionISBNMTXT = txtISBNMore.frame.origin.x
        
        //View will slide 20px up
        let yPositionISBNMTXT = txtISBNTeachers.frame.origin.y + heightISBNTXT + 50 + heightISBNMT + 50
        
        
        let heightISBNMTXT = txtISBNMore.frame.size.height
        let widthISBNMTXT = txtISBNMore.frame.size.width
        
        txtISBNMore.frame = CGRect(x: xPositionISBNMTXT, y: yPositionISBNMTXT, width: widthISBNMTXT, height: heightISBNMTXT )
        
        self.txtISBNMore.sizeToFit()
        
        self.txtDet1.sizeToFit()
        self.txtDet2.sizeToFit()
        self.txtDet3.sizeToFit()
        self.txtDet4.sizeToFit()
        self.txtDet5.sizeToFit()
        self.txtDet6.sizeToFit()
        
        self.txtDetT1.sizeToFit()
        self.txtDetT2.sizeToFit()
        self.txtDetT3.sizeToFit()
        self.txtDetT4.sizeToFit()
        self.txtDetT5.sizeToFit()
        self.txtDetT6.sizeToFit()
        self.txtDetT7.sizeToFit()
        self.txtDetT8.sizeToFit()
        
  
    }
    
    @IBAction func regresar(){
        let _ = self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func openModal(_ sender: UIButton) {
        let vc = (
            storyboard?.instantiateViewController(
                withIdentifier: "simbolkey")
            )!
        vc.view.backgroundColor = UIColor(
            red: 0,
            green: 0,
            blue: 0,
            alpha: 0.4)
        vc.modalTransitionStyle = .crossDissolve
        present(vc, animated: true, completion: nil)
    }
    
    func heightForView(text:String, font:UIFont, width:CGFloat) -> CGFloat{
        
        var currHeight:CGFloat!
        
        let label:UILabel = UILabel(frame: CGRect(x:0, y:0, width: width, height: CGFloat.greatestFiniteMagnitude))
        label.numberOfLines = 0
        label.lineBreakMode = NSLineBreakMode.byWordWrapping
        label.font = font
        label.text = text
        label.sizeToFit()
        
        currHeight = label.frame.height
        label.removeFromSuperview()
        
        return currHeight
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
    
    
    @IBAction func home(){
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "CategoriasTableViewController") as! CategoriasTableViewController
        self.navigationController?.pushViewController(vc, animated: true)
        //print("Tiendas")
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













