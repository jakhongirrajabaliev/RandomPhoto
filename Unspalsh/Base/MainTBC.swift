//
//  MainTBC.swift
//  Unspalsh
//
//  Created by user1 on 16/10/22.
//

import Foundation
import UIKit

class MainTBC: UITabBarController {

    var tabbarItem1 = UITabBarItem()
    var tabbarItem2 = UITabBarItem()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tabbarSetup()
    }

    
    func tabbarSetup() {
        let vc1 = MainContoller.init()
        let navVc1 = UINavigationController(rootViewController: vc1)
        
        let vc2 = FovoriteController()
        let navVc2 = UINavigationController(rootViewController: vc2)
        
        tabbarItem1 = UITabBarItem(title: "Main", image: UIImage(systemName: "house"), selectedImage: nil)
        tabbarItem2 = UITabBarItem(title: "Fovorite", image: UIImage(systemName: "heart"), selectedImage: nil)
       
        vc1.tabBarItem = tabbarItem1
        vc2.tabBarItem = tabbarItem2
     
        navigationController?.navigationBar.barTintColor = .white
        UITabBar.appearance().tintColor = #colorLiteral(red: 0.03118176013, green: 0.5137683153, blue: 0.4233419299, alpha: 1)
        UITabBar.appearance().barTintColor = #colorLiteral(red: 0.9606898427, green: 0.9608504176, blue: 0.9606687427, alpha: 1)
        
        
        viewControllers = [vc1,vc2]
        
    }
  
}
