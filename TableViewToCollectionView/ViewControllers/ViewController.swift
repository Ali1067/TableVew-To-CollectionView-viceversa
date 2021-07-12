//
//  ViewController.swift
//  TableViewToCollectionView
//
//  Created by Muhammad Ali on 12/07/2021.
//  Ali1067@outlook.com 0092-331-2611993

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var tableview: UITableView!
    @IBOutlet weak var collectionview: UICollectionView!
    
    var pictures: [UIImage] = [ UIImage(named: "avengers")!,
                                UIImage(named:"starwar")!,
                                UIImage(named: "space")!,
                                UIImage(named: "friends")!,
                                UIImage(named: "fiftyshades")!,
                                UIImage(named: "avengers2")!
    ]
    var name: [String] = ["Avengers", "StarWar", "Space", "Friends Season", "50 Shades Of Gray", "Avengers 2"]
    
    var isTableView: Bool = false        // by default table is hidden
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Delegate & Datasource of CollectionView
        self.collectionview.delegate = self
        self.collectionview.dataSource = self
        
        
        
        // Delete & Datasource of Tableview
        self.tableview.delegate = self
        self.tableview.dataSource = self
        
        // To Re-Load Data
        self.tableview.reloadData()
        self.collectionview.reloadData()
        // Do any additional setup after loading the view.
        
        
        if(isTableView == true){          //show TableView
            tableview.isHidden = false
            collectionview.isHidden = true
        }else{
            collectionview.isHidden = false
        }
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        //hide on current view controller
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    override func viewWillDisappear(_ animated: Bool) {
        //show for other viewcontrollers
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    @IBAction func changeLayout(_ sender: Any) {
                
        if (isTableView == false){
            isTableView = true
            collectionview.isHidden = false
            tableview.isHidden = true
            collectionview.reloadData()
        } else if(isTableView == true){    // if table showing
            tableview.isHidden = false // hide the table
            collectionview.isHidden = true  // show the collection
            isTableView = false     // keep state of bool check
          
        }
    }
    
}

extension ViewController : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return name.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        if let cell: CellTable = tableview.dequeueReusableCell(withIdentifier: "CellTable") as? CellTable{
            
            cell.lblMovieTitle.text! = name[indexPath.row]
            cell.movieImage.image = pictures[indexPath.row]
            
            cell.movieImage.layer.cornerRadius = 8.0
            cell.movieImage.clipsToBounds = true
            
            return cell
        }
        return UITableViewCell()
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 280
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let ViewController = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "DescriptionVC") as? DescriptionVC
        ViewController?.desText = name[indexPath.row]
        ViewController?.newImage = pictures[indexPath.row]
        self.navigationController?.pushViewController(ViewController!, animated: true)
    }
    
    
}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return name.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell : CellCollection = collectionView.dequeueReusableCell(withReuseIdentifier: "CellCollection", for: indexPath) as? CellCollection {
            cell.lblMovieTitle.text! = name[indexPath.row]
            cell.movieImage.image = pictures[indexPath.row]
            cell.movieImage.layer.cornerRadius = 8.0
            cell.movieImage.clipsToBounds = true
            return cell
        }
        return UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        
        return CGSize(width: 270, height: 440)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
      
        let VC = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "DescriptionVC") as? DescriptionVC
        VC?.desText = name[indexPath.row]
        VC?.newImage = pictures[indexPath.row]
        self.navigationController?.pushViewController(VC!, animated: true)
    }
    
}


