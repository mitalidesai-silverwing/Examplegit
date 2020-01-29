//
//  SaveEmployeeDataVC.swift
//  Task
//
//  Created by Silverwing Macmini1 on 24/01/20.
//  Copyright © 2020 Silverwing Macmini1. All rights reserved.
//

import UIKit
import SwiftyJSON
import Alamofire

struct  EmployeeSaveStatus : Codable{
   let status : String!
   let data : [EmployeeAddData]
}
struct EmployeeAddData : Codable
{
    let id : String!
    let name : String!
    let salary : String!
    let age : String!
}
class SaveEmployeeDataVC: UIViewController {
var empSaveDataArray = [EmployeeAddData]()
    
 
    
    @IBOutlet weak var btnSave: UIButton!
    @IBOutlet weak var mainDataView: UIView!
    @IBOutlet weak var tvAge: UITextField!
    @IBOutlet weak var tvSalary: UITextField!
    @IBOutlet weak var tvName: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        mainDataView.layer.cornerRadius = 15
        btnSave.layer.cornerRadius = 10
        
        // Do any additional setup after loading the view.
    }
    func showProgressBar()  {
        
        let vc = storyboard?.instantiateViewController(withIdentifier: "idProgressBarVC") as! ProgressBarVC
    
        view.addSubview(vc.view)
        addChild(vc)
        
        vc.view.backgroundColor  =  UIColor.black.withAlphaComponent(0.6)
    }
    @IBAction func onClickSave(_ sender: Any) {
        showProgressBar()
        saveData()
       
        
      
    }
    
    func saveData(){
        let params = ["name":tvName.text!,"salary":tvSalary.text!,"age":tvAge.text!]
        
        
         let url = "http://dummy.restapiexample.com/api/v1/create"
         Alamofire.request(url, method: .post, parameters: params, encoding: JSONEncoding.default, headers: nil).responseJSON { (response) in
             
              switch response.result
                    {
                
                    case .success(_) :
                        //print(response as Any)
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
        _ = storyboard?.instantiateViewController(withIdentifier: "idEployeeDashboardVC")as! EployeeDashboardVC
        self.navigationController?.popViewController(animated: true)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
