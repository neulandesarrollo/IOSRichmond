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
        subcategoria.append(Subcategoria(titulo: "GUMDROPS", icono: #imageLiteral(resourceName: "cool_kids.png"), subtitulo: "Rebecca Lee Williams"))
        subcategoria.append(Subcategoria(titulo: "TIPPY TOES", icono: #imageLiteral(resourceName:"tippy_toes.png"), subtitulo: "Rebecca Lee Williams"))
        subcategoria.append(Subcategoria(titulo: "MY FIRST LETTERS AND SOUNDS", icono: #imageLiteral(resourceName: "mfls.png"), subtitulo: "Rachel Gonin - Rebecca Lee Williams"))
        subcategoria.append(Subcategoria(titulo: "CRICKETS", icono: #imageLiteral(resourceName:"crickets.png"), subtitulo: "Annette Flavel - Francisco Layda - Isabel Moreno - Fanny Riva Palacio"))
        subcategoria.append(Subcategoria(titulo: "M@TH ADVENTURES", icono: #imageLiteral(resourceName:"math_adventures.png"), subtitulo: "Rebecca Lee Williams"))
        return subcategoria
    }
    
    class func getPrimary() -> [Subcategoria]{
        var subcategoria = [Subcategoria]()
        subcategoria.append(Subcategoria(titulo: "ABRACADABRA", icono: #imageLiteral(resourceName: "abracadabra.png"), subtitulo: "Lenore Cohen - Sarah Fash"))
        subcategoria.append(Subcategoria(titulo: "BEEP", icono: #imageLiteral(resourceName: "beep.png"), subtitulo: "Brendan Dunne - Robin Newton"))
        subcategoria.append(Subcategoria(titulo: "COOL KIDS", icono: #imageLiteral(resourceName: "cool_kids.png"), subtitulo: "Gabriela Zapiain - Silvia Zapiain - Joep van der Werff - Andrew Starling - Jeanette Greenwell - Ana Foncerrada"))
        subcategoria.append(Subcategoria(titulo: "LIGHTHOUSE", icono: #imageLiteral(resourceName: "lighthouse.png"), subtitulo: "Robin Newton - Brendan Dunne - David Gray - Michael Downie - Juan M. Jiménez"))
        subcategoria.append(Subcategoria(titulo: "THUMBS UP! SECOND EDITION", icono: #imageLiteral(resourceName: "tup.jpg"), subtitulo: "Sarah Fash - Suzanne Harris - Martyn Hobbs - Julia Keddle"))
        subcategoria.append(Subcategoria(titulo: "PATHWAY TO GRAMMAR", icono: #imageLiteral(resourceName: "pt_grammar.png"), subtitulo: "Noelle Child"))
        subcategoria.append(Subcategoria(titulo: "PATHWAY TO LITERATURE", icono: #imageLiteral(resourceName: "pt_literature.png"), subtitulo: "Elizabeth Rodriguez - Stefania Villarreal - Aaron Burkholder"))
        subcategoria.append(Subcategoria(titulo: "PATHWAY TO MATH", icono: #imageLiteral(resourceName: "pt_math.png"), subtitulo: ""))
        subcategoria.append(Subcategoria(titulo: "PATHWAY TO SCIENCE", icono: #imageLiteral(resourceName: "pt_science.png"), subtitulo: ""))
        subcategoria.append(Subcategoria(titulo: "SCIENCE AND GEOGRAPHY", icono: #imageLiteral(resourceName: "sgeo_students_book.jpg"), subtitulo: ""))
        subcategoria.append(Subcategoria(titulo: "SKYROCKET", icono: #imageLiteral(resourceName: "skyrocket.png"), subtitulo: "Sarah Fash - Andrew Starling - Lindsay Ruggles - Sarah Conway"))
        subcategoria.append(Subcategoria(titulo: "SPOTLIGHT ON ENGLISH", icono: #imageLiteral(resourceName: "sp_english.png"), subtitulo: ""))
        return subcategoria
    }
    
    class func getSecundary() -> [Subcategoria]{
        var subcategoria = [Subcategoria]()
        subcategoria.append(Subcategoria(titulo: "ACHIEVERS", icono: #imageLiteral(resourceName: "achievers.png"), subtitulo: "Carolyn Barraclough - Leanne Gray - Martyn Hobbs - Julia Keddle - Jane Revell - Ken Wilson"))
        subcategoria.append(Subcategoria(titulo: "AWESOME", icono: #imageLiteral(resourceName: "awesome.png"), subtitulo: "Carol Lethaby - Simon Brewster"))
        subcategoria.append(Subcategoria(titulo: "COMBINED SCIENCES", icono: #imageLiteral(resourceName: "combined_science.png"), subtitulo: "Hina Hashmi - Vali Tamm - Carol Haddox-Baldwin - Bernice Richter"))
        subcategoria.append(Subcategoria(titulo: "ENGLISH IN MOTION", icono: #imageLiteral(resourceName: "english_motion.png"), subtitulo: "Robert Campbell - Gill Holley - Rob Metcalf"))
        subcategoria.append(Subcategoria(titulo: "NEXT STEP", icono: #imageLiteral(resourceName: "next_step.png"), subtitulo: "Carol Lethaby - Simon Brewster"))
        subcategoria.append(Subcategoria(titulo: "SPOTLIGHT ON LITERATURE", icono: #imageLiteral(resourceName: "sp_literature.png"), subtitulo: ""))
        subcategoria.append(Subcategoria(titulo: "STOPWATCH", icono: #imageLiteral(resourceName: "stopwatch.png"), subtitulo: "Simon Brewster - Viviane Kirmeliene - Alastair Lane"))
        return subcategoria
    }
    
    class func getYoungAdults() -> [Subcategoria]{
        var subcategoria = [Subcategoria]()
        subcategoria.append(Subcategoria(titulo: "AMERICAN BIG PICTURE", icono: #imageLiteral(resourceName: "abp.png"), subtitulo: "Ben Goldstein - Ceri Jones - Bess Bradfield - Carol Lethaby - Alastair Lane - Simon Brewster - Mark Lloyd"))
        subcategoria.append(Subcategoria(titulo: "@WORK", icono: #imageLiteral(resourceName: "work.png"), subtitulo: "Luois Rogers - Anna Cowper - James Greenan - Marion Grussendorf - Pete Sharma"))
        subcategoria.append(Subcategoria(titulo: "ENGLISH ID", icono: #imageLiteral(resourceName: "id.png"), subtitulo: "Paul Seligson - Tom Abraham - Cris Gontow - Carol Lethaby - Jose Luis Morales - Luis Otávio Barros - Ray Shoulder - Ricardo Sili - Pamela Vittorio"))
        subcategoria.append(Subcategoria(titulo: "GOING PRO", icono: #imageLiteral(resourceName: "going_pro.png"), subtitulo: "Simon Brewster - Alastair Lane"))
        subcategoria.append(Subcategoria(titulo: "IDENTITIES", icono: #imageLiteral(resourceName: "identities.png"), subtitulo: "Paul Seligson - Luiz Otávio Barros"))
        subcategoria.append(Subcategoria(titulo: "RICHMOND MAZES", icono: #imageLiteral(resourceName: "mazes.png"), subtitulo: "James Styring - Alastair Lane - Victoria Boobyer"))
        subcategoria.append(Subcategoria(titulo: "THE BIG PICTURE", icono: #imageLiteral(resourceName: "the_big_picture.png"), subtitulo: "Ben Goldstein - Ceri Jones - Bess Bradfield - Carol Lethaby - Alastair Lane - Simon Brewster - MArk Lloyd"))
        return subcategoria
    }
    
    class func getSupplementary() -> [Subcategoria]{
        var subcategoria = [Subcategoria]()
        subcategoria.append(Subcategoria(titulo: "BUSINESS SKILLS", icono: #imageLiteral(resourceName: "bussinessskill.png"), subtitulo: "Jon Marks"))
        subcategoria.append(Subcategoria(titulo: "BUSINESS THEORIES", icono: #imageLiteral(resourceName: "businesstheory.png"), subtitulo: "Angela Lilley"))
        subcategoria.append(Subcategoria(titulo: "VISUAL GRAMMAR", icono: #imageLiteral(resourceName: "visual_grammar.png"), subtitulo: "Jim Scrivener"))
        subcategoria.append(Subcategoria(titulo: "VOCABULARY BUILDER", icono: #imageLiteral(resourceName: "vocabulary_builder.png"), subtitulo: "Elizabeth Walter - Kate Woodford"))
        subcategoria.append(Subcategoria(titulo: "ENGLISH GRAMMAR IN STEPS", icono: #imageLiteral(resourceName: "english_grammar.png"), subtitulo: "David Bolton - Noel Goodey"))
        subcategoria.append(Subcategoria(titulo: "PRIMARY METHODOLOGY HANDBOOK", icono: #imageLiteral(resourceName: "primary_methodology_handbook.jpg"), subtitulo: "Patricia Grounds - Suzanne Guerrero - Carol Lethaby - Caroline Moore - Joep van der Werff"))
        subcategoria.append(Subcategoria(titulo: "LESSONS LEARNED", icono: #imageLiteral(resourceName: "thumbs_lessons_learned.png"), subtitulo: "Gabriel Díaz Maggioli - Lesley Painter-Farrell"))
        subcategoria.append(Subcategoria(titulo: "PRIMARY HANDBOOK FOR TEACHERS", icono: #imageLiteral(resourceName: "handbooks_for_teachers.png"), subtitulo: "Paul Seligson - Andy Baxter - Amanda Cant - Emma Dafouz - Michele C. Guerrini - Susan House - Ricky Lowes - Genevieve Roth - Wendy Superfine - Francesca Target  -  Julie Tice"))
        subcategoria.append(Subcategoria(titulo: "RICHMOND PICTURE DICTIONARY", icono: #imageLiteral(resourceName: "thumbs_richmond_picture_dictionary.png"), subtitulo: ""))
        subcategoria.append(Subcategoria(titulo: "RICHMOND FIRST DICTIONARY", icono: #imageLiteral(resourceName: "thumbs_richmond_first_dictionary.png"), subtitulo: ""))
        subcategoria.append(Subcategoria(titulo: "RICHMOND DICTIONARY FULLY ILLUSTRATED", icono: #imageLiteral(resourceName: "thumbs_dictionary_fully_illustrated.png"), subtitulo: ""))
        subcategoria.append(Subcategoria(titulo: "RICHMOND DICTIONARIES", icono: #imageLiteral(resourceName: "thumbs_richmond_com_poc_min_dictionary.png"), subtitulo: ""))
        return subcategoria
    }
    
    class func getExams() -> [Subcategoria]{
        var subcategoria = [Subcategoria]()
        subcategoria.append(Subcategoria(titulo: "DELTA'S Key to the TOEFL iBT", icono: #imageLiteral(resourceName: "toefl_ibt.png"), subtitulo: "Nancy Gallagher"))
        subcategoria.append(Subcategoria(titulo: "TARGET KET FOR SCHOOLS", icono: #imageLiteral(resourceName: "ket_schools.png"), subtitulo: "Sue Ireland - Joanna Kosta"))
        subcategoria.append(Subcategoria(titulo: "TARGET PET", icono: #imageLiteral(resourceName: "pet.png"), subtitulo: "Sue Ireland - Joanna Kosta"))
        subcategoria.append(Subcategoria(titulo: "RICHMOND PRACTICE TESTS FOR CAMBRIDGE ENGLISH: ADVANCED", icono: #imageLiteral(resourceName: "cambridge_advanced.png"), subtitulo: "Language Testing 123"))
        subcategoria.append(Subcategoria(titulo: "RICHMOND PRACTICE TESTS FOR CAMBRIDGE ENGLISH: FIRST", icono: #imageLiteral(resourceName: "cambridge_fist.png"), subtitulo: "Diana L. Fried-Booth"))
        subcategoria.append(Subcategoria(titulo: "RICHMOND PRACTICE TESTS FOR IELTS", icono: #imageLiteral(resourceName: "ielts.png"), subtitulo: "Language Testing 123"))
        subcategoria.append(Subcategoria(titulo: "PASS THE TOEIC TEST", icono: #imageLiteral(resourceName: "toeic_introductory.jpg"), subtitulo: "Miles Craven"))
        subcategoria.append(Subcategoria(titulo: "RICHMOND PRACTICE TESTS: YLE", icono: #imageLiteral(resourceName: "rpt_movers_sb.jpg"), subtitulo: ""))
        subcategoria.append(Subcategoria(titulo: "RICHMOND PRACTICE TESTS: KET AND PET", icono: #imageLiteral(resourceName: "thumbs_practice_tests_ket_pet.png"), subtitulo: "Sue Elliott - Sue Irelan - Karen Saxby - Diana L. Fried-Booth"))
        subcategoria.append(Subcategoria(titulo: "TARGET CAMBRIDGE ENGLISH: FIRST", icono: #imageLiteral(resourceName: "thumb_target_cambridge_english_first.png"), subtitulo: "Bess Bradfield - Caroline Krantz"))
        return subcategoria
    }
    
    class func getReaders() -> [Subcategoria]{
        var subcategoria = [Subcategoria]()
        subcategoria.append(Subcategoria(titulo: "READY, SET, GO!", icono: #imageLiteral(resourceName: "thumbs_ready_set_go.jpg"), subtitulo: ""))
        subcategoria.append(Subcategoria(titulo: "INFOQUEST", icono: #imageLiteral(resourceName: "thumb_infoquest.jpg"), subtitulo: ""))
        subcategoria.append(Subcategoria(titulo: "LITTLE READERS", icono: #imageLiteral(resourceName: "thumb_little_readers.jpg"), subtitulo: ""))
        subcategoria.append(Subcategoria(titulo: "SUPER STARS", icono: #imageLiteral(resourceName: "thumb_super_stars.jpg"), subtitulo: ""))
        subcategoria.append(Subcategoria(titulo: "POPCORN READERS", icono: #imageLiteral(resourceName: "thumbs_popcorn_readers.jpg"), subtitulo: ""))
        subcategoria.append(Subcategoria(titulo: "MEDIA READERS", icono: #imageLiteral(resourceName: "media_readers.jpg"), subtitulo: ""))
        subcategoria.append(Subcategoria(titulo: "RICHMOND READERS", icono: #imageLiteral(resourceName: "thumb_richmond_readers.jpg"), subtitulo: ""))
        subcategoria.append(Subcategoria(titulo: "DVD READERS", icono: #imageLiteral(resourceName: "thumb_dvd_readers.jpg"), subtitulo: ""))
        return subcategoria
    }
    
}
