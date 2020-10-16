//
//  SecrtPageViewController.swift
//  SQLiteExample
//
//  Created by Praveen Raman on 10/16/20.
//

import UIKit

class SecrtPageViewController: UIViewController {

    @IBOutlet weak var secretText: UILabel!
    
    var secretTextStr: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        secretText.text = secretTextStr
    }

}
