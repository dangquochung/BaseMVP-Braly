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
