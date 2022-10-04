//
//  DetallesViewController.swift
//  Marvel-Comics
//
//  Created by Hector Carmona on 10/3/22.
//

import UIKit
import Kingfisher

class DetallesViewController: UIViewController {
    
    //MARK: - propiedades superheroe
    var heroName: String = ""
    var heroeDescription: String? = ""
    var heroeImageURL: String = ""
    var heroeSeries: [String]? = []
    var serieString: String? {
        var newString = ""
        for index in 0..<(heroeSeries?.count ?? 0) {
            newString.append(heroeSeries?[index] ?? "No Descripcion")
            newString += "\n\n"
        }
        return newString
    }
    //MARK: - Datos para tableview DataSource
    var categoryArray: [String] = ["Nombre:", "Biografia:", "Series:"]
    var infoArray: [String] = []
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var heroeImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        heroeImage.setImage(imageURL: heroeImageURL)
        DispatchQueue.main.async {
            self.infoArray = [self.heroName, self.heroeDescription ?? "No Descripcion disponible", self.serieString ?? "No series disponibles"]
            self.tableView.reloadData()
        }
    }
    
}


//MARK: - TableView DataSource Methods.

extension DetallesViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return infoArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "infocell", for: indexPath)
        cell.textLabel?.text = categoryArray[indexPath.row]
        cell.detailTextLabel?.text = infoArray[indexPath.row]
        return cell
    }
}
