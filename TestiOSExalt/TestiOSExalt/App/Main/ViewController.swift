//
//  ViewController.swift
//  TestiOSExalt
//
//  Created by Juan Manuel Moreno on 7/06/23.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        print("Hi")
    }

    private func enterTestiOS() {
        MainRouter().routeToRecipeList(source: self)
    }
    
    @IBAction func `try`(_ sender: Any) {
        self.enterTestiOS()
    }

}

