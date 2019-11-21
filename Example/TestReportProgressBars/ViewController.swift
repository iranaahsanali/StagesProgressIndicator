//
//  ViewController.swift
//  TestReportProgressBars
//
//  Created by Ahsan Ali on 17/10/2019.
//  Copyright © 2019 Ahsan Ali. All rights reserved.
//

import UIKit
import StagesProgressIndicator

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    
    @IBAction func ActionNextController(_ sender: Any) {
        let programmaticalController = ProgrammaticalViewController()
        self.navigationController?.pushViewController(programmaticalController, animated: true)
    }
}

