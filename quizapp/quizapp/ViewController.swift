//
//  ViewController.swift
//  quizapp
//
//  Created by DoSSi4 on 31.01.2021.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var playButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func playQuiz(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "GameViewController") as! GameViewController
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true)
    }
    
}

