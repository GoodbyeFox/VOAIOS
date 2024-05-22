//
//  SEmpowerListViewController.swift
//  O2Platform
//
//  Created by FancyLou on 2023/5/17.
//  Copyright © 2023 zoneland. All rights reserved.
//

import UIKit

class SEmpowerListViewController: UIViewController {

    @IBOutlet weak var myEmpowerLabel: UILabel!
    
    @IBOutlet weak var myEmpowerLineView: UIView!
    
    @IBOutlet weak var myEmpowerToLabel: UILabel!
    
    @IBOutlet weak var myEmpowerToLineView: UIView!
    
    @IBOutlet weak var myEmpowerTabView: UIStackView!
    
    @IBOutlet weak var myEmpowerToTabView: UIStackView!
    
    @IBOutlet weak var tableView: UITableView!
    
    private let viewModel: O2PersonalViewModel = {
        return O2PersonalViewModel()
    }()

    private var empowerList:[EmpowerData] = []
    
    private var type: EmpowerTypeEnum = EmpowerTypeEnum.empowerList // 我的委托
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "外出授权"
        
        //右边按钮
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: L10n.new, style: .plain, target: self, action: #selector(self.gotoCreate))
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.tableFooterView = UIView()
        self.myEmpowerTabView.addTapGesture { tap in
            self.changeType(emType: EmpowerTypeEnum.empowerList)
        }
        self.myEmpowerToTabView.addTapGesture { tap in
            self.changeType(emType: EmpowerTypeEnum.empowerListTo)
        }
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.changeType(emType: EmpowerTypeEnum.empowerList)
    }
    
    @objc private func gotoCreate() {
        self.performSegue(withIdentifier: "showEmpowerCreate", sender: nil)
    }
    
    ///
    /// 点击切换 我的委托 收到的委托
    ///
    private func changeType(emType: EmpowerTypeEnum) {
        self.type = emType
        switch emType {
        case EmpowerTypeEnum.empowerList:
            self.myEmpowerLabel.textColor = base_color
            self.myEmpowerLineView.backgroundColor = base_color
            self.myEmpowerToLabel.textColor = text_primary_color
            self.myEmpowerToLineView.backgroundColor = UIColor.white
            break
        case EmpowerTypeEnum.empowerListTo:
            self.myEmpowerLabel.textColor = text_primary_color
            self.myEmpowerLineView.backgroundColor = UIColor.white
            self.myEmpowerToLabel.textColor = base_color
            self.myEmpowerToLineView.backgroundColor = base_color
            break
        }
        
        self.loadData()
    }
    
    ///
    /// 获取数据
    ///
    private func loadData() {
        if self.type == EmpowerTypeEnum.empowerList {
            self.showLoading()
            self.viewModel.empowerList().then { list in
                self.hideLoading()
                self.empowerList = list
                self.tableView.reloadData()
            }.catch { error in
                self.showError(title: error.localizedDescription)
            }
        } else {
            self.showLoading()
            self.viewModel.empowerListTo().then { list in
                self.hideLoading()
                self.empowerList = list
                self.tableView.reloadData()
            }.catch { error in
                self.showError(title: error.localizedDescription)
            }
        }
    }
    
    private func deleteEmpowerConfirm(item: EmpowerData) {
        self.showDefaultConfirm(title: L10n.alt, message: "确定要删除这个授权吗？") { action in
            self.deleteEmpower(id: item.id)
        }
    }
    
    private func deleteEmpower(id: String?) {
        if let id = id {
            self.viewModel.empowerDelete(id: id).then { result in
                self.loadData()
            }
        }
    }

}

extension SEmpowerListViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.empowerList.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 64
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "EmpowerItemTableViewCell", for: indexPath) as? EmpowerItemTableViewCell {
            cell.setupData(item: self.empowerList[indexPath.row], type: self.type)
            return cell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        if self.type == EmpowerTypeEnum.empowerList {
            self.deleteEmpowerConfirm(item: self.empowerList[indexPath.row])
        }
    }
    
    
}
