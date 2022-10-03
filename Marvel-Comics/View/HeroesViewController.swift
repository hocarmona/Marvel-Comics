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

class HeroesViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var anycancellable: [AnyCancellable] = []
    var heroViewModel = HeroViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UINib(nibName: "HeroeTableViewCell", bundle: nil), forCellReuseIdentifier: "cell")
        tableView.dataSource = self
        tableView.delegate = self
        suscriptions()
        heroViewModel.fetchData()
    }
    
    private func suscriptions() {
        heroViewModel.heroList.sink { _ in } receiveValue: {[weak self] heroe in
            print("success")
            print(heroe)
        }.store(in: &anycancellable)

    }

}

//MARK: - TableView DataSource Methods
extension HeroesViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! HeroeTableViewCell
        cell.heroeNameLabel.text = "HeroeDEfault\nhjgfiure\nsghfie\n"
        cell.heroeImage.image = UIImage(named: "spiderman")
        return cell
    }
}

//MARK: -TableView Delegate Methods
extension HeroesViewController: UITableViewDelegate {
    
}
    




