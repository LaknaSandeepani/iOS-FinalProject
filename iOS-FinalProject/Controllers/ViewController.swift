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
        let mainViewController = MainViewController()
        let userDetailsViewController = UserDetailsViewController()
        let loginViewController = LoginViewController()

        // Set titles and icons for each tab
        mainViewController.tabBarItem = UITabBarItem(title: "First", image: UIImage(named: "t"), tag: 0)
        userDetailsViewController.tabBarItem = UITabBarItem(title: "Second", image: UIImage(named: "t"), tag: 1)
        loginViewController.tabBarItem = UITabBarItem(title: "Third", image: UIImage(named: "t"), tag: 2)

        // Set the view controllers for the tab bar controller
        tabBar.viewControllers = [mainViewController, userDetailsViewController, loginViewController]

        // Set the delegate of the tab bar controller
        tabBar.delegate = self

        // Customize the appearance of the tab bar
        tabBar.tabBar.barTintColor = .white
        tabBar.tabBar.tintColor = .blue

        // Embed the tab bar controller inside a navigation controller
        let navigationController = UINavigationController(rootViewController: tabBar)

        // Add the navigation controller's view to the main view with constraints
        addChild(navigationController)
        view.addSubview(navigationController.view)
        navigationController.view.translatesAutoresizingMaskIntoConstraints = false
        navigationController.view.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        navigationController.view.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        navigationController.view.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        navigationController.view.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
    }

    // MARK: - UITabBarControllerDelegate methods

    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        if let selectedViewController = tabBarController.selectedViewController {
            // Perform navigation or additional logic based on the selected view controller
            if selectedViewController == tabBarController.viewControllers?[0] {
                // First tab selected
                navigateToFirstTab()
            } else if selectedViewController == tabBarController.viewControllers?[1] {
                // Second tab selected
                navigateToSecondTab()
            } else if selectedViewController == tabBarController.viewControllers?[2] {
                // Third tab selected
                navigateToThirdTab()
            }
        }
    }

    // Custom navigation methods for each tab
    func navigateToFirstTab() {
        // Perform navigation to the respective view controller for the first tab
        let mainViewController = MainViewController()
        navigationController?.pushViewController(mainViewController, animated: true)
    }

    func navigateToSecondTab() {
        // Perform navigation to the respective view controller for the second tab
        let userDetailsViewController = UserDetailsViewController()
        navigationController?.pushViewController(userDetailsViewController, animated: true)
    }

    func navigateToThirdTab() {
        // Perform navigation to the respective view controller for the third tab
        let loginViewController = LoginViewController()
        navigationController?.pushViewController(loginViewController, animated: true)
    }
}




