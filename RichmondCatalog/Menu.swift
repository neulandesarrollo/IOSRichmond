//
//  Menu.swift
//  RichmondCatalog
//
//  Created by Feelink Apps on 16/12/16.
//  Copyright © 2016 Yanku. All rights reserved.
//

import UIKit

enum MenuId: Int{
    
    case PRESCHOOL = 1
    case PRIMARY = 2
    case SECONDARY = 3
    case YOUNG_ADULTS = 4
    case SUPPLEMENTARY = 5
    case EXAMS = 6
    case READERS = 7
    
}

class Menu {
    
    var idMenu: MenuId!
    var titulo: String!
    var icono: UIImage!
    var background: UIColor!
    var iconoFlecha: UIImage!
    
    init(idMenu: MenuId,titulo: String,icono: UIImage,background: UIColor,iconoFlecha: UIImage) {
        self.idMenu = idMenu
        self.titulo = titulo
        self.icono = icono
        self.background = background
        self.iconoFlecha = iconoFlecha
    }
    
    class func getAll() -> [Menu]{
        var menu = [Menu]()
        
        let PRESCHOOL = Menu(idMenu: .PRESCHOOL,titulo: "PRESCHOOL", icono: #imageLiteral(resourceName: "presschool_new"), background: UIColor(red:0.965,  green:0.585,  blue:0.116, alpha:1),iconoFlecha: #imageLiteral(resourceName: "fpreschool.png"))
        menu.append(PRESCHOOL)
        
        let PRIMARY = Menu(idMenu: .PRIMARY,titulo: "PRIMARY", icono: #imageLiteral(resourceName: "primary_new"), background: UIColor(red:0.090,  green:0.677,  blue:0.753, alpha:1),iconoFlecha:#imageLiteral(resourceName: "fprimary.png"))
        menu.append(PRIMARY)
        
        let SECONDARY = Menu(idMenu: .SECONDARY,titulo: "SECONDARY", icono: #imageLiteral(resourceName: "secondary_new"), background: UIColor(red:0.565,  green:0.255,  blue:0.580, alpha:1),iconoFlecha:#imageLiteral(resourceName: "fsecondary.png"))
        menu.append(SECONDARY)
        
        let YOUNG_ADULTS = Menu(idMenu: .YOUNG_ADULTS,titulo: "YOUNG ADULTS", icono: #imageLiteral(resourceName: "youngadults_new"), background: UIColor(red:0.097,  green:0.706,  blue:0.580, alpha:1),iconoFlecha:#imageLiteral(resourceName: "fyoungadults.png"))
        menu.append(YOUNG_ADULTS)
        
        let SUPPLEMENTARY = Menu(idMenu: .SUPPLEMENTARY,titulo: "SUPPLEMENTARY", icono: #imageLiteral(resourceName: "suplementary_new"), background: UIColor(red:0.928,  green:0.331,  blue:0.345, alpha:1),iconoFlecha:#imageLiteral(resourceName: "fsupplementary.png"))
        menu.append(SUPPLEMENTARY)
        
        let EXAMS = Menu(idMenu: .EXAMS,titulo: "EXAMS", icono: #imageLiteral(resourceName: "exams_new"), background: UIColor(red:0.893,  green:0.718,  blue:0.035, alpha:1),iconoFlecha:#imageLiteral(resourceName: "fexams.png"))
        menu.append(EXAMS)
        
        let READERS = Menu(idMenu: .READERS,titulo: "READERS", icono: #imageLiteral(resourceName: "readers_new"), background: UIColor(red:0.274,  green:0.507,  blue:0.710, alpha:1),iconoFlecha:#imageLiteral(resourceName: "freaders.png"))
        menu.append(READERS)
        
       return menu
        
    }
    
}

class Subcategoria {
    
    var icono: UIImage!
    var titulo: String!
    var subtitulo: String!
    
    init(titulo: String,icono: UIImage,subtitulo: String) {
        self.titulo = titulo
        self.icono = icono
        self.subtitulo = subtitulo
    }
    
    class func getSubcategoriasPorId(id: MenuId) -> [Subcategoria]{
        switch id {
        case .PRESCHOOL:
            return Subcategoria.getPreschool()
        case .PRIMARY:
            return Subcategoria.getPrimary()
        case .SECONDARY:
            return Subcategoria.getSecundary()
        case .YOUNG_ADULTS:
            return Subcategoria.getYoungAdults()
        case .SUPPLEMENTARY:
            return Subcategoria.getSupplementary()
        case .EXAMS:
            return Subcategoria.getExams()
        case .READERS:
            return Subcategoria.getReaders()
        }
    }
    
    class func getPreschool() -> [Subcategoria]{
        var subcategoria = [Subcategoria]()
        subcategoria.append(Subcategoria(titulo: "CUBBY HOUSE", icono: #imageLiteral(resourceName:"cubbyhouse.png"), subtitulo: "Fanny Riva Palacio - Stefania Villareal"))
        subcategoria.append(Subcategoria(titulo: "PEBBLES", icono: #imageLiteral(resourceName:"pebbles.png"), subtitulo: "Marlina Bahena"))
        subcategoria.append(Subcategoria(titulo: "GUMDROPS", icono: #imageLiteral(resourceName: "cool_kids.png"), subtitulo: "Gabriela Zatain"))
        subcategoria.append(Subcategoria(titulo: "TIPPY TOES", icono: #imageLiteral(resourceName:"tippy_toes.png"), subtitulo: "Rebecca Williams Salvador"))
        subcategoria.append(Subcategoria(titulo: "CRICKETS", icono: #imageLiteral(resourceName:"crickets.png"), subtitulo: "Annette Flavel - Isabel Moreno"))
        subcategoria.append(Subcategoria(titulo: "M@TH ADVENTURES", icono: #imageLiteral(resourceName:"math_adventures.png"), subtitulo: "Rebecca Lee Williams"))
        return subcategoria
    }
    
    class func getPrimary() -> [Subcategoria]{
        var subcategoria = [Subcategoria]()
        subcategoria.append(Subcategoria(titulo: "ABRACADABRA", icono: #imageLiteral(resourceName: "abracadabra.png"), subtitulo: "Lenore Cohen"))
        subcategoria.append(Subcategoria(titulo: "BEEP", icono: #imageLiteral(resourceName: "beep.png"), subtitulo: "Brendan Dunne - Robin"))
        subcategoria.append(Subcategoria(titulo: "COOL KIDS", icono: #imageLiteral(resourceName: "cool_kids.png"), subtitulo: "Gabriela Zapiain - Silvia\nZapiain - Joep van der Werff\n- Andrew Starling - Jeanette"))
        subcategoria.append(Subcategoria(titulo: "LIGHTHOUSE", icono: #imageLiteral(resourceName: "lighthouse.png"), subtitulo: "Michael Downie - David\nGray - Juan M. Jiménez"))
        subcategoria.append(Subcategoria(titulo: "PATHWAY TO GRAMMAR", icono: #imageLiteral(resourceName: "pt_grammar.png"), subtitulo: "Noelle Child"))
        subcategoria.append(Subcategoria(titulo: "PATHWAY TO LITERATURE", icono: #imageLiteral(resourceName: "pt_literature.png"), subtitulo: "Elizabeth Rodriguez -\n Stefania Villarreal - Aaron\nBurkholder"))
        subcategoria.append(Subcategoria(titulo: "PATHWAY TO MATH", icono: #imageLiteral(resourceName: "pt_math.png"), subtitulo: ""))
        subcategoria.append(Subcategoria(titulo: "PATHWAY TO SCIENCE", icono: #imageLiteral(resourceName: "pt_science.png"), subtitulo: ""))
        subcategoria.append(Subcategoria(titulo: "SCIENCE AND GEOGRAPHY", icono: #imageLiteral(resourceName: "sgeo_students_book.jpg"), subtitulo: ""))
        subcategoria.append(Subcategoria(titulo: "SKYROCKET", icono: #imageLiteral(resourceName: "skyrocket.png"), subtitulo: "Sarah Conway"))
        subcategoria.append(Subcategoria(titulo: "SPOTLIGHT ON ENGLISH", icono: #imageLiteral(resourceName: "sp_english.png"), subtitulo: ""))
        return subcategoria
    }
    
    class func getSecundary() -> [Subcategoria]{
        var subcategoria = [Subcategoria]()
        subcategoria.append(Subcategoria(titulo: "ACHIEVERS", icono: #imageLiteral(resourceName: "achievers.png"), subtitulo: "Leanne Gray - Ken Wilson"))
        subcategoria.append(Subcategoria(titulo: "AWESOME", icono: #imageLiteral(resourceName: "awesome.png"), subtitulo: "Carol Lethaby - Simon Brewster"))
        subcategoria.append(Subcategoria(titulo: "COMBINED SCIENCES", icono: #imageLiteral(resourceName: "combined_science.png"), subtitulo: "Hina Hashmi - Bernice Richter"))
        subcategoria.append(Subcategoria(titulo: "ENGLISH IN MOTION", icono: #imageLiteral(resourceName: "english_motion.png"), subtitulo: "Robert Campbell - Gill Holley - Rob Metcalf"))
        subcategoria.append(Subcategoria(titulo: "NEXT STEP", icono: #imageLiteral(resourceName: "next_step.png"), subtitulo: "Carol Lethaby - Simon Brewster"))
        subcategoria.append(Subcategoria(titulo: "SPOTLIGHT ON LITERATURE", icono: #imageLiteral(resourceName: "sp_literature.png"), subtitulo: ""))
        subcategoria.append(Subcategoria(titulo: "STOPWATCH", icono: #imageLiteral(resourceName: "stopwatch.png"), subtitulo: "Simon Brewster - Viviane Kirmeline and Alastair Lane"))
        return subcategoria
    }
    
    class func getYoungAdults() -> [Subcategoria]{
        var subcategoria = [Subcategoria]()
        subcategoria.append(Subcategoria(titulo: "AMERICAN BIG PICTURE", icono: #imageLiteral(resourceName: "abp.png"), subtitulo: "Simon Brewster - Alastair Lane"))
        subcategoria.append(Subcategoria(titulo: "@WORK", icono: #imageLiteral(resourceName: "work.png"), subtitulo: "Anna Cowper - James Greenan"))
        subcategoria.append(Subcategoria(titulo: "ENGLISH ID", icono: #imageLiteral(resourceName: "id.png"), subtitulo: "Paul Seligson - Luis Otávio Barros"))
        subcategoria.append(Subcategoria(titulo: "GOING PRO", icono: #imageLiteral(resourceName: "going_pro.png"), subtitulo: "Simon Brewster - Alastair Lane"))
        subcategoria.append(Subcategoria(titulo: "IDENTITIES", icono: #imageLiteral(resourceName: "identities.png"), subtitulo: "Paul Seligson - Luis Otávio Barros"))
        subcategoria.append(Subcategoria(titulo: "RICHMOND MAZES", icono: #imageLiteral(resourceName: "mazes.png"), subtitulo: "Alastair Lane - James Styring"))
        subcategoria.append(Subcategoria(titulo: "THE BIG PICTURE", icono: #imageLiteral(resourceName: "the_big_picture.png"), subtitulo: "Ben Goldsteing Ceri Jones"))
        return subcategoria
    }
    
    class func getSupplementary() -> [Subcategoria]{
        var subcategoria = [Subcategoria]()
        subcategoria.append(Subcategoria(titulo: "BUSINESS SKILLS", icono: #imageLiteral(resourceName:"business.png"), subtitulo: ""))
        subcategoria.append(Subcategoria(titulo: "BUSINESS THEORIES", icono: #imageLiteral(resourceName:"business_theories.png"), subtitulo: ""))
        subcategoria.append(Subcategoria(titulo: "ENGLISH GRAMMAR IN STEPS", icono: #imageLiteral(resourceName:"grammar_steps.png"), subtitulo: "David Bolton - Noel Goodey"))
        subcategoria.append(Subcategoria(titulo: "PRIMARY METHODOLOGY HANDBOOK", icono: #imageLiteral(resourceName:"handbook.png"), subtitulo: ""))
        subcategoria.append(Subcategoria(titulo: "RICHMOND COMPACT DICTIONARY", icono: #imageLiteral(resourceName:"compact_dictionary.png"), subtitulo: ""))
        subcategoria.append(Subcategoria(titulo: "RICHMOND MINI DICTIONARY", icono: #imageLiteral(resourceName:"mini_dictionary.png"), subtitulo: ""))
        subcategoria.append(Subcategoria(titulo: "RICHMOND POCKET DICTIONARY", icono: #imageLiteral(resourceName:"pocket_dictionary.png"), subtitulo: ""))
        subcategoria.append(Subcategoria(titulo: "AN INTRODUCTION TO TEACHING ENGLISH TO CHILDREN", icono: #imageLiteral(resourceName:"teaching_english.png"), subtitulo: "Susan House"))
        subcategoria.append(Subcategoria(titulo: "VISUAL GRAMMAR", icono: #imageLiteral(resourceName:"visual_grammar.png"), subtitulo: "Jim Scrivener"))
        subcategoria.append(Subcategoria(titulo: "RICHMOND VOCABULARY BUILDER", icono: #imageLiteral(resourceName:"vocabulary_builder.png"), subtitulo: "Liz Walter"))
        return subcategoria
    }
    
    class func getExams() -> [Subcategoria]{
        var subcategoria = [Subcategoria]()
        subcategoria.append(Subcategoria(titulo: "DELTA's KEY TO THE NEXT GENERATION TOELF TEST", icono: #imageLiteral(resourceName: "toefl_ibt.png"), subtitulo: "Nancy Gallagher"))
        subcategoria.append(Subcategoria(titulo: "TARGET KET FOR SCHOOLS", icono: #imageLiteral(resourceName: "ket_schools.png"), subtitulo: "Sue Ireland - Joanna Kosta"))
        subcategoria.append(Subcategoria(titulo: "TARGET PET", icono: #imageLiteral(resourceName: "pet.png"), subtitulo: "Sue Ireland - Joanna Kosta"))
        subcategoria.append(Subcategoria(titulo: "RICHMOND PRACTICE TESTS FOR CAMBRIDGE ENGLISH: ADVANCED", icono: #imageLiteral(resourceName: "cambridge_advanced.png"), subtitulo: ""))
        subcategoria.append(Subcategoria(titulo: "RICHMOND PRACTICE TESTS FOR CAMBRIDGE ENGLISH: FIRST", icono: #imageLiteral(resourceName: "cambridge_fist.png"), subtitulo: ""))
        subcategoria.append(Subcategoria(titulo: "RICHMOND PRACTICE TESTS FOR IELTS", icono: #imageLiteral(resourceName: "ielts.png"), subtitulo: ""))
        subcategoria.append(Subcategoria(titulo: "PASS THE TOEIC TEST: INTRODUCTORY COURSE", icono: #imageLiteral(resourceName: "toeic_introductory.jpg"), subtitulo: "Miles Craven"))
        subcategoria.append(Subcategoria(titulo: "RICHMOND PRACTICE TEST - MOVERS", icono: #imageLiteral(resourceName: "rpt_movers_sb.jpg"), subtitulo: "Richmond"))
        return subcategoria
    }
    
    class func getReaders() -> [Subcategoria]{
        var subcategoria = [Subcategoria]()
        subcategoria.append(Subcategoria(titulo: "READY, SET, GO!", icono: #imageLiteral(resourceName: "azul.png"), subtitulo: "Lenore Cohen"))
        subcategoria.append(Subcategoria(titulo: "INFOQUEST", icono: #imageLiteral(resourceName: "azul.png"), subtitulo: "Brendan Dunne - Robin Newton"))
        subcategoria.append(Subcategoria(titulo: "LITTLE READERS", icono: #imageLiteral(resourceName: "azul.png"), subtitulo: "Michael Downiw - David Gray - Juan M Jimenez"))
        subcategoria.append(Subcategoria(titulo: "SUPER STARS", icono: #imageLiteral(resourceName: "azul.png"), subtitulo: ""))
        subcategoria.append(Subcategoria(titulo: "POPCORN READERS", icono: #imageLiteral(resourceName: "azul.png"), subtitulo: "Aaron Burkholder"))
        subcategoria.append(Subcategoria(titulo: "MEDIA READERS", icono: #imageLiteral(resourceName: "azul.png"), subtitulo: ""))
        subcategoria.append(Subcategoria(titulo: "RICHMOND READERS", icono: #imageLiteral(resourceName: "azul.png"), subtitulo: ""))
        subcategoria.append(Subcategoria(titulo: "DVD READERS", icono: #imageLiteral(resourceName: "azul.png"), subtitulo: ""))
        return subcategoria
    }
    
}
