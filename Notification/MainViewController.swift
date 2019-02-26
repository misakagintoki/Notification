//
//  MainViewController.swift
//  Notification
//
//  Created by USER on 2019/02/26.
//  Copyright © 2019 ZZL. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    
    @IBOutlet weak var label: UILabel!
    
    @IBOutlet weak var inputTableView: UITableView!
    
    var array = ["hdfhadhfkjhjkfhkahkfhkaldlkfhfaksdfhkadfklldfkjladsjfjasdl;fjlamfl;nvnkjdfo;jldflsjdfl;dl",
                 "aklsndfklngknkgnkajflkaldnrfkwenf;lknl;fdnlajelrjelfm;dmf;lmdl;f",
                 "hdfhadhfkjhjkfhkahkfhkaldlkfhfaksdfhkadfklldfkjladsjfjasdl;fjlamfl;nvnkjdfo;jldflsjdfl;dl",
                 "hdfhadhfkjhjkfhkahkfhkaldlkfhfaksdfhkadfklldfkjladsjfjasdl;fjlamfl;nvnkjdfo;jldflsjdfl;dl",
                 "hdfhadhfkjhjkfhkahkfhkaldlkfhfaksdfhkadfklldfkjladsjfjasdl;fjlamfl;nvnkjdfo;jldflsjdfl;dl",
                 "hdfhadhfkjhjkfhkahkfhkaldlkfhfaksdfhkadfklldfkjladsjfjasdl;fjlamfl;nvnkjdfo;jldflsjdfl;dl"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        label.text = "请继续输入"
        
        inputTableView.delegate = self
        inputTableView.dataSource = self
        
        NotificationCenter.default.addObserver(self, selector: #selector(changeLabel), name: changeLabelText, object: nil)
    }
    
    //析构函数，类死亡的时候会运行里面的代码
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    
    @objc func changeLabel(){
        label.text = "不能再输入了。"
    }
    
    
}

extension MainViewController:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1 + array.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0{
            let cell = tableView.dequeueReusableCell(withIdentifier: "InputCell", for: indexPath) as! inputTextViewCell
            //        cell.textView.delegate = self
            return cell
        }else{
            let cell = UITableViewCell()
            cell.textLabel?.text = "\(array[indexPath.row - 1])"
            cell.textLabel?.numberOfLines = 0
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 10
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0{
            return 80
        }else{
            return UITableView.automaticDimension//根据输入框的文字，自动调整cell的高度
        }
    }
}
//
//extension inputTextViewCell:UITextViewDelegate{
//    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
//        let text = textView.text!
//        if text.count == 10{
//            return false
//        }
//        return true
//    }
//}
