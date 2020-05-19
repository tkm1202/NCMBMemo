//
//  DetailViewController.swift
//  NCMBMemo
//
//  Created by 加藤拓洋 on 2020/05/19.
//  Copyright © 2020 TakumiKato. All rights reserved.
//

import UIKit
import NCMB
import CDAlertView

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
                let alert = CDAlertView(title: "Awesome Title", message: "Are you in?!", type: .notification)
                let doneAction = CDAlertViewAction(title: "Sure! 💪")
                alert.add(action: doneAction)
                alert.show()
            }else{
                self.navigationController?.popViewController(animated: true)
            }
        }
    }
    
    @IBAction func delete(){
        selectedMemo.deleteInBackground { (error) in
            if error != nil{
                let alert = CDAlertView(title: "Awesome Title", message: "Are you in?!", type: .notification)
                let doneAction = CDAlertViewAction(title: "Sure! 💪")
                alert.add(action: doneAction)
                alert.show()
            }else{
                let alert = CDAlertView(title: "Awesome Title", message: "Are you in?!", type: .notification)
                let doneAction = CDAlertViewAction(title: "Sure! 💪")
                alert.add(action: doneAction)
                let nevermindAction = CDAlertViewAction(title: "Nevermind 😑")
                alert.add(action: nevermindAction)
                alert.show()
                self.navigationController?.popViewController(animated: true)
            }
        }
    }
}
