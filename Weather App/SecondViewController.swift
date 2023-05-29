//
//  SecondViewController.swift
//  Weather App
//
//  Created by Abdüssamed Söğüt on 27.05.2023.
//

import UIKit



class SecondViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UISearchBarDelegate {
   
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return CityList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cityName = CityList[indexPath.row].name
        
        let cell = cityTableView.dequeueReusableCell(withIdentifier: "cityViewCell",for: indexPath) as! cityTableViewCell

        cell.cityLabel.text = cityName
        
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: "toWeatherData", sender: CityList[indexPath.row].id)
        
        let cityID = CityList[indexPath.row].id
        print(cityID)
                
        let vc = self.storyboard?.instantiateViewController(identifier: "viewControllerID") as! ViewController
        
        getTodayResult(cityID, vc)
        
    }
    
    
    func getTodayResult(_ cityID: Int, _ viewController:ViewController) {
        if let url = URL(string: "https://api.openweathermap.org/data/2.5/weather?APPID=e1540e9d04a2bcac98db40c4bb45fccd&units=metric&id=\(cityID)") {
            let request = URLRequest(url: url)
            let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
                 
                if  error == nil {
                    
                    if let incomingData = data {
                        do {
                            let json = try JSONSerialization.jsonObject(with: incomingData, options: JSONSerialization.ReadingOptions.mutableContainers) as AnyObject
                            
                            print(json)
                            
                            if let main = json["main"] as? NSDictionary {
                                
                                if  let humidity = main["humidity"] as? Int {
                                                                        
                                    DispatchQueue.main.sync {
                                        
                                         
                                            viewController.labelHumidity.text = String(humidity)
                                        }
                                    
                                    }
                                
                            }
                            
                        } catch  {
                            print("bir hata oluştu")
                        }
                    }
                }
            }
            task.resume()
        }
    }
    
    
    
    func loadCitiesFromJSON() -> [City]? {

        if let path = Bundle.main.path(forResource: "city.list", ofType: "json") {
            do {
               let data = try Data(contentsOf: URL(filePath: path))
                let cities = try JSONDecoder().decode([City].self, from: data)
                return cities
            } catch  {
                print("json veri okuması hatalı")
            }
        }
            
        return nil
    }
    
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var cityTableView: UITableView!
    
    
    var CityList = [City]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let loadedCities = loadCitiesFromJSON() {
            CityList = loadedCities
            
        }
        
             
        
        cityTableView.dataSource = self
        cityTableView.delegate = self
        searchBar.delegate = self
    }
    
}


