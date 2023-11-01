//
//  ViewController.swift
//  SlideshowApp
//
//  Created by 杉原俊一郎 on 2023/10/17.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var backward: UIButton!
    
    
    @IBOutlet weak var forward: UIButton!
    
  
    
    
    @IBAction func tapAction(_ sender: Any) {
        // セグエを使用して画面を遷移
        performSegue(withIdentifier: "result", sender: nil)
        
    }
    
    
    @IBOutlet weak var playstopbutton: UIButton!
    
    
    
    
    @IBOutlet weak var seabass: UIImageView!
    let imageName = ["seabass","warasa","swordfish"]
    var changeImageNo = 0
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // segueから遷移先のResultViewControllerを取得する
        let ZoomingViewController: ZoomingViewController = segue.destination as! ZoomingViewController
        
        ZoomingViewController.Largerimages = seabass.image
        }
    
    @objc  func tapped(_ sender : UITapGestureRecognizer) {

    }
    
    
    //戻るボタン
    @IBAction func backward(_ sender: Any) {
        if changeImageNo == 0 {
            changeImageNo = 2
        } else if changeImageNo == 1 {
            changeImageNo = 0
        } else if changeImageNo == 2 {
            changeImageNo = 1
        }
        let name = imageName[changeImageNo]
        seabass.image = UIImage(named: name)
    }
    
    //進むボタン
    @IBAction func forward(_ sender: Any) {

        if changeImageNo == 0 {
            changeImageNo = 1
        } else if changeImageNo == 1 {
            changeImageNo = 2
        } else if changeImageNo == 2 {
            changeImageNo = 0
        }
        let name = imageName[changeImageNo]
        seabass.image = UIImage(named: name)
    }
    //zooming View Controllerから戻るボタン
    @IBAction func unwind(_ segue: UIStoryboardSegue) {
    }
    
    
    // 配列に指定するindex番号を宣言
    var nowIndex:Int = 0
    
    // スライドショーに使用するタイマーを宣言
    var timer: Timer!
    
    // スライドショーさせる画像の配列を宣言
    var imageArray:[UIImage] = [
        UIImage(named: "seabass")!,
        UIImage(named: "warasa")!,
        UIImage(named: "swordfish")!
    ]
    
 
    @IBAction func playStop(_ sender: Any) {
        // 再生中か停止しているかを判定
        if (timer == nil) {
            // 再生時の処理を実装
            // タイマーをセットする
            timer = Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(changeImage), userInfo: nil, repeats: true)
            
            //ボタンの表示を停止にする
            playstopbutton.setTitle("停止", for: .normal)
            
            forward.isEnabled = false
            backward.isEnabled = false
            
            
        } else {
            // 停止時の処理を実装
            // タイマーを停止する
            timer.invalidate()
            
            // タイマーを削除しておく(timer.invalidateだけだとtimerがnilにならないため)
            timer = nil
            //ボタンの名前を直す
            playstopbutton.setTitle("再生", for: .normal)
            
            forward.isEnabled = true
            backward.isEnabled = true
            
           
        }
    }
    @objc func changeImage() {
        if changeImageNo == 0 {
            changeImageNo = 1
        } else if changeImageNo == 1 {
            changeImageNo = 2
        } else if changeImageNo == 2 {
            changeImageNo = 0
        }
        let name = imageName[changeImageNo]
        seabass.image = UIImage(named: name)
    }
    
}



