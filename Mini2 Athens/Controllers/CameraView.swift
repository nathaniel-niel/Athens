//
//  CameraView.swift
//  HumanBodyPoseAnalyzer
//
//  Created by Meichel Rendio on 06/06/21.
//

import UIKit
import AVFoundation

class CameraView: UIView {

    private var overlayLayer = CAShapeLayer()
    private var pointsPath = UIBezierPath()

    var previewLayer: AVCaptureVideoPreviewLayer {
        return layer as! AVCaptureVideoPreviewLayer
    }

    override class var layerClass: AnyClass {
        return AVCaptureVideoPreviewLayer.self
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupOverlay()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupOverlay()
    }
    
    override func layoutSublayers(of layer: CALayer) {
        super.layoutSublayers(of: layer)
        if layer == previewLayer {
            overlayLayer.frame = layer.bounds
        }
    }

    private func setupOverlay() {
        previewLayer.addSublayer(overlayLayer)
    }
    
    func showPoints(_ upperPoints: [CGPoint], lowerPoints: [CGPoint], color: UIColor) {
        pointsPath.removeAllPoints()
        pointsPath.miterLimit = 20
        var currentPoint = previewLayer.layerPointConverted(fromCaptureDevicePoint: upperPoints.first!)
        // draw both hand
        for point in upperPoints {
            let newPoint = previewLayer.layerPointConverted(fromCaptureDevicePoint: point)
            pointsPath.move(to: currentPoint)
            pointsPath.addArc(withCenter: newPoint, radius: 2.5, startAngle: 0, endAngle: 2 * .pi, clockwise: true)
            pointsPath.addLine(to: newPoint)
            currentPoint = newPoint
        }
        // draw both Leg
        currentPoint = previewLayer.layerPointConverted(fromCaptureDevicePoint: lowerPoints.first!)
        for point in lowerPoints {
            let newPoint = previewLayer.layerPointConverted(fromCaptureDevicePoint: point)
            pointsPath.move(to: currentPoint)
            pointsPath.addArc(withCenter: newPoint, radius: 2.5, startAngle: 0, endAngle: 2 * .pi, clockwise: true)
            pointsPath.addLine(to: newPoint)
            currentPoint = newPoint
        }
        // connect lower body and upper body
        do{
            pointsPath.move(to: previewLayer.layerPointConverted(fromCaptureDevicePoint: upperPoints[2]))
            pointsPath.addLine(to: previewLayer.layerPointConverted(fromCaptureDevicePoint: lowerPoints[2]))
            pointsPath.move(to: previewLayer.layerPointConverted(fromCaptureDevicePoint: upperPoints[3]))
            pointsPath.addLine(to: previewLayer.layerPointConverted(fromCaptureDevicePoint: lowerPoints[3]))
        }
        
        
        
        overlayLayer.fillColor = color.cgColor
        CATransaction.begin()
        CATransaction.setDisableActions(true)
        overlayLayer.path = pointsPath.cgPath
        overlayLayer.lineWidth = 5
        overlayLayer.strokeColor = color.cgColor
        CATransaction.commit()
    }
}
