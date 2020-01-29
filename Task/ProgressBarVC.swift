//
//  ProgressBarVC.swift
//  Task
//
//  Created by Silverwing Macmini1 on 28/01/20.
//  Copyright © 2020 Silverwing Macmini1. All rights reserved.
//

import UIKit
import NVActivityIndicatorView
class ProgressBarVC: UIViewController {

    @IBOutlet weak var progressView: NVActivityIndicatorView!
    override func viewDidLoad() {
        super.viewDidLoad()
        progressView.startAnimating()
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 5.0){
            self.progressView.stopAnimating()
            self.removeFromParent()
            self.view.removeFromSuperview()
        }
    
    }
    
   

   

}
