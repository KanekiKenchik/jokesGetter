//
//  ViewController.swift
//  GetAndPost
//
//  Created by Афанасьев Александр Иванович on 20.08.2021.
//

import UIKit

class ViewController: UIViewController {


    
    @IBAction func getTapped(_ sender: UIButton) {
        
        let request = URLRequest(url: URL(string: "https://v2.jokeapi.dev/joke/Any")!)
        URLSession.shared.dataTask(with: request) { data, response, error in
            let dictionary = try! JSONSerialization.jsonObject(with: data!, options: .allowFragments) as! [String: Any]
            let setup = dictionary["setup"] ?? ""
            let delivery = dictionary["delivery"] ?? ""
            self.label.text = setup as? String
            self.label.text! += "\n\n\n\n"
            self.label.text! += delivery as? String ?? ""
        }.resume()
    }

    @IBOutlet weak var label: UILabel!

}
