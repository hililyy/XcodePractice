//
//  ViewController.swift
//  Alert2
//
//  Created by 강조은 on 2021/08/04.
//

import UIKit

class ViewController: UIViewController {
    
    let timeSelector: Selector = #selector(ViewController.updateTime)
    let interval = 1.0
    let count = 0
    var alarmTime: String?
    var flag = false;
    @IBOutlet var lblCurrentTime: UILabel!
    @IBOutlet var lblPickerTime: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        Timer.scheduledTimer(timeInterval: interval, // 타이머 간격 : 1초
                                     target : self, // 동작될 뷰 : self
                                     selector : timeSelector, // 타이머 구동 시 실행할 함수
                                     userInfo: nil, // 사용자 여부
                                     repeats: true) // 반복 여부
    }
    
    
    @IBAction func changeDatePicker(_ sender: UIDatePicker) {
        let datePickerView = sender
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm EEE"
        
        lblPickerTime.text = "선택시간: "+formatter.string(from:datePickerView.date)
        formatter.dateFormat = "hh:mm aaa"
        alarmTime = formatter.string(from: datePickerView.date)
        
    }
    @objc func updateTime() {
        let date = NSDate()
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss EEE"
        lblCurrentTime.text = "현재시간: " + formatter.string(from: date as Date)
        formatter.dateFormat = "hh:mm aaa"
        let currentTime = formatter.string(from: date as Date)
            
            if (alarmTime == currentTime ) {
                if(flag == false){
                    let alarmAlert = UIAlertController(title:"알림",message: "설정된 시간입니다!!!",preferredStyle: UIAlertController.Style.alert)
                    let Action = UIAlertAction(title:"네, 알겠습니다",style: UIAlertAction.Style.default,handler: nil)
                    alarmAlert.addAction(Action)
                    present(alarmAlert, animated: true, completion: nil)
                    flag = true
                }
                
            }
            else {
                flag = false
            }
    }
    
}

