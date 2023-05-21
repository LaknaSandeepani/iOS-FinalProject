//
//  ExerciseDetailViewController.swift
//  iOS-FinalProject
//
//  Created by Lakna Attigala on 2023-05-17.

import UIKit
import AVKit

class ExerciseDetailsViewController: UIViewController {
    var exercise: Exercise?
    var player: AVPlayer?
    var playerViewController: AVPlayerViewController?
    
//    let backButton: UIButton = {
//        let button = UIButton()
//        button.setImage(UIImage(named: "back"), for: .normal)
//        button.addTarget(self, action: #selector(backButtonTapped), for: .touchUpInside)
//        button.translatesAutoresizingMaskIntoConstraints = false
//        return button
//    }()

    
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
    let checkLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 18)
        label.textColor = .gray
        label.text = "Proceed & Do this By Yourself"
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
         
//            title = exercise.name
            nameLabel.text = exercise.name
            repLabel.text = "Reps: \(exercise.repcount)"
            timeLabel.text = "Time: \(exercise.duration)"
            let muscleGroups = exercise.muscleGroups.joined(separator: ", ")
            bodyPartLabel.text = "Targeted Body Parts: \(muscleGroups)"
        }
        
        view.backgroundColor = .white
        view.addSubview(nameLabel)
        view.addSubview(repLabel)
        view.addSubview(timeLabel)
        view.addSubview(videoView)
        view.addSubview(bodyPartLabel)
        view.addSubview(proceedButton)
        view.addSubview(timerLabel)
        view.addSubview(stopButton)
        view.addSubview(checkLabel)
//        view.addSubview(backButton)
        
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
        videoView.layer.borderWidth = 1.0
        videoView.layer.borderColor = UIColor.black.cgColor
        
        bodyPartLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        bodyPartLabel.topAnchor.constraint(equalTo: videoView.bottomAnchor, constant: 8).isActive = true
        
        proceedButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        proceedButton.topAnchor.constraint(equalTo: checkLabel.bottomAnchor, constant: 16).isActive = true
        proceedButton.widthAnchor.constraint(equalToConstant: 200).isActive = true
        proceedButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        timerLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        timerLabel.topAnchor.constraint(equalTo: proceedButton.bottomAnchor, constant: 16).isActive = true
        
        stopButton.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 5).isActive = true
        stopButton.topAnchor.constraint(equalTo: timerLabel.bottomAnchor, constant: 16).isActive = true
        stopButton.widthAnchor.constraint(equalToConstant: 200).isActive = true
        stopButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        checkLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        checkLabel.topAnchor.constraint(equalTo: bodyPartLabel.bottomAnchor, constant: 8).isActive = true
        
        // Set constraints for the back button
//                backButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16).isActive = true
//                backButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16).isActive = true
//                backButton.widthAnchor.constraint(equalToConstant: 24).isActive = true
//                backButton.heightAnchor.constraint(equalToConstant: 24).isActive = true

        
        if let exercise = exercise, let videoURL = URL(string: exercise.videoUrl) {
            let player = AVPlayer(url: videoURL)
            playerViewController = AVPlayerViewController()
            playerViewController?.player = player
            
            addChild(playerViewController!)
            videoView.addSubview(playerViewController!.view)
            
            playerViewController!.view.frame = videoView.bounds
            playerViewController!.view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
            
            player.play()
            
            player.currentItem?.addObserver(self, forKeyPath: "status", options: [.new, .initial], context: nil)
        } else {
            print("Invalid video URL")
        }
    }
    
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
        startTimer()
    }
    
    @objc func stopButtonTapped() {
        print("Stop button tapped")
        stopTimer()
        elapsedSeconds = 0
        updateTimerLabel()
    }

    func startTimer() {
        stopButton.isEnabled = true
        elapsedSeconds = 0
        updateTimerLabel()
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
    }
    
    func stopTimer() {
        stopButton.isEnabled = false
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
   

}
