//
//  OOAttendanceScheduleViewCell.swift
//  O2Platform
//
//  Created by FancyLou on 2020/7/21.
//  Copyright © 2020 zoneland. All rights reserved.
//

import UIKit

class OOAttendanceScheduleViewCell: UICollectionViewCell {
    @IBOutlet weak var checkInTypeLabel: UILabel!
    @IBOutlet weak var updateCheckInBtn: UIButton!
    @IBOutlet weak var checkInStatusLabel: UILabel!
    @IBOutlet weak var checkInTimeLabel: UILabel!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    
    func setData(info: OOAttandanceMobileScheduleInfo, isLastRecord: Bool) {
        self.checkInTypeLabel.text = info.checkinType
        self.checkInTimeLabel.text = info.signTime
        self.checkInStatusLabel.text = info.checkinStatus
        self.updateCheckInBtn.isHidden = true
        //if info.checkinStatus == "已打卡" {
        if info.checkinStatus == L10n.hasCheckIn {
            if let time = info.checkinTime {
                self.checkInStatusLabel.text = time.subString(from: 0, to: 5) + (info.checkinStatus ?? "")
            }
            if isLastRecord {
                self.updateCheckInBtn.isHidden = false
            }
        }
        
    }
    
    func setDataV2(data: AttendanceV2CheckItemData) {
        var status = data.recordTime ?? ""
        if data.isRecord == true {
            status = data.recordTime ?? ""
        } else {
            status = L10n.needCheckIn
//            status = "待打卡"
        }
        self.checkInStatusLabel.text = status
        self.checkInTypeLabel.text = data.checkInTypeString ?? ""
        self.checkInTimeLabel.text = data.preDutyTime ?? ""
        self.updateCheckInBtn.isHidden = !(data.isLastRecord == true)
    }

}
