//
//  SeriesUITabBarController.swift
//  RichmondCatalog
//
//  Created by GrupoNeu on 28/09/16.
//  Copyright © 2016 Yanku. All rights reserved.
//

import UIKit

class SeriesUITabBarController: UITabBarController {
    
    let indice = SeriesTableViewController()

    
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

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        tabBar.backgroundColor = colorsSeriesSolid[1]
    }

}
