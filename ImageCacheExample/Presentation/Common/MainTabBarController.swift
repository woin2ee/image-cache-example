//
//  MainTabBarController.swift
//  ImageCacheExample
//
//  Created by Jaewon Yun on 2022/11/06.
//

import UIKit

final class MainTabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let firstVC: WithPullDownMenuViewController = .instantiate(withStoryboardName: "WithPullDownMenu")
        let firstNC: UINavigationController = .init(rootViewController: firstVC)
        firstNC.tabBarItem = .init(
            title: "PullDownMenu",
            image: UIImage.init(systemName: "list.bullet.rectangle.portrait"),
            tag: 0
        )
        
        let secondVC: WithSideBarViewController = .instantiate(withStoryboardName: "WithSideBar")
        let secondNC: UINavigationController = .init(rootViewController: secondVC)
        secondNC.tabBarItem = .init(
            title: "SideBar",
            image: UIImage.init(systemName: "sidebar.left"),
            tag: 1
        )
        
        self.viewControllers = [firstNC, secondNC]
    }
}
