//
//  WebsitesTableViewController.swift
//  DAM-TD3
//
//  Created by Jonathan on 16/01/2017.
//  Copyright © 2017 Ludivine. All rights reserved.
//

import UIKit


class WebsitesTableViewController: UITableViewController {
    
    var sites = ["Facebook", "Twitter", "Google"]
    var favicon = [UIImage]()
    var url = ["www.facebook.com", "www.twitter.com", "www.google.com"]
    var finLien = "/favicon.ico"


    override func viewDidLoad() {
        super.viewDidLoad()
        
        // récup favicons URL
        /*if let urlFb = NSURL(string: "http://www.facebook.com/favicon.ico") {
            if let data = NSData(contentsOf: urlFb as URL) {
                let image = UIImage(data: data as Data)
                favicon.append(image!)
            }
        }
        
        if let urlTwitter = NSURL(string: "http://www.twitter.com/favicon.ico") {
            if let data = NSData(contentsOf: urlTwitter as URL) {
                let image = UIImage(data: data as Data)
                favicon.append(image!)
            }
        }
        
        if let urlGoogle = NSURL(string: "http://www.google.com/favicon.ico") {
            if let data = NSData(contentsOf: urlGoogle as URL) {
                let image = UIImage(data: data as Data)
                favicon.append(image!)
            }
        }*/
        
    }
  
    
    // UIAlertController, ajout d'un site web
    @IBAction func addAction(_ sender: Any) {
        
        let alertController = UIAlertController(title: "Sites", message: "Ajouter un site web", preferredStyle: .alert)
        
        let actionCancel = UIAlertAction(title: "Cancel", style: .cancel) { (action:UIAlertAction) in
            //This is called when the user presses the cancel button.
            print("You've pressed the cancel button")
        }
        
        let actionAdd = UIAlertAction(title: "Ajouter", style: .default) { (action:UIAlertAction) in
            //This is called when the user presses the add button.
            let textNom = alertController.textFields![0] as UITextField
            let textURL = alertController.textFields![1] as UITextField
            
            self.sites.append(String(describing: textNom.text!))
            //print(textNom.text!)
            self.url.append(String(describing: textURL.text!))
            //print(textURL.text!)
            //self.favicon.append(UIImage())
            
            // recharge la tableview
            self.tableView.reloadData()
            
            print("The user entered: ",textNom.text!,textURL.text!)
        }
        
        alertController.addTextField { (textField) -> Void in
            //Configure the attributes of the first text box.
            textField.placeholder = "Nom"
        }
        
        alertController.addTextField { (textField) -> Void in
            //Configure the attributes of the second text box.
            textField.placeholder = "URL"
            //textField.secureTextEntry = true
        }
        
        //Add the buttons
        alertController.addAction(actionCancel)
        alertController.addAction(actionAdd)
        
        //Present the alert controller
        self.present(alertController, animated: true, completion:nil)
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return sites.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! CustomCell

        // Configure the cell...
        let chemin = String(url[indexPath.row]+finLien)
        print(chemin!)
        cell.title.text = sites[indexPath.row]
        cell.title.font = UIFont.boldSystemFont(ofSize: 16.0)
        
        if let url = URL(string: "http://\(self.url[indexPath.row])/favicon.ico") {
            do  {
                let data = try Data(contentsOf: url)
                cell.favicon.image = UIImage(data: data)
            }
            catch {
                print("error retrieving file for : \(self.url[indexPath.row])")
            }
        }
        else {
            print("not a URL")
        }
        
        //cell.favicon.image = favicon[indexPath.row]
        //cell.favicon.backgroundColor = UIColor.darkGray
        cell.url.text = url[indexPath.row]

        return cell
    }
    
    
    // détecter la sélection d'une cellule
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.deselectRow(at: indexPath, animated: true)
        //print("url: \(url[indexPath.row])")
        
        // « poussez » une instance de MyWebViewController dans le navigation controller 
        if let viewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "viewview") as? MyWebViewController {
            viewController.url = url[indexPath.row] // passage de l'url
            viewController.titre = sites[indexPath.row] // passage du nom du site
            if let navigator = navigationController {
                navigator.pushViewController(viewController, animated: true)
            }
        }
    }

}


