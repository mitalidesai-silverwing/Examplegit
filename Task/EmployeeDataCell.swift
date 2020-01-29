//
//  EmployeeDataCell.swift
//  Task
//
//  Created by Silverwing Macmini1 on 22/01/20.
//  Copyright © 2020 Silverwing Macmini1. All rights reserved.
//

import UIKit
import SwiftyJSON
import Alamofire
struct EmpDeleteData : Codable
{
    let status : String!
    let message : String!
}
protocol DeleteEmployeeDataDelegate {
    func deleteData(indexPath : IndexPath)
}
class EmployeeDataCell: UITableViewCell {
    var empDeleteDataArray = [EmpDeleteData]()

    var delegate : DeleteEmployeeDataDelegate!
    var indexPath : IndexPath!
    
    @IBOutlet weak var btnEdit: UIButton!
    @IBOutlet weak var idview: UIView!
    @IBOutlet weak var lblid: UILabel!
    @IBOutlet weak var lblage: UILabel!
    @IBOutlet weak var lblsalary: UILabel!
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var mainView: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        mainView.layer.cornerRadius = 15
        
        
        
        idview.layer.cornerRadius =  idview.layer.frame.width / 2
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func deleteData(){
    let url = "http://dummy.restapiexample.com/api/v1/delete/2/"
    Alamofire.request(url, method: .get, parameters: nil, encoding: URLEncoding.default, headers: nil).responseJSON { (response) in
        
         switch response.result
               {
               case .success(_) :
                   let json = JSON(response.data)
                   print(json)
                   if response.result.value != nil{
                       do{
                           let decodeResponse = try JSONDecoder().decode(EmpDeleteData.self , from: response.data!)
                        print(decodeResponse.message)
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
    @IBAction func onClickUpdate(_ sender: Any) {
    
    }
    @IBAction func onClickDelete(_ sender: Any) {
        //deleteData()
        self.delegate.deleteData(indexPath: self.indexPath)
    }
    
}
