//
//  GameViewController.swift
//  quizapp
//
//  Created by DoSSi4 on 31.01.2021.
//

import UIKit
struct 	Questions{
    let imgName: String
    let optionA: String
    let optionB: String
    let optionC: String
    let optionD: String
    let corrAns: Int
}

class GameViewController: UIViewController{

    @IBOutlet weak var qstnCount: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var optionA: UIButton!
    @IBOutlet weak var optionB: UIButton!
    @IBOutlet weak var optionC: UIButton!
    @IBOutlet weak var optionD: UIButton!
    var questionArray = [Questions]()
    var currQuestion:Int = 0
    var score:Int = 0
   

    override func viewDidLoad() {
        super.viewDidLoad()
        optionA.tag = 1
        optionB.tag=2
        optionC.tag = 3
        optionD.tag = 4
        questionArray.append(Questions(imgName: "img1", optionA: "Michelin", optionB: "Nokian", optionC: "ToyoTypes", optionD: "Yokohama", corrAns: 1))
        questionArray.append(Questions(imgName: "img2", optionA: "Pringles", optionB: "KFC", optionC: "Levi's", optionD: "Heinz", corrAns: 3))
        questionArray.append(Questions(imgName: "img3", optionA: "Mercedes-Benz", optionB: "Alfa Romeo", optionC: "BMW", optionD: "Volkswagen", corrAns: 2))
        questionArray.append(Questions(imgName: "img4", optionA: "Starbucks", optionB: "Angel-in-us", optionC: "Spotify", optionD: "Heineken", corrAns: 1))
        questionArray.append(Questions(imgName: "img5", optionA: "Sinoil", optionB: "Mobil1", optionC: "YOKO", optionD: "Shell", corrAns: 4))
        questionArray.append(Questions(imgName: "img6", optionA:"LinkedIn", optionB: "Facebook", optionC: "Apple", optionD: "Microsoft", corrAns: 2))
        questionArray.append(Questions(imgName: "img7", optionA: "Peugout", optionB: "Citroen", optionC: "Lexus", optionD: "Honda", corrAns: 1))
        questionArray.append(Questions(imgName: "img8", optionA: "Nike", optionB: "Adidas", optionC: "Puma", optionD: "Under Armour", corrAns: 1))
        questionArray.append(Questions(imgName: "img9", optionA: "Pringles", optionB: "Pepsi", optionC: "Lipton", optionD: "Lay's", corrAns: 2))
        questionArray.append(Questions(imgName: "img10", optionA: "Yves Saint Laurent", optionB: "Dolce & Gabbana", optionC: "Chanel", optionD: "Louis Vuitton", corrAns: 3))
        updateQuestion()
        updateUI()
    }
    @IBAction func nextAnsw(_ sender: UIButton){
        if(currQuestion<questionArray.count){
        if questionArray[currQuestion].corrAns == sender.tag{
            print("Correct")
            score += 1
        }
        
        else{
            print("Incorrect")
        }
        }
        currQuestion += 1
        updateQuestion()
    }
    func updateQuestion(){
        if currQuestion <= questionArray.count - 1{
            print(currQuestion)
            print(questionArray.count)
            imageView.image = UIImage(named:(questionArray[currQuestion].imgName))
            optionA.setTitle(questionArray[currQuestion].optionA, for: UIControl.State.normal)
            optionB.setTitle(questionArray[currQuestion].optionB, for: UIControl.State.normal)
            optionC.setTitle(questionArray[currQuestion].optionC, for: UIControl.State.normal)
            optionD.setTitle(questionArray[currQuestion].optionD, for: UIControl.State.normal)
    
            updateUI()
        }
        else if currQuestion >= questionArray.count{
            let alert = UIAlertController(title: "Nice try!", message: "Score: \(score)", preferredStyle: .alert)
            let backAction = UIAlertAction(title: "Back to Main Menu", style: .default, handler:    {action in
                self.dismiss(animated: true)
                
            })
            alert.addAction(backAction)
            self.present(alert, animated: true)
            
        }
    }
    func updateUI(){
        qstnCount.text="\(currQuestion + 1)/10"
        
    }
}

