//
//  SecondViewController.swift
//  LearnAdvanced
//
//  Created by Marcos Felipe Souza on 11/11/2017.
//  Copyright © 2017 Marcos. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var responseLabel: UILabel!
    
    var texto:String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        responseLabel.text = texto
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
