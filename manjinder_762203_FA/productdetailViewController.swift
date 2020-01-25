//
//  productdetailViewController.swift
//  manjinder_762203_FA
//
//  Created by Manjinder Aulakh on 2020-01-24.
//  Copyright © 2020 Manjinder kaur. All rights reserved.
//

import UIKit

class productdetailViewController: UIViewController {
    var delegate : pTableViewController?
    
    @IBOutlet weak var nameLbl: UILabel!
       
       @IBOutlet weak var Idlbl: UILabel!
       
       @IBOutlet weak var descLbl: UILabel!
       @IBOutlet weak var pricelbl: UILabel!
       

       var str1 : String?
        var str2 : String?
        var str3 : String?
        var str4 : String?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        nameLbl.text = str1
        Idlbl.text = str2
        descLbl.text = str3
        pricelbl.text = str4
        
        // Do any additional setup after loading the view.
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
