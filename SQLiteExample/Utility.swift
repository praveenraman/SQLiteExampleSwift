//
//  Utility.swift
//  SQLiteExample
//
//  Created by Praveen Raman on 10/11/20.
//

import Foundation

class Utility: NSObject{
    
    class func getpath(_fileNmae: String) -> String{
        
        let documentDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
        let fileUrl  = documentDirectory.appendingPathComponent(_fileNmae)
        print("Database Path : - \(fileUrl.path)")
        return fileUrl.path
    }
    
    // Check Note create Database
    
    class func copyDatabase(_fileNmae: String){
        let dpPath = getpath(_fileNmae: "RegisterDB.db")
        let fileManager = FileManager.default
        if !fileManager.fileExists(atPath: dpPath)
        {
            let bundle = Bundle.main.resourceURL
            let file = bundle?.appendingPathComponent(_fileNmae)
            var error: NSError?
            do{
                try fileManager.copyItem(atPath: (file?.path)!, toPath: dpPath)
            }catch let error1 as NSError{
                error = error1
            }
            // If Database Error Print Error
            if error == nil{
                print("error in db")
            }else{
                print("Yaah !!")
            }
            
        }
    }
}
