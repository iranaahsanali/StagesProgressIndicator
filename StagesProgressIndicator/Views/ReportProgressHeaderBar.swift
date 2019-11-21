//
//  ReportProgressHeaderBar.swift
//  StagesProgressIndicator
//
//  Created by Ahsan Ali on 17/10/2019.
//  Copyright © 2019 Ahsan Ali. All rights reserved.
//

import Foundation
import UIKit

@IBDesignable
open class ReportProgressHeaderBar : UIView
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
    
    // Bar Thumb Border Width
    @IBInspectable public var thumbBorderWidth: CGFloat = 0.0
    
    // InComplete Progress Color
    @IBInspectable public var inCompleteColor : UIColor = UIColor.lightGray
    
    // Selected Thumb With Image
    // Image To Place in circle
    @IBInspectable public var selectedImage : UIImage?
    
    // Selected Thumb Radius
    @IBInspectable public var selectedthumbRadius: CGFloat = 0.0
    
    // Selected Thumb Border Widthd
    @IBInspectable public var selectedthumbBorderWidth: CGFloat = 0.0
    
    // Selected Thumb Border Color
    @IBInspectable public var selectedthumbBorderColor : UIColor = UIColor.lightGray
    
    public var imageView = UIImageView()

    // MARK: - Private Atrribues & Functions
    private let borderPath = UIBezierPath()
    private var thumbPath = UIBezierPath()
    private var inCompletePath = UIBezierPath()
    
    override open func draw(_ rect: CGRect) {
        
        let calculatedY = (rect.height / 2) - (bgBarHeight / 2)
        let calculatedX : CGFloat = bgBarHeight / 2.0
        
        self.backgroundColor = UIColor.clear
        
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
            let thumbCenter = ReturnThumbCenter(for: self.currentStage)
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
            inCompleteColor.setFill()
            borderPath.fill()
        }
        
        // Set thumb Position
        SetStagesThumb()
    }
    
    // Returns Center Point of Circular thumb
    private func ReturnThumbCenter(for stage : Int) -> CGPoint
    {
        let chunkWidth = self.frame.width / CGFloat(totalStages)
        let thumbPostion = CGFloat(stage) * chunkWidth
        
        let thumbX = thumbPostion
        let thumbY = self.frame.height / 2 - thumbRadius
        
        return CGPoint(x: thumbX, y: thumbY)
    }
    
    // Set All Stages thumb
    private func SetStagesThumb()
    {
        for i in 0...self.totalStages
        {
            SetThumb(for: i)
        }
    }
    
    // Set Circular thumb based on progress
    private func SetThumb(for stage : Int)
    {
        if stage != currentStage
        {
            let chunkWidth = self.frame.width / CGFloat(totalStages)
            let thumbPostion = CGFloat(stage) * chunkWidth
            
            let thumbX = thumbPostion
            let thumbY = self.frame.height / 2 - thumbRadius
            // Draw Circle with Bezier Path
            thumbPath = UIBezierPath(ovalIn: CGRect(x: (stage == 0 ? -0.5 : 0) + thumbX + thumbBorderWidth, y: thumbY, width: thumbRadius * 2, height: thumbRadius * 2))
            thumbColor.setFill()
            thumbPath.fill()
            
            if stage < self.currentStage
            {
                thumbPath.lineWidth = self.thumbBorderWidth
                inCompleteColor.setStroke()
                thumbPath.stroke()
            }
            else
            {
                thumbPath.lineWidth = self.thumbBorderWidth
                barColor.setStroke()
                thumbPath.stroke()
            }
        }
        else
        {
            if stage == 0
            {
                let thumbX = ReturnThumbCenter(for: stage).x
                let thumbY = self.frame.height / 2 - selectedthumbRadius
                // Draw Border of Image View
                let outerImageView = UIImageView(frame: CGRect(x: thumbX + 0.5 - (selectedthumbRadius + selectedthumbBorderWidth / 2.0) , y: thumbY - selectedthumbBorderWidth / 2.0, width: selectedthumbRadius * 2 + selectedthumbBorderWidth, height: selectedthumbRadius * 2 + selectedthumbBorderWidth))
                outerImageView.backgroundColor = selectedthumbBorderColor
                outerImageView.layer.cornerRadius = outerImageView.frame.width / 2.0
                outerImageView.clipsToBounds = true
                self.addSubview(outerImageView)
                
                // Setting Image here
                imageView.frame = CGRect(x: thumbX + 0.5 - (selectedthumbRadius), y: thumbY, width: selectedthumbRadius * 2, height: selectedthumbRadius * 2)
                imageView.backgroundColor = UIColor.white
                imageView.layer.cornerRadius = selectedthumbRadius
                imageView.clipsToBounds = true
                self.addSubview(imageView)
                
            }
            else if stage == totalStages
            {
                let thumbX = ReturnThumbCenter(for: stage).x
                let thumbY = self.frame.height / 2 - selectedthumbRadius
                
                // Draw Border of Image View
                let outerImageView = UIImageView(frame: CGRect(x: thumbX + 0.5 + (thumbBorderWidth * 2) - (selectedthumbRadius / 2.0 + selectedthumbBorderWidth / 2.0), y: thumbY - selectedthumbBorderWidth / 2.0, width: selectedthumbRadius * 2 + selectedthumbBorderWidth, height: selectedthumbRadius * 2 + selectedthumbBorderWidth))
                outerImageView.backgroundColor = selectedthumbBorderColor
                outerImageView.layer.cornerRadius = (selectedthumbRadius * 2 + selectedthumbBorderWidth) / 2.0
                outerImageView.clipsToBounds = true
                self.addSubview(outerImageView)
                
                // Setting Image here
                imageView.frame = CGRect(x: thumbX + 0.5 + (thumbBorderWidth * 2) - (selectedthumbRadius / 2.0), y: thumbY, width: selectedthumbRadius * 2, height: selectedthumbRadius * 2)
                imageView.backgroundColor = UIColor.white
                imageView.layer.cornerRadius = selectedthumbRadius
                imageView.clipsToBounds = true
                //imageView.image = selectedImage
                self.addSubview(imageView)
            }
            else
            {
                let thumbX = ReturnThumbCenter(for: stage).x
                let thumbY = self.frame.height / 2 - selectedthumbRadius
                // Draw Circle with Bezier Path
                thumbPath = UIBezierPath(ovalIn: CGRect(x: thumbX + 1.0 + (thumbBorderWidth * 2) - (selectedthumbRadius / 2.0), y: thumbY, width: selectedthumbRadius * 2, height: selectedthumbRadius * 2))
                
                // Setting Image here
                imageView.frame = CGRect(x: thumbX + 1.0 + (thumbBorderWidth * 2) - (selectedthumbRadius / 2.0), y: thumbY, width: selectedthumbRadius * 2, height: selectedthumbRadius * 2)
                imageView.backgroundColor = UIColor.white
                imageView.layer.cornerRadius = selectedthumbRadius
                imageView.clipsToBounds = true
                //imageView.image = selectedImage
                self.addSubview(imageView)
                
                // Setting Image Border
                thumbPath.lineWidth = self.selectedthumbBorderWidth
                selectedthumbBorderColor.setStroke()
                thumbPath.stroke()
            }
            
        }
        
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
    
    public func GetSelectedThumbCenter() -> CGPoint
    {
        return ReturnThumbCenter(for: currentStage)
    }
}
