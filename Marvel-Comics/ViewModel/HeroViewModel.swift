//
//  HeroViewModel.swift
//  Marvel-Comics
//
//  Created by Hector Carmona on 9/28/22.
//

import Foundation
import Alamofire
import SwiftyJSON
import Combine
import UIKit

class HeroViewModel {
    
    var heroModelArray: [HeroModel] = []
    var heroList = PassthroughSubject<[JSON], Error>()
//    var heroList: [String] = []
    
    func fetchData() {
        let urlString = "https://gateway.marvel.com:443/v1/public/characters?apikey=2e1f8906f07ca504665371350cd38c7e&ts=1&hash=6daf326c8d6c2941c1f11133cf7a62f7"
    
        Alamofire.request(urlString, method: .get).responseJSON
        { (responce) in
            if responce.result.isSuccess {
                guard let safeData = responce.data else { return }

                do {
                    let decoder = JSONDecoder()
                    let heroes = try decoder.decode(Heroes.self, from: safeData)
                    let heroArray = heroes.data.results
                    for index in  0...heroArray.count-1 {
                        let name = heroArray[index].name
                        let description = heroArray[index].description
                        let path = heroArray[index].thumbnail.path
                        let `extension` = heroArray[index].thumbnail.`extension`
                        var series: [String]? = []
                        heroArray[index].series.items.forEach {
                            series?.append($0.name)
                        }
                
                        let heroModel = HeroModel(name: name, description: description, imagePath: path, imageExtension: `extension`, series: series)
                        self.heroModelArray.append(heroModel)
                        print(self.heroModelArray[index].imageURL)
                    }
                } catch {
                    print(responce.error!)
                }
            }
        }
    
    
    }
}
