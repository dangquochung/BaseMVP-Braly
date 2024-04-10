//
//  HomeVC.swift
//  InPulseDemo
//
//  Created by Hùng Đặng on 10/04/2024.
//

import UIKit
import AVFoundation

class HomeVC: UIViewController, PresenterToViewHomeProtocol {
    // MARK: - Properties
    private var presenter: ViewToPresenterHomeProtocol?
    
    @IBOutlet weak var cameraView: UIView!
    @IBOutlet weak var heartRateLabel: UILabel!
    // AVCaptureSession for camera capture
    private var captureSession: AVCaptureSession?
    
    // AVCaptureDevice for camera
    private var captureDevice: AVCaptureDevice?
    private var videoPreviewLayer: AVCaptureVideoPreviewLayer?
    private var heartRate: Int = 0 {
        didSet {
            DispatchQueue.main.async {
                self.heartRateLabel.text = "\(self.heartRate) BPM"
            }
        }
    }
    
    func setPresenter(presenter: ViewToPresenterHomeProtocol) {
        self.presenter = presenter
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Start the camera capture session
        startCaptureSession()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set up the camera view
        setupCameraView()
        
        // Set up the heart rate label
        setupHeartRateLabel()
    }
    
    private func setupCameraView() {
        // Set the background color of the camera view
        cameraView.backgroundColor = .black
    }
    
    private func setupHeartRateLabel() {
        // Set the text and font of the heart rate label
        heartRateLabel.text = "-- BPM"
        heartRateLabel.font = UIFont.systemFont(ofSize: 48, weight: .bold)
        heartRateLabel.textColor = .white
        heartRateLabel.textAlignment = .center
    }
    
    private func startCaptureSession() {
        // Check if the camera is available
        guard let device = AVCaptureDevice.default(for: .video) else {
            return
        }
        
        captureDevice = device
        
        do {
            // Create an input from the camera device
            let input = try AVCaptureDeviceInput(device: captureDevice!)
            
            // Create the capture session
            captureSession = AVCaptureSession()
            captureSession?.addInput(input)
            
            // Create the video preview layer
            videoPreviewLayer = AVCaptureVideoPreviewLayer(session: captureSession!)
            videoPreviewLayer?.videoGravity = .resizeAspectFill
            videoPreviewLayer?.frame = cameraView.bounds
            cameraView.layer.addSublayer(videoPreviewLayer!)
            
            // Start the capture session
            captureSession?.startRunning()
            
            // Turn on the camera flash
            try captureDevice?.lockForConfiguration()
            captureDevice?.torchMode = .on
            captureDevice?.unlockForConfiguration()
        } catch {
            print("Error setting up camera: \(error.localizedDescription)")
        }
    }
    
    private func stopCaptureSession() {
        // Stop the capture session
        if let captureSession = captureSession, captureSession.isRunning {
            captureSession.stopRunning()
        }
        
        // Remove the video preview layer
        videoPreviewLayer?.removeFromSuperlayer()
        videoPreviewLayer = nil
        
        // Clean up the capture session and device
        captureSession = nil
        captureDevice = nil
    }
}

extension HomeVC: AVCaptureVideoDataOutputSampleBufferDelegate {
    func captureOutput(_ output: AVCaptureOutput, didOutput sampleBuffer: CMSampleBuffer, from connection: AVCaptureConnection) {
        // Process the video frame and calculate heart rate
        guard let pixelBuffer = CMSampleBufferGetImageBuffer(sampleBuffer) else {
            return
        }
        
        // Your heart rate calculation logic goes here
//        let heartRateValue = calculateHeartRate(from: pixelBuffer)
//        
//        // Update the heart rate label
//        self.heartRate = heartRateValue
    }
    
//    private func calculateHeartRate(from pixelBuffer: CVPixelBuffer) -> Int {
//        // 1. Convert the pixel buffer to a CIImage
//        guard let image = CIImage(cvPixelBuffer: pixelBuffer) else {
//            return 0
//        }
//        
//        // 2. Apply a color filter to isolate the red channel
//        let redFilter = CIFilter(name: "CIColorMonochrome")!
//        redFilter.setValue(image, forKey: kCIInputImageKey)
//        redFilter.setValue(CIVector(x: 1, y: 0, z: 0), forKey: kCIInputColorKey)
//        redFilter.setValue(1.0, forKey: kCIInputIntensityKey)
//        guard let redImage = redFilter.outputImage else {
//            return 0
//        }
//        
//        // 3. Perform a Fourier transform on the red channel data
//        let width = CVPixelBufferGetWidth(pixelBuffer)
//        let height = CVPixelBufferGetHeight(pixelBuffer)
//        let redData = redImage.bitmap(width: width, height: height)
//        let fft = performFFT(on: redData)
//        
//        // 4. Find the dominant frequency in the Fourier spectrum
//        let dominantFrequency = findDominantFrequency(in: fft)
//        
//        // 5. Convert the dominant frequency to heart rate in BPM
//        let heartRate = Int(dominantFrequency * 60)
//        
//        return heartRate
//    }
    
//    private func performFFT(on data: [Float]) -> [Complex<Float>] {
//        // Implement the Fast Fourier Transform algorithm here
//        // You can use a library like vDSP or Accelerate.framework
//        // to perform the FFT calculation
//        
//        // This is a placeholder, you'll need to replace it with your own FFT implementation
//        return data.map { Complex($0, 0) }
//    }
    
//    private func findDominantFrequency(in fft: [Complex<Float>]) -> Float {
//        // Find the frequency with the highest magnitude in the Fourier spectrum
//        // This is the dominant frequency, which corresponds to the heart rate
//        
//        // This is a placeholder, you'll need to replace it with your own logic
//        // to find the dominant frequency
//        return 1.2
//    }
}
