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
            setupNaviAndStatus()
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
//MARK: init
    init(naviType: NaviType = .hideNavi) {
        self.naviType = naviType
        super.init(nibName: nil, bundle: nil)
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        config()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        let hud = MBProgressHUD.showAdded(to: view, animated: true)
        hud.mode = MBProgressHUDMode.text
        hud.detailsLabel.text = "detailsLabeldetailsLabeldetailsLabeldetailsLabeldetailsLabeldetailsLabeldetailsLabeldetailsLabeldetailsLabeldetailsLabeldetailsLabeldetailsLabeldetailsLabel"
        hud.hide(animated: true, afterDelay: 3)
        
        
        let btn: UIButton = UIButton(frame: CGRect(x: 100, y: 300, width: 20, height: 60))
        view.addSubview(btn)
        btn.addTarget(self, action: #selector(action), for: UIControl.Event.touchUpInside)
        btn.setTitle("enhenga???", for: UIControl.State.normal)
        btn.setTitleColor(UIColor.black, for: UIControl.State.normal)
        
    }
    @objc func action(sender: UIButton) {
        print("手动创建的btn")
        
        sender.hxh.topImgBottomText(space: 2);
        
        setTextHud(text: "en heng ????????asdasdasd44654as6d4a6s8d46as4d6a5s4d65as4d65asd465s4da654as65d4a65sd465asdinitWithFrameinitWithFrameinitWithFrameinitWithFrame heng ????????asdasdasd44654as6d4a6s8d46as4d6a5s4d65as4d65asd465s4da654as65d4a65sd465asdinitWithFrameinitWithFrameinitWithFrameinitWithFrame heng ????????asdasdasd44654as6d4a6s8d46as4d6a5s4d65as4d65asd465s4da654as65d4a65sd465asdinitWithFrameinitWithFrameinitWithFrameinitWithFrame heng ????????asdasdasd44654as6d4a6s8d46as4d6a5s4d65as4d65asd465s4da654as65d4a65sd465asdinitWithFrameinitWithFrameinitWithFrameinitWithFrame heng ????????asdasdasd44654as6d4a6s8d46as4d6a5s4d65as4d65asd465s4da654as65d4a65sd465asdinitWithFrameinitWithFrameinitWithFrameinitWithFrame heng ????????asdasdasd44654as6d4a6s8d46as4d6a5s4d65as4d65asd465s4da654as65d4a65sd465asdinitWithFrameinitWithFrameinitWithFrameinitWithFrame heng ????????asdasdasd44654as6d4a6s8d46as4d6a5s4d65as4d65asd465s4da654as65d4a65sd465asdinitWithFrameinitWithFrameinitWithFrameinitWithFrame heng ????????asdasdasd44654as6d4a6s8d46as4d6a5s4d65as4d65asd465s4da654as65d4a65sd465asdinitWithFrameinitWithFrameinitWithFrameinitWithFrame")
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
    func setupNaviAndStatus() {
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
    /// 自定义naviView
    func setupCustomNavi(customTitle: NSString, leftBtn: UIButton?, rightBtn: UIButton, titleColor: UIColor, bgColor: UIColor?) {
        //第一步，容器view
        let naviView = UIView()
        guard let bgColor = bgColor else {
            naviView.backgroundColor = UIColor.white
            return
        }
        naviView.backgroundColor = bgColor
        view.addSubview(naviView)
        
        naviView.snp.makeConstraints { (make) in
            make.top.equalTo(view.snp.top)
            make.left.equalTo(view.snp.left)
            make.right.equalTo(view.snp.right)
            make.height.equalTo(NaviAndStatusHeight)
        }
        //title
        customTitleLabel.text = String(customTitle);
        let labelSize: CGSize  = customTitleLabel.intrinsicContentSize
        naviView.addSubview(customTitleLabel)
        customTitleLabel.center = CGPoint(x: ScreenWidth/2.0, y: 22.0 + StatusBarHeight)
        customTitleLabel.bounds = CGRect(origin: CGPoint(x: 0, y: 0), size: labelSize)
        customTitleLabel.snp.makeConstraints { (make) in
            make.bottom.equalTo(view.snp.bottom)
            make.centerX.equalTo(view.snp.centerX)
            make.height.equalTo(44)
        }
        //leftBtn
        if let leftBtn = leftBtn {
            naviView.addSubview(leftBtn)
            leftBtn.frame = CGRect(x: 12.0, y: StatusBarHeight, width: leftBtn.intrinsicContentSize.width, height: 44)
        } else {
           
            
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
