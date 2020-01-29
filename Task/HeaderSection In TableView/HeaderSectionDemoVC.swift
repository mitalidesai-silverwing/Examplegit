//
//  HeaderSectionDemoVC.swift
//  Task
//
//  Created by Silverwing Macmini1 on 29/01/20.
//  Copyright © 2020 Silverwing Macmini1. All rights reserved.
//

import UIKit
struct Section {
var country: String
var states: [String]
var collapsed: Bool
}
class HeaderSectionDemoVC: UIViewController {
    
   var sectionArray = [Section]()
    var fruit = ["Apple","Banana","Cherry"]
    var vegetable = ["Lettuce","Broccoli","Cauliflower"]
    @IBOutlet weak var tvHeaderView: UITableView!
    let headerView = "HeaderView"
       let sectionCell = "SectionCell"
    override func viewDidLoad() {
        super.viewDidLoad()

       let nib = UINib(nibName: sectionCell, bundle: nil)
        tvHeaderView.register(nib, forCellReuseIdentifier: sectionCell)
        
       let headernib = UINib(nibName: headerView, bundle: nil)
        tvHeaderView.register(headernib, forHeaderFooterViewReuseIdentifier: headerView)
        
        tvHeaderView.delegate = self
        tvHeaderView.dataSource = self
        sectionArray.append(Section(country: "India", states: ["Gujrat","Rajshtan"], collapsed: true))
     
    }
    
}
extension HeaderSectionDemoVC : UITableViewDelegate,UITableViewDataSource
{
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        var rowCount = 0
               switch (section) {
    
               case 0:
                   rowCount = fruit.count
               case 1:
                   rowCount = vegetable.count
               default:
                   rowCount = 0
               }
               
               return rowCount
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       let cell = tvHeaderView.dequeueReusableCell(withIdentifier: sectionCell, for: indexPath)as! SectionCell
       switch (indexPath.section) {

        case 0:
            cell.lblText.text = fruit[indexPath.row]
        case 1:
            cell.lblText.text = vegetable[indexPath.row]
        default:
            cell.lblText.text = "Other"
        }
        return cell
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerCell = tableView.dequeueReusableHeaderFooterView(withIdentifier: headerView)as! HeaderView
        headerCell.backgroundColor = UIColor.gray
        switch (section) {
       
        case 0:
            headerCell.lblHeaderText.text = "Fruits"
        case 1:
            headerCell.lblHeaderText.text = "Vegetable"
        default:
            headerCell.lblHeaderText.text = "Other"
        }
        
      
       return headerCell
    }
//    func tableView(_ tableView: UITableView, estimatedHeightForHeaderInSection section: Int) -> CGFloat {
//        return view.frame.size.width
//    }
//
}
