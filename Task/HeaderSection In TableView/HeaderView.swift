//
//  HeaderView.swift
//  Task
//
//  Created by Silverwing Macmini1 on 29/01/20.
//  Copyright © 2020 Silverwing Macmini1. All rights reserved.
//

import UIKit
protocol HeaderSectionDelegate {
    func toggleSection(_ header: HeaderView, section: Int)
}
class HeaderView: UITableViewHeaderFooterView {
   
    var delegate: HeaderSectionDelegate?
    var section: Int = 0
    
    @IBOutlet weak var lblHeaderText: UILabel!
    //    var delegate : HeaderSectionDelegate!
//    var indexpath : IndexPath!
  
//    @IBAction func onClickExpand(_ sender: UIButton) {
//        self.delegate.sectionShow(indexpath: self.indexpath)
//    }
    
}
