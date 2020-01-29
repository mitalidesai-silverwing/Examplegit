//
//  UpdateEmployeeDataVC.swift
//  Task
//
//  Created by Silverwing Macmini1 on 24/01/20.
//  Copyright © 2020 Silverwing Macmini1. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
struct  EmployeeUpdateStatus : Codable{
   let status : String!
   let data : [EmployeeAddData]
}
struct EmployeeUpdateData : Codable
{
    let id : String!
    let name : String!
    let salary : String!
    let age : String!
}
class UpdateEmployeeDataVC: UIViewController {
var empSaveDataArray = [EmployeeAddData]()
        var editData : EmployeeData!
    @IBOutlet weak var tfAge: UITextField!
    
    @IBOutlet weak var lblId: UILabel!
    @IBOutlet weak var btnUpdate: UIButton!
    @IBOutlet weak var tfSalary: UITextField!
    @IBOutlet weak var tfName: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        btnUpdate.layer.cornerRadius = 10
        // Do any additional setup after loading the view.
    }
    

    func updateData(){
        let params = ["name":tfName.text!,"salary":tfSalary.text!,"age":tfAge.text!]
        
        
         let url = "http://dummy.restapiexample.com/api/v1/update/21/"
         Alamofire.request(url, method: .put, parameters: params, encoding: JSONEncoding.default, headers: nil).responseJSON { (response) in
             
              switch response.result
                    {
                
                    case .success(_) :
                        print(response as Any)
                        let json = JSON(response.data)
                        print(json)
                        let vc = self.storyboard?.instantiateViewController(withIdentifier: "idEployeeDashboardVC")as! EployeeDashboardVC
                              self.navigationController?.pushViewController(vc, animated: true)
                    
                    case .failure(_) :
                        print("parsor error")
                        break
                    }
         }
    }
    @IBAction func onClickBack(_ sender: Any) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "idEployeeDashboardVC")as! EployeeDashboardVC
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func onClickUpdate(_ sender: Any) {
        updateData()
    }
}
