//
//  SecondViewController.swift
//  TableViewExperiments
//
//  Created by リヴォーフ　ユーリ on 2019/12/14.
//  Copyright © 2019 リヴォーフ　ユーリ. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    var getCell: Int = 0
    var vedgiName: String = ""
    
    @IBOutlet weak var localLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        print(getCell)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        print(vedgiName)
       localLabel.text = vedgiName
    }
}
