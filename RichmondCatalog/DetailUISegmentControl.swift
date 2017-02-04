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
    
    @IBOutlet weak var unoBtn: UIButton!
    @IBOutlet weak var dosBtn: UIButton!
    @IBOutlet weak var tresBtn: UIButton!
    @IBOutlet weak var cuatroBtn: UIButton!
    @IBOutlet weak var cincoBtn: UIButton!
    @IBOutlet weak var seisBtn: UIButton!
    @IBOutlet weak var sieteBtn: UIButton!
    @IBOutlet weak var ochoBtn: UIButton!
    
    @IBOutlet weak var imgDetailSerie: UIImageView!
    @IBOutlet weak var imgSampleUnit: UIImageView!
    @IBOutlet weak var imgScope: UIImageView!
    
    @IBOutlet weak var imgCEFR: UIImageView!
    
    @IBOutlet weak var txtTitleDetailSerie: UILabel!
    @IBOutlet weak var txtAuthDetailSerie: UILabel!
    @IBOutlet weak var txtDescriptionDetailSerie: UITextView!
    
    @IBOutlet weak var txtTitleDetailReaders: UILabel!
    @IBOutlet weak var txtAuthDetailReaders: UILabel!
    @IBOutlet weak var txtDescriptionDetailReaders: UITextView!
    
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
    @IBOutlet weak var imgDet4: UIImageView!
    @IBOutlet weak var imgDet5: UIImageView!
    @IBOutlet weak var imgDet6: UIImageView!
    
    @IBOutlet weak var txtDet1: UITextView!
    @IBOutlet weak var txtDet2: UITextView!
    @IBOutlet weak var txtDet3: UITextView!
    @IBOutlet weak var txtDet4: UITextView!
    @IBOutlet weak var txtDet5: UITextView!
    @IBOutlet weak var txtDet6: UITextView!
    
    @IBOutlet weak var imgTable: UIImageView!
    
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
        
        /* Edition start */
        if viaSegueSerie == 1 {
            self.txtComponents.isHidden = true
            
            imgDet1.isHidden = false;
            imgDet2.isHidden = false;
            
            txtDet1.isHidden = false;
            txtDet2.isHidden = false;
            
            imgDet1.image = UIImage(named: "student_book_cubby.png")
            imgDet2.image = UIImage(named: "student_cd_cubby.png")
            
            unoImg.image = UIImage(named: "levels3.png")
            dosImg.image = UIImage(named: "hours1_3.png")
            
            unoBtn.isHidden = false
            dosBtn.isHidden = false
            
            self.txtDet1.text = "Student’s Book\n\n El Student’s Book contiene páginas con ilustraciones o fotografías a todo color para representar el léxico y las estructuras de forma más clara, memorable y atractiva."
            self.txtDet2.text = "Student’s CD\n\n Cubby House incluye un CD con las canciones, cantos, rimas e historias de la serie, para que los alumnos pueden escucharlos cuantas veces quieran y consoliden lo aprendido en clase."
            
            self.txtComponentsTeachers.text = "- Guía del Maestro (In Spanish)\n\n- Class & Resource CD\n\n- Story Cards\n\n- Flashcards"
            self.txtMoreComponentsTeachers.text = "In the Teacher’s Guide, teacher’s will  nd instructions to build a play house—similar to those in the Values section—where students can develop their creativity and motor skills.\n\nTeachers will also  nd suggestions to use the cubby houses— children can keep their toys or school materials inside or get in to color and play.\n\nBy building their cubby houses, students will enjoy themselves while understanding and visualizing the value in a more memorable way!"
            self.txtISBNStudents.text = "Pack Cubby House (SB+CD)\nLevel 1          7506009844452\nLevel 2          7506009844469\nLevel 3          7506009844476"
            self.txtISBNTeachers.text = "Pack Cubby House (GUIA+CLASS +FLASH)\nLevel 1          7506009845176\nLevel 2          7506009845206\nLevel 3          7506009845183\n\nStory Cards\nLevel 1          7506009843745\nLevel 2          7506009843752\nLevel 3          7506009843769"
            
        } else if viaSegueSerie == 2 {
            self.txtComponents.isHidden = true
            
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
            
            self.txtComponentsTeachers.text = "-Teacher’s Guide in Spanish\n \n-Class CD\n \n-Flashcards\n \n-Fun Activity Mat with Pebble Puppet\n \n"
            self.txtMoreComponentsTeachers.isHidden = true
            self.txtISBNStudents.text = "Pack Pebbles (SB+CD+RSC Booklet+AP)\nLevel 1          7506009834934\nLevel 2          7506009834941\nLevel 3          7506009834958"
            self.txtISBNTeachers.text = "Pack Pebbles (Guia + Class CD)\nLevel 1          7506009835405\nLevel 2          7506009835412\nLevel 3          7506009835429\n\nFlashcards\nLevel 1          9786070605161\nLevel 2          9786070605208\nLevel 3          9786070605246\n\nFun Activity Mat (Level 1,2 and 3)\nLevel 1          9786070606649\nLevel 2          9786070606656\nLevel 3          9786070606663"
            
        } else if viaSegueSerie == 3 {
            self.txtComponents.isHidden = true
            
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
            
            self.txtComponentsTeachers.text = "- Teacher’s Guide\n \n-Big Books\n \n-Posters &amp; Cutouts\n \n-Teacher’s Resource CD-ROM\n \n-Class Audio\n \n-Classroom Language Cards\n \n-Digital Book\n \n"
            self.txtMoreComponentsTeachers.isHidden = true
            self.txtISBNStudents.text = "Pack Gumdrops (SB&TN+CD&CLASS CD)\nLevel 1          N/A\nLevel 2          N/A\nLevel 3          N/A\nLevel N          7506009837508\n\nPack Gumdrops (SB+CD+RSC Pack)\nLevel 1          7506009837515\nLevel 2          7506009837522\nLevel 3          7506009837539\nLevel N          N/A\n\nActivity Pad\nLevel 1          9786070607394\nLevel 2          9786070607400\nLevel 3          9786070607417\nLevel N          N/A"
            self.txtISBNTeachers.text = "Pack Gumdrops (TG+Class CD)\nLevel 1          7506009837546\nLevel 2          7506009837553\nLevel 3          7506009837560\nLevel N          N/A\n\nBig Book\nLevel 1          9786070607424\nLevel 2          9786070607431\nLevel 3          9786070607448\nLevel N          N/A\n\nPosters & Posters Cutouts\nLevel 1          7506009836471\nLevel 2          7506009836488\nLevel 3          7506009836495\nLevel N          N/A\n\nTeacher's Resource CD-ROM\nLevel 1          7506009836402\nLevel 2          7506009836433\nLevel 3          7506009836464\nLevel N          N/A\n\nClassroom Language Cards (Level 1,2 and 3)\nLevel 1          9786070607455\nLevel 2          9786070607455\nLevel 3          9786070607455\nLevel N          N/A\n\nDigital Book DVD (Level 1,2 and 3)\nLevel 1          7506009844179\nLevel 2          7506009844179\nLevel 3          7506009844179\nLevel N          N/A"
            
        } else if viaSegueSerie == 4 {
            self.txtComponents.isHidden = true
            
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
            tresImg.image = UIImage(named: "hours3_5.png")
            cuatroImg.image = UIImage(named: "digital_book.png")
            cincoImg.image = UIImage(named: "audio.png")
            seisImg.image = UIImage(named: "digital_resources.png")
            sieteImg.image = UIImage(named: "digital_resources.png")
            
            unoBtn.isHidden = false
            dosBtn.isHidden = false
            tresBtn.isHidden = false
            cuatroBtn.isHidden = false
            cincoBtn.isHidden = false
            seisBtn.isHidden = false
            sieteBtn.isHidden = false
            
            self.txtComponentsTeachers.text = "-Teacher’s Book \n \n-Class CD\n \n-Big Book\n \n-Posters &amp; Cutouts \n \n-Fun Activity Mat \n \n-Puppets (Level 3) \n \n-Digital Book\n \n"
            self.txtMoreComponentsTeachers.isHidden = true
            self.txtISBNStudents.text = "Pack Tippy Toes (SB+CD+STK+MY FIRST...)\nLevel 1          7506009842755\nLevel 2          7506009842762\nLevel 3          7506009842779\n\nActivity Book\nLevel 1          9786070602641\nLevel 2          9786070602658\nLevel 3          9786070602665"
            self.txtISBNTeachers.isHidden = false
            self.txtISBNTeachers.text = "Teacher’s Guide\nLevel 1          9786070602672\nLevel 2          9786070602689\nLevel 3          9786070602696\n\nClass CD\nLevel 1          7506009807518\nLevel 2          7506009807525\nLevel 3          7506009807532\n\nBig Book\nLevel 1          9786070602702\nLevel 2          9786070602719\nLevel 3          9786070602726\n\nPosters & Cutouts\nLevel 1          7506009807181\nLevel 2          7506009807198\nLevel 3          7506009807204\n\nFun Activity Mat (Level 1,2 and 3)\nLevel 1          9786070606649\nLevel 2          9786070606656\nLevel 3          9786070606663\n\nPuppets (Level 3)\nLevel 1          N/A\nLevel 2          N/A\nLevel 3          7506009807846\nDigital Book DVD (Level 1,2 and 3)\nLevel 1          7506009844162\nLevel 2          7506009844162\nLevel 3          7506009844162"
            
        } else if viaSegueSerie == 11 {
            
            self.txtComponents.isHidden = true
            
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
            self.txtISBNStudents.text = "Pack Crickets Nursery (SB+CLASS & RCD)\nLevel 1          N/A\nLevel 2          N/A\nLevel 3          N/A\nLevel N          7506009842489\n\nPack Crickets (SB+CD+TALES)\nLevel 1          7506009842571\nLevel 2          7506009842588\nLevel 3          7506009842595\nLevel N          N/A\nPractice Book\nLevel 1          9786070610783\nLevel 2          9786070610738\nLevel 3          9786070610745\nLevel N          N/A"
            self.txtISBNTeachers.isHidden = false
            self.txtISBNTeachers.text = "Pack Crickets Teacher (TG+TR+SC+F+TA+CLF)\nLevel 1          7506009842601\nLevel 2          7506009842618\nLevel 3          7506009842625\nLevel N          N/A\n\nFlashcards (Level N)\nLevel 1          7506009842502\nLevel 2          N/A\nLevel 3          N/A\nLevel N          N/A\n\nDigital Book DVD (Level 1,2 and 3)\nLevel 1          N/A\nLevel 2          7506009844186\nLevel 3          7506009844186\nLevel N          7506009844186"
            
            
        } else if viaSegueSerie == 5 {
            
            self.txtComponents.isHidden = true
            
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
            self.txtISBNStudents.text = "Pack Crickets Nursery (SB+CLASS & RCD)\nLevel 1          N/A\nLevel 2          N/A\nLevel 3          N/A\nLevel N          7506009842489\n\nPack Crickets (SB+CD+TALES)\nLevel 1          7506009842571\nLevel 2          7506009842588\nLevel 3          7506009842595\nLevel N          N/A\nPractice Book\nLevel 1          9786070610783\nLevel 2          9786070610738\nLevel 3          9786070610745\nLevel N          N/A"
            self.txtISBNTeachers.isHidden = false
            self.txtISBNTeachers.text = "Pack Crickets Teacher (TG+TR+SC+F+TA+CLF)\nLevel 1          7506009842601\nLevel 2          7506009842618\nLevel 3          7506009842625\nLevel N          N/A\n\nFlashcards (Level N)\nLevel 1          7506009842502\nLevel 2          N/A\nLevel 3          N/A\nLevel N          N/A\n\nDigital Book DVD (Level 1,2 and 3)\nLevel 1          N/A\nLevel 2          7506009844186\nLevel 3          7506009844186\nLevel N          7506009844186"
        
            
        } else if viaSegueSerie == 8 {
            
            self.txtComponents.isHidden = true
            
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
            
            self.txtComponentsTeachers.text = "- Teacher’s Guide with Pocket Cube\n \n- Resource Pack \n \n- Teacher’s Resource CD \n \n- Digital Book\n \n"
            self.txtMoreComponentsTeachers.isHidden = true
            self.txtISBNStudents.text = "Pack Math A. (SB+RESOURCE+SRCD)\nLevel 2          7506009842816\nLevel 3          7506009842823"
            self.txtISBNTeachers.text = "Pack Math A. (TG+TCD+RES+CUBE)\nLevel 2          7506009842359\nLevel 3          7506009842366"
            
        } else if viaSegueSerie == 9 {
            imgCEFR.image = UIImage(named: "abracadabra_cefr.png")
            self.txtComponents.text = "- Student’s Book \n \n- Student’s CD"
            imgDet1.isHidden = true
            imgDet2.isHidden = true
            imgDet3.isHidden = true
            self.txtDet1.isHidden = true
            self.txtDet2.isHidden = true
            self.txtDet3.isHidden = true
            self.txtComponentsTeachers.text = "- Teacher’s Guide in Spanish\n \n- Flashcards\n \n- Teacher’s Resource CD with Audio\n \n- Digital Book\n \n"
            self.txtMoreComponentsTeachers.isHidden = true
            self.txtISBNStudents.text = "Pack Abracadabra (SB + CD)\nLevel 1          7506009840263\nLevel 2          7506009840270\nLevel 3          7506009840287\nLevel 4          7506009840294\nLevel 5          7506009840300\nLevel 6          7506009840317"
            self.txtISBNTeachers.text = "Pack Abracadabra (GM+TRCD)\nLevel 1          7506009840638\nLevel 2          7506009840645\nLevel 3          7506009840652\nLevel 4          7506009840676\nLevel 5          7506009840669\nLevel 6          7506009840683\n\nFlashcards\nLevel 1          9786070609350\nLevel 2          9786070609374\nLevel 3          9786070609367\nLevel 4          9786070609398\nLevel 5          9786070609381\nLevel 6          9786070610097\n\nDigital Book CD\nLevel 1          9786070612985\nLevel 2          9786070613005\nLevel 3          9786070613029\nLevel 4          9786070612749\nLevel 5          9786070612961\nLevel 6          9786070612954"
            
        } else if viaSegueSerie == 10 {
            imgCEFR.image = UIImage(named: "beep_cefr.png")
            
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
            
            self.txtComponents.text = "Student’s Book & Activity Book combo\n \n-Student’s Audio CD\n \n-Playing Cards & Stickers (Levels 1 and 2)\n \n-Playing Cards (Levels 3 and 4)"
            imgDet1.isHidden = true
            imgDet2.isHidden = true
            imgDet3.isHidden = true
            self.txtDet1.isHidden = true
            self.txtDet2.isHidden = true
            self.txtDet3.isHidden = true
            self.txtComponentsTeachers.text = "- Teacher’s Book \n \n-Posters \n \n-Flashcards\n \n-Puppet included in the  ashcards pack (Levels 1 and 2)\n \n-Class Audio & Resource CD\n \n-Digital Book\n \n"
            self.txtMoreComponentsTeachers.isHidden = true
            self.txtISBNStudents.text = "Pack Beep (SB&AB+PC+ Stickers+CD)\nLevel 1          7506009840102\nLevel 2          7506009840119\nLevel 3          N/A\nLevel 4          N/A\nLevel 5          N/A\nLevel 6          N/A\n\nPack Beep (SB&AB+PlayingCards+CD)\nLevel 1          N/A\nLevel 2          N/A\nLevel 3          7506009840324\nLevel 4          7506009840126\nLevel 5          N/A\nLevel 6          N/A\n\nPack Beep (SB&AB+CD)\nLevel 1          N/A\nLevel 2          N/A\nLevel 3          N/A\nLevel 4          N/A\nLevel 5          7506009840331\nLevel 6          7506009840133"
            self.txtISBNTeachers.text = "Pack Beep (TB + Class CD + Flashcards)\nLevel 1          7506009840348\nLevel 2          7506009840355\nLevel 3          7506009840362\nLevel 4          7506009840379\nLevel 5          7506009840386\nLevel 6          7506009840393\n\nPosters\nLevel 1          7506009839533\nLevel 2          7506009839540\nLevel 3          7506009839557\nLevel 4          7506009839564\nLevel 5          7506009839571\nLevel 6          7506009839588\n\nDigital Book CD\nLevel 1          9786070613036\nLevel 2          9786070612862\nLevel 3          9786070612909\nLevel 4          9786070612978\nLevel 5          9786070612886\nLevel 6          9786070612923"
            
        } else if viaSegueSerie == 12 {
            imgCEFR.image = UIImage(named: "cool_kids_second_edition_cefr.png")
            
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
            self.txtISBNStudents.text = "Pack Cool Kids SE\nLevel 1          7506009846265\nLevel 2          7506009846272\nLevel 3          7506009846289\nLevel 4          7506009846296\nLevel 5          7506009846302\nLevel 6          7506009846319\n\nWorkbook\nLevel 1          *TBA\nLevel 2          *TBA\nLevel 3          *TBA\nLevel 4          *TBA\nLevel 5          *TBA\nLevel 6          *TBA"
            self.txtISBNTeachers.isHidden = false
            self.txtISBNTeachers.text = "Pack Cool Kids SE (Teacher’s Guide)\nLevel 1          7506009846388\nLevel 2          7506009846395\nLevel 3          7506009846401\nLevel 4          7506009846418\nLevel 5          7506009846425\nLevel 6          7506009846432\n\nPack Cool Kids SE (Guía del Maestro)\nLevel 1          7506009846449\nLevel 2          7506009846456\nLevel 3          7506009846463\nLevel 4          7506009846470\nLevel 5          7506009846487\nLevel 6          7506009846494"
            
        } else if viaSegueSerie == 13 {
            imgCEFR.image = UIImage(named: "lighthouse_cefr.png")
            
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
            
            self.txtComponents.text = "- Student’s Book\n \n- Student’s CD \n \n- Activity Book \n \n- Stickers"
            imgDet1.isHidden = true
            imgDet2.isHidden = true
            imgDet3.isHidden = true
            self.txtDet1.isHidden = true
            self.txtDet2.isHidden = true
            self.txtDet3.isHidden = true
            self.txtComponentsTeachers.text = "- Teacher’s Book\n \n- Class CD &amp; CD-ROM\n \n- Puzzles (levels 1-3)\n \n- Word Kits (levels 4-6) \n \n- Digital Book\n \n- Poster with Word Cards and Cutouts\n \n"
            self.txtMoreComponentsTeachers.isHidden = true
            self.txtISBNStudents.text = "Pack Lighthouse (SB + CD + Stickers)\nLevel 1          7506009805163\nLevel 2          7506009805170\nLevel 3          7506009805187\nLevel 4          7506009805194\nLevel 5          7506009805200\nLevel 6          7506009805217\n\nActivity Book\nLevel 1          9786076000427\nLevel 2          9786076000069\nLevel 3          9786076000700\nLevel 4          9786076000458\nLevel 5          9786076000403\nLevel 6          9786076000922"
            self.txtISBNTeachers.isHidden = false
            self.txtISBNTeachers.text = "Teacher’s Book\nLevel 1          9786076000441\nLevel 2          9786076000090\nLevel 3          9786076000717\nLevel 4          9786076000106\nLevel 5          9786076000410\nLevel 6          9786076000946\n\nClass CDs & CR ROM\nLevel 1          7506009804371\nLevel 2          7506009804418\nLevel 3          7506009804456\nLevel 4          7506009804494\nLevel 5          7506009804531\nLevel 6          7506009804579\n\nPoster & Cutouts\nLevel 1          7506009802414\nLevel 2          7506009802421\nLevel 3          7506009802438\nLevel 4          7506009802445\nLevel 5          7506009802452\nLevel 6          7506009802469\n\nPuzzles\nLevel 1          9786076000144\nLevel 2          9786076000083\nLevel 3          9786076000885\n\nWord Kits\nLevel 4          9786076000076\nLevel 5          9786076000397\nLevel 6          9786076000953\n\nDigital Book CD\nLevel 1          9786070608643\nLevel 2          9786070608650\nLevel 3          9786070608667\nLevel 4          9786070608667\nLevel 5          9786070608681\nLevel 6          9786070608698"
            
        } else if viaSegueSerie == 21 {
            imgCEFR.image = UIImage(named: "oathway_to_grammar_cefr.png")
            
            self.txtComponents.text = "- Student’s Book with Audio CD"
            imgDet1.isHidden = true
            imgDet2.isHidden = true
            imgDet3.isHidden = true
            self.txtDet1.isHidden = true
            self.txtDet2.isHidden = true
            self.txtDet3.isHidden = true
            self.txtComponentsTeachers.text = "- Teacher’s Booklet\n \n"
            self.txtMoreComponentsTeachers.isHidden = true
            self.txtISBNStudents.text = "Pack Pathway to Grammar (SB + CD)\nLevel 1          7506009842830\nLevel 2          7506009842847\nLevel 3          7506009842854\nLevel 4          7506009842861\nLevel 5          7506009842878\nLevel 6          7506009842885"
            self.txtISBNTeachers.text = "Teacher’s Booklet\nLevel 1          9786070610837\nLevel 2          9786070610981\nLevel 3          9786070610998\nLevel 4          9786070611001\nLevel 5          9786070611018\nLevel 6          9786070611025"
            
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
            self.txtISBNStudents.isHidden = false
            self.txtISBNStudents.text = "Pack Pathway to Math (SB + AC)\nLevel 1          7506009844391\nLevel 2          N/A\nLevel 3          N/A\nLevel 4          7506009844421\nLevel 5          N/A\nLevel 6          N/A\n\nPathway to Math Student’s Book\nLevel 1          N/A\nLevel 2          9786070612565\nLevel 3          9786070612572\nLevel 4          N/A\nLevel 5          9786070612596\nLevel 6          9786070612602"
            self.txtISBNTeachers.isHidden = false
            self.txtISBNTeachers.text = "Pack Pathway to Math (TG+R&E+EVAL+DB)\nLevel 1          7506009845244\nLevel 2          7506009845251\nLevel 3          7506009845268\nLevel 4          7506009845275\nLevel 5          7506009845282\nLevel 6          7506009845299"
            
            
        } else if viaSegueSerie == 15 {
            imgCEFR.image = UIImage(named: "thumb_up_second_edition_cefr.png")
            
            unoImg.image = UIImage(named: "richmondsolution.png")
            dosImg.image = UIImage(named: "levels6.png")
            tresImg.image = UIImage(named: "microsite.png")
            
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
            self.txtISBNStudents.text = "Student’s Book\nLevel 1          9786070611087\nLevel 2          9786070611032\nLevel 3          9786070611094\nLevel 4          9786070611100\nLevel 5          976070611049\nLevel 6          9786070611056"
            self.txtISBNTeachers.text = "Teacher’s Resource CD\nLevel 1          7506009842403\nLevel 2          7506009842410\nLevel 3          7506009842427\nLevel 4          7506009842434\nLevel 5          7506009842441\nLevel 6          7506009842458\n"
            
        } else if viaSegueSerie == 19 {
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
            
            self.txtComponents.text = "- Student’s Book with Activity Cards"
            imgDet1.isHidden = true
            imgDet2.isHidden = true
            imgDet3.isHidden = true
            self.txtDet1.isHidden = true
            self.txtDet2.isHidden = true
            self.txtDet3.isHidden = true
            self.txtComponentsTeachers.text = "- Teacher’s Guide\n \n- Reinforcement and Extension Worksheets\n \n- Evaluations \n \n- Digital Book\n \n"
            self.txtMoreComponentsTeachers.isHidden = true
            self.txtISBNStudents.text = "Student’s Book\nLevel 1          9786070611087\nLevel 2          9786070611032\nLevel 3          9786070611094\nLevel 4          9786070611100\nLevel 5          976070611049\nLevel 6          9786070611056"
            self.txtISBNTeachers.text = "Teacher’s Resource CD\nLevel 1          7506009842403\nLevel 2          7506009842410\nLevel 3          7506009842427\nLevel 4          7506009842434\nLevel 5          7506009842441\nLevel 6          7506009842458\n"
            
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
            self.txtISBNStudents.text = "Pack Pathway to Science (SB + SB/AC)\nLevel 1          7506009840041\nLevel 2          7506009840058\nLevel 3          7506009840065\nLevel 4          7506009840072\nLevel 5          7506009840089\nLevel 6          7506009840096\n"
            self.txtISBNTeachers.text = "Pack Pathway to Science (Tg+Evaluations+R&E)\nLevel 1          7506009840409\nLevel 2          7506009840416\nLevel 3          7506009840423\nLevel 4          7506009840430\nLevel 5          7506009840447\nLevel 6          7506009840454"
            
        } else if viaSegueSerie == 17 {
            imgCEFR.image = UIImage(named: "science_and_geography_cefr.png")
            
            self.txtComponents.text = "- Student’s Book"
            imgDet1.isHidden = true
            imgDet2.isHidden = true
            imgDet3.isHidden = true
            self.txtDet1.isHidden = true
            self.txtDet2.isHidden = true
            self.txtDet3.isHidden = true
            self.txtComponentsTeachers.text = "- Teacher’s Book \n \n- Resource Book \n \n- Posters\n \n"
            self.txtMoreComponentsTeachers.isHidden = true
            self.txtISBNStudents.text = "Pack Science & Geography (SB+CD-ROM)\nLevel 1          7506009837447\nLevel 2          7506009837454\nLevel 3          7506009837461\nLevel 4          7506009837478\nLevel 5          7506009837485\nLevel 6          7506009837492\n"
            self.txtISBNTeachers.text = "Science and Geography Teacher’s Book\nLevel 1          9786076000489\nLevel 2          9786076000526\nLevel 3          9786076000519\nLevel 4          9786076000496\nLevel 5          9786076000663\nLevel 6          9786076000670\n\nScience and Geography Posters\nLevel 1          7506009805668\nLevel 2          7506009805675\nLevel 3          7506009805682\nLevel 4          7506009805699\nLevel 5          7506009805705\nLevel 6          7506009805712\n\nScience and Geography Resource Book\nLevel 1          9786076001004\nLevel 2          9786076000540\nLevel 3          9786076000533\nLevel 4          9786076000892\nLevel 5          9786076001028\nLevel 6          9786076001011"
            
        } else if viaSegueSerie == 14 {
            imgCEFR.image = UIImage(named: "skyrocket_cefr.png")
            
            unoImg.image = UIImage(named: "richmondsolution.png")
            dosImg.image = UIImage(named: "levels6.png")
            tresImg.image = UIImage(named: "hours5_75.png")
            cuatroImg.image = UIImage(named: "digital_book.png")
            cincoImg.image = UIImage(named: "audio.png")
            seisImg.image = UIImage(named: "digital_resources.png")
            sieteImg.image = UIImage(named: "british.png")
            ochoImg.image = UIImage(named: "microsite.png")
            
            unoBtn.isHidden = false
            dosBtn.isHidden = false
            tresBtn.isHidden = false
            cuatroBtn.isHidden = false
            cincoBtn.isHidden = false
            seisBtn.isHidden = false
            sieteBtn.isHidden = false
            ochoBtn.isHidden = false
            
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
            self.txtISBNStudents.text = "Student’s Book\nLevel 1          9786070608827\nLevel 2          9786070608834\nLevel 3          978607060884\nLevel 4          9786070609503\nLevel 5          9786070609510\nLevel 6          9786070608858\n\nPack Skyrocket (PB+CD)\nLevel 1          7506009839908\nLevel 2          7506009839915\nLevel 3          7506009839922\nLevel 4          7506009839939\nLevel 5          7506009839946\nLevel 6          7506009839953\n\nSkyrocket Your Grammar Student’s Book\nLevel 1          9786070608995\nLevel 2          7506009839915\nLevel 3          9786070608872\nLevel 4          9786070609541\nLevel 5          9786070609558\nLevel 6          9786070609008\n\nPack Skyrocket (SB+PRACTICE+CD+GRAMMAR)\nLevel 1          7506009841093\nLevel 2          7506009841109\nLevel 3          7506009841116\nLevel 4          7506009841123\nLevel 5          7506009841130\nLevel 6          7506009841147"
            self.txtISBNTeachers.text = "Pack Skyrocket (TG+CA+RCD)\nLevel 1          7506009839960\nLevel 2          7506009839984\nLevel 3          7506009840461\nLevel 4          7506009840478\nLevel 5          7506009840485\nLevel 6          7506009840492\n\nPack Skyrocket Your Grammar (TG+CA)\nLevel 1          7506009839977\nLevel 2          7506009839991\nLevel 3          7506009840003\nLevel 4          7506009840010\nLevel 5          7506009840027\nLevel 6          7506009840034\n\nPosters with Word Cards\nLevel 1          7506009836600\nLevel 2          7506009836617\nLevel 3          7506009836624\nLevel 4          7506009836631\nLevel 5          7506009836648\nLevel 6          7506009836655\n\nDigital Media Projects\nLevel 1          N/A\nLevel 2          N/A\nLevel 3          7506009839861\nLevel 4          7506009839878\nLevel 5          7506009839885\nLevel 6          7506009839892\n\nDigital Book DVD\nLevel 1          9786070612947\nLevel 2          9786070612848\nLevel 3          9786070612824\nLevel 4          9786070612756\nLevel 5          9786070612725\nLevel 6          9786070613043"
            
        } else if viaSegueSerie == 22 {
            
            imgCEFR.image = UIImage(named: "spotlight_on_english_cefr.png")
            
            unoImg.image = UIImage(named: "british.png")
            dosImg.image = UIImage(named: "levels6.png")
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
            self.txtISBNStudents.text = "Pack Student’s Spotlight\nLevel 1          7506009835856\nLevel 2          7506009835863\nLevel 3          7506009835870\nLevel 4          7506009835887\nLevel 5          7506009835894\nLevel 6          7506009835900\nLevel K          7506009835849\n\nStudent’s Book\nLevel 1          9786070601262\nLevel 2          9786070601316\nLevel 3          9786070601408\nLevel 4          9786070601453\nLevel 5          9786070601507\nLevel 6          9786070601545\nLevel K          9786070601255\n\nActivity Pad\nLevel 1          N/A\nLevel 2          N/A\nLevel 3          N/A\nLevel 4          N/A\nLevel 5          N/A\nLevel 6          N/A\nLevel K          9786070601361\n\nPractice Book\nLevel 1          9786070601279\nLevel 2          9786070601323\nLevel 3          9786070601415\nLevel 4          9786070601460\nLevel 5          9786070601514\nLevel 6          9786070601552\nLevel K          N/A\n\nAssessments\nLevel 1          9786070601286\nLevel 2          9786070601330\nLevel 3          9786070601422\nLevel 4          9786070601477\nLevel 5          9786070601521\nLevel 6          9786070601569\nLevel K          9786070601378\n\nPack Spotlight Thematic Library\nLevel 1          7506009807983\nLevel 2          7506009807990\nLevel 3          7506009808003\nLevel 4          7506009808010\nLevel 5          7506009808027\nLevel 6          7506009808034\nLevel K          N/A\n\nInteractive CD-ROM\nLevel 1          7506009807785\nLevel 2          7506009807792\nLevel 3          7506009807808\nLevel 4          7506009807815\nLevel 5          7506009807822\nLevel 6          7506009807839\nLevel K          7506009807716"
            self.txtISBNTeachers.text = "Teacher’s Guide\nLevel 1          9786070601309\nLevel 2          9786070601354\nLevel 3          9786070601439\nLevel 4          9786070601491\nLevel 5          9786070601668\nLevel 6          9786070601675\nLevel K          9786070601392\n\nAssessments Teacher’s Manual\nLevel 1          9786070601293\nLevel 2          9786070601347\nLevel 3          9786070601446\nLevel 4          9786070601484\nLevel 5          9786070601538\nLevel 6          9786070601576\nLevel K          9786070601385\n\nBlackline Masters\nLevel 1          7506009806658\nLevel 2          7506009806665\nLevel 3          7506009806672\nLevel 4          7506009806689\nLevel 5          7506009806696\nLevel 6          7506009806702\nLevel K          7506009806641\n\nTeacher’s Digital Resource\nLevel 1          7506009807723\nLevel 2          7506009807730\nLevel 3          7506009807747\nLevel 4          7506009807754\nLevel 5          7506009807761\nLevel 6          7506009807778\nLevel K          N/A\n\nAudio CD\nLevel 1          7506009806580\nLevel 2          7506009806597\nLevel 3          7506009806603\nLevel 4          7506009806610\nLevel 5          7506009806627\nLevel 6          7506009806634\nLevel K          7506009806573\n\nPoster with Cutouts\nLevel 1          N/A\nLevel 2          N/A\nLevel 3          N/A\nLevel 4          N/A\nLevel 5          N/A\nLevel 6          N/A\nLevel K          7506009806559"
            
        } else if viaSegueSerie == 27 {
            imgCEFR.image = UIImage(named: "achievers_cefr.png")
            
            unoImg.image = UIImage(named: "richmondspiral.png")
            dosImg.image = UIImage(named: "levels6.png")
            tresImg.image = UIImage(named: "hours5.png")
            cuatroImg.image = UIImage(named: "digital_book.png")
            cincoImg.image = UIImage(named: "audio.png")
            seisImg.image = UIImage(named: "digital_resources.png")
            sieteImg.image = UIImage(named: "british.png")
            ochoImg.image = UIImage(named: "microsite.png")
            
            unoBtn.isHidden = false
            dosBtn.isHidden = false
            tresBtn.isHidden = false
            cuatroBtn.isHidden = false
            cincoBtn.isHidden = false
            seisBtn.isHidden = false
            sieteBtn.isHidden = false
            ochoBtn.isHidden = false
            
            self.txtComponents.text = "- Student’s Book \n \n- Workbook \n \n- Audio CD \n \n- Richmond Spiral Platform"
            imgDet1.isHidden = true
            imgDet2.isHidden = true
            imgDet3.isHidden = true
            self.txtDet1.isHidden = true
            self.txtDet2.isHidden = true
            self.txtDet3.isHidden = true
            self.txtComponentsTeachers.text = "- Teacher’s Book\n \n- Teacher’s Resource Book\n \n- Teacher’s Digital Book\n \n- Teacher’s Audio Material Pack\n \n- Richmond Spiral Platform\n \n"
            self.txtMoreComponentsTeachers.isHidden = true
            self.txtISBNStudents.text = "Achievers Student’s Book\nLevel 1          9788466829434\nLevel 2          9788466829069\nLevel 3          9788466829229\nLevel 4          9788466829137\nLevel 5          9788466829656\nLevel 6          9788466829335\n\nPack Achievers (WB+AUDIO CD)\nLevel 1          7506009843455\nLevel 2          7506009843462\nLevel 3          7506009843479\nLevel 4          7506009843486\nLevel 5          7506009843493\nLevel 6          7506009844315"
            self.txtISBNTeachers.text = "Pack Achievers (TG+TRB+AUDIO MATERIAL)\nLevel 1          7506009843646\nLevel 2          7506009843615\nLevel 3          7506009843622\nLevel 4          7506009843639\nLevel 5          7506009843653\nLevel 6          7506009844483\n\nTeacher’s l-Book\nLevel 1          9788466829571\nLevel 2          9788466829380\nLevel 3          9788466829106\nLevel 4          9788466829557\nLevel 5          9788466829915\nLevel 6          TBA"
            
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
            self.txtISBNStudents.text = "Awesome NE Student’s Book\nLevel 1          9786070609701\nLevel 2          9786070609831\nLevel 3          9786070609855\nLevel 4          9786070609848\n\nPack Awesome NE (PB+RG)\nLevel 1          7506009840829\nLevel 2          7506009841086\nLevel 3          7506009841154\nLevel 4          7506009841161"
            self.txtISBNTeachers.text = "Awesome NE Teacher’s Book\nLevel 1          9786070609909\nLevel 2          9786070609916\nLevel 3          9786070609923\nLevel 4          9786070609930\n\nAwesome NE Resource Book\nLevel 1          9786070609985\nLevel 2          9786070609992\nLevel 3          9786070610004\nLevel 4          9786070610011\n\nAwesome NE Teacher’s CD Pack (Class+Interactive)\nLevel 1          7506009841178\nLevel 2          7506009841185\nLevel 3          7506009841192\nLevel 4          7506009841208\n\nAwesome NE Poster\nLevel 1          7506009840782\nLevel 2          7506009840799\nLevel 3          7506009840805\nLevel 4          7506009840812\n\nAwesome NE Digital Book DVD\nLevel 1          9786070613067\nLevel 2          9786070613098\nLevel 3          9786070613128\nLevel 4          9786070613111"
            
        } else if viaSegueSerie == 29 {
            
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
            
            self.txtComponents.text = "- Student’s Book \n \n- Practice Book\n \n- Reference Guide"
            imgDet1.isHidden = true
            imgDet2.isHidden = true
            imgDet3.isHidden = true
            self.txtDet1.isHidden = true
            self.txtDet2.isHidden = true
            self.txtDet3.isHidden = true
            self.txtComponentsTeachers.text = "- Online Teacher’s Guide and Videos\n \n"
            self.txtMoreComponentsTeachers.isHidden = true
            self.txtISBNStudents.text = "Pack Pathway to... (Sb+Digital Book)\nBiology          7506009843349\nPhysics          7506009843356\nChemistry          7506009843363"
            self.txtISBNTeachers.isHidden = true
            
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
            self.txtISBNStudents.text = "English In motion Students Book\nLevel 1          9788466810029\nLevel 2          9788466814928\nLevel 3          9788466815123\nLevel 4          9788466815147\n\nPack English In motion (Wb+M-ROM)\nLevel 1          7506009834149\nLevel 2          7506009834156\nLevel 3          7506009834163\nLevel 4          7506009834170"
            self.txtISBNTeachers.text = "English In motion Teacher’s Book\nLevel 1          9788466808538\nLevel 2          9788466813594\nLevel 3          9788466813884\nLevel 4          9788466814072\n\nEnglish In motion Class CD\nLevel 1          8431300228733\nLevel 2          8431300228740\nLevel 3          8431300228757\nLevel 4          8431300228771\n\nPack English In motion (Test Book + CD Audio)\nLevel 1          7506009838833\nLevel 2          7506009838840\nLevel 3          7506009838857\nLevel 4          7506009838864\n\nEnglish In motion Test Pack+CD\nLevel 1          7506009838833\nLevel 2          7506009838840\nLevel 3          7506009838857\nLevel 4          7506009838864\n\nEnglish In motion DVD\nLevel 1          8431300228788\nLevel 2          8431300228801\nLevel 3          8431300228818\nLevel 4          8431300228825\n\nEnglish In motion Digital CD-ROM\nLevel 1          8431300230415\nLevel 2          8431300230422\nLevel 3          8431300230439\nLevel 4          8431300230446\n\nEnglish In motion All-In-One Resource Book\nLevel 1          9788466812856\nLevel 2          9788466813624\nLevel 3          9788466814041\nLevel 4          9788466814102"
            
        } else if viaSegueSerie == 24 {
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
            
            self.txtComponents.text = "- Student’s Book \n \n- Practice Book \n \n- CD-ROM"
            imgDet1.isHidden = true
            imgDet2.isHidden = true
            imgDet3.isHidden = true
            self.txtDet1.isHidden = true
            self.txtDet2.isHidden = true
            self.txtDet3.isHidden = true
            self.txtComponentsTeachers.text = "- Teacher’s Book\n \n- Class CDs &amp; Tests\n \n- Tests (can be downloaded and adapted)\n \n- Posters Digital Book\n \n"
            self.txtMoreComponentsTeachers.isHidden = true
            self.txtISBNStudents.text = "Pack Next Step (SB+CD-ROM)\nLevel 1          7506009831179\nLevel 2          7506009831186\nLevel 3          7506009831193\nLevel 4          7506009831353\n\nNext Step Practice Book\nLevel 1          9786070604164\nLevel 2          9786070604171\nLevel 3          9786070604188\nLevel 4          9786070604195"
            self.txtISBNTeachers.text = "Next Step Teacher’s Book\nLevel 1          9786070604201\nLevel 2          9786070604218\nLevel 3          9786070604225\nLevel 4          9786070604232\n\nNext Step Posters\nLevel 1          7506009808454\nLevel 2          7506009808461\nLevel 3          7506009808478\nLevel 4          7506009831032\n\nNext Step Teacher’s CD Pack\nLevel 1          7506009809185\nLevel 2          7506009809192\nLevel 3          7506009809208\nLevel 4          7506009809215"
            
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
            self.txtISBNStudents.text = "Spotlight On Literature Student’s Book NE\nLevel A          9786070607943\nLevel B          9786070607950\nLevel C          9786070607967\nLevel D          9786070607974\nLevel E          9786070607981\nLevel F          9786070607998\n"
            self.txtISBNTeachers.text = "Pack Spotlight On Literature (Tch+CD-ROM) NE\nLevel A          7506009838161\nLevel B          7506009838178\nLevel C          7506009838185\nLevel D          7506009838192\nLevel E          7506009838208\nLevel F          7506009838215"
            
            
        } else if viaSegueSerie == 23 {
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
            self.txtISBNStudents.isHidden = false
            self.txtISBNStudents.text = "Pack Stopwatch (SB&WB+CD)\nLevel 1          7506009844360\nLevel 2          7506009844377\nLevel 3          7506009844384\nLevel 4          7506009845305\nLevel 5          7506009845312\nLevel 6          7506009845329"
            self.txtISBNTeachers.isHidden = false
            self.txtISBNTeachers.text = "Pack Stopwatch (TCH+TOOLKIT CD+DB)\nLevel 1          7506009845213\nLevel 2          7506009845220\nLevel 3          7506009845237\nLevel 4          7506009846111\nLevel 5          7506009846128\nLevel 6          7506009846135"
            
        } else if viaSegueSerie == 32 {
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
            
            self.txtComponents.text = "- Student’s Book\n \n- Workbook\n \n- Audio CD\n \n- Downloadable audio online\n \n- Split Edition Available\n \n- Interactive online activities\n \n- Learning Platform"
            imgDet1.isHidden = true
            imgDet2.isHidden = true
            imgDet3.isHidden = true
            self.txtDet1.isHidden = true
            self.txtDet2.isHidden = true
            self.txtDet3.isHidden = true
            self.txtComponentsTeachers.text = "- Teacher’s Book\n \n- Class Audio CD\n \n- Digital Book\n \n- Test Studio\n \n- Online videos and author interviews\n \n- Learning Platform\n \n"
            self.txtMoreComponentsTeachers.isHidden = true
            self.txtISBNStudents.text = "American Big Picture Student’s Book\nA1          9786070608704\nA2          9786070605697\nB1          9786070605772\nB1+         9786070607066\nB2          9786070607561\nC1          9786070608728\n\nPack American Big Picture (Wb + CD)\nA1          7506009834965\nA2          7506009834972\nB1          7506009834989\nB1+         7506009834996\nB2          7506009835009\nC1          7506009835016"
            self.txtISBNTeachers.text = "Pack American Big Picture (Tch + CD)\nA1          7506009835436\nA2          7506009835443\nB1          7506009835450\nB1+         7506009835467\nB2          7506009835474\nC1          7506009835481\n\nAmerican Big Picture Digital Book CD-ROM\nA1          9786070608742\nA2          9786070607059\nB1          9786070607356\nB1+         9786070607363\nB2          9786070608124\nC1          9786070608759"
            
        } else if viaSegueSerie == 34 {
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
            
            self.txtComponents.text = "- Student’s Book with access code\n \n- Workbook \n \n- Audio CD \n \n- eWorkbook"
            imgDet1.isHidden = true
            imgDet2.isHidden = true
            imgDet3.isHidden = true
            self.txtDet1.isHidden = true
            self.txtDet2.isHidden = true
            self.txtDet3.isHidden = true
            self.txtComponentsTeachers.text = "- Teacher’s Book \n \n- Class Audio CD \n \n- Learning Platform \n \n- Digital book for IWB\n \n"
            self.txtMoreComponentsTeachers.isHidden = true
            self.txtISBNStudents.text = "Student’s Book\nElementary          9788466813570\nPre-intermediate          9788466813631\nIntermediate          9788466814058\nUpper-intermediate          9788466814119\n\nPack @work WorkbookElementary          7506009838888\nPre-intermediate          7506009841420\nIntermediate          7506009839632\nUpper-intermediate          7506009841444\n\n@Work Digital Workbook\nElementary          8431300228429\nPre-intermediate          8431300228450\nIntermediate          8431300228481\nUpper-intermediate          8431300228511"
            self.txtISBNTeachers.text = "Teacher’s Book\nElementary          9788466813600\nPre-intermediate          9788466814027\nIntermediate          9788466814089\nUpper-intermediate          9788466814157\n\nClass Audio CD\nElementary          8431300228405\nPre-intermediate          8431300228436\nIntermediate          8431300228467\nUpper-intermediate          8431300228498\n\n@Work Digital Book\nElementary          8431300228412\nPre-intermediate          8431300228443\nIntermediate          8431300228474\nUpper-intermediate          8431300228504"
            
        } else if viaSegueSerie == 30 {
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
            
            self.txtComponents.text = "- Student’s Book (with portal access code)\n \n- eWorkbook\n \n- Split editions (except for Starter)\n \n- Learning Platform extra practice, audio and video"
            imgDet1.isHidden = true
            imgDet2.isHidden = true
            imgDet3.isHidden = true
            self.txtDet1.isHidden = true
            self.txtDet2.isHidden = true
            self.txtDet3.isHidden = true
            self.txtComponentsTeachers.text = "- Teacher’s Book \n \n- Class CD\n \n- DVD (ID Café) \n \n- Digital Book\n \n- Learning Platform with a full range of digital resources\n \n"
            self.txtMoreComponentsTeachers.isHidden = true
            self.txtISBNStudents.text = "English ID Starter Student's & Workbook\nStarter          9786070607776\nLevel 1          N/A\nLevel 2          N/A\nLevel 3          N/A\n\nEnglish ID Student’s Book\nStarter          N/A\nLevel 1          9786070607615\nLevel 2          9786070607639\nLevel 3          9786070607653\n\nEnglish ID Workbook\nStarter          N/A\nLevel 1          9786070607622\nLevel 2          9786070607646\nLevel 3          9786070607660"
            self.txtISBNTeachers.text = "English ID Teacher’s Book\nStarter          9786070607714\nLevel 1          9786070607752\nLevel 2          9786070607721\nLevel 3          9786070607738\n\nEnglish ID Class CD\nStarter          7506009836716\nLevel 1          7506009836730\nLevel 2          7506009839137\nLevel 3          7506009839076\n\nEnglish ID DVD\nStarter          7506009836723\nLevel 1          7506009836747\nLevel 2          7506009836761\nLevel 3          7506009836785\n\nEnglish ID Digital Book CD-ROM\nStarter          9786070607899\nLevel 1          9786070607882\nLevel 2          9786070607905\nLevel 3          9786070607912"
            
        } else if viaSegueSerie == 36 {
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
            
            self.txtComponents.text = "- Student’s Book \n \n- Student’s Audio CD\n \n"
            imgDet1.image = UIImage(named: "adultsgoingpros1.png")
            imgDet2.image = UIImage(named: "adultsgoingpros2.png")
            imgDet3.isHidden = true
            self.txtDet1.text = "Each block begins with an exciting opener including a separate fold-out spread in which students explore, discuss and solve a mystery or puzzle. Subsequent lessons cover listening and speaking activities thematically connected to the opener, followed by communicative grammar and vocabulary work and reading strategies."
            self.txtDet2.text = "Case studies to promote critical thinking. Reading and writing Tips in every block, students will find boxes with explanations and practical suggestions on how to become better readers and/or writers."
            self.txtDet3.isHidden = true
            self.txtComponentsTeachers.text = "- Teacher’s Guide\n \n- Teacher’s Resource CD\n \n- DVD\n \n- Digital Book\n \n"
            self.txtMoreComponentsTeachers.isHidden = true
            self.txtISBNStudents.text = "Pack Going Pro (SB+CD)\nLevel 1          7506009840188\nLevel 2          7506009839052\nLevel 3          7506009840201\nLevel 4         7506009839069\nLevel 5          7506009842069\nLevel 6          7506009842465"
            self.txtISBNTeachers.text = "Pack Going Pro (TB+TRCD+DVD)\nLevel 1          7506009843165\nLevel 2          7506009843172\nLevel 3          7506009843189\nLevel 4         7506009843196\nLevel 5          7506009843141\nLevel 6          7506009843295\n\nGoing Pro Digital Book CD\nLevel 1          9786070611520\nLevel 2          9786070611537\nLevel 3          9786070611544\nLevel 4         9786070611551\nLevel 5          9786070611568\nLevel 6          9786070611575"
            
        } else if viaSegueSerie == 31 {
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
            
        } else if viaSegueSerie == 58 {
            unoImg.image = UIImage(named: "exam_friendly.png")
            dosImg.image = UIImage(named: "audio.png")
            tresImg.image = UIImage(named: "digital_resources.png")
            cuatroImg.image = UIImage(named: "british.png")
            cincoImg.image = UIImage(named: "learning.png")
            
        } else if viaSegueSerie == 65 {
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
            
        } else if viaSegueSerie == 67 {
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
            
        } else if viaSegueSerie == 39 {
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
            
        } else if viaSegueSerie == 40 {
            unoImg.image = UIImage(named: "audio.png")
            dosImg.image = UIImage(named: "british.png")
            tresImg.image = UIImage(named: "levels2.png")
            cuatroImg.image = UIImage(named: "learning.png")
            
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
            
        } else if viaSegueSerie == 41 {
            unoImg.image = UIImage(named: "british.png")
            dosImg.image = UIImage(named: "levels2.png")
            
            unoBtn.isHidden = false
            dosBtn.isHidden = false

            
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
            
        } else if viaSegueSerie == 42 {
            unoImg.image = UIImage(named: "videos.png")
            dosImg.image = UIImage(named: "dvd.png")
            
            unoBtn.isHidden = false
            dosBtn.isHidden = false

            
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
            
        } else if viaSegueSerie == 78 {
            unoImg.image = UIImage(named: "new_icon.png")

            
            unoBtn.isHidden = false

            
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
            
        } else if viaSegueSerie == 43 {
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
            
        } else if viaSegueSerie == 44 {
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
            
        } else if viaSegueSerie == 45 {
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
            
        } else if viaSegueSerie == 46 {
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
            
        } else if viaSegueSerie == 47 {
            unoImg.image = UIImage(named: "app.png")
            
            unoBtn.isHidden = false

            
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
            
        } else if viaSegueSerie == 51 {
            unoImg.image = UIImage(named: "exam_friendly.png")
            dosImg.image = UIImage(named: "audio.png")
            tresImg.image = UIImage(named: "digital_resources.png")
            cuatroImg.image = UIImage(named: "british.png")
            
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
            
        } else if viaSegueSerie == 52 {
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
            
        } else if viaSegueSerie == 55 {
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
            
        } else if viaSegueSerie == 56 {
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
            
        } else if viaSegueSerie == 57 {
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
            
        } else if viaSegueSerie == 61 {
            unoImg.image = UIImage(named: "exam_friendly.png")
            dosImg.image = UIImage(named: "audio.png")
            tresImg.image = UIImage(named: "digital_resources.png")
            cuatroImg.image = UIImage(named: "british.png")
            cincoImg.image = UIImage(named: "levels3.png")
            
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
            unoImg.image = UIImage(named: "exam_friendly.png")
            dosImg.image = UIImage(named: "audio.png")
            tresImg.image = UIImage(named: "digital_resources.png")
            cuatroImg.image = UIImage(named: "british.png")

            
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
            
        }  else if viaSegueSerie == 70 {
            
            unoImg.image = UIImage(named: "richmondlearning.png")
            dosImg.image = UIImage(named: "levels6.png")
            tresImg.image = UIImage(named: "hours90_120.png")
            cuatroImg.image = UIImage(named: "digital_book.png")
            cincoImg.image = UIImage(named: "videos.png")
            seisImg.image = UIImage(named: "digital_resources.png")
            sieteImg.image = UIImage(named: "british.png")
            ochoImg.image = UIImage(named: "app.png")
            
            unoBtn.isHidden = false
            dosBtn.isHidden = false
            tresBtn.isHidden = false
            cuatroBtn.isHidden = false
            cincoBtn.isHidden = false
            seisBtn.isHidden = false
            sieteBtn.isHidden = false
            ochoBtn.isHidden = false
            
            txtTitleDetailReaders.isHidden = false
            txtAuthDetailReaders.isHidden = false
            txtDescriptionDetailReaders.isHidden = false
            
            txtTitleDetailSerie.isHidden = true
            txtAuthDetailSerie.isHidden = true
            txtDescriptionDetailSerie.isHidden = true
            
            txtTitleDetailReaders.text = txtTitleDetailSerie.text
            txtAuthDetailReaders.text = txtAuthDetailSerie.text
            txtDescriptionDetailReaders.text = txtDescriptionDetailSerie.text
            
            imgTable.isHidden = false
            imgTable.image = UIImage(named: "ready_set_go_table.png")
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
            self.txtISBNStudents.text = "Level 2(K1)\nWhat Shape Is It? :9786070606038\nFarm Animals : 9786070606021\nMy Clothes : 9786070606014\nHelping My Family: 9786070606052\n\n Level 3 (K2):\nEveryday Jobs :9786070606403\nWild Animals: 9786070606045\nMy New School : 9786070606069\nHow Do We Get There?: 9786070606533 \n\n Level 4 (K3):\nOur Living Earth: 9786070606564\n My Senses at Work: 9786070606311\nAnimals through the Seasons : 9786070606328\nTake a Ride: 9786070606557 \n\n\n\n"
            self.txtISBNTeachers.isHidden = true
            self.txtISBNTeachers.text = "iDentities Teacher’s Book\nLevel 1          9788466820844\nLevel 2          *TBA\n\niDentities Class CD\nLevel 1          9788466820806\nLevel 2          *TBA"
            
        } else if viaSegueSerie == 71 {
            txtTitleDetailReaders.isHidden = false
            txtAuthDetailReaders.isHidden = false
            txtDescriptionDetailReaders.isHidden = false
            
            txtTitleDetailSerie.isHidden = true
            txtAuthDetailSerie.isHidden = true
            txtDescriptionDetailSerie.isHidden = true
            
            txtTitleDetailReaders.text = txtTitleDetailSerie.text
            txtAuthDetailReaders.text = txtAuthDetailSerie.text
            txtDescriptionDetailReaders.text = txtDescriptionDetailSerie.text
            
            imgTable.isHidden = false
            imgTable.image = UIImage(named: "portadas_little_readers.jpg")
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
            self.txtISBNStudents.text = "Level 1\nCrickle, Crackle, Pop: 9789707392229\n\n Level 2:\nShake and Shver : 9789707392236 \n\n\n\n"
            self.txtISBNTeachers.isHidden = true
            self.txtISBNTeachers.text = "iDentities Teacher’s Book\nLevel 1          9788466820844\nLevel 2          *TBA\n\niDentities Class CD\nLevel 1          9788466820806\nLevel 2          *TBA"
            
        } else if viaSegueSerie == 72 {
            txtTitleDetailReaders.isHidden = false
            txtAuthDetailReaders.isHidden = false
            txtDescriptionDetailReaders.isHidden = false
            
            txtTitleDetailSerie.isHidden = true
            txtAuthDetailSerie.isHidden = true
            txtDescriptionDetailSerie.isHidden = true
            
            txtTitleDetailReaders.text = txtTitleDetailSerie.text
            txtAuthDetailReaders.text = txtAuthDetailSerie.text
            txtDescriptionDetailReaders.text = txtDescriptionDetailSerie.text
            
            imgTable.isHidden = false
            imgTable.image = UIImage(named: "portadas_infoquest.jpg")
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
            self.txtISBNStudents.text = "Level 1\nIn My Garden: 9789707392267\nDown on the Farm : 9789707392281\nJeepers Creepers : 9789707392250\n\n Level 2:\nFun and Games :9789707392311\nThose Animals: 9789707392304\nWhat´s Cooking?: 9789707392328\n\n Level 3:\nTap into Sap: 9789707392366\n\nLevel 4\nGrassland Safari :9789707392380\nOn the Wild Side : 9789707392403\n\n Level 5:\nA Way with Words:9789707392410\nGetting Together: 99789707392441\nCell City: 9789707392434\n\n Level 6:\nClose Up on Careers: 9789707392458\n\n\n\n"
            self.txtISBNTeachers.isHidden = true
            self.txtISBNTeachers.text = "iDentities Teacher’s Book\nLevel 1          9788466820844\nLevel 2          *TBA\n\niDentities Class CD\nLevel 1          9788466820806\nLevel 2          *TBA"

            
        } else if viaSegueSerie == 73 {
            txtTitleDetailReaders.isHidden = false
            txtAuthDetailReaders.isHidden = false
            txtDescriptionDetailReaders.isHidden = false
            
            txtTitleDetailSerie.isHidden = true
            txtAuthDetailSerie.isHidden = true
            txtDescriptionDetailSerie.isHidden = true
            
            txtTitleDetailReaders.text = txtTitleDetailSerie.text
            txtAuthDetailReaders.text = txtAuthDetailSerie.text
            txtDescriptionDetailReaders.text = txtDescriptionDetailSerie.text
            
            imgTable.isHidden = false
            imgTable.image = UIImage(named: "ready_set_go_table.png")
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
            self.txtISBNStudents.text = "Early Reader 1:\nBe Healthy: 9786070606113\nButterfly Life Cycle : 9786070606168\nFace Painting: 9786070606618\nMeet a Beekeeper: 9786070606571\nMeet an Astronaut: 9786070606144\nGrow Grass Creatures: 9786070606199\nMy Community: 9786070606489\nOur Earth: 9786070606588\nWhy We Need Sleep: 9786070606601\n\nEarly Reader 2:\nTadpo le to Frog: 9786070606137\nWater for Life : 9786070606472\nSchool yard Games: 9786070606182\nMonkeys and Apes: 9786070606076\nDangerous Jobs: 9786070606175\nExplore Eclipses: 9786070606090\nAll about Sharks: 9786070606083\nMelting Ice: 9786070606120\n\nSolo Reader 1:\nWhales and Dolphins: 9786070606625\nWild Wind storms : 9786070606151\nEnd angered Animals: 9786070606465\nOn Safari: 9786070606373\nRecycling Race: 9786070606366\nSpace Junk: 9786070606106\nMaking Masks: 9786070606243\nExperiment with magnets: 9786070606205\n\nSolo Reader 2:\nSpace Stations: 9786070606250\nPuppets Making : 9786070606274\nMy Family Tree: 9786070606212\nDesert Animals: 9786070606342\nWhy Volcanoes Erupt: 9786070606519\nWorking with Apes: 9786070606229\nRadical Robos: 9786070606335\nAnimals in captivity: 9786070606236\n\nFluent Reader 1:\nThe Games: 9786070606540\nGlobal Warming : 9786070606267\nOur Greatest Inventions: 9786070606298\nHow Animals Defend Themselves: 9786070606359\nGreat Moments in History: 9786070606281\nSuper Science Experiments: 9786070606304\nMagnificent Mummies: 9786070606526\nSecret Codes: 9786070606397\n\nFluent Reader 2:\nCreating Cool Gadgets: 9786070606632\nExplore Extreme Sports:9786070606434\nHow the Brain Works: 9786070606427\nIt’s a Mystery: 9786070606595\nMake Your Own Web Page: 9786070606441\nHow Aircraft Fly: 9786070606496\nReptiles and Amphibians: 9786070606380\nWhy Earth quakes Occur: 9786070606502\nBody Smart: 9786070606458\n\n\n\n"
            self.txtISBNTeachers.isHidden = true
            self.txtISBNTeachers.text = "iDentities Teacher’s Book\nLevel 1          9788466820844\nLevel 2          *TBA\n\niDentities Class CD\nLevel 1          9788466820806\nLevel 2          *TBA"
            
        } else if viaSegueSerie == 74 {
            txtTitleDetailReaders.isHidden = false
            txtAuthDetailReaders.isHidden = false
            txtDescriptionDetailReaders.isHidden = false
            
            txtTitleDetailSerie.isHidden = true
            txtAuthDetailSerie.isHidden = true
            txtDescriptionDetailSerie.isHidden = true
            
            txtTitleDetailReaders.text = txtTitleDetailSerie.text
            txtAuthDetailReaders.text = txtAuthDetailSerie.text
            txtDescriptionDetailReaders.text = txtDescriptionDetailSerie.text
            
            imgTable.isHidden = false
            imgTable.image = UIImage(named: "ready_set_go_table.png")
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
            self.txtISBNStudents.text = "Starter Level:\nMeet the Turtles: 9781909221819\nMeet the Smurfs!: 9781910173442\nWho are the Smurfs?: 9781910173435\nSpongeBob squarepants: Underwater Friends: 9781909221833\nMr. Bean: A day at the beach: 9781909221796\nHow to Tra in Your Dragon: Hic up and Friends: 9781910173756\nSpongeBob squarepants : SpongeBob’s New Toy:  9781909221895\nMr. Bean: Guide to London : 9781910173046\nMeet the Croods: 9781910173770\nThe Animals of Kung Fu Panda: 9781910173794\n\nLevel 1:\nIce Age 4: 9781407169910\nThe Jungle Book : Man Trap : 9781908351500\nMr. Bean Royal Bean: 9781906861469\nMadagascar: 9781906861575\nShrek: 9781906861551\nOver the Hedge: 9781909221291\nKung Fu Panda : Holidays: 9781909221284\nRio: Blu and Jewel: 9781908351258\nThe Penguins of Madagascar: 9781909221307\nGargamel’s Magic Spell : 9781910173558\nSpongeBob Square Pants :Talent Show: 9781909221901\nCloudy with the Chane of Meatballs: 9781910173459\nRise of the Turtles: 9781909221888\nIce Age: 9781906861599\nThe Jungle Book :Cobra’s Egg: 9781908351524\nSnoopy and Charlie Brown:The Peanuts Movie: 9781910173510\nHow to Train Your Dragon: 9781910173817\n\nLevel 2:\nThe little prince & the rose: 9781407169941\nAngry Birds: 9781407169927\nMadagascar: Escape Africa: 9781906861650\nMr. Bean: Toothache: 9781906861483\nPUSS in boots : The Outlaw: 9781909221338\nShrek 2: 9781906861636\nThe Smurfs 2: 9781910173541\nRango: 9781906861995\nPeanuts classic:Snoopy and Friends: 9781910173565\nCloudy with the Chance of Meatballs 2 : 9781910173466\nTime Jump : Back to the Stone Age: 9781908351647\nThe Turtles : Kraang Attack!: 9781910173015\nHow to Train Your Dragon 2: 9781910173831\nTurbo: 9781910173855\nSpongeBob Square Pants : Wormy: 9781910173008\n\nLevel 3:\nThe Smurfs : The Lost Village: 9781407169958\nHome: 9781910173879\nSpongeBob Square Pants :DoodleBob: 9781909221826\nRio: Looking for Blu: 9781908351128\nThe Turtles : Donnie’s Robot: 9781910173022\nShrek Forever After: 9781906861308\nMadagascar 3: Europe’s Most Wanted: 9781909221352\nPeanuts classic: The Ice-Skating Competition: 9781910173572\nKung Fu Panda 2: 9781906861834\nShrek the Third : 9781906861735\nMr.Bean: The palace of bean: 9781906861506\nIce Age 3: Dawn of the Dinosaurs:9781906861773\n\n\n"
            self.txtISBNTeachers.isHidden = true
            self.txtISBNTeachers.text = "iDentities Teacher’s Book\nLevel 1          9788466820844\nLevel 2          *TBA\n\niDentities Class CD\nLevel 1          9788466820806\nLevel 2          *TBA"
            
            
        } else if viaSegueSerie == 75 {
            txtTitleDetailReaders.isHidden = false
            txtAuthDetailReaders.isHidden = false
            txtDescriptionDetailReaders.isHidden = false
            
            txtTitleDetailSerie.isHidden = true
            txtAuthDetailSerie.isHidden = true
            txtDescriptionDetailSerie.isHidden = true
            
            txtTitleDetailReaders.text = txtTitleDetailSerie.text
            txtAuthDetailReaders.text = txtAuthDetailSerie.text
            txtDescriptionDetailReaders.text = txtDescriptionDetailSerie.text
            
            imgTable.isHidden = false
            imgTable.image = UIImage(named: "ready_set_go_table.png")
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
            self.txtISBNStudents.text = "Starter Level:\nRobin Hood: The Taxman: 9788466812214\nZoey 101: Dance Contest: 9781906861063\nBlog Love: 9780956857705\nStorm Hawks: 9781906861056\n\nLevel 1:\nMalala: 9781910173602\nMr. Bean’s Holiday : 9788466810197\nBuffy the vampire slayer: 9781904720331\nTransformers: 9781905775446\nHotel for Dogs: 9781905775897\nMonster House: 9788466808729\nTHE ADVENTURES OF MERLIN: Arthur and the Unicorn : 9781905775873\nOne Direct ion:Making the dream real: 9781909221864\nThe city of ember: 9781905775460\nSMALLVILLE ARRIVAL: 9788466808668\n\nLevel 2:\nMuhammad Ali: 9781407169972\nGreat Expectations: 9781909221994\nSelma: 9781910173718\nSherlock :The Sign of Three: 9781910173497\nThe Pink Panther: 9788466818704, 9781904720751\nRomeo and Juliet: 9781910173534\nThe In-Crowd: 9788466819046\nJohnny English Reborn: 9781407133720\nABOUT TIME: 9781910173473\nTHE DEVIL WEARS PRADA: 9788466812245\nSTAR WARS: THE CLONE WARS : 9781905775521\nSENSE AND SENSIBILITY: 9781905775620\nGLEE: FOREING EXCHANGE: 9781909221215\nHOOT: 9788466810241\nNIGHT AT THE MUSEUM: SECRET OF THE TOMB: 9781910173589\nThe OC: The Outsider: 9781904720836\nThe Mask of Zorro: 9781906861162\nBandslam: 9781905775972\nJane Eyre: 9788466810227\nBatman Begins: 9788466818698\nGlee : The Beginning: 9781908351333\nSenna: 9781909221192\nNelson Mandela: 9781908351166\nTRANSFORMERS: Revenge of the Fallen: 9781909221222\nROBIN HOOD: The Silver Arrow and the Slaves: 9788466810234\nDJ Ambition: 9788466819053\n\nLevel 3:\n12 Years a Slave:  9781910173527\nSuffragette: 9781910173398\nThe Imitation Game: 9781910173411\nBlack Gold: 9781905775569\nBob Marley: 9781908351982\nMICHAEL JACKS ON : The Man, The Music, The Mystery: 9788466812771\nAngela’s Ashes: 9788466810302\nMade in Dagenham: 9781908351203\nGlee : Summer Break: 9781909221253\nTRANSFORMERS : THE DARK OF MOON : 9781909221260\nPride & Prejudice: 9788466810265\nSHERLOCK: The Hounds of Basker ville: 9781909221246\nLife of PI: 9781909221789\nTouching the Void: 9781905775095\nThe Story of Chanel: 9781906861858\nThe Queen: 9788466812276\nThe OC: The Gambled : 9781904720850\nThe OC: The Misfits: 9781904720874\nVANITY FAIR: 9781906861186\n\nLevel 4:\nAn Education: 9781906861018\nNowhere Boy: Before The Beatles– the story of John Lennon: 9781906861032\nA Lion Called Christian: 9781906861223\nSlumdog Millionaire: 9781906861216\n\n\n"
            self.txtISBNTeachers.isHidden = true
            self.txtISBNTeachers.text = "iDentities Teacher’s Book\nLevel 1          9788466820844\nLevel 2          *TBA\n\niDentities Class CD\nLevel 1          9788466820806\nLevel 2          *TBA"
            
        } else if viaSegueSerie == 76 {
            txtTitleDetailReaders.isHidden = false
            txtAuthDetailReaders.isHidden = false
            txtDescriptionDetailReaders.isHidden = false
            
            txtTitleDetailSerie.isHidden = true
            txtAuthDetailSerie.isHidden = true
            txtDescriptionDetailSerie.isHidden = true
            
            txtTitleDetailReaders.text = txtTitleDetailSerie.text
            txtAuthDetailReaders.text = txtAuthDetailSerie.text
            txtDescriptionDetailReaders.text = txtDescriptionDetailSerie.text
            
            imgTable.isHidden = false
            imgTable.image = UIImage(named: "ready_set_go_table.png")
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
            self.txtISBNStudents.text = "Level 3:\nP.R. and Prejudice: 9788466817370\nThe Canterville Ghost: 9788466815987\nDr. Jekyll & Mr. Hyde: 9788466815963\nFrankenstein: 9788466815970\n\nLevel 4:\nMedical Match: 9788466817363\nA Floral Arrangement : 9788466817387\nSense & Sensibility: 9788466816021\nDracula: 9788466816007\nA Trip to London: 9788466815994\n\nLevel 5:\nElizabet h II:The Diamond Queen: 9788466816076\nSteve Jobs : the man behind Apple: 9788466816069\nSHERLOCK HOLMES: 9788466816113\n\n\n"
            self.txtISBNTeachers.isHidden = true
            self.txtISBNTeachers.text = "iDentities Teacher’s Book\nLevel 1          9788466820844\nLevel 2          *TBA\n\niDentities Class CD\nLevel 1          9788466820806\nLevel 2          *TBA"
            
        } else if viaSegueSerie == 77 {
            txtTitleDetailReaders.isHidden = false
            txtAuthDetailReaders.isHidden = false
            txtDescriptionDetailReaders.isHidden = false
            
            txtTitleDetailSerie.isHidden = true
            txtAuthDetailSerie.isHidden = true
            txtDescriptionDetailSerie.isHidden = true
            
            txtTitleDetailReaders.text = txtTitleDetailSerie.text
            txtAuthDetailReaders.text = txtAuthDetailSerie.text
            txtDescriptionDetailReaders.text = txtDescriptionDetailSerie.text
            
            imgTable.isHidden = false
            imgTable.image = UIImage(named: "ready_set_go_table.png")
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
            self.txtISBNStudents.text = "Level A2:\nBrilliant Brita in: The Seaside: 9786070606915\nTake Away My Takeaway : Hong Kong: 9786070606861\nTake Away My Takeaway : Texas: 9786070606854\n999 Emergency: 9781909221383\nThe British Royal Family:9781909221390\n\nLevel B1:\nBrilliant Britain: Tea: 9786070606908\nChanging World : 9781909221413\nTake Away My Takeaway : Italy: 9786070606878\nEccentric Britain: 9781909221406\nBrilliant Britain: Breakfasts: 9786070606892\nTake Away My Takeaway :New Orleans: 9786070606885\n\n\n"
            self.txtISBNTeachers.isHidden = true
            self.txtISBNTeachers.text = "iDentities Teacher’s Book\nLevel 1          9788466820844\nLevel 2          *TBA\n\niDentities Class CD\nLevel 1          9788466820806\nLevel 2          *TBA"
            
        } else if viaSegueSerie == 66 {
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
            self.txtISBNStudents.text = "Pack Pebbles (SB+CD+RSC Booklet+AP)\nLevel 1          7506009834934\nLevel 2          7506009834941\nLevel 3          7506009834958"
            self.txtISBNTeachers.text = "Pack Pebbles (Guia + Class CD)\nLevel 1          7506009835405\nLevel 2          7506009835412\nLevel 3          7506009835429\n\nFlashcards\nLevel 1          9786070605161\nLevel 2          9786070605208\nLevel 3          9786070605246\n\nFun Activity Mat (Level 1,2 and 3)\nLevel 1          9786070606649\nLevel 2          9786070606656\nLevel 3          9786070606663"
        }
        
  
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













