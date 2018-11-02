//
//  CreateCollectableViewController.swift
//  Collector
//
//  Created by Andres Felipe De La Ossa Navarro on 10/19/18.
//  Copyright © 2018 Andres Felipe De La Ossa Navarro. All rights reserved.
//

import UIKit

class CreateCollectableViewController: UIViewController, UIImagePickerControllerDelegate,UINavigationControllerDelegate {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleTextField: UITextField!
    var pickerController = UIImagePickerController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        pickerController.delegate = self
  
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[.originalImage] as? UIImage {
            imageView.image = image
        }
        pickerController.dismiss(animated: true, completion: nil)
    }
    @IBAction func mediaFolderTapped(_ sender: Any) {
        pickerController.sourceType = .photoLibrary
        present(pickerController, animated: true, completion: nil)
    }
    @IBAction func cameraTapped(_ sender: Any) {
        pickerController.sourceType = .camera
        present(pickerController, animated: true, completion: nil)
        
    }
    
    @IBAction func addTapped(_ sender: Any) {
        if let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext{
            let collectable = Collectable(context:context)
            collectable.title = titleTextField.text
            collectable.image = imageView.image?.jpegData(compressionQuality: 1.0)
            (UIApplication.shared.delegate as? AppDelegate)?.saveContext()
        }
        navigationController?.popViewController(animated: true)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
