//
//  ReportProgressBar.swift
//  StagesProgressIndicator
//
//  Created by Ahsan Ali on 17/10/2019.
//  Copyright © 2019 Ahsan Ali. All rights reserved.
//

import Foundation
import UIKit

@IBDesignable
open class PeportProgressBar : UIView
{
    // MARK: - PUBLIC VARIABLES
    
    // Background color of view
    @IBInspectable public var barColor: UIColor = UIColor.lightGray
    
    // Arrow Width
    @IBInspectable public var arrowWidth: CGFloat = 10.0
    
    // Background Bar Height
    @IBInspectable public var bgBarHeight: CGFloat = 0.0
    
    // Bar Total Stages
    @IBInspectable public var totalStages: Int = 1
    
    // Bar Current Stage
    @IBInspectable public var currentStage: Int = 1
    
    // Bar Thumb Radius
    @IBInspectable public var thumbRadius: CGFloat = 0.0
    
    // Bar Thumb Color
    @IBInspectable public var thumbColor: UIColor = UIColor.green
    
    // InComplete Progress Color
    @IBInspectable public var inCompleteColor : UIColor = UIColor.lightGray
    
    // MARK: - Private Atrribues & Functions
    private let borderPath = UIBezierPath()
    private var thumbPath = UIBezierPath()
    private var inCompletePath = UIBezierPath()
    
    
    override open func draw(_ rect: CGRect) {
        
        let calculatedY = (rect.height / 2) - (bgBarHeight / 2)
        let calculatedX : CGFloat = bgBarHeight / 2.0
        
        //set the path's line width to the height of the stroke
        borderPath.lineWidth = 1.0
        
        // STEP 1
        borderPath.move(to: CGPoint(x: calculatedX,y: calculatedY))
        borderPath.addLine(to: CGPoint(x: rect.width - arrowWidth, y: calculatedY))
        
        // STEP 2
        borderPath.addLine(to: CGPoint(x: rect.width, y: bgBarHeight / 2 + calculatedY))
        
        // STEP 3
        borderPath.addLine(to: CGPoint(x: rect.width - arrowWidth, y: bgBarHeight + calculatedY))
        
        // STEP 4
        borderPath.addLine(to: CGPoint(x: calculatedX, y: bgBarHeight + calculatedY))
        
        // STEP 5
        borderPath.addLine(to: CGPoint(x: calculatedX, y: calculatedY))
        
        // Bar Color filling
        barColor.setFill()
        borderPath.fill()
        
        // INCOMPLETE PATH COLOR SETTING
        if currentStage < totalStages
        {
            // Center of Thumb Postion
            // Seperator between complete & incomplete path, in order to give color different
            let thumbCenter = ReturnThumbCenter()
            let seperatorPoint = CGPoint(x: thumbCenter.x, y: 0)
            
            // InComplete Bazier Path Oval
            inCompletePath = UIBezierPath(rect: CGRect(x: bgBarHeight / 2.0, y: calculatedY, width: seperatorPoint.x + thumbRadius, height: bgBarHeight))
            inCompletePath.addArc(withCenter: CGPoint(x: bgBarHeight / 2.0, y: calculatedY + bgBarHeight / 2), radius: bgBarHeight / 2.0, startAngle: 1.57, endAngle: 4.71, clockwise: true)
            
            inCompletePath.lineCapStyle = .round
            inCompleteColor.setFill()
            inCompletePath.fill()
        }
        else
        {
            // Complete Bazier Path Oval
            inCompletePath = UIBezierPath(rect: CGRect(x: bgBarHeight / 2.0, y: calculatedY, width: bgBarHeight / 2.0, height: bgBarHeight))
            inCompletePath.addArc(withCenter: CGPoint(x: bgBarHeight / 2.0, y: calculatedY + bgBarHeight / 2), radius: bgBarHeight / 2.0, startAngle: 1.57, endAngle: 4.71, clockwise: true)
            
            inCompletePath.lineCapStyle = .round
            inCompleteColor.setFill()
            inCompletePath.fill()
            
            inCompleteColor.setFill()
            borderPath.fill()
        }
        
        // Set thumb Position
        SetThumb()
    }
    
    // Returns Center Point of Circular thumb
    private func ReturnThumbCenter() -> CGPoint
    {
        let chunkWidth = self.frame.width / CGFloat(totalStages)
        let thumbPostion = CGFloat(currentStage) * chunkWidth
        
        let thumbX = thumbPostion
        let thumbY = self.frame.height / 2 - thumbRadius
        
        return CGPoint(x: thumbX, y: thumbY)
    }
    
    // Set Circular thumb based on progress
    private func SetThumb()
    {
        let chunkWidth = self.frame.width / CGFloat(totalStages)
        let thumbPostion = CGFloat(currentStage) * chunkWidth
        
        let thumbX = thumbPostion
        let thumbY = self.frame.height / 2 - thumbRadius
        // Draw Circle with Bezier Path
        thumbPath = UIBezierPath(ovalIn: CGRect(x: thumbX, y: thumbY, width: thumbRadius * 2, height: thumbRadius * 2))
        thumbColor.setFill()
        thumbPath.fill()
    }
    
    // MARK: - Public Method
    public func AdjustProgress(totalStages : Int,currentStage : Int,arrowWidth : CGFloat, bgBarHeight : CGFloat, thumbRadius : CGFloat, barColor : UIColor, thumbColor : UIColor,inCompleteColor : UIColor) {
        
        self.totalStages = totalStages
        self.currentStage = currentStage
        self.arrowWidth = arrowWidth
        self.bgBarHeight = bgBarHeight
        self.thumbRadius = thumbRadius
        self.barColor = barColor
        self.thumbColor = thumbColor
        self.inCompleteColor = inCompleteColor
    }
    
}
