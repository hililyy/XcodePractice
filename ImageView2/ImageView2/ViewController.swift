//
//  ViewController.swift
//  ImageView2
//
//  Created by 강조은 on 2021/07/31.
//

import UIKit

class ViewController: UIViewController {
    
    
    var numImage = 1
    var maxImage = 3;
    @IBOutlet var img: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }
    
    @IBAction func btnBefore(_ sender: UIButton) {
        numImage = numImage - 1
        if (numImage < 1) {
            numImage = maxImage
        }
        let imageName = "flower" + String(numImage) + ".jpg"
        img.image = UIImage(named: imageName)
    }

    @IBAction func btnAfter(_ sender: UIButton) {
        numImage = numImage + 1
        if (numImage > maxImage) {
            numImage = 1
        }
        let imageName = "flower" + String(numImage) + ".jpg"
        img.image = UIImage(named: imageName)
    }
}

