//
//  ViewController.swift
//  Marvel-Comics
//
//  Created by Hector Carmona on 9/28/22.
//

import UIKit
import Alamofire
import Kingfisher
import Combine

class HeroesViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var anycancellable: [AnyCancellable] = []
    var heroViewModel = HeroViewModel()
    var heroesList: [HeroModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UINib(nibName: "HeroeTableViewCell", bundle: nil), forCellReuseIdentifier: "cell")
        tableView.dataSource = self
        tableView.delegate = self
        suscriptions()
        heroViewModel.fetchData()
    }
    
    private func suscriptions() {
        heroViewModel.heroList.sink { _ in } receiveValue: {[weak self] heroes in
            print("success")
            DispatchQueue.main.async {
                self?.heroesList = heroes
                self?.tableView.reloadData()
            }
        }.store(in: &anycancellable)

    }

}

//MARK: - TableView DataSource Methods
extension HeroesViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return heroesList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! HeroeTableViewCell
        cell.heroeNameLabel.text = "Name:\n\(heroesList[indexPath.row].name)"
        cell.heroeImage.setImage(imageURL: heroesList[indexPath.row].imageURL)
        return cell
    }
}

//MARK: -TableView Delegate Methods
extension HeroesViewController: UITableViewDelegate {
    
}
    




