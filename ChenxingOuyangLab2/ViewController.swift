//
//  ViewController.swift
//  ChenxingOuyangLab2
//
//  Created by ouyang chenxing on 2/5/17.
//  Copyright © 2017 ouyang chenxing. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var foodView: DisplayView!
    @IBOutlet weak var happyView: DisplayView!
    
    @IBOutlet weak var playTimes: UILabel!
    @IBOutlet weak var feedTimes: UILabel!
    @IBOutlet weak var growthCount: UILabel!
    
    @IBOutlet weak var foodWarning: UILabel!
    @IBOutlet weak var happyWarning: UILabel!

    @IBOutlet weak var backView: UIView!
    @IBOutlet weak var petImage: UIImageView!
    
    
    var dogInstance:PetPlayFeed!
    var catInstance:PetPlayFeed!
    var birdInstance:PetPlayFeed!
    var bunnyInstance:PetPlayFeed!
    var fishInstance:PetPlayFeed!
    var petType = ""

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        dogInstance = PetPlayFeed(name: "Dog")
        catInstance = PetPlayFeed(name: "Cat")
        birdInstance = PetPlayFeed(name: "Bird")
        bunnyInstance = PetPlayFeed(name: "Bunny")
        fishInstance = PetPlayFeed(name: "Fish")
        foodView.color = UIColor(red: 64/255, green: 224/255, blue: 205/255, alpha:1)
        happyView.color = UIColor(red: 0/255, green: 199/255, blue: 140/255, alpha:1)
        updateDogView()
    }

    @IBAction func playPet(_ sender: Any) {
        switch petType {
            case "Dog":
                dogInstance.play()
                updateDogView()
            case "Cat":
                catInstance.play()
                updateCatView()
            case "Bird":
                birdInstance.play()
                updateBirdView()
            case "Bunny":
                bunnyInstance.play()
                updateBunnyView()
            case "Fish":
                fishInstance.play()
                updateFishView()
            default:
                dogInstance.play()
                updateDogView()
        }
        
    }
    
    @IBAction func feedPet(_ sender: Any) {
        switch petType {
        case "Dog":
            dogInstance.feed()
            updateDogView()
        case "Cat":
            catInstance.feed()
            updateCatView()
        case "Bird":
            birdInstance.feed()
            updateBirdView()
        case "Bunny":
            bunnyInstance.feed()
            updateBunnyView()
        case "Fish":
            fishInstance.feed()
            updateFishView()
        default:
            dogInstance.feed()
            updateDogView()
        }
      
    }
    
    @IBAction func trainPet(_ sender: Any) {
        switch petType {
        case "Dog":
            dogInstance.training()
            updateDogView()
        case "Cat":
            catInstance.training()
            updateCatView()
        case "Bird":
            birdInstance.training()
            updateBirdView()
        case "Bunny":
            bunnyInstance.training()
            updateBunnyView()
        case "Fish":
            fishInstance.training()
            updateFishView()
        default:
            dogInstance.training()
            updateDogView()
        }
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    private func updateDogView() {
        
        let foodValue = Double(dogInstance.foodLevel)/10
        let happyValue = Double(dogInstance.happinessLevel)/10
        
        foodView.animateValue(to: CGFloat(foodValue))
        happyView.animateValue(to: CGFloat(happyValue))
        playTimes.text = "played:" + String(dogInstance.playCount)
        feedTimes.text = "fed:" + String(dogInstance.feedCount)
        growthCount.text = "growth:" + String(dogInstance.growthValue)
        fullWarning(foodValue: foodValue,happyValue: happyValue)
        
    }
    private func updateCatView() {
        let foodValue = Double(catInstance.foodLevel)/10
        let happyValue = Double(catInstance.happinessLevel)/10
        
        foodView.animateValue(to: CGFloat(foodValue))
        happyView.animateValue(to: CGFloat(happyValue))
        playTimes.text = "played:" + String(catInstance.playCount)
        feedTimes.text = "fed:" + String(catInstance.feedCount)
        growthCount.text = "growth:" + String(catInstance.growthValue)
        fullWarning(foodValue: foodValue,happyValue: happyValue)
        
    }
    private func updateBirdView() {
        
        let foodValue = Double(birdInstance.foodLevel)/10
        let happyValue = Double(birdInstance.happinessLevel)/10
        
        foodView.animateValue(to: CGFloat(foodValue))
        happyView.animateValue(to: CGFloat(happyValue))
        playTimes.text = "played:" + String(birdInstance.playCount)
        feedTimes.text = "fed:" + String(birdInstance.feedCount)
        growthCount.text = "growth:" + String(birdInstance.growthValue)
        fullWarning(foodValue: foodValue,happyValue: happyValue)
        
        
    }
    private func updateBunnyView() {
        let foodValue = Double(bunnyInstance.foodLevel)/10
        let happyValue = Double(bunnyInstance.happinessLevel)/10
        
        foodView.animateValue(to: CGFloat(foodValue))
        happyView.animateValue(to: CGFloat(happyValue))
        playTimes.text = "played:" +  String(bunnyInstance.playCount)
        feedTimes.text = "fed:" + String(bunnyInstance.feedCount)
        growthCount.text = "growth:" + String(bunnyInstance.growthValue)
        fullWarning(foodValue: foodValue,happyValue: happyValue)
        
    }
    private func updateFishView() {
        let foodValue = Double(fishInstance.foodLevel)/10
        let happyValue = Double(fishInstance.happinessLevel)/10
        
        foodView.animateValue(to: CGFloat(foodValue))
        happyView.animateValue(to: CGFloat(happyValue))
        playTimes.text = "played:" + String(fishInstance.playCount)
        feedTimes.text = "fed:" + String(fishInstance.feedCount)
        growthCount.text = "growth:" + String(fishInstance.growthValue)
        fullWarning(foodValue: foodValue,happyValue: happyValue)
    }
    
    private func fullWarning(foodValue:Double, happyValue:Double){
        if (foodValue >= 1){
            foodWarning.text = "HIC!"
        }else{
            foodWarning.text = "Food level:"
        }
        if (happyValue >= 1){
            happyWarning.text = "HAHAHA!"
        }else{
            happyWarning.text = "Happiness:"
        }

    }
    
    
    @IBAction func dogSelected(_ sender: Any) {
        petType = "Dog"
        backView.backgroundColor = UIColor.cyan
        petImage.image = #imageLiteral(resourceName: "dog-1")
        foodView.color = UIColor(red: 64/255, green: 224/255, blue: 205/255, alpha:1)
        happyView.color = UIColor(red: 0/255, green: 199/255, blue: 140/255, alpha:1)
        updateDogView()
    }
    
    @IBAction func catSelected(_ sender: Any) {
        petType = "Cat"
        backView.backgroundColor = UIColor(red: 0/255, green: 100/255, blue: 220/255, alpha:0.8)
        petImage.image = #imageLiteral(resourceName: "cat-1")
        foodView.color = UIColor(red: 25/255, green: 25/255, blue: 112/255, alpha:1)
        happyView.color = UIColor(red: 3/255, green: 168/255, blue: 158/255, alpha:1)
        updateCatView()
    }
    
    @IBAction func birdSelected(_ sender: Any) {
        petType = "Bird"
        backView.backgroundColor = UIColor.orange
        petImage.image = #imageLiteral(resourceName: "bird-1")
        foodView.color = UIColor.red
        happyView.color = UIColor(red: 237/255, green: 145/255, blue: 33/255, alpha:1)
        updateBirdView()
    }
    
    @IBAction func bunnySelected(_ sender: Any) {
        petType = "Bunny"
        backView.backgroundColor = UIColor.gray
        petImage.image = #imageLiteral(resourceName: "bunny-1")
        happyView.color = UIColor.darkGray
        foodView.color = UIColor(red: 192/255, green: 192/255, blue: 192/255, alpha:1)
        updateBunnyView()
    }
    
    @IBAction func fishSelected(_ sender: Any) {
        petType = "Fish"
        backView.backgroundColor = UIColor.green
        petImage.image = #imageLiteral(resourceName: "fish-1")
        foodView.color = UIColor(red: 34/255, green: 139/255, blue: 34/255, alpha:1)
        happyView.color = UIColor(red: 107/255, green: 142/255, blue: 35/255, alpha:1)
        updateFishView()
    }

}

