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
        
        //生成した乱数を余りを求める「%」と組み合わせて乱数の範囲を決定
        //arc4random()をCGFloat型にキャスト
        // → UInt32型の数値は、小数値であるCGFloat型の数値と計算することはできない
        let randY = CGFloat(arc4random()) % (self.view.frame.height - 64) + 64
        label.frame.origin = CGPoint(x: self.view.frame.width, y: randY)
        
        //フォントサイズを20px~40pxの間でランダムな値を指定
        label.font = UIFont(name: "HirakakuProN-W6", size: CGFloat(arc4random() % 21 + 20))
        
        //サイズの設定は、テキスト内容を決めてから記述する
        label.sizeToFit()
        return label
    }

    @IBAction func tapSubmitButton(sender: UIButton) {
        commentTextField.resignFirstResponder()
        let commentLabel = makeCommentLabel()
        
        //生成したLabelをViewControllerに表示
        self.view.addSubview(commentLabel)
        
        NSTimer.scheduledTimerWithTimeInterval(0.1, target: self, selector: #selector(ViewController.moveComment(_:)), userInfo: commentLabel, repeats: true)
    }

    func moveComment(sender: NSTimer) {
        let commentLabel = sender.userInfo as! UILabel
        //userInfoに指定したcommentLabelはmoveCommet()メソッドの引数であるsenderから取得している
        //commetLabelのx座標はframe.origin.xで取得
        commentLabel.frame.origin.x -= commentLabel.frame.height
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        commentTextField.resignFirstResponder()
        return true
    }

}

