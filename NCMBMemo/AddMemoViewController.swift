//
//  AddMemoViewController.swift
//  NCMBMemo
//
//  Created by 加藤拓洋 on 2020/05/19.
//  Copyright © 2020 TakumiKato. All rights reserved.
//

import UIKit
import NCMB

class AddMemoViewController: UIViewController {
    
    @IBOutlet var memoTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        memoTextView.becomeFirstResponder()
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    @IBAction func save(){
        let object = NCMBObject(className: "Memo")
        object?.setObject(memoTextView.text, forKey: "memo")
        object?.saveInBackground({ (error) in
            if error != nil{
                print(error)
            }else{
                let alertController = UIAlertController(title: "保存完了", message: "メモの保存が完了しました", preferredStyle: .alert)
                let action = UIAlertAction(title: "OK", style: .default,handler:  { (action) in
                    self.navigationController?.popViewController(animated: true)
                })
                alertController.addAction(action)
                self.navigationController?.popViewController(animated: true)
            }
        })
    }

}
