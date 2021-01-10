//
//  DetailViewController.swift
//  drugs
//
//  Created by Jaskirat Singh on 2021-01-09.
//

import UIKit

class DetailViewController: UIViewController {

    var selectedData: String?
    
    @IBOutlet weak var dataLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "\(selectedData!) details"
        dataLabel.text = selectedData
    }
}
