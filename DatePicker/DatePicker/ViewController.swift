//
//  ViewController.swift
//  DatePicker
//
//  Created by 강조은 on 2021/08/01.
//

import UIKit

class ViewController: UIViewController {
    var timeSelector: Selector = #selector(ViewController.updateTime)
    // 타이머 동작시 실행할 함수 지정
    var interval = 1.0 // 타이머 간격 1초
    var count = 0   //

    
    @IBOutlet var lblCurrentTime: UILabel!  // 현재시간 레이블 아울렛 변수
    @IBOutlet var lblPickerTime: UILabel!   // 선택시간 레이블 아울렛 변수
                                            // 레이블 아울렛 : 드로그 엔 드롭으로 생성한 변수
    override func viewDidLoad() { // 시스템에 의해 자동으로 호출됨
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
        lblPickerTime.text = "선택시간 : " + formatter.string(from: datePickerView.date)

    }
    
    @objc func updateTime() {   // 타이머가 동작할때 실행할 함수
//        lblCurrentTime.text = String(count)
//        count = count + 1
        let date = NSDate() // 특정한 시간, 21세기 시작기점으로부터 현재까지를 초단위로 저장
        
        let formatter = DateFormatter() // 현재 날짜의 특정 부분만 추출할때 사용
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss EEE"
        lblCurrentTime.text = "현재시간: " + formatter.string(from: date as Date)
        
       
    }
    
}

