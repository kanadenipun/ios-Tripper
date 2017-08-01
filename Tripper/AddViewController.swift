//
//  AddViewController.swift
//  Tripper
//
//  Created by NIPUN KANADE on 16/07/17.
//  Copyright © 2017 ThoughtWorks. All rights reserved.
//

import UIKit

class AddViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var titleTextInput: UITextField!
    @IBOutlet weak var imageView: UIImageView!
    
    var imagePicker = UIImagePickerController()
    var previousVC = HomeViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imagePicker.delegate = self
    }

    @IBAction func photoButtonTapped(_ sender: Any) {
        imagePicker.sourceType = .photoLibrary
        present(imagePicker, animated: true, completion: nil)
    }
    
    @IBAction func cameraButtonTapped(_ sender: Any) {
//        imagePicker.sourceType = .camera
//        present(imagePicker, animated: true, completion: nil)
//        dismiss(animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        imageView.image = info[UIImagePickerControllerOriginalImage] as? UIImage
        dismiss(animated:true, completion: nil)
    }
    
    @IBAction func addButtonTapped(_ sender: Any) {
    
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        let trip = Trip(context:context)
        
        if(titleTextInput.text == nil || imageView.image == nil) {
                print("Title Or Image Was Empty")
        }else{
            do {
                trip.title = titleTextInput.text
                trip.image = UIImagePNGRepresentation(imageView.image!)! as NSData
                try context.save()
                navigationController?.popViewController(animated: true)
            
            } catch {
                print("Error happened in saving object")
            }
        }
    }
}
