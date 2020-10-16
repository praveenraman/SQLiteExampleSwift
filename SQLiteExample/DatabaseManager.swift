//
//  DatabaseManager.swift
//  SQLiteExample
//
//  Created by Praveen Raman on 10/11/20.
//

import Foundation
import FMDB
var shareInstance = DatabaseManager()

class DatabaseManager: NSObject{
    
    var database: FMDatabase? = nil
    
    class func getInstance()-> DatabaseManager{
        if shareInstance.database == nil{
            shareInstance.database = FMDatabase(path: Utility.getpath(_fileNmae: "RegisterDB.db"))
        }
        return shareInstance
    }
    
    func saveData(_modelInfo: SignupModel)-> Bool{
        shareInstance.database?.open()
        let isSave = shareInstance.database?.executeUpdate("INSERT INTO RegisterTable (fname, lname, phone, email) VALUES(?,?,?,?)", withArgumentsIn: [_modelInfo.fname, _modelInfo.lname, _modelInfo.phone, _modelInfo.email])
        
        shareInstance.database?.close()
        return isSave!
    }
    
}
