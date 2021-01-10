//
//  ViewController.swift
//  drugs
//
//  Created by Jaskirat Singh on 2021-01-09.
//

import UIKit

class ViewController: UIViewController{

    //Main collection view covering the entire home screen
    
    @IBOutlet var collectionView: UICollectionView!
    
    var data = ["🤨","🤔","😇","😅","😚","😂","😍","🤪","😝","😒","😞","🥳","😟","😎","😋","🥰","😍"]
    
    let refreshControl = UIRefreshControl()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        collectionView.delegate = self
        collectionView.dataSource = self
        
        //Displaying the cells properly
        let numofColumns = 1
        let width = (self.view.frame.size.width - CGFloat((numofColumns - 1)*10)) / CGFloat(numofColumns)
        let layout = collectionView.collectionViewLayout as! UICollectionViewFlowLayout
        
        //Setting the cell size
        layout.itemSize = CGSize(width: width, height: width)

        refreshControl.addTarget(self, action: #selector(appendNewItem), for: UIControl.Event.valueChanged)
        collectionView.refreshControl = refreshControl
        
    }
    
    //refresh control selector
    @objc func appendNewItem(){
        let text = "🥔"
        data.insert(text, at: 0)
        let indexPath = IndexPath(row: 0, section: 0)
        collectionView.insertItems(at: [indexPath])
        collectionView.refreshControl?.endRefreshing()
    }

}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CustomCell
        
        if let label = cell.viewWithTag(100) as? UILabel{
            label.text = data[indexPath.item]
        }
        cell.itemLabel.text = data[indexPath.item]
        
        //Enable to round the cells
        //cell.layer.cornerRadius = 20
        return cell
    }
    
    //Cell selection
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath){
        let selectedData = data[indexPath.item]
        self.performSegue(withIdentifier: "detail", sender: selectedData)
    }
    
}
