//
//  ExerciseDetailViewController.swift
//  iOS-FinalProject
//
//  Created by Lakna Attigala on 2023-05-17.
//
import UIKit
import AVKit

class ExerciseDetailsViewController: UIViewController {
    var exercise: Exercise?
    var player: AVPlayer?
    var playerViewController: AVPlayerViewController?
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 18)
        return label
    }()
    
    let repLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 14)
        return label
    }()
    
    let timeLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 14)
        return label
    }()
    
    let videoView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let bodyPartLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 14)
        return label
    }()
    
    let proceedButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Proceed", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 8
        button.addTarget(self, action: #selector(proceedButtonTapped), for: .touchUpInside)
        return button
    }()
    
    let timerLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 25)
        return label
    }()
    
    let startButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Start", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 8
        button.addTarget(self, action: #selector(startButtonTapped), for: .touchUpInside)
        return button
    }()
    
    let stopButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Stop", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .systemRed
        button.layer.cornerRadius = 8
        button.addTarget(self, action: #selector(stopButtonTapped), for: .touchUpInside)
        button.isEnabled = false
        return button
    }()
    
    var timer: Timer?
    var elapsedSeconds: TimeInterval = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let exercise = exercise {
            // Example: Set the title of the navigation bar to the exercise name
            title = exercise.name
            nameLabel.text = exercise.name
            repLabel.text = "Reps: \(exercise.repcount)"
            timeLabel.text = "Time: \(exercise.duration)"
            let muscleGroups = exercise.muscleGroups.joined(separator: ", ")
            bodyPartLabel.text = "Body Parts: \(muscleGroups)"
        }
        
        view.backgroundColor = .white
        view.addSubview(nameLabel)
        view.addSubview(repLabel)
        view.addSubview(timeLabel)
        view.addSubview(videoView)
        view.addSubview(bodyPartLabel)
        view.addSubview(proceedButton)
        view.addSubview(timerLabel)
        view.addSubview(startButton)
        view.addSubview(stopButton)
        proceedButton.addTarget(self, action: #selector(proceedButtonTapped), for: .touchUpInside)
        startButton.addTarget(self, action: #selector(startButtonTapped), for: .touchUpInside)
        stopButton.addTarget(self, action: #selector(stopButtonTapped), for: .touchUpInside)


        
        nameLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        nameLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16).isActive = true
        
        repLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        repLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 8).isActive = true
        
        timeLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        timeLabel.topAnchor.constraint(equalTo: repLabel.bottomAnchor, constant: 8).isActive = true
        
        videoView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        videoView.topAnchor.constraint(equalTo: timeLabel.bottomAnchor, constant: 8).isActive = true
        videoView.widthAnchor.constraint(equalToConstant: 300).isActive = true
        videoView.heightAnchor.constraint(equalToConstant: 200).isActive = true
        videoView.layer.borderWidth = 1.0  // Set border width
        videoView.layer.borderColor = UIColor.black.cgColor  // Set border color
        
        bodyPartLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        bodyPartLabel.topAnchor.constraint(equalTo: videoView.bottomAnchor, constant: 8).isActive = true
        
        proceedButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        proceedButton.topAnchor.constraint(equalTo: bodyPartLabel.bottomAnchor, constant: 16).isActive = true
        proceedButton.widthAnchor.constraint(equalToConstant: 200).isActive = true
        proceedButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        timerLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        timerLabel.topAnchor.constraint(equalTo: proceedButton.bottomAnchor, constant: 16).isActive = true
        
        startButton.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: -60).isActive = true
        startButton.topAnchor.constraint(equalTo: timerLabel.bottomAnchor, constant: 16).isActive = true
        startButton.widthAnchor.constraint(equalToConstant: 80).isActive = true
        startButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        stopButton.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 60).isActive = true
        stopButton.topAnchor.constraint(equalTo: timerLabel.bottomAnchor, constant: 16).isActive = true
        stopButton.widthAnchor.constraint(equalToConstant: 80).isActive = true
        stopButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        if let exercise = exercise, let videoURL = URL(string: exercise.videoUrl) {
            let player = AVPlayer(url: videoURL)
            playerViewController = AVPlayerViewController()
            playerViewController?.player = player
            
            addChild(playerViewController!)  // Add this line
            videoView.addSubview(playerViewController!.view)  // Add this line
            
            playerViewController!.view.frame = videoView.bounds  // Set the frame of the player's view
            playerViewController!.view.autoresizingMask = [.flexibleWidth, .flexibleHeight]  // Set autoresizing mask
            
            player.play()
            
            // Observing AVPlayerItem status for error handling
            player.currentItem?.addObserver(self, forKeyPath: "status", options: [.new, .initial], context: nil)
        } else {
            print("Invalid video URL")
        }
    }
    
    // Observe AVPlayerItem status changes
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey: Any]?, context: UnsafeMutableRawPointer?) {
        if keyPath == "status", let playerItem = player?.currentItem {
            if playerItem.status == .failed {
                if let error = playerItem.error {
                    print("Video playback failed: \(error.localizedDescription)")
                }
            }
        }
    }
    
    @objc func proceedButtonTapped() {
        print("Proceed button tapped")
        
        // Start the timer
        startTimer()
    }
    
    @objc func startButtonTapped() {
        print("Start button tapped")
        
        // Start the timer
        startTimer()
    }
    
    @objc func stopButtonTapped() {
        print("Stop button tapped")
        
        // Stop the timer
        stopTimer()
    }
    
    func startTimer() {
        stopButton.isEnabled = true
        startButton.isEnabled = false
        elapsedSeconds = 0
        updateTimerLabel()
        
        // Create and start the timer
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
    }
    
    func stopTimer() {
        stopButton.isEnabled = false
        startButton.isEnabled = true
        
        // Stop and invalidate the timer
        timer?.invalidate()
        timer = nil
    }
    
    @objc func updateTimer() {
        elapsedSeconds += 1
        updateTimerLabel()
    }
    
    func updateTimerLabel() {
        let minutes = Int(elapsedSeconds) / 60
        let seconds = Int(elapsedSeconds) % 60
        
        timerLabel.text = String(format: "%02d:%02d", minutes, seconds)
    }
    
    deinit {
        // Remove observer
        player?.currentItem?.removeObserver(self, forKeyPath: "status")
    }
}
