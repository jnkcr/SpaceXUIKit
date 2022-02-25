//
//  SceneDelegate.swift
//  SpaceXUIKit
//
//  Created by Jan Kučera on 03.02.2022.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    @StoredInt(key: "appearance") var appearanceKey: Int

    var window: UIWindow?
    
    let spaceFlightsVC = SpaceFlightsVC()
    let crewVC = CrewVC()
    let settingsVC = SettingsVC()
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        // Navigation controllers
        let spaceFlightsNC = UINavigationController(rootViewController: spaceFlightsVC)
        spaceFlightsNC.navigationBar.tintColor = .systemYellow
        spaceFlightsNC.tabBarItem = UITabBarItem(title: "Flights", image: UIImage(systemName: "airplane.circle.fill"), tag: 0)
        let crewNC = UINavigationController(rootViewController: crewVC)
        crewNC.navigationBar.tintColor = .systemYellow
        crewNC.tabBarItem = UITabBarItem(title: "Crew", image: UIImage(systemName: "person.2.circle.fill"), tag: 1)
        let settingsNC = UINavigationController(rootViewController: settingsVC)
        settingsNC.navigationBar.tintColor = .systemYellow
        settingsNC.tabBarItem = UITabBarItem(title: "Settings", image: UIImage(systemName: "gear.circle.fill"), tag: 2)
        
        // Tabbar
        let tabbar = UITabBarController()
        tabbar.tabBar.tintColor = .systemYellow
        tabbar.viewControllers = [spaceFlightsNC, crewNC, settingsNC]
        
        // Appearance delegation
        settingsVC.appearanceDelegate = self
        
        // Window configuration
        window = UIWindow(frame: windowScene.coordinateSpace.bounds)
        window?.windowScene = windowScene
        window?.rootViewController = tabbar
        window?.overrideUserInterfaceStyle = getInterfaceStyle()
        window?.makeKeyAndVisible()
        
        UNUserNotificationCenter.current().delegate = self
        requestAuthorization()
    }

    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not necessarily discarded (see `application:didDiscardSceneSessions` instead).
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    }

    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.
    }

}

extension SceneDelegate: AppearanceDelegate {
    
    func didChangeAppearanceStyle(to style: UIUserInterfaceStyle) {
        window?.overrideUserInterfaceStyle = style
    }
    
}

extension SceneDelegate {
    
    func getInterfaceStyle() -> UIUserInterfaceStyle {
        switch appearanceKey {
        case 0:
            return UIUserInterfaceStyle.unspecified
        case 1:
            return UIUserInterfaceStyle.light
        case 2:
            return UIUserInterfaceStyle.dark
        default:
            return UIUserInterfaceStyle.unspecified
        }
    }
    
}

// MARK: - Notifications

extension SceneDelegate {
    
        private func requestAuthorization() {
            let center = UNUserNotificationCenter.current()
            center.requestAuthorization(options: [.alert, .sound]) { isGranted, error in
                if isGranted {
                    print("NOTIFICATION ACCESS GRANTED")
                } else {
                    print("NOTIFICATION ACCESS DENIED")
                }
            }
        }
    
}

extension SceneDelegate: UNUserNotificationCenterDelegate {
    
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        completionHandler([.banner, .sound, .list])
    }
    
}

