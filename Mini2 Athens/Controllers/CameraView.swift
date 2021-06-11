//
//  CameraView.swift
//  HumanBodyPoseAnalyzer
//
//  Created by Meichel Rendio on 06/06/21.
//

import UIKit
import AVFoundation


enum bodyDirection{
    case front
    case left
    case right
}

enum workoutType{
    case pushup
    case plank
    case squad
}


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

    
    func showPoints(_ leftPoints: [CGPoint], rightPoints: [CGPoint], color: UIColor, direction: bodyDirection) {
        pointsPath.removeAllPoints()
        var currentPoint: CGPoint!
        switch direction {
        case .front:
            // draw left side
            currentPoint = previewLayer.layerPointConverted(fromCaptureDevicePoint: leftPoints.first!)
            for point in leftPoints {
                let newPoint = previewLayer.layerPointConverted(fromCaptureDevicePoint: point)
                pointsPath.move(to: currentPoint)
                pointsPath.addArc(withCenter: newPoint, radius: 2.5, startAngle: 0, endAngle: 2 * .pi, clockwise: true)
                pointsPath.addLine(to: newPoint)
                currentPoint = newPoint
            }
            // draw right side
            currentPoint = previewLayer.layerPointConverted(fromCaptureDevicePoint: rightPoints.first!)
            for point in rightPoints {
                let newPoint = previewLayer.layerPointConverted(fromCaptureDevicePoint: point)
                pointsPath.move(to: currentPoint)
                pointsPath.addArc(withCenter: newPoint, radius: 2.5, startAngle: 0, endAngle: 2 * .pi, clockwise: true)
                pointsPath.addLine(to: newPoint)
                currentPoint = newPoint
            }
            // Connect BothSide
        
            do{
                pointsPath.move(to: previewLayer.layerPointConverted(fromCaptureDevicePoint: leftPoints[2]))
                pointsPath.addLine(to: previewLayer.layerPointConverted(fromCaptureDevicePoint: rightPoints[2]))
                pointsPath.move(to: previewLayer.layerPointConverted(fromCaptureDevicePoint: leftPoints[3]))
                pointsPath.addLine(to: previewLayer.layerPointConverted(fromCaptureDevicePoint: rightPoints[3]))
            }
            
        case .left:
            // draw left side
            currentPoint = previewLayer.layerPointConverted(fromCaptureDevicePoint: leftPoints.first!)
            for point in leftPoints {
                let newPoint = previewLayer.layerPointConverted(fromCaptureDevicePoint: point)
                pointsPath.move(to: currentPoint)
                pointsPath.addArc(withCenter: newPoint, radius: 2.5, startAngle: 0, endAngle: 2 * .pi, clockwise: true)
                pointsPath.addLine(to: newPoint)
                currentPoint = newPoint
            }

        case .right:
            // draw right side
            currentPoint = previewLayer.layerPointConverted(fromCaptureDevicePoint: rightPoints.first!)
            for point in rightPoints {
                let newPoint = previewLayer.layerPointConverted(fromCaptureDevicePoint: point)
                pointsPath.move(to: currentPoint)
                pointsPath.addArc(withCenter: newPoint, radius: 2.5, startAngle: 0, endAngle: 2 * .pi, clockwise: true)
                pointsPath.addLine(to: newPoint)
                currentPoint = newPoint
            }
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
