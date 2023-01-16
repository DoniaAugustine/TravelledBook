//
//  TravelledCitiesCollectionViewController.swift
//  TraveledBook
//
//  Created by Deep shah on 2022-09-07.
//

import UIKit
import CoreData

private let reuseIdentifier = "dataCell"
var DestinationDB : [TravelData]?

class TravelledCitiesCollectionViewController: UICollectionViewController {
    
   // private var cityDisplay : [Cities] = [Cities(image: "TajMahal", name: "Taj Mahal"),
    //Cities(image: "CNTower", name: "C.N Tower"),
   // Cities(image: "EiffelTower", name: "Eiffel Tower")]
    
    @IBAction func AddDestination(_ sender: Any) {
        let addDest = storyboard?.instantiateViewController(withIdentifier: "AddDestinationViewController") as! AddDestinationViewController
        
        self.navigationController?.pushViewController(addDest, animated: false)
    }
    
    @IBAction func unwindToMain(segue: UIStoryboardSegue){
            
        }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
//    func getRecordsCount() {
//        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "TravelData")
//        do {
//            let count = try context.count(for: fetchRequest)
//
//        } catch {
//            print(error.localizedDescription)
//        }
//    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        let context  = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "TravelData")
        do {
            let count = try context.count(for: fetchRequest)
            return count
            
        } catch {
            print(error.localizedDescription)
        }
        return 1
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! TravelledCitiesCollectionViewCell
        
//        let city = cityDisplay[indexPath.row]
//        cell.cityViewImage.image = UIImage(named: city.image)
//        cell.cityNameLabel.text = city.name
        
        let context  = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "TravelData")
        do{
            
            DestinationDB = try context.fetch(fetchRequest) as? [TravelData]
            
            
            if let photo = DestinationDB?[indexPath.row]{
                cell.cityViewImage.image = UIImage(data: photo.images!)
                    
              //  latitudeText.text = photo.latitude!
                cell.cityNameLabel.text = photo.destinationName!
            }
            
        }catch let error{
            print(error.localizedDescription)
        }
        
    
    
        return cell
    }
    
    // Need to change image for details screen
    
//    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
//        if segue.identifier == "showZoomController" {
//           let zoomVC = segue.destinationViewController as PhotoZoomViewController
//           let cell = sender as UICollectionViewCell
//           let indexPath = self.collectionView!.indexPathForCell(cell)
//           let userPost  = self.timeLineData.objectAtIndex(indexPath.row) as PFObject
//            zoomVC.post = userPost
//        }
//    }
//
//
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetail"{
            let destinationController = segue.destination as! DestinationDetailViewController
            if let indexPaths = collectionView.indexPathsForSelectedItems{
//                let cell = collectionView.cellForItem(at: indexPath) as? TravelledCitiesCollectionViewCell
//                = DestinationDB?[indexPaths[0].row]
//                destinationController.city =
//
//
                destinationController.savedData = DestinationDB?[indexPaths[0].row]
                
//                if let photo = DestinationDB?[indexPaths[0].row]{
//                    cell.cityViewImage.image = UIImage(data: photo.images!)
//
//                  //  latitudeText.text = photo.latitude!
//                    cell.cityNameLabel.text = photo.destinationName!
//                }
//
//                
//                if let selectedImage = DestinationDB?[indexPaths.first]{
//                    destinationController.cityImageView.image = UIImage(data: selectedImage.images!)
//                }
                
                
                
                collectionView.deselectItem(at:indexPaths[0], animated: false)
            }
        }
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
            performSegue(withIdentifier: "showDetail", sender: nil)
        }
    
    
    
//    @IBAction func DeleteAll(_ sender: Any) {
//        let fetchRequest: NSFetchRequest<NSFetchRequestResult> = NSFetchRequest(entityName: "TravelData")
//        let deleteRequest = NSBatchDeleteRequest(fetchRequest: fetchRequest)
//
//        do {
//            try NSPersistentStoreCoordinator.execute(deleteRequest)
//        } catch let error as NSError {
//            // TODO: handle the error
//        }
//    }
    
    
    
    

}
