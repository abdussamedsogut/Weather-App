//
//  ViewController.swift
//  Weather App
//
//  Created by Abdüssamed Söğüt on 27.05.2023.
//

import UIKit

class ViewController: UIViewController {


    
    @IBOutlet weak var labelCityName: UILabel!
    @IBOutlet weak var labelCurrentTemp: UILabel!
    @IBOutlet weak var labelFeelsTemp: UILabel!
    
    @IBOutlet weak var labelHighestTemp: UILabel!
    @IBOutlet weak var labelLowestTemp: UILabel!
    
    @IBOutlet weak var labelHumidity: UILabel!
    @IBOutlet weak var labelWindSpeed: UILabel!
    @IBOutlet weak var labelGustSpeed: UILabel!
    @IBOutlet weak var labelSeaLevel: UILabel!
    
    @IBOutlet weak var labelLatitude: UILabel!
    @IBOutlet weak var labelLongitude: UILabel!
    
    @IBOutlet weak var myView: UIView!
    @IBOutlet weak var viewHumidty: UIView!
    @IBOutlet weak var viewWind: UIView!
    @IBOutlet weak var viewSeaLevel: UIView!
    
    @IBOutlet weak var viewCoordinate: UIView!
    @IBOutlet weak var viewDescripton: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       

        myView.layer.borderWidth = 2.0
        myView.layer.borderColor = UIColor.black.cgColor
        
        
        viewHumidty.layer.borderWidth = 2.0
        viewHumidty.layer.borderColor = UIColor.black.cgColor
        viewHumidty.layer.cornerRadius = 20
        
        viewWind.layer.borderWidth = 2.0
        viewWind.layer.borderColor = UIColor.black.cgColor
        viewWind.layer.cornerRadius = 20

        
        viewSeaLevel.layer.borderWidth = 2.0
        viewSeaLevel.layer.borderColor = UIColor.black.cgColor
        viewSeaLevel.layer.cornerRadius = 20

        viewCoordinate.layer.borderWidth = 2.0
        viewCoordinate.layer.borderColor = UIColor.black.cgColor
        viewCoordinate.layer.cornerRadius = 20
        
        viewDescripton.layer.borderWidth = 2.0
        viewDescripton.layer.borderColor = UIColor.black.cgColor
        
    }



    
 
    
    

}

