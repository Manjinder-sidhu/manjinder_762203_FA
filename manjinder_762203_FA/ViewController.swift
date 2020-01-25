//
//  ViewController.swift
//  manjinder_762203_FA
//
//  Created by Manjinder Aulakh on 2020-01-24.
//  Copyright © 2020 Manjinder kaur. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {


    
    
    @IBOutlet weak var nameLbl: UILabel!
       
       @IBOutlet weak var Idlbl: UILabel!
       
       @IBOutlet weak var descLbl: UILabel!
       @IBOutlet weak var pricelbl: UILabel!
       

     
   
    
    var productsd : [Product]?
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
      loadCoreData()
      saveCoreData()
        
    }

   
    
    
    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//           // Get the new view controller using segue.destination.
//           // Pass the selected object to the new view controller.
//           
//           let detailview = segue.destination as! pTableViewController
//           detailview.delegate = self
//        self.productsd = detailview.products
//      
//       }
      
     func saveCoreData(){
            
                   clearCoreData()
            
                   let appDelegate = UIApplication.shared.delegate as! AppDelegate
                      
                    let context = appDelegate.persistentContainer.viewContext
                          
                          //3rd step: write into the context
                          
                          
                    let product1 = NSEntityDescription.insertNewObject(forEntityName: "ProductModal", into: context)

                    product1.setValue("TV", forKey: "name")
                    product1.setValue("TV1", forKey: "id")
                    product1.setValue("Television", forKey: "desc")
                    product1.setValue(1000, forKey: "price")
                   
                   
                    let product2 = NSEntityDescription.insertNewObject(forEntityName: "ProductModal", into: context)

                    product2.setValue("pen", forKey: "name")
                    product2.setValue("p1", forKey: "id")
                    product2.setValue("pen", forKey: "desc")
                    product2.setValue(10, forKey: "price")
//    //
//                    let product3 = NSEntityDescription.insertNewObject(forEntityName: "ProductModal", into: context)
//
//                    product3.setValue("book", forKey: "name")
//                    product3.setValue("ap1", forKey: "id")
//                    product3.setValue("book for java", forKey: "desc")
//                    product3.setValue(100, forKey: "price")
//    //
//    //
//                    let product4 = NSEntityDescription.insertNewObject(forEntityName: "ProductModal", into: context)
//
//                    product4.setValue("microwave", forKey: "name")
//                    product4.setValue("m1", forKey: "id")
//                    product4.setValue("kitchen usage", forKey: "desc")
//                    product4.setValue(1020, forKey: "price")

                    let product5 = NSEntityDescription.insertNewObject(forEntityName: "ProductModal", into: context)

                    product5.setValue("cream", forKey: "name")
                    product5.setValue("c1", forKey: "id")
                    product5.setValue("kitchen product", forKey: "desc")
                    product5.setValue(10, forKey: "price")
                      
            
            let product6 = NSEntityDescription.insertNewObject(forEntityName: "ProductModal", into: context)

                           product6.setValue("fan", forKey: "name")
                           product6.setValue("f1", forKey: "id")
                           product6.setValue("house usage", forKey: "desc")
                           product6.setValue(130, forKey: "price")

                           let product7 = NSEntityDescription.insertNewObject(forEntityName: "ProductModal", into: context)

                           product7.setValue("jug", forKey: "name")
                           product7.setValue("j1", forKey: "id")
                           product7.setValue("kitchen usage", forKey: "desc")
                           product7.setValue(10, forKey: "price")
            
            let product8 = NSEntityDescription.insertNewObject(forEntityName: "ProductModal", into: context)

                                  product8.setValue("AC", forKey: "name")
                                  product8.setValue("AC1", forKey: "id")
                                  product8.setValue("house usage", forKey: "desc")
                                  product8.setValue(1350, forKey: "price")

                                  let product9 = NSEntityDescription.insertNewObject(forEntityName: "ProductModal", into: context)

                                  product9.setValue("Laptop", forKey: "name")
                                  product9.setValue("lp1", forKey: "id")
                                  product9.setValue("study usage", forKey: "desc")
                                  product9.setValue(1120, forKey: "price")
                   
            let product10 = NSEntityDescription.insertNewObject(forEntityName: "ProductModal", into: context)

                                         product10.setValue("Table", forKey: "name")
                                         product10.setValue("tb1", forKey: "id")
                                         product10.setValue("study usage", forKey: "desc")
                                         product10.setValue(120, forKey: "price")
            
            
            
            
                          // 4th step: save context
                          
                          do{
                              try context.save()
    //                          print(product1, "is saved")

                          }
                          catch{
                              print(error)
                          }
        }
    
    
    func loadCoreData(){
        
        productsd = [Product]()
        
        //create an instance of app delegate
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
            
        /*
            Second we need the context
            This context is the manager like location manager, audio manager etc
         */
                
        let managedContext = appDelegate.persistentContainer.viewContext
        
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "ProductModal")
        
        do{
            let results = try managedContext.fetch(fetchRequest)
            if results is [NSManagedObject]{
                for result in results as! [NSManagedObject]{
                    let productName = result.value(forKey: "name") as! String
                    let productId = result.value(forKey: "id") as! String
                    let productDescription = result.value(forKey: "desc") as! String
                    let productPrice = result.value(forKey: "price") as! Int
//                    productsd?.append(Product(productName: productName, productId: productId, productDescription: productDescription, price: productPrice))
//                    print(productsd)
                 
                    nameLbl.text = productName
                    Idlbl.text = productId
                    descLbl.text = productDescription
                    pricelbl.text = String(productPrice)
                    
                    
                }
            }
        }
        catch{
            print(error)
        }
        
        
    }

    
    func clearCoreData(){
        
        //create an instance of app delegate
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
            
        /*
            Second we need the context
            This context is the manager like location manager, audio manager etc
         */
                
        let managedContext = appDelegate.persistentContainer.viewContext
        
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "ProductModal")
        
        fetchRequest.returnsObjectsAsFaults = false
        
        do{
            let results = try managedContext.fetch(fetchRequest)
            for managedObjects in results{
                if let managedObjectData = managedObjects as? NSManagedObject{
                    managedContext.delete(managedObjectData)
                }
            }
        }
        catch{
            print(error)
        }
    }
    
}

