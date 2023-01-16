//
//  AddDestinationViewController.swift
//  TraveledBook
//
//  Created by Deep shah on 2022-09-13.
//

import UIKit
import CoreData

class AddDestinationViewController: UIViewController, UINavigationControllerDelegate {
    
   // var locations : [NSManagedObject] = []
    
    @IBOutlet weak var destination : UITextField!
    @IBOutlet weak var latitude : UITextField!
    @IBOutlet weak var longitude : UITextField!
    @IBOutlet weak var video : UITextField!
    
    @IBOutlet weak var Image1: UIImageView!
    
   // @IBOutlet weak var Image2: UIImageView!
    
  //  @IBOutlet weak var Image3: UIImageView!
    
    var imagePicker = UIImagePickerController()
//    var imagePicker2 = UIImagePickerController()
//    var imagePicker3 = UIImagePickerController()
    var DestinationDB : [TravelData]?
    
    @IBAction func ImgBtn1(_ sender: Any) {
        self.openImagePicker1()
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func AddDestinationToCD(_ sender: Any) {

        let context  = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        guard let entity = NSEntityDescription.entity(forEntityName: "TravelData", in: context)
        else{
            return
        }
        
        let travelData = NSManagedObject(entity: entity, insertInto: context)

//        let travelData = NSEntityDescription.insertNewObject(forEntityName: "TravelData", into: context) as! TravelData


            let DestName = self.destination.text
        travelData.setValue(DestName, forKey: "destinationName")
        
        //    travelData.destinationName = DestName
            
                let DestLat = Double(self.latitude.text!)!
        travelData.setValue(DestLat, forKey: "destLatitude")
        
        //        travelData.destLatitude = DestLat
        
                    let DestLong = Double(self.longitude.text!)!
        travelData.setValue(DestLong, forKey: "destLongitude")
           //         travelData.destLongitude = DestLong
          
                        let DestVideo = self.video.text
        travelData.setValue(DestVideo, forKey: "videoLink")
        
        //                travelData.videoLink = DestVideo
        
                    let DestImage = self.Image1.image?.pngData()
        travelData.setValue(DestImage, forKey: "images")
        
        //                travelData.images = DestImage
        
        do{
            try context.save()
        }catch let error {
            print(error.localizedDescription)
        }
        
        
        // swathi
        
//        let saveDataDB = storyboard?.instantiateViewController(withIdentifier: "TravelledCitiesCollectionViewController") as! TravelledCitiesCollectionViewController
//        
//        self.navigationController?.pushViewController(saveDataDB, animated: false)
        
    }
    
    
    
    
    @IBAction func ImgBtn2(_ sender: Any) {
     //  self.openImagePicker2()
    }
    
    @IBAction func ImgBtn3(_ sender: Any) {
   //     self.openImagePicker3()
    }
    
    
    
//    func save(saveDestination: String, saveLatitude: String, saveLongitude: String, saveImage: Data){
//            guard let appDelegate = UIApplication.shared.delegate as? AppDelegate
//            else{
//                return
//            }
//            let managedContext = appDelegate.persistentContainer.viewContext
//
//            let entity = NSEntityDescription.entity(forEntityName: "TravelData", in: managedContext)!
//
//            let destinationValue = NSManagedObject(entity: entity, insertInto: managedContext)
//
//
//        destinationValue.setValue(saveDestination, forKeyPath: "destinatoinName")
//        destinationValue.setValue(saveLatitude , forKeyPath: "destLatitude")
//        destinationValue.setValue(saveLongitude, forKeyPath: "destLongitude")
//
//            //person.setValue(name, forKeyPath: "name")
//
//            do{
//                try managedContext.save()
//
//
//              // DestinationDB.append(destinationValue)
//                //people.append(person)
//
//            }
//            catch let error as NSError{
//                print("Coud not save \(error),\(error.userInfo)")
//            }
//        }
    
    // end of AddDestinationViewController class
}
    
extension AddDestinationViewController: UIImagePickerControllerDelegate{
    
    // for Image1
    func openImagePicker1(){
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary){
            imagePicker.delegate = self
            imagePicker.sourceType = .photoLibrary
            imagePicker.allowsEditing = false
            present(imagePicker, animated: true, completion: nil)
        }
    }
    
    // for Image2
//    func openImagePicker2(){
//        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary){
//            imagePicker2.delegate = self
//            imagePicker2.sourceType = .photoLibrary
//            imagePicker2.allowsEditing = false
//            present(imagePicker2, animated: true, completion: nil)
//        }
//    }
//
//    // for Image3
//    func openImagePicker3(){
//        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary){
//            imagePicker.delegate = self
//            imagePicker.sourceType = .photoLibrary
//            imagePicker.allowsEditing = false
//            present(imagePicker, animated: true, completion: nil)
//        }
//    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        dismiss(animated: true, completion: nil)
        if let img = info[.originalImage] as? UIImage{
            self.Image1.image = img
        }
        
//        if let img2 = info[.originalImage] as? UIImage{
//            self.Image2.image = img2
//        }
//
//        if let img3 = info[.originalImage] as? UIImage{
//            self.Image3.image = img3
//        }
        
    }
    // end of extension
}
