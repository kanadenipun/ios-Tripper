//
//  ViewController.swift
//  Tripper
//
//  Created by NIPUN KANADE on 16/07/17.
//  Copyright © 2017 ThoughtWorks. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
   
    
    @IBOutlet weak var tableView: UITableView!
    
    var trips : [Trip] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 500
    }
    
    override func viewWillAppear(_ animated: Bool) {
   
    }
    
    override func viewDidAppear(_ animated: Bool) {
        getTrips()
        tableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell:CustomTableViewCell = tableView.dequeueReusableCell(withIdentifier: "CustomCell", for: indexPath) as! CustomTableViewCell
        
        let trip = trips[indexPath.row]
        
        cell.tripViewImage.image = UIImage(data: trip.image! as Data)
        cell.tripViewLabel.text = trip.title
     
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let trip = trips[indexPath.row]
        performSegue(withIdentifier: "showTripDetailsSegue", sender: trip)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return trips.count
    }
    
    func getTrips(){
    
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        do {
            trips = try context.fetch(Trip.fetchRequest()) as! [Trip]
            print(trips)
        } catch {
            print("Error occured in fetching items")
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "showTripDetailsSegue" {
            let nextVC = segue.destination as! ShowTripsViewController
            nextVC.trip = sender as! Trip
            nextVC.previousVC = self
        }
        
    }
}

