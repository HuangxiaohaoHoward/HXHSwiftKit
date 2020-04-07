//
//  HXHBaseNavigationViewController.swift
//  HXHSwiftKit
//
//  Created by 黄小豪 on 2020/4/7.
//  Copyright © 2020 黄小豪. All rights reserved.
//

import UIKit

class HXHBaseNavigationViewController: UINavigationController, UIGestureRecognizerDelegate, UINavigationControllerDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupSideslip()
        //默认无暗黑
        if #available(iOS 13.0, *) {
            overrideUserInterfaceStyle = .light
        } else {
            
        }
        
    }
    
    /// 重写下push
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        if viewControllers.count > 0 {
            viewController.hidesBottomBarWhenPushed = true
        }
        super.pushViewController(viewController, animated: animated)
    }
    /// 侧滑配置
    func setupSideslip() {
        interactivePopGestureRecognizer?.isEnabled = true
        interactivePopGestureRecognizer?.delegate = self
    }
   //MARK: - 侧滑相关代理
    func navigationController(_ navigationController: UINavigationController, didShow viewController: UIViewController, animated: Bool) {
        if (navigationController.viewControllers.count < 2) {
            interactivePopGestureRecognizer?.isEnabled = false;
        } else {
            interactivePopGestureRecognizer?.isEnabled = true;
        }
    }
    func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        if gestureRecognizer == interactivePopGestureRecognizer {
            if (viewControllers.count < 2) || (visibleViewController == viewControllers.first) {
                return false
            }
        }
        return true
    }
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        if otherGestureRecognizer.delegate?.isKind(of: NSClassFromString("UICollectionView")) {
            <#code#>
        }
        return false
    }
}

