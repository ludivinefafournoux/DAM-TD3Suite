//
//  MyWebViewController.swift
//  DAM-TD3
//
//  Created by Laura Daufeld on 18/01/2017.
//  Copyright © 2017 Ludivine. All rights reserved.
//

import UIKit
import SafariServices

class MyWebViewController: UIViewController {
    
    public var url: String = ""
    public var titre: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.addSubview(mywebviewoutlet)
        
        // change titre navigation bar
        self.navigationItem.title = titre
        
        // affiche toolbar
        self.navigationController?.isToolbarHidden = false
        
        // ajout bouton ouvrir dans safari
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Safari", style: .plain, target: self, action: #selector(openSafari))
        
        // chargez l’url du site web dans la webview
        mywebviewoutlet.loadRequest(NSURLRequest(url: NSURL(string: "http://\(url)")! as URL) as URLRequest)

    }
    
    // ouvrir dans safari
    func openSafari() {
        let safariVC = SFSafariViewController(url: NSURL(string: "http://\(url)")! as URL)
        self.present(safariVC, animated: true, completion: nil)
        //safariVC.delegate = self
    }
    func safariViewControllerDidFinish(controller: SFSafariViewController) {
        controller.dismiss(animated: true, completion: nil)
    }

    // webview outlet
    @IBOutlet weak var mywebviewoutlet: UIWebView!
    
    
    // boutons toolbar
    @IBAction func goBack(_ sender: Any) {
        self.mywebviewoutlet.goBack()
    }
    
    @IBAction func forward(_ sender: Any) {
        self.mywebviewoutlet.goForward()
    }
    
    @IBAction func reload(_ sender: Any) {
        self.mywebviewoutlet.reload()
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}
