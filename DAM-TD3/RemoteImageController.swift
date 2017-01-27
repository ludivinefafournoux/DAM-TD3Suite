//
//  RemoteImageController.swift
//  DAM-TD3
//
//  Created by Jonathan on 16/01/2017.
//  Copyright © 2017 Ludivine. All rights reserved.
//

import UIKit

class RemoteImageController: UIViewController {

    var imageView1 : UIImageView!

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // imageview
        imageView1 = UIImageView(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height))
        
        
        /*let button1 = UIButton(frame: CGRect(x: 0, y: 470, width: 115, height: 50))
        button1.backgroundColor = .purple
        button1.setTitle("Button 1", for: .normal)
        button1.addTarget(self, action: #selector(buttonAction1), for: .touchUpInside)        
        
        let button2 = UIButton(frame: CGRect(x: 100, y: 470, width: 115, height: 50))
        button2.backgroundColor = .blue
        button2.setTitle("Button 2", for: .normal)
        button2.addTarget(self, action: #selector(buttonAction2), for: .touchUpInside)
        
        let button3 = UIButton(frame: CGRect(x: 200, y: 470, width: 115, height: 50))
        button3.backgroundColor = .red
        button3.setTitle("Button 3", for: .normal)
        button3.addTarget(self, action: #selector(buttonAction3), for: .touchUpInside)
        
        self.view.addSubview(button1)
        self.view.addSubview(button2)
        self.view.addSubview(button3)*/
        
        
    }
    
    @IBOutlet weak var button1: UIButton!
    @IBAction func button1Action(_ sender: Any) {
        print("Button1 tapped")
        self.view.addSubview(self.imageView1)
        self.view.sendSubview(toBack: self.imageView1)
    }
    
    @IBOutlet weak var button2: UIButton!
    @IBAction func button2Action(_ sender: Any) {
        print("Button2 tapped")
        imageView1.backgroundColor = UIColor.black
        self.imageView1.image = UIImage(named: "pandaroux")
        imageView1.contentMode = .scaleAspectFit
    }
    
    @IBOutlet weak var button3: UIButton!
    @IBAction func button3Action(_ sender: Any) {
        print("Button3 tapped")
        imageView1.backgroundColor = UIColor.black
        let url = URL(string: "http://www.clipartkid.com/images/293/re-uploading-old-art-red-panda-by-sarilain-0JgNA8-clipart.png")
        let data = try? Data(contentsOf: url!) //make sure your image in this url does exist, otherwise unwrap in a if let check / try-catch
        imageView1.image = UIImage(data: data!)
        imageView1.contentMode = .scaleAspectFit
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
