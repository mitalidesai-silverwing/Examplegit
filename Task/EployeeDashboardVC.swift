//
//  EployeeDashboardVC.swift
//  Task
//
//  Created by Silverwing Macmini1 on 22/01/20.
//  Copyright © 2020 Silverwing Macmini1. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
struct  EmployeeStatus : Codable{
   let status : String!
   let data : [EmployeeData]
}
struct EmployeeData : Codable
{
    let id : String!
    let employee_name : String!
    let employee_salary : String!
    let employee_age : String!
    let profile_image : String!
}
class EployeeDashboardVC: UIViewController {
    var employeeDataArray = [EmployeeData]()
    var selectedIndex = Int()
let employeeCell = "EmployeeDataCell"
   
    @IBOutlet weak var tvDashboard: UITableView!
    @IBOutlet weak var addDataView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        addDataView.layer.cornerRadius = addDataView.layer.frame.width / 2
        loadData()
        let nib = UINib(nibName: employeeCell, bundle: nil)
        tvDashboard.register(nib, forCellReuseIdentifier: employeeCell)
        /*employeeDataArray.append(EmployeeData(id: "1", name: "Mitali", salary: "10000", age : "21"))
        employeeDataArray.append(EmployeeData(id: "1", name: "Mitali", salary: "10000", age : "21"))*/
        tvDashboard.delegate=self
        tvDashboard.dataSource=self
        
        tvDashboard.estimatedRowHeight = 200
    }
   
    func loadData(){
        let url = "http://dummy.restapiexample.com/api/v1/employees"
        Alamofire.request(url, method: .get, parameters: nil, encoding: URLEncoding.default, headers: nil).responseJSON { (response) in
            
             switch response.result
                   {
                   case .success(_) :
                       let json = JSON(response.data)
                       print(json)
                       if response.result.value != nil{
                           do{
                               let decodeResponse = try JSONDecoder().decode(EmployeeStatus.self , from: response.data!)
                               if decodeResponse.data != nil {
                                   self.employeeDataArray.append(contentsOf: decodeResponse.data)
                                   self.tvDashboard.reloadData()
                               }else {
                                   
                                   
                               }
                           } catch{
                               print(error)
                           }
                       }
                       break
                   case .failure(_) :
                       print("parsor error")
                       break
                   }
        }
   
       
    }
    
    @IBAction func onClickAddEmpData(_ sender: Any) {

      //let vc = storyboard?.instantiateViewController(withIdentifier: "idSaveEmployeeDataVC")as! SaveEmployeeDataVC//
      
        let vc = storyboard?.instantiateViewController(withIdentifier: "idSaveEmployeeDataVC")as!  SaveEmployeeDataVC
     self.navigationController?.pushViewController(vc, animated: true)
    }
    
}

extension EployeeDashboardVC : UITableViewDelegate,UITableViewDataSource,DeleteEmployeeDataDelegate
{
    func deleteData(indexPath: IndexPath) {
        employeeDataArray.remove(at: indexPath.row)
        tvDashboard.reloadData()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let vc = storyboard?.instantiateViewController(withIdentifier: "idDisplayEmployeeDataVC")as! DisplayEmployeeDataVC
        
        vc.data = employeeDataArray[indexPath.row]
       self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return employeeDataArray.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tvDashboard.dequeueReusableCell(withIdentifier: employeeCell, for: indexPath) as! EmployeeDataCell
       cell.lblName.text = employeeDataArray[indexPath.row].employee_name
        cell.lblsalary.text = employeeDataArray[indexPath.row].employee_salary
        cell.lblage.text = employeeDataArray[indexPath.row].employee_age
        cell.lblid.text = employeeDataArray[indexPath.row].id
        cell.btnEdit.addTarget(self, action: #selector(doEditData(sender:)), for: .touchUpInside)
        
        cell.delegate = self
        cell.indexPath = indexPath
        return cell
    }
    @objc func doEditData(sender : UIButton)
    {
        let editIndex = sender.tag
        let vc = storyboard?.instantiateViewController(withIdentifier: "idUpdateEmployeeDataVC") as! UpdateEmployeeDataVC
    
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
}
