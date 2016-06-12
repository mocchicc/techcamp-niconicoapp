//
//  ViewController.swift
//  TechCamp-NicoNicoApp
//
//  Created by mocchicc on 2016/06/12.
//  Copyright © 2016年 mocchicc. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var commentTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        commentTextField.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func makeCommentLabel() -> UILabel {
        let label = UILabel()
        
        //commentTextFieldの内容を取得
        label.text = commentTextField.text
        
        label.frame.origin = CGPoint(x: 130, y: 200)
        label.font = UIFont(name: "HirakakuProN-W6", size:20)
        
        //サイズの設定は、テキスト内容を決めてから記述する
        label.sizeToFit()
        return label
    }

    @IBAction func tapSubmitButton(sender: UIButton) {
        commentTextField.resignFirstResponder()
        let commentLabel = makeCommentLabel()
        
        //生成したLabelをViewControllerに表示
        self.view.addSubview(commentLabel)
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        commentTextField.resignFirstResponder()
        return true
    }

}

