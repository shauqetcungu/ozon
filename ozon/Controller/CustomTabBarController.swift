//
//  CustomTabBarController.swift
//  ozon
//
//  Created by Administrator on 03/01/2019.
//  Copyright © 2019 Amplitudo. All rights reserved.
//

import UIKit
import Dropdowns
import Kingfisher
class CustomTabBarController: UITabBarController{
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        delegate = self
    }
    
    // LOGO OZON
   func addNavBarImage() {
        let image = UIImage(named: "logo_ozon_1.png") //Your logo url here
        let logoImageView = UIImageView(image: image)
        
        logoImageView.frame = CGRect(x:0.0,y:0.0, width:80,height:35.0)
        logoImageView.contentMode = .scaleAspectFit
        let imageItem = UIBarButtonItem.init(customView: logoImageView)
        let widthConstraint = logoImageView.widthAnchor.constraint(equalToConstant: 60)
        let heightConstraint = logoImageView.heightAnchor.constraint(equalToConstant: 25)
        heightConstraint.isActive = true
        widthConstraint.isActive = true
        navigationItem.leftBarButtonItem =  imageItem
        
    }
    
    // SLIKA OBLAK
    func addNavBarImageright() {
        let image = UIImage(named: "cloud.png") //Your logo url here
        let logoImageView = UIImageView(image: image)
        
        logoImageView.frame = CGRect(x:0.0,y:0.0, width:80,height:35.0)
        logoImageView.contentMode = .scaleAspectFit
        let imageItem = UIBarButtonItem.init(customView: logoImageView)
        let widthConstraint = logoImageView.widthAnchor.constraint(equalToConstant: 60)
        let heightConstraint = logoImageView.heightAnchor.constraint(equalToConstant: 25)
        heightConstraint.isActive = true
        widthConstraint.isActive = true
        navigationItem.rightBarButtonItem =  imageItem
        
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        // POZICIONIRANJE TABOVA
        let navigationBarHeight: CGFloat = self.navigationController!.navigationBar.frame.height
        var tabFrame:CGRect = self.tabBar.frame
        tabFrame.origin.y = navigationBarHeight
        tabFrame.size.height = 70
        tabBar.frame = tabFrame
        
        //FONT TABOVA
        let systemFontAttributes = [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 18.0)]
        UITabBarItem.appearance().setTitleTextAttributes(systemFontAttributes, for: .normal)
        
       addNavBarImage()
       addNavBarImageright()
        
       let items = OzonDataService.instance.getCities()
       let titleView = TitleView(navigationController: navigationController!, title: "Grad", items: items)
        
       navigationItem.titleView = titleView
        
        let secondFrame = CGRect(x: tabFrame.width/1.1, y: 0, width: tabFrame.width/2, height: navigationBarHeight/1.8)
        let secondLabel = UILabel(frame: secondFrame)
        secondLabel.textColor = UIColor.white
        secondLabel.font = UIFont.boldSystemFont(ofSize: 11)
        
        titleView?.action = { [weak self] index in
            secondLabel.text = "\(OzonDataService.instance.getTemperatures()[index])°C"
        }
        navigationController?.navigationBar.addSubview(secondLabel)
    }
}

//ANIMACIJA ZA TABOVE
extension CustomTabBarController: UITabBarControllerDelegate  {
    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
        guard let tabViewControllers = tabBarController.viewControllers, let toIndex = tabViewControllers.index(of: viewController) else {
            return false
        }
        animateToTab(toIndex: toIndex)
        return true
    }
    
    func animateToTab(toIndex: Int) {
        guard let tabViewControllers = viewControllers,
            let selectedVC = selectedViewController else { return }
        
        guard let fromView = selectedVC.view,
            let toView = tabViewControllers[toIndex].view,
            let fromIndex = tabViewControllers.index(of: selectedVC),
            fromIndex != toIndex else { return }
        
        
        // Add the toView to the tab bar view
        fromView.superview?.addSubview(toView)
        
        // Position toView off screen (to the left/right of fromView)
        let screenWidth = UIScreen.main.bounds.size.width
        let scrollRight = toIndex > fromIndex
        let offset = (scrollRight ? screenWidth : -screenWidth)
        toView.center = CGPoint(x: fromView.center.x + offset, y: toView.center.y)
        
        // Disable interaction during animation
        view.isUserInteractionEnabled = false
        
        UIView.animate(withDuration: 0.3,
                       delay: 0.0,
                       usingSpringWithDamping: 1,
                       initialSpringVelocity: 0,
                       options: .curveEaseOut,
                       animations: {
                        // Slide the views by -offset
                        fromView.center = CGPoint(x: fromView.center.x - offset, y: fromView.center.y)
                        toView.center = CGPoint(x: toView.center.x - offset, y: toView.center.y)
                        
        }, completion: { finished in
            // Remove the old view from the tabbar view.
            fromView.removeFromSuperview()
            self.selectedIndex = toIndex
            self.view.isUserInteractionEnabled = true
        })
    }
}
