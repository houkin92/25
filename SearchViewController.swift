//
//  SearchViewController.swift
//  微信
//
//  Created by 方瑾 on 2019/2/12.
//  Copyright © 2019 方瑾. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController {

    @IBOutlet weak var moving: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
       
        let tap = UITapGestureRecognizer(target: self, action: #selector(back))
        moving.addGestureRecognizer(tap)
        moving.isUserInteractionEnabled = true
        

        // Do any additional setup after loading the view.
    }
    @objc func back(_ sender: UITapGestureRecognizer) {
        self.dismiss(animated: true, completion: nil)
    }
    

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        //输入框和按键所在的View整体上移
        UIView.animate(withDuration: 1, animations:{
             self.moving.frame.origin.y -= 30  //Y轴向上移三十
//             self.moving.frame.size.width -= 30//宽减三十
        })
      
    }

}
