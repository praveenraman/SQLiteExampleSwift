//
//  ViewController.swift
//  SQLiteExample
//
//  Created by Praveen Raman on 10/11/20.
//

import StoreKit
import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var deeplink: UIButton!
    
    let application = UIApplication.shared
    //
    
    @IBOutlet weak var textFname: UITextField!
    @IBOutlet weak var textLname: UITextField!
    @IBOutlet weak var textPhone: UITextField!
    @IBOutlet weak var textEmail: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    @IBAction func deeplinkTap(_ sender: Any) {
        // open easemytrip app
        guard let url =  URL(string: "DeepLinking://") else {
            return
        }
        if application.canOpenURL(url)
        {
            application.open(url, options: [:], completionHandler: nil)
            
        }else{
            let vc = SKStoreProductViewController()
            vc.loadProduct(withParameters: [SKStoreProductParameterITunesItemIdentifier: NSNumber(value: 1053030595)], completionBlock: nil)
            present(vc, animated: true, completion: nil)
        }
    }
    
    @IBAction func registerTaped(_ sender: Any) {
        
        let modelInfo = SignupModel(fname: textFname.text!, lname: textLname.text!, phone: textPhone.text!, email: textPhone.text!)
        
        let isSaveData = DatabaseManager.getInstance().saveData(_modelInfo: modelInfo)
        print(isSaveData)
        
    }
    
}

