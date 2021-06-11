//
//  MovementAnalyzerViewController.swift
//  Mini2 Athens
//
//  Created by Meichel Rendio on 07/06/21.
//
import UIKit
import AVFoundation
import Vision
import Photos

class MovementAnalyzerViewController: UIViewController, AVCaptureVideoDataOutputSampleBufferDelegate, AVCaptureFileOutputRecordingDelegate {
    @IBOutlet weak var recordButton: UIButton!

    
    private var cameraView: CameraView { view as! CameraView }
    private let videoDataOutputQueue = DispatchQueue(label: "CameraFeedDataOutput", qos: .userInteractive)
    private let humanBodyPose = VNDetectHumanBodyPoseRequest()
    private var cameraFeedSession: AVCaptureSession?
    private var overlayLayer = CAShapeLayer()
    private var PathLayer = UIBezierPath()
    var cameraPreviewLayer : AVCaptureVideoPreviewLayer?
    let videoRecorder = AVCaptureMovieFileOutput()
    
    
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
    
    
    @IBOutlet weak var rightWirstLabel: UILabel!
    @IBOutlet weak var rightElbowLabel: UILabel!
    @IBOutlet weak var rightShoulderLabel: UILabel!
    @IBOutlet weak var leftWristLabel: UILabel!
    @IBOutlet weak var leftElbowLabel: UILabel!
    @IBOutlet weak var leftShoulderLabel: UILabel!
    @IBOutlet weak var rightAnkleLabel: UILabel!
    @IBOutlet weak var rightKneeLabel: UILabel!
    @IBOutlet weak var rightHipLabel: UILabel!
    @IBOutlet weak var leftHipLabel: UILabel!
    @IBOutlet weak var leftKneeLabel: UILabel!
    @IBOutlet weak var LeftAnkleLabel: UILabel!
    
    var rightBodyLabel: [UILabel] = []
    var leftBodyLabel: [UILabel] = []
    
    var leftDegreeValue: [Double] = []
    var rightDegreeValue: [Double] = []
    
    var leftPoint: [CGPoint] = []
    var rightPoint: [CGPoint] = []
    
    var currentVideoDevice: AVCaptureDevice!
    override func viewDidLoad() {
        super.viewDidLoad()
         rightBodyLabel = [rightAnkleLabel,rightKneeLabel  ,rightHipLabel,rightShoulderLabel,rightElbowLabel,rightWirstLabel]
        leftBodyLabel = [LeftAnkleLabel,leftKneeLabel,leftHipLabel,leftShoulderLabel,leftElbowLabel,leftWristLabel]
        hideAllLabel()
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
    func hideAllLabel(){
        for label in rightBodyLabel{
            label.isHidden = true
        }
        for label in leftBodyLabel {
            label.isHidden = true
        }
        
    }
    func hideLabel(direction: bodyDirection){
        hideAllLabel()
        switch direction {
        case .front:
            for label in rightBodyLabel{
                label.isHidden = false
            }
            for label in leftBodyLabel {
                label.isHidden = false
            }
        case .left:
            for label in leftBodyLabel {
                label.isHidden = false
            }
        case .right:
            for label in rightBodyLabel{
                label.isHidden = false
            }
        }
    }
    func countSudut(Point1: CGPoint, Point2: CGPoint, Point3: CGPoint) -> Double{
        let numerator = Double((Point2.y*(Point1.x-Point3.x)) + (Point1.y*(Point3.x-Point2.x)) + (Point3.y*(Point2.x-Point1.x)))
        let denominator = Double((Point2.x-Point1.x)*(Point1.x-Point3.x) + (Point2.y-Point1.y)*(Point1.y-Point3.y))
        let ratio = numerator/denominator
        
        let angleRad = atan(ratio)
        var angleDeg = (angleRad*180) / Double.pi
        
        if(angleDeg < 0){
            angleDeg += 180
        }
        return angleDeg
    }

    func countSudutFor(direction: bodyDirection, workout: workoutType, leftPoints: [CGPoint], rightPoints: [CGPoint]){
        switch direction {
        case .left:
            switch workout {
            case .pushup:
                leftDegreeValue = []
                leftDegreeValue.append(countSudut(Point1: leftPoints[0], Point2: leftPoints[1], Point3: CGPoint(x: leftPoints[0].x, y: leftPoints[0].y+0.01)))
                leftDegreeValue.append(countSudut(Point1: leftPoints[1], Point2: leftPoints[2], Point3: leftPoints[0]))
                leftDegreeValue.append(countSudut(Point1: leftPoints[2], Point2: leftPoints[3], Point3: leftPoints[1]))
                leftDegreeValue.append(countSudut(Point1: leftPoints[3], Point2: leftPoints[4], Point3: leftPoints[2]))
                leftDegreeValue.append(countSudut(Point1: leftPoints[4], Point2: leftPoints[5], Point3: leftPoints[3]))
                leftDegreeValue.append(countSudut(Point1: leftPoints[5], Point2: leftPoints[4], Point3: CGPoint(x: leftPoints[5].x+0.01, y: leftPoints[5].y)))
            case .plank:
                return
            case .squad:
                return
            }
            
        case .right:
            switch workout {
            case .pushup:
                return
            case .plank:
                return
            case .squad:
                return
            }
        case .front:
            return
        }
    }
    
    func setDegreeLabelText(direction: bodyDirection){
        switch direction {
        case .front:
            guard leftDegreeValue.count == leftBodyLabel.count else {
                return
            }
        case .left:
            guard leftDegreeValue.count == leftBodyLabel.count else {
                return
            }
            for i in 0...leftDegreeValue.count-1{
                leftBodyLabel[i].text = String(format: "%.0f", leftDegreeValue[i])
            }
        case .right:
            guard leftDegreeValue.count == leftBodyLabel.count else {
                return
            }
        }
    }

    func drawHumanBodyPose(direction: bodyDirection){
        leftPoint = [leftAnkle,leftKnee,leftHip,leftShoulder,leftElbow,leftWrist]
        rightPoint = [rightAnkle,rightKnee,rightHip,rightShoulder,rightElbow,rightWrist]
        
        cameraView.showPoints(leftPoint, rightPoints: rightPoint, color: .blue, direction: direction)
        countSudutFor(direction: direction, workout: .pushup, leftPoints: leftPoint, rightPoints: rightPoint)
        setDegreeLabel(rightPoints: rightPoint, leftPoints: leftPoint, direction: direction)
        setDegreeLabelText(direction: direction)
        
    }
    
    func setupCamera(){
        // Select current camera, make an input.
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
    
    func recordVideo(){
        if videoRecorder.isRecording {
            videoRecorder.stopRecording()
            recordButton.setImage(UIImage(systemName: "largecircle.fill.circle"), for: .normal)
        }else{
            recordButton.setImage(UIImage(systemName: "stop.circle"), for: .normal)
            guard cameraFeedSession != nil else{
                return
            }
            if cameraFeedSession!.canAddOutput(videoRecorder){
                cameraFeedSession!.addOutput(videoRecorder)
            }
            cameraFeedSession?.startRunning()
            let savePath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
            let filePath = savePath[0].appendingPathComponent("\(Date()).mp4")
            videoRecorder.startRecording(to: filePath, recordingDelegate: self)
           
        }
    }
    
    func setDegreeLabel(rightPoints: [CGPoint], leftPoints:[CGPoint], direction: bodyDirection){
        hideLabel(direction: direction)
        let width = view.frame.size.width
        let height = view.frame.size.height
        switch direction {
        case .front:
            for i in 0...rightPoints.count-1{
                rightBodyLabel[i].frame.origin = CGPoint(x: rightPoints[i].x*width, y: rightPoints[i].y*height)
            }
        case .left:
            for i in 0...leftPoints.count-1{
                let newPoint = cameraView.previewLayer.layerPointConverted(fromCaptureDevicePoint: leftPoints[i])
                print(newPoint)
                leftBodyLabel[i].frame.origin =  newPoint
            }
        case .right:
            for i in 0...rightPoints.count-1{
                let newPoint = cameraView.previewLayer.layerPointConverted(fromCaptureDevicePoint: rightPoints[i])
                rightBodyLabel[i].frame.origin = newPoint
            }
        }
        
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
            let confidenceValue: Float = 0.2
            
            let faceLeftConfidentValue = leftWristPoint.confidence + leftElbowPoint.confidence + leftShoulderPoint.confidence + leftAnklePoint.confidence + leftKneePoint.confidence + leftHipPoint.confidence
            let faceRightConfidentValue = rightWristPoint.confidence + rightElbowPoint.confidence +  rightShoulderPoint.confidence + rightAnklePoint.confidence +  rightKneePoint.confidence + rightHipPoint.confidence
            if faceLeftConfidentValue-faceRightConfidentValue < -0.5{
                if rightWristPoint.confidence > confidenceValue && rightElbowPoint.confidence > confidenceValue && rightShoulderPoint.confidence > confidenceValue &&  rightAnklePoint.confidence > confidenceValue && rightKneePoint.confidence > confidenceValue && rightHipPoint.confidence > confidenceValue {
                    rightElbow = CGPoint(x: rightElbowPoint.location.x, y: 1 - rightElbowPoint.location.y )
                    rightWrist = CGPoint(x: rightWristPoint.location.x, y: 1 - rightWristPoint.location.y )
                    rightShoulder = CGPoint(x: rightShoulderPoint.location.x, y: 1 - rightShoulderPoint.location.y )
                    rightAnkle = CGPoint(x: rightAnklePoint.location.x, y: 1 - rightAnklePoint.location.y )
                    rightKnee = CGPoint(x: rightKneePoint.location.x, y: 1 - rightKneePoint.location.y )
                    rightHip = CGPoint(x: rightHipPoint.location.x, y: 1 - rightHipPoint.location.y )
                }
                DispatchQueue.main.async {
                    self.drawHumanBodyPose(direction: .right)
                }
                
            }else if faceLeftConfidentValue-faceRightConfidentValue > 0.5{ 
                if  leftWristPoint.confidence > confidenceValue && leftElbowPoint.confidence > confidenceValue && leftShoulderPoint.confidence > confidenceValue &&  leftAnklePoint.confidence > confidenceValue && leftKneePoint.confidence > confidenceValue && leftHipPoint.confidence > confidenceValue{
                    leftElbow = CGPoint(x: leftElbowPoint.location.x, y: 1 - leftElbowPoint.location.y )
                    leftWrist = CGPoint(x: leftWristPoint.location.x, y: 1 - leftWristPoint.location.y )
                    leftShoulder = CGPoint(x: leftShoulderPoint.location.x, y: 1 - leftShoulderPoint.location.y )
                    leftAnkle = CGPoint(x: leftAnklePoint.location.x, y: 1 - leftAnklePoint.location.y )
                    leftKnee = CGPoint(x: leftKneePoint.location.x, y: 1 - leftKneePoint.location.y )
                    leftHip = CGPoint(x: leftHipPoint.location.x, y: 1 - leftHipPoint.location.y )
                    }
                DispatchQueue.main.async {
                    self.drawHumanBodyPose(direction: .left)
                }
                
            }else{
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
                DispatchQueue.main.async {
                    self.drawHumanBodyPose(direction: .front)
                }
                print("right = \(rightHip)")
            }
            
    
            
        }catch{
            return
        }
        
    }
    func fileOutput(_ output: AVCaptureFileOutput, didFinishRecordingTo outputFileURL: URL, from connections: [AVCaptureConnection], error: Error?) {
        if error != nil {
            print("Cant Save File")
        }else{
            UISaveVideoAtPathToSavedPhotosAlbum(outputFileURL.path, nil, nil, nil)
        }
    }
    
    @IBAction func switchCamera(_ sender: Any) {
        if(currentVideoDevice.position == .back){
            currentVideoDevice = AVCaptureDevice.default(.builtInWideAngleCamera, for: .video, position: .front)
        }else{
            currentVideoDevice = AVCaptureDevice.default(.builtInWideAngleCamera, for: .video, position: .back)
        }
        DispatchQueue.main.async {
            self.setupCamera()
            self.cameraView.previewLayer.session = self.cameraFeedSession
            self.cameraFeedSession?.startRunning()
        }
    }
    
    @IBAction func startRecord(_ sender: Any){
        PHPhotoLibrary.requestAuthorization { status in
            guard status == .authorized else { return }
        }
        
        recordVideo()
    }
    
    
    
}
