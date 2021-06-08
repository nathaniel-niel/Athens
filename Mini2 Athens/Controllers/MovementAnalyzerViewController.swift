//
//  MovementAnalyzerViewController.swift
//  Mini2 Athens
//
//  Created by Meichel Rendio on 07/06/21.
//
import UIKit
import AVFoundation
import Vision
class MovementAnalyzerViewController: UIViewController, AVCaptureVideoDataOutputSampleBufferDelegate {
    private var cameraView: CameraView { view as! CameraView }
    private let videoDataOutputQueue = DispatchQueue(label: "CameraFeedDataOutput", qos: .userInteractive)
    private let humanBodyPose = VNDetectHumanBodyPoseRequest()
    private var cameraFeedSession: AVCaptureSession?
    private var overlayLayer = CAShapeLayer()
    private var PathLayer = UIBezierPath()
    var cameraPreviewLayer : AVCaptureVideoPreviewLayer?

    
    
    var rightWrist: CGPoint = CGPoint()
    var rightElbow: CGPoint = CGPoint()
    var rightShoulder: CGPoint = CGPoint()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        do {
            if cameraFeedSession == nil {
                cameraView.previewLayer.videoGravity = .resizeAspectFill
                setupCamera()
                cameraView.previewLayer.session = cameraFeedSession
            }
            cameraFeedSession?.startRunning()
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        cameraFeedSession?.stopRunning()
        super.viewWillDisappear(animated)
    }
    
    func drawHumanBodyPose(){
        cameraView.showPoints([rightWrist, rightShoulder,rightElbow], color: .blue)
    }
    
    func setupCamera(){
        // Select a front facing camera, make an input.
        guard let videoDevice = AVCaptureDevice.default(.builtInWideAngleCamera, for: .video, position: .front) else {
         return
        }
        
        guard let deviceInput = try? AVCaptureDeviceInput(device: videoDevice) else {
           return
        }
        
        let session = AVCaptureSession()
        session.beginConfiguration()
        session.sessionPreset = AVCaptureSession.Preset.high
        
        // Add a video input.
        guard session.canAddInput(deviceInput) else {
            return
        }
        session.addInput(deviceInput)
        
        let dataOutput = AVCaptureVideoDataOutput()
        if session.canAddOutput(dataOutput) {
            session.addOutput(dataOutput)
            // Add a video data output.
            dataOutput.alwaysDiscardsLateVideoFrames = true
            dataOutput.videoSettings = [kCVPixelBufferPixelFormatTypeKey as String: Int(kCVPixelFormatType_420YpCbCr8BiPlanarFullRange)]
            dataOutput.setSampleBufferDelegate(self, queue: videoDataOutputQueue)
        } else {
            return
        }
        session.commitConfiguration()
        cameraFeedSession = session
        
    }
    public func captureOutput(_ output: AVCaptureOutput, didOutput sampleBuffer: CMSampleBuffer, from connection: AVCaptureConnection) {
        

        let handler = VNImageRequestHandler(cmSampleBuffer: sampleBuffer, orientation: .up, options: [:])
        do {
            try handler.perform([humanBodyPose])
            guard let observation = humanBodyPose.results?.first else{
                return
            }
            
            let rightWristPoint = try observation.recognizedPoint(.rightWrist)
            let rightElbowPoint = try observation.recognizedPoint(.rightElbow)
            let rightShoulderPoint = try observation.recognizedPoint(.rightShoulder)
            
            guard rightWristPoint.confidence > 0.3 && rightElbowPoint.confidence > 0.3 && rightShoulderPoint.confidence > 0.3 else {
                return
            }
            rightElbow = CGPoint(x: rightElbowPoint.location.x, y: 1 - rightElbowPoint.location.y )
            rightWrist = CGPoint(x: rightWristPoint.location.x, y: 1 - rightWristPoint.location.y )
            rightShoulder = CGPoint(x: rightShoulderPoint.location.x, y: 1 - rightShoulderPoint.location.y )
            
            print("Right Wrist \(rightWrist.x) \nRight Elbow \(rightElbow.x) \nRight Shoulder \(rightShoulder.x)")
            //drawHumanBodyPose()
        }catch{
            return
        }
        
    }
}
