//
//  ListViewViewController.swift
//  NCMBMemo
//
//  Created by 加藤拓洋 on 2020/05/19.
//  Copyright © 2020 TakumiKato. All rights reserved.
//

import UIKit
import NCMB

class ListViewViewController: UIViewController,UITableViewDataSource,UITableViewDelegate{
    @IBOutlet var memoTableView: UITableView!
    
    var memoArray = [NCMBObject]()

    override func viewDidLoad() {
        super.viewDidLoad()
        memoTableView.delegate = self
        memoTableView.dataSource = self
        memoTableView.tableFooterView = UIView()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        loadData()
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return memoArray.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell")!
        cell.textLabel?.text = memoArray[indexPath.row].object(forKey: "memo") as? String
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: "toDetail", sender: nil)
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //次の画面の取得(Detail)
        if segue.identifier == "toDetail"{
        let detailViewController = segue.destination as! DetailViewController
            let selectedIndex = memoTableView.indexPathForSelectedRow!
            detailViewController.selectedMemo = memoArray[selectedIndex.row]
            
        }
    }
    
    func loadData(){
        let query = NCMBQuery(className: "Memo")
               query?.findObjectsInBackground({ (result, error) in
                   if error != nil{
                       print("erroe")
                   }else{
                       self.memoArray = result as! [NCMBObject]
                       self.memoTableView.reloadData()
                   }
               })
    }
}
