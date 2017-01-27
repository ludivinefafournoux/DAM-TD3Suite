//
//  PartiesController.swift
//  DAM-TD3
//
//  Created by Laura Daufeld on 23/01/2017.
//  Copyright © 2017 Ludivine. All rights reserved.
//

import UIKit

class PartiesController: UITableViewController {
    
    // variable tableau résultats json
    var eventArray = [Event]()
    // variable pour formater les dates
    let dateFormatter = DateFormatter()

    @IBAction func triDescAction(_ sender: Any) {
        // tri descendant
        eventArray.sort(by: {$0.date.compare($1.date) == .orderedDescending})
        // reload data
        tableView.reloadData()
    }
    
    @IBAction func triAscAction(_ sender: Any) {
        // tri ascendant
        eventArray.sort(by: {$0.date.compare($1.date) == .orderedAscending})
        // reload data
        tableView.reloadData()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Ajout d'un margin top à la tableView
        self.tableView.contentInset = UIEdgeInsetsMake(15, 0, 0, 0)
        
        
        // Dimension et style du TableView
        //tableView = UITableView(frame: UIScreen.main.bounds)

        // Uncomment the following line to preserve selection between presentations
        //self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        
        
        
        // récupération jon
        if let url = URL(string: "http://sealounge.lanoosphere.com/seadata_en.xml") {
            do {
                let contenu = try String(contentsOf: url)
                
                let xml = SWXMLHash.parse(contenu) // parse json
                
                for index in 0...22 { // parcours chaque balise Event du json
                    let id = xml["Data"]["Event"][index].element!.attribute(by: "id")!.text
                    //print(id)
                    
                    // date
                    let date = xml["Data"]["Event"][index].element!.attribute(by: "date")!.text
                    
                    // formater string to date
                    dateFormatter.dateFormat = "yyyy-MM-dd HH:mm"
                    let myDate = dateFormatter.date(from: date)
                    
                    
                    // nom
                    let name = xml["Data"]["Event"][index].element!.attribute(by: "name")!.text
                    //print(name)
                    
                    // image
                    let flyer = xml["Data"]["Event"][index].element!.attribute(by: "flyer")!.text
                    //print(flyer)
                    
                    let event = Event(id: Int(id)!, date: myDate!, name: name, flyer: flyer) // créé un objet event (class Event)
                    
                    eventArray.append(event) // passe l'objet event au tableau eventArray
                    //print(event.id)
                    
                }
            }
            catch {
            }
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
   
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! CustomCellParties
        
        // opacité flyer à 0
        cell.flyerOutlet.alpha = 0.0
        
        // Name
        cell.nameOutlet.text = eventArray[indexPath.row].name
        cell.nameOutlet.font = UIFont.boldSystemFont(ofSize: 28.0)
     
        // converti l'url des flyers en image et ajoute à cell
        if let urlFlyer = NSURL(string: eventArray[indexPath.row].flyer) {
            if let data = NSData(contentsOf: urlFlyer as URL) {
                DispatchQueue.main.async {
                    let flyerImg = UIImage(data: data as Data)
                    UIView.animate(withDuration: 1.5, animations: {
                        cell.flyerOutlet.image = flyerImg
                        cell.flyerOutlet.alpha = 1.0
                    })
                }
            }
        }
        
        // formater date en string
        dateFormatter.dateFormat = "dd/MM/yyyy"
        let dateString = dateFormatter.string(from: eventArray[indexPath.row].date as Date)
        cell.dateOutlet.text = "Le " + dateString
        
        // formater date en string pour l'heure
        dateFormatter.dateFormat = "HH"
        let hourString = dateFormatter.string(from: eventArray[indexPath.row].date as Date)
        cell.hourOutlet.text = hourString + "H"
        cell.hourOutlet.font = UIFont.boldSystemFont(ofSize: 23.0)
        
        return cell
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
        return eventArray.count
    }


    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
