//
//  inputTextViewCell.swift
//  Notification
//
//  Created by USER on 2019/02/26.
//  Copyright © 2019 ZZL. All rights reserved.
//

import UIKit

var changeLabelText = NSNotification.Name(rawValue: "changeLabelText")


class inputTextViewCell: UITableViewCell {
    
    @IBOutlet weak var textView: UITextView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        textView.layer.borderWidth = 0.5
        textView.layer.borderColor = UIColor.black.cgColor
        textView.delegate = self
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

extension inputTextViewCell:UITextViewDelegate{
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        let text = textView.text!
        if text.count == 10{
            //发送通知
            NotificationCenter.default.post(name: changeLabelText, object: self)
            return false
        }
        return true
    }
}
