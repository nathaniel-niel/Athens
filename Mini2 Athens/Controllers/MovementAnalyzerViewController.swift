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
    var leftWrist: CGPoint = CGPoint()
    var leftElbow: CGPoint = CGPoint()
    var leftShoulder: CGPoint = CGPoint()
    var rightAnkle: CGPoint = CGPoint()
    var rightKnee: CGPoint = CGPoint()
    var rightHip: CGPoint = CGPoint()
    var leftHip: CGPoint = CGPoint()
    var leftKnee: CGPoint = CGPoint()
    var leftAnkle: CGPoint = CGPoint()
    var currentVideoDevice: AVCaptureDevice!
    override func viewDidLoad() {
        super.viewDidLoad()
        currentVideoDevice = AVCaptureDevice.default(.builtInWideAngleCamera, for: .video, position: .back)
        overlayLayer.frame = view.layer.bounds
        view.layer.addSublayer(overlayLayer)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        startCameraSession()
    }
    func startCameraSession(){
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
        let upperPoint = [rightWrist,rightElbow,rightShoulder,leftShoulder,leftElbow,leftWrist]
        let lowerPoint = [rightAnkle,rightKnee,rightHip,leftHip,leftKnee,leftAnkle]
        cameraView.showPoints(upperPoint, lowerPoints: lowerPoint, color: .blue)
    }
    
    func setupCamera(){
        // Select a front facing camera, make an input.
        guard let videoDevice = currentVideoDevice else {
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
            let leftShoulderPoint = try observation.recognizedPoint(.leftShoulder)
            let leftElbowPoint = try observation.recognizedPoint(.leftElbow)
            let leftWristPoint = try observation.recognizedPoint(.leftWrist)
            let rightAnklePoint = try observation.recognizedPoint(.rightAnkle)
            let rightKneePoint = try observation.recognizedPoint(.rightKnee)
            let rightHipPoint = try observation.recognizedPoint(.rightHip)
            let leftAnklePoint = try observation.recognizedPoint(.leftAnkle)
            let leftKneePoint = try observation.recognizedPoint(.leftKnee)
            let leftHipPoint = try observation.recognizedPoint(.leftHip)
            let confidenceValue: Float = 0.1
            guard rightWristPoint.confidence > confidenceValue && rightElbowPoint.confidence > confidenceValue && rightShoulderPoint.confidence > confidenceValue && leftWristPoint.confidence > confidenceValue && leftElbowPoint.confidence > confidenceValue && leftShoulderPoint.confidence > confidenceValue && rightAnklePoint.confidence > confidenceValue && rightKneePoint.confidence > confidenceValue && rightHipPoint.confidence > confidenceValue && leftAnklePoint.confidence > confidenceValue && leftKneePoint.confidence > confidenceValue && leftHipPoint.confidence > confidenceValue else {
                return
            }
            rightElbow = CGPoint(x: rightElbowPoint.location.x, y: 1 - rightElbowPoint.location.y )
            rightWrist = CGPoint(x: rightWristPoint.location.x, y: 1 - rightWristPoint.location.y )
            rightShoulder = CGPoint(x: rightShoulderPoint.location.x, y: 1 - rightShoulderPoint.location.y )
            leftElbow = CGPoint(x: leftElbowPoint.location.x, y: 1 - leftElbowPoint.location.y )
            leftWrist = CGPoint(x: leftWristPoint.location.x, y: 1 - leftWristPoint.location.y )
            leftShoulder = CGPoint(x: leftShoulderPoint.location.x, y: 1 - leftShoulderPoint.location.y )
            rightAnkle = CGPoint(x: rightAnklePoint.location.x, y: 1 - rightAnklePoint.location.y )
            rightKnee = CGPoint(x: rightKneePoint.location.x, y: 1 - rightKneePoint.location.y )
            rightHip = CGPoint(x: rightHipPoint.location.x, y: 1 - rightHipPoint.location.y )
            leftAnkle = CGPoint(x: leftAnklePoint.location.x, y: 1 - leftAnklePoint.location.y )
            leftKnee = CGPoint(x: leftKneePoint.location.x, y: 1 - leftKneePoint.location.y )
            leftHip = CGPoint(x: leftHipPoint.location.x, y: 1 - leftHipPoint.location.y )
            
            print("Right Wrist \(rightWrist.x) \nRight Elbow \(rightElbow.x) \nRight Shoulder \(rightShoulder.x)")
            DispatchQueue.main.async { [self] in
                self.drawHumanBodyPose()
            }
            
            
        }catch{
            return
        }
        
    }
    
    @IBAction func switchCamera(_ sender: Any) {
        if(currentVideoDevice.position == .back){
            currentVideoDevice = AVCaptureDevice.default(.builtInWideAngleCamera, for: .video, position: .front)
            print("back")
        }else{
            currentVideoDevice = AVCaptureDevice.default(.builtInWideAngleCamera, for: .video, position: .back)
        }
        DispatchQueue.main.async {
            
            self.setupCamera()
            self.cameraView.previewLayer.session = self.cameraFeedSession
            self.cameraFeedSession?.startRunning()
        }
        
        
    }
    
}
