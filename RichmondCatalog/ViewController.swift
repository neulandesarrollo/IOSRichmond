//
//  ViewController.swift
//  RichmondCatalog
//
//  Created by Yanku on 08/08/16.
//  Copyright © 2016 Yanku. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib
        //let tabtitle = UITabBarItem()
        UITabBarItem.appearance().setTitleTextAttributes([NSFontAttributeName: UIFont(name: "LeagueGothic-Regular",size: 17)!], for: .normal)
        //tabtitle.setTitleTextAttributes([NSFontAttributeName: UIFont(name: "LeagueGothic-Regular",size: 17)!], for: .normal)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

