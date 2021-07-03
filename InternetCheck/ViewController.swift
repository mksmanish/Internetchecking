//
//  ViewController.swift
//  InternetCheck
//
//  Created by manish on 03/07/21.
//

import UIKit
import Network

class ViewController: UIViewController {
    // Mark: IBOutlet
    @IBOutlet weak var imageSmile: UIImageView!
    @IBOutlet weak var lblStatus: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        checkAvailablity()
    }
    
    func checkAvailablity() {
        let check = NWPathMonitor()
        check.pathUpdateHandler = { path in
            if path.status == .satisfied {
                
                DispatchQueue.main.async {
                    self.lblStatus.text = "Yes Contected"
                    self.view.backgroundColor = .green
                    self.imageSmile.image = UIImage(systemName: "hand.thumbsup.fill")
                   self.imageSmile.tintColor = .red
                }
                
                
            }else
            {
                DispatchQueue.main.async {
                    self.lblStatus.text = "Not Connected"
                    self.view.backgroundColor = .red
                    self.imageSmile.image = UIImage(systemName: "hand.thumbsdown.fill")
                    self.imageSmile.tintColor = .blue
                }
                
            }
        }
        let queue = DispatchQueue(label: "internet Check", qos: .utility)
        check.start(queue: queue)
    }
    
    
}

