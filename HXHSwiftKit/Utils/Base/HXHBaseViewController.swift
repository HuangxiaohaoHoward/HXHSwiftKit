//
//  HXHBaseViewController.swift
//  HXHSwiftKit
//
//  Created by 黄小豪 on 2020/4/2.
//  Copyright © 2020 黄小豪. All rights reserved.
//

import UIKit

import SDWebImage
import YYKit
import MBProgressHUD
import SnapKit


class HXHBaseViewController: UIViewController {
    enum NaviType {
        case hideNavi
        case normal
    }
    var naviType = NaviType.hideNavi {
        didSet{
            setupBaseNaviAndStatus()
        }
    }
    
    /// 简单文字提示
    lazy var hud: MBProgressHUD = {
        var hud = MBProgressHUD(view: view)
        view.addSubview(hud)
        hud.mode = MBProgressHUDMode.text
        hud.isUserInteractionEnabled = false
        return hud
    }()
    
    /// 标题label
    lazy var customTitleLabel = UILabel()
    //MARK: - 构造方法 init
    init(naviType: NaviType = .hideNavi) {
        self.naviType = naviType
        super.init(nibName: nil, bundle: nil)
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    //MARK: - 声明周期
    override func viewDidLoad() {
        super.viewDidLoad()
        config()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupBaseNaviAndStatus()
    }
    
    
}
//MARK: - 基础设置
extension HXHBaseViewController {
    func config() {
        automaticallyAdjustsScrollViewInsets = false
        self.modalPresentationStyle = .fullScreen
        
        if #available(iOS 13.0, *) {
            overrideUserInterfaceStyle = .light
        } else {
            
        }
    }
    //MARK: - 基础设置 - 状态栏基础状态
    private func setupBaseNaviAndStatus() {
        navigationController?.navigationBar.isTranslucent = false
        UIApplication.shared.setStatusBarHidden(false, with: .fade)
        switch naviType {
        case .hideNavi:
            navigationController?.setNavigationBarHidden(false, animated: false)
        default:
            navigationController?.setNavigationBarHidden(true, animated: false)
        }
        setupStatusBarDefault()
    }
    func setupStatusBarLight() {
        navigationController?.navigationBar.barStyle = .black;
        UIApplication.shared.statusBarStyle = .lightContent;
        perform(#selector(setNeedsStatusBarAppearanceUpdate))
    }
    
    func setupStatusBarDefault() -> Void {
        navigationController?.navigationBar.barStyle = .default
        
        if #available(iOS 13.0, *) {
            UIApplication.shared.statusBarStyle = .darkContent
        } else {
            UIApplication.shared.statusBarStyle = .default
        }
        perform(#selector(setNeedsStatusBarAppearanceUpdate))
    }
}
//MARK: - view层的常用方法
extension HXHBaseViewController {
    //MARK: - navi - 构造方法与点击
    /// 自定义naviView
    func setupCustomNavi(customTitle: NSString, leftBtn: UIButton?, rightBtn: UIButton?, titleColor: UIColor?, bgColor: UIColor?) {
        //第一步，容器view
        let naviView = UIView()
        if let bgColor = bgColor {
            naviView.backgroundColor = bgColor
        } else {
            naviView.backgroundColor = UIColor.white
        }
        view.addSubview(naviView)
        
        naviView.snp.makeConstraints { (make) in
            make.top.equalTo(view.snp.top)
            make.left.equalTo(view.snp.left)
            make.right.equalTo(view.snp.right)
            make.height.equalTo(NaviAndStatusHeight)
        }
        //title
        customTitleLabel.text = String(customTitle)
        customTitleLabel.font = .systemFont(ofSize: 17, weight: UIFont.Weight.semibold)
        naviView.addSubview(customTitleLabel)
        customTitleLabel.snp.makeConstraints { (make) in
            make.bottom.equalTo(view.snp.bottom)
            make.centerX.equalTo(view.snp.centerX)
            make.height.equalTo(44)
        }
        if let titleColor = titleColor {
            customTitleLabel.textColor = titleColor
        } else {
            customTitleLabel.textColor = UIColor.init(hexString: kBlack_333333)
        }
        //leftBtn
        if let leftBtn = leftBtn {
            naviView.addSubview(leftBtn)
            leftBtn.snp.makeConstraints { (make) in
                make.left.equalTo(naviView.snp.left).offset(12)
                make.bottom.equalTo(naviView.snp.bottom)
                make.height.equalTo(44)
            }
        } else {
            let leftBtn = UIButton(type: UIButton.ButtonType.custom)
            leftBtn.setImage(UIImage(named: "navi_back_black"), for: UIControl.State.normal)
            leftBtn.addTarget(self, action: #selector(naviLeftBtnAction(sender:)), for: .touchUpInside)
            leftBtn.snp.makeConstraints { (make) in
                make.left.equalTo(naviView.snp.left).offset(12)
                make.bottom.equalTo(naviView.snp.bottom)
                make.height.equalTo(44)
            }
        }
//        rightBtn
        if let rightBtn = rightBtn {
            rightBtn.snp.makeConstraints { (make) in
                make.right.equalTo(naviView).offset(12)
                make.bottom.equalTo(naviView)
                make.height.equalTo(44)
            }
        }
    }
    @objc func naviLeftBtnAction(sender: UIButton) {
        if (navigationController?.viewControllers.count ?? 0) > 1 {
            navigationController?.popViewController(animated: true)
        }
    }
    /// 常规的显示文字提示，多行
    func setTextHud(text: String) {
        hud.show(animated: true)
        hud.detailsLabel.text = text
        hud.hide(animated: true, afterDelay: 1)
        print(text)
    }
    
}
