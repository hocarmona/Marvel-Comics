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
        title = "Heroes Marvel Comics"
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
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "goToDetalles", sender: self)
    }
    
    // Transferencia de datos hacia el proximo controlador a mostrar.
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToDetalles" {
            let destinationvc = segue.destination as! DetallesViewController
            if let indexPath = tableView.indexPathForSelectedRow {
                destinationvc.heroName = heroesList[indexPath.row].name
                destinationvc.heroeSeries = heroesList[indexPath.row].series
                destinationvc.heroeImageURL = heroesList[indexPath.row].imageURL
                destinationvc.heroeDescription = heroesList[indexPath.row].description
            }
        }
        
    }
}





