//
//  ViewController.swift
//  Marvel-Comics
//
//  Created by Hector Carmona on 9/28/22.
//

import UIKit
import Alamofire
import SwiftyJSON
import Kingfisher
import Combine

class ViewController: UIViewController {
    @IBOutlet weak var imageHeroe: UIImageView!
    
    var heroViewModel = HeroViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        heroViewModel.fetchData()

        
        // Do any additional setup after loading the view.
    }
    



}

