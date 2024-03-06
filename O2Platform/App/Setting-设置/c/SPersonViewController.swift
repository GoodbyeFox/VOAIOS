//
//  SPersonViewController.swift
//  O2Platform
//
//  Created by 刘振兴 on 2016/10/14.
//  Copyright © 2016年 zoneland. All rights reserved.
//

import UIKit
import Eureka
import Alamofire
import AlamofireImage
import AlamofireObjectMapper

import ObjectMapper
import BSImagePicker
import Photos
import CocoaLumberjack

class SPersonViewController: FormViewController {
    
    var person:O2PersonInfo? = nil
    
    var updateFlag:Bool = false

    var myIconView:UIImageView = UIImageView()
    
    private let viewModel: O2PersonalViewModel = {
        return O2PersonalViewModel()
    }()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        //右边按钮
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: L10n.change, style: .plain, target: self, action: #selector(self.submitPersonUpdateAction(sender:)))
        
        ImageRow.defaultCellUpdate = { cell, row in
            cell.accessoryView?.layer.cornerRadius = 17
            cell.accessoryView?.frame = CGRect(x: 0, y: 0, width: 34, height: 34)
            cell.textLabel?.font = setting_content_textFont
            cell.textLabel?.textColor  = setting_content_textColor
        }
        LabelRow.defaultCellUpdate = {
            cell,row in
            cell.textLabel?.font = setting_content_textFont
            cell.textLabel?.textColor  = setting_content_textColor
            cell.accessoryType = .disclosureIndicator
        }
        EmailRow.defaultCellUpdate = {
            cell,row in
            cell.textLabel?.font = setting_content_textFont
            cell.textLabel?.textColor  = setting_content_textColor
        }
        PhoneRow.defaultCellUpdate = {
            cell,row in
            cell.textLabel?.font = setting_content_textFont
            cell.textLabel?.textColor  = setting_content_textColor
        }
        TextRow.defaultCellUpdate = {
            cell,row in
            //修改输入法顶部的“完成”按钮的颜色字体
            if cell.inputAccessoryView?.isKind(of: NavigationAccessoryView.self) == true {
                let view = cell.textField.inputAccessoryView as? NavigationAccessoryView
                view?.doneButton.setTitleTextAttributes([
                    NSAttributedString.Key.font:navbar_item_font,
                    NSAttributedString.Key.foregroundColor: base_blue_color
                    ], for:UIControl.State())
            }
            cell.textLabel?.font = setting_content_textFont
            cell.textLabel?.textColor  = setting_content_textColor
        }
        ButtonRow.defaultCellUpdate = {
            cell,row in
            cell.textLabel?.font = setting_item_textFont
            cell.textLabel?.theme_textColor = ThemeColorPicker(keyPath: "Base.base_color")

        }
        ActionSheetRow<String>.defaultCellUpdate = {
            cell,row in
            cell.textLabel?.font = setting_content_textFont
            cell.textLabel?.textColor =  setting_content_textColor
        }
        self.loadCurrentPersonInfo()
    }
    
    
    private func loadCurrentPersonInfo(){
        self.showLoading(title: L10n.loading)
        self.viewModel.loadMyInfo().then { (person) in
                DispatchQueue.main.async {
                    self.person = person
                    self.loadAvatar()
                }
            }.catch { (error) in
                DispatchQueue.main.async {
                    self.showError(title: ("\(error)\n"+L10n.errorLoadProfile))
                }
        }
    }
    private func loadAvatar() {
        let avatarUrlString = AppDelegate.o2Collect.generateURLWithAppContextKey(ContactContext.contactsContextKeyV2, query: ContactContext.personIconByNameQueryV2, parameter: ["##name##":self.person?.id as AnyObject])
        let avatarUrl = URL(string: avatarUrlString!)
        self.myIconView.bounds = CGRect(x: 0, y: 0, width: 34, height: 34)
        self.myIconView.hnk_setImageFromURL(avatarUrl!, placeholder: UIImage(named: "personDefaultIcon"), format: nil, failure: { (error) in
            DDLogError("加载头像异常, \(String(describing: error))")
            self.setupForm(nil)
        }) { (image) in
            self.setupForm(image)
        }
        
    }
    
    private func setupForm(_ avatarImage: UIImage?) {
        self.title = self.person?.name
        if avatarImage == nil {
            DDLogError("没有头像数据！！！！！")
        }
        form +++ Section()
            
            <<< ImageRow("myAvatar"){ row in
                row.title = L10n.avatar
                row.sourceTypes = [.PhotoLibrary,.Camera]
                row.clearAction = .no
                row.value = avatarImage
                }.onChange({ (row:ImageRow) in
                    if let image = row.value {
                        self.viewModel.updateMyIcon(icon: image)
                            .then({ (result) in
                                DDLogInfo("上次头像成功！，result:\(result)")
                                self.notifyReloadAvatar()
                            }).catch({ (error) in
                                DDLogInfo("上传头像失败，\(error)")
                                self.showError(title: "Error，\(error)")
                            })
                    }else {
                        row.value = UIImage(named: "personDefaultIcon")
                    }
                })
            <<< LabelRow(){
                $0.title = L10n.code
                $0.value = person?.employee
            }
            <<< TextRow(){
                $0.title = L10n.name
                $0.value = person?.name
                }.onChange({ (row) in
                    self.person?.name = row.value
                    self.updateFlag = true
                })
            
            <<< ActionSheetRow<String>(){
                $0.title = L10n.gender
                $0.selectorTitle = L10n.selectGender
                $0.options = [L10n.male,L10n.female]
                $0.cancelTitle = L10n.cancel
                $0.value = person?.genderType == "f" ? L10n.female:L10n.male
                }.onChange({ (row:ActionSheetRow<String>) in
                    if row.value == L10n.male {
                        self.person?.genderType = "m"
                    }else if row.value == L10n.female{
                        self.person?.genderType = "f"
                    }
                    self.updateFlag = true
                })
            
            +++ Section()
            <<< EmailRow(){
                $0.title = "Email"
                $0.value = person?.mail
                }.onChange({ (row) in
                    self.person?.mail = row.value
                    self.updateFlag = true
                })
            
            <<< PhoneRow(){
                $0.title = L10n.mobile
                $0.value = person?.mobile
                }.onChange({ (row) in
                    self.person?.mobile = row.value
                    self.updateFlag = true
                })
            
            <<< TextRow(){
                $0.title = L10n.wechat
                $0.value = person?.weixin
                }.onChange({ (row) in
                    self.person?.weixin = row.value
                    self.updateFlag = true
                })
            
            
            <<< TextRow(){
                $0.title = "QQ"
                $0.value = person?.qq
                }.onChange({ (row) in
                    self.person?.qq = row.value
                    self.updateFlag = true
                })
            
            +++ Section()
            <<< ButtonRow() {
                $0.title = L10n.logout
                }.onCellSelection({ (cell, row) in
                    let alertController = UIAlertController(title: L10n.logout, message: L10n.exitConfirmMessage, preferredStyle: .actionSheet)
                    let okAction = UIAlertAction(title: L10n.exit, style: .destructive, handler: { _ in
                        self.logout()
                    })
                    let cancelAction = UIAlertAction(title: L10n.cancel, style: .cancel, handler: nil)
                    alertController.addAction(okAction)
                    alertController.addAction(cancelAction)
                    self.present(alertController, animated: true, completion: nil)
                }).cellSetup({ (cell:ButtonCellOf<String>, buttonRow) in
                    cell.textLabel?.font = UIFont(name: "PingFangSC-Regular", size: 14.0)
                    cell.textLabel?.theme_textColor = ThemeColorPicker(keyPath: "Base.base_color")
                })
        self.hideLoading()
    }
    
    func logout()  {
        // 人员登录信息清除
        O2AuthSDK.shared.logout { (result, msg) in
            DDLogInfo("O2 登出 \(result), msg：\(msg ?? "")")
        }
        // 退出极光推送
        O2JPushManager.shared.O2JPushUnBind()
        // 退出极速打卡
        FastCheckInManager.shared.stop()
        
        self.forwardDestVC("login", "loginVC")
    }
    
    //提交更新
    @objc func submitPersonUpdateAction(sender:UIBarButtonItem){
        if updateFlag ==  true {
            self.viewModel.updateMyInfo(person: self.person!).then { (result) in
                DDLogInfo("更新个人信息成功，\(result)")
                self.showSuccess(title: L10n.applicationsUpdateSuccess)
                }.catch { (error) in
                    DDLogError("更新个人信息失败，\(error)")
                    self.showError(title: (L10n.updateError+"，\(error)"))
            }
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    /// 通知更新头像了
    @objc private func notifyReloadAvatar() {
        NotificationCenter.default.post(name: Notification.Name("reloadMyIcon"), object: nil)
    }
}
