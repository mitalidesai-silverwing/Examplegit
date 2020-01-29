//
//  DisplayEmployeeDataVC.swift
//  Task
//
//  Created by Silverwing Macmini1 on 23/01/20.
//  Copyright © 2020 Silverwing Macmini1. All rights reserved.
//

import UIKit

class DisplayEmployeeDataVC: UIViewController {

    @IBOutlet weak var lblEmpAge: UILabel!
    @IBOutlet weak var lblEmpSalary: UILabel!
    @IBOutlet weak var lblEmpId: UILabel!
    @IBOutlet weak var lblEmpName: UILabel!
    @IBOutlet weak var idView: UIView!
    @IBOutlet weak var empDataView: UIView!
    var data : EmployeeData!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        empDataView.layer.cornerRadius = 15
        idView.layer.cornerRadius = idView.layer.frame.width / 2
        // Do any additional setup after loading the view.
        lblEmpId.text = data.id
        lblEmpName.text = data.employee_name
        lblEmpSalary.text = data.employee_salary
        lblEmpAge.text = data.employee_age
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
