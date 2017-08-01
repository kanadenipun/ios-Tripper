//
//  ShowTripsViewController.swift
//  Tripper
//
//  Created by NIPUN KANADE on 23/07/17.
//  Copyright © 2017 ThoughtWorks. All rights reserved.
//

import UIKit

class ShowTripsViewController: UIViewController {

    var trip : Trip = Trip()
    var previousVC = UIViewController()
    
    @IBOutlet weak var tripImageView: UIImageView!
    
   
    @IBOutlet weak var tripLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tripImageView.image = UIImage(data: trip.image! as Data)
        tripLabel.text = trip.title
        
        // Do any additional setup after loading the view.
    }

    
    @IBAction func deleteTripPressed(_ sender: Any) {
    }
}
