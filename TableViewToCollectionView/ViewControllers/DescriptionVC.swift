//
//  DescriptionVC.swift
//  TableViewToCollectionView
//
//  Created by Muhammad Ali on 12/07/2021.
// //  Ali1067@outlook.com 0092-331-2611993

import UIKit

class DescriptionVC: UIViewController {
    
    
    var desText: String = "" // declared to get string from Previous ViewController but not using this.
    var newImage: UIImage!
    @IBOutlet weak var descriptionLbl: UILabel!
    
    
    @IBOutlet weak var imageview: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = " \(desText)"
        
//        navigationController?.navigationBar.barTintColor = UIColor.black
        navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.white]
        
        // Do any additional setup after loading the view.
        
        imageview.image = newImage
        descriptionLbl.text! = "Welcome to the description screen. you're looking the details of **** \(desText) **** move. it was released on 1550 :-D i don't have enough details of the movie to explain. and this text is just to give you an idea about test task for iOS Skills"
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
