//
//  CategoriasTableViewController.swift
//  RichmondCatalog
//
//  Created by Yanku on 08/08/16.
//  Copyright © 2016 Yanku. All rights reserved.
//

import UIKit

class CategoriasTableViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    let menu = Menu.getAll()
    
    override var prefersStatusBarHidden: Bool {
        return true
    }

    // MARK: - Table View Methods

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.menu.count
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return tableView.bounds.height / CGFloat(self.menu.count)
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0.0000000001
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 0.0000000001
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let menu = self.menu[indexPath.row]
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "SeriesTableViewController") as! SeriesTableViewController
        vc.menu = menu
        self.navigationController?.pushViewController(vc, animated: true)
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "categoriaCell", for: indexPath) as! CategoriasTableViewCell
        let menu = self.menu[indexPath.row]
        cell.labelCategoria?.text = menu.titulo
        cell.backgroundColor = menu.background
        cell.imgLogoCategoria.image = menu.icono
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


