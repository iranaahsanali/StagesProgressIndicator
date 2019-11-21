//
//  ProgrammaticalViewController.swift
//  TestReportProgressBars
//
//  Created by Ahsan Ali on 21/11/2019.
//  Copyright © 2019 Ahsan Ali. All rights reserved.
//

import UIKit
import StagesProgressIndicator

class ProgrammaticalViewController: UIViewController {

    let stageProgressHeader = ReportProgressHeaderBar()
    
    let stages1 =  ReportProgressHeaderBar(frame: CGRect(x: 0, y: 200, width: UIScreen.main.bounds.width, height: 50))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupUI()
    }
    
    // MARK: - Setting UI Programmatically
    func setupUI()
    {
        self.view.backgroundColor = UIColor.white
        
        stages1.backgroundColor = UIColor.clear
        self.view.addSubview(stages1)
        
        self.view.addSubview(stageProgressHeader)
        stageProgressHeader.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            stageProgressHeader.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            stageProgressHeader.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            stageProgressHeader.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            stageProgressHeader.heightAnchor.constraint(equalToConstant: 65)])
        
        stageProgressHeader.backgroundColor = UIColor.clear
        stageProgressHeader.barColor = UIColor.gray
        stageProgressHeader.currentStage = 2
        stageProgressHeader.totalStages = 5
        stageProgressHeader.selectedthumbRadius = 20
        stageProgressHeader.selectedthumbBorderWidth = 2.0
        stageProgressHeader.thumbRadius = 15
        
        stageProgressHeader.bgBarHeight = 12
        stageProgressHeader.arrowWidth = 10
        stageProgressHeader.inCompleteColor = UIColor.lightGray
        stageProgressHeader.selectedthumbBorderColor = UIColor.gray
        stageProgressHeader.thumbColor = UIColor.gray
        
    }
}
