//
//  IMConversationListViewController.swift
//  O2Platform
//
//  Created by FancyLou on 2020/6/4.
//  Copyright © 2020 zoneland. All rights reserved.
//

import UIKit
import CocoaLumberjack

class IMConversationListViewController: UIViewController {

    fileprivate lazy var tableview: UITableView = {
        var tableview = UITableView(frame: CGRect(x: 0, y: 0, width: self.view.width, height: self.view.height - TAB_BAR_HEIGHT))
        tableview.delegate = self
        tableview.dataSource = self
        tableview.backgroundColor = UIColor(netHex: 0xe8edf3)
        tableview.register(UINib(nibName: "IMConversationItemCell", bundle: nil), forCellReuseIdentifier: "IMConversationItemCell")
        tableview.separatorStyle = .none
        return tableview
    }()

    fileprivate lazy var emptyView: UIView = {
        let view = UIView(frame: CGRect(x: 0, y: 36, width: self.view.width, height: self.view.height - 36))
        view.isHidden = true
        view.backgroundColor = .white
        let tips = UILabel()
        tips.text = L10n.noMessage
        tips.textColor = UIColor(netHex: 0x666666)
        tips.sizeToFit()
        tips.center = CGPoint(x: view.centerX, y: view.height / 2 - 60)
        view.addSubview(tips)
        return view
    }()

    private lazy var viewModel: IMViewModel = {
        return IMViewModel()
    }()

    private var conversationList: [IMConversationInfo] = []
    private var instantMsgList: [InstantMessage] = []
    private var imConfig = IMConfig()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.rightBarButtonItems = [UIBarButtonItem(image: UIImage(named: "add"), style: .plain, target: self, action: #selector(addConversation))]
        
        view.addSubview(tableview)
        view.addSubview(emptyView)

        NotificationCenter.default.addObserver(self, selector: #selector(receiveMessageFromWs(notice:)), name: OONotification.imCreate.notificationName, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(receiveImConvUpdateFromWs(notice:)), name: OONotification.imConvUpdate.notificationName, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(receiveImConvDeleteFromWs(notice:)), name: OONotification.imConvDelete.notificationName, object: nil)
        

        imConfig.enableClearMsg = false
        viewModel.loadImConfig().then { imConfig in
            self.imConfig = imConfig
        }

    }

    override func viewWillAppear(_ animated: Bool) {
        getInstantMsgList()
    }
    
    func getInstantMsgList() {
        self.showLoading()
        viewModel.getInstantMsgList().then { (list) in
            self.instantMsgList = list
            self.getConversationList()
        }
    }

    func getConversationList() {
        viewModel.myConversationList().then { (list) in
            self.conversationList = list
            var n = 0
            if !self.conversationList.isEmpty {
                for item in self.conversationList {
                    if let number = item.unreadNumber {
                        n += number
                    }
                }
            }
            DispatchQueue.main.async {
                self.hideLoading()
                if self.conversationList.count > 0 || self.instantMsgList.count > 0 {
                    self.emptyView.isHidden = true
                } else {
                    self.emptyView.isHidden = false
                }
                self.tableview.reloadData()
                self.refreshRedPoint(number: n)
            }

        }.catch { (err) in
            DDLogError(err.localizedDescription)
            DispatchQueue.main.async {
                self.hideLoading()
                if self.conversationList.count > 0 || self.instantMsgList.count > 0 {
                    self.emptyView.isHidden = false
                }
            }
        }
    }
    
    @objc private func receiveImConvUpdateFromWs(notice: Notification) {
        DDLogDebug("接收到websocket 更新会话 消息")
        if let _ = notice.object as? IMConversationInfo {
            self.getConversationList()
        }
    }
    @objc private func receiveImConvDeleteFromWs(notice: Notification) {
        DDLogDebug("接收到websocket 删除会话 消息")
        if let _ = notice.object as? IMConversationInfo {
            self.getConversationList()
        }
    }

    //接收websocket消息
    @objc private func receiveMessageFromWs(notice: Notification) {
        DDLogDebug("接收到websocket im 消息")
        if let message = notice.object as? IMMessageInfo {
            if self.conversationList.contains(where: { (info) -> Bool in
                return info.id == message.conversationId
            }) {
                DDLogDebug("有对应的会话 刷新列表")
                var newList: [IMConversationInfo] = []
                self.conversationList.forEach { (info) in
                    if message.conversationId != nil && info.id == message.conversationId {
                        info.lastMessage = message
                        info.unreadNumber = (info.unreadNumber ?? 0) + 1
                    }
                    newList.append(info)
                }
                self.conversationList = newList
                DispatchQueue.main.async {
                    self.tableview.reloadData()
                }
            } else {
                DDLogDebug("没有对应的会话 重新获取会话列表")
                self.getInstantMsgList()
            }
        } else {
            DDLogError("不正确的消息类型。。。")
        }
    }


    private func refreshRedPoint(number: Int) {
        if number > 0 && number < 100 {
            self.navigationController?.tabBarItem.badgeValue = "\(number)"
        } else if number >= 100 {
            self.navigationController?.tabBarItem.badgeValue = "99.."
        }else {
            self.navigationController?.tabBarItem.badgeValue = nil
        }
    }
    
    
    @objc private func addConversation() {
        self.showSheetAction(title: nil, message: nil, actions: [
            UIAlertAction(title: L10n.createSingle, style: .default, handler: { (action) in
                self.createSingleConversation()
            }),
            UIAlertAction(title: L10n.createGroup, style: .default, handler: { (action) in
                self.createGroupConversation()
            })
        ])
    }

    private func createSingleConversation() {
        self.showContactPicker(modes: [.person], callback: { (result) in
            if let users = result.users, users.count > 0 {
                self.viewModel.createConversation(type: o2_im_conversation_type_single, users: [users[0].distinguishedName!]).then { (con) in
                    self.createConversationSuccess(conv: con)
                }.catch { (err) in
                    self.showError(title: (L10n.createSingleError + ", \(err.localizedDescription)"))
                }
                
            }
        }, multiple: false)
    }
    
    private func createGroupConversation() {
        self.showContactPicker(modes: [.person], callback: { (result) in
            if let users = result.users, users.count > 0 {
                let array = users.map { (item) -> String in
                    item.distinguishedName!
                }
                self.viewModel.createConversation(type: o2_im_conversation_type_group, users: array).then { (conv) in
                    self.createConversationSuccess(conv: conv)
                }.catch { (err) in
                    self.showError(title: (L10n.createGroupError + ", \(err.localizedDescription)"))
                }
            }
        })
    }
    
    //创建会话成功 打开聊天界面
    private func createConversationSuccess(conv: IMConversationInfo) {
        if !self.conversationList.contains(where: { (info) -> Bool in
            return info.id == conv.id
        }) {
            self.conversationList.append(conv)
            DispatchQueue.main.async {
                self.tableview.reloadData()
            }
        }
        let chatView = IMChatViewController()
        chatView.conversation = conv
        self.navigationController?.pushViewController(chatView, animated: true)
    }

}

// MARK: - tableview delegate
extension IMConversationListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if self.instantMsgList.count > 0 {
            return self.conversationList.count + 1
        }
        return self.conversationList.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "IMConversationItemCell", for: indexPath) as? IMConversationItemCell {
            if self.instantMsgList.count > 0 {
                if indexPath.row == 0 {
                    cell.setInstantContent(item: self.instantMsgList.last!)
                }else {
                    cell.bindConversation(conversation: self.conversationList[indexPath.row - 1])
                }
            }else {
                cell.bindConversation(conversation: self.conversationList[indexPath.row])
            }
            return cell
        }
        return UITableViewCell()
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 84
    }
    
    /// Cell 圆角背景计算
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        //圆率
        let cornerRadius:CGFloat = 10.0
        //大小
        let bounds:CGRect  = cell.bounds
        //绘制曲线
//        var bezierPath: UIBezierPath? = nil
        //一个为一组时,四个角都为圆角
        let bezierPath: UIBezierPath? = UIBezierPath(roundedRect: bounds, byRoundingCorners: .allCorners, cornerRadii: CGSize(width: cornerRadius, height: cornerRadius))
        //cell的背景色透明
        cell.backgroundColor = .clear
        //新建一个图层
        let layer = CAShapeLayer()
        //图层边框路径
        layer.path = bezierPath?.cgPath
        //图层填充色,也就是cell的底色
        layer.fillColor = UIColor.white.cgColor
        //图层边框线条颜色
        /*
         如果self.tableView.style = UITableViewStyleGrouped时,每一组的首尾都会有一根分割线,目前我还没找到去掉每组首尾分割线,保留cell分割线的办法。
         所以这里取巧,用带颜色的图层边框替代分割线。
         这里为了美观,最好设为和tableView的底色一致。
         设为透明,好像不起作用。
         */
        layer.strokeColor = UIColor.white.cgColor
        //将图层添加到cell的图层中,并插到最底层
        cell.layer.insertSublayer(layer, at: 0)
        
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        DDLogDebug("点击了 row \(indexPath.row)")
        if self.instantMsgList.count > 0 {
            if indexPath.row == 0 {
                let instantView = IMInstantMessageViewController()
                instantView.instantMsgList = self.instantMsgList
                self.navigationController?.pushViewController(instantView, animated: true)
            }else {
                gotoChatView(row: indexPath.row-1)
            }
        }else {
            gotoChatView(row: indexPath.row)
        }
    }
    
    private func gotoChatView(row: Int) {
        let chatView = IMChatViewController()
        chatView.conversation = self.conversationList[row]
        self.navigationController?.pushViewController(chatView, animated: true)
    }

}
