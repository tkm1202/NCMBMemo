//
//  DetailViewController.swift
//  NCMBMemo
//
//  Created by 加藤拓洋 on 2020/05/19.
//  Copyright © 2020 TakumiKato. All rights reserved.
//

import UIKit
import NCMB

class DetailViewController: UIViewController {
    var selectedMemo: NCMBObject!
    @IBOutlet var memoTextView: UITextView!

    override func viewDidLoad() {
        super.viewDidLoad()

        memoTextView.text = selectedMemo.object(forKey: "memo") as! String
    }
    

    @IBAction func update(){
        selectedMemo.setObject(memoTextView.text, forKey: "memo")
        selectedMemo.saveInBackground { (error) in
            if error != nil{
                print(error)
            }else{
                self.navigationController?.popViewController(animated: true)
            }
        }
    }
}
