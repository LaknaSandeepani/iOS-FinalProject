//
//  ViewController.swift
//  iOS-FinalProject
//
//  Created by Lakna Attigala on 2023-05-18.
//

import UIKit

class ViewController: UIViewController, UITabBarControllerDelegate {
    let tabBar = UITabBarController()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white

        // Create view controllers for each tab
        let userDetailsViewController = UserDetailsViewController()
        let customScheduleViewController = CustomScheduleViewController()
        let viewCustomScheduleController = ViewCustomScheduleController()
        
        // Set titles and icons for each tab
        userDetailsViewController.tabBarItem = UITabBarItem(title: "", image: UIImage(named: "home"), tag: 0)
        customScheduleViewController.tabBarItem = UITabBarItem(title: "", image: UIImage(named: "schedule"), tag: 1)
        viewCustomScheduleController.tabBarItem = UITabBarItem(title: "", image: UIImage(named: "view"), tag: 2)
        
        // Set the view controllers for the tab bar controller
        let tabBar = UITabBarController()
        tabBar.viewControllers = [userDetailsViewController, customScheduleViewController, viewCustomScheduleController]
        
        // Set the delegate of the tab bar controller
        tabBar.delegate = self

        // Customize the appearance of the tab bar
        tabBar.tabBar.barTintColor = .white
        tabBar.tabBar.tintColor = .black

        // Embed the tab bar controller inside a navigation controller
        let navigationController = UINavigationController(rootViewController: tabBar)

        // Add the navigation controller's view to the main view with constraints
        addChild(navigationController)
        view.addSubview(navigationController.view)
        navigationController.view.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            navigationController.view.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            navigationController.view.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            navigationController.view.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            navigationController.view.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor)
        ])

    }

}




