//
//  ZoomingViewController.swift
//  SlideshowApp
//
//  Created by 杉原俊一郎 on 2023/10/17.
//

import UIKit

class ZoomingViewController: UIViewController {
    
    @IBOutlet weak var largerimages: UIImageView!
    

    var Largerimages: UIImage!
    
    
    @IBAction func zoom(_ sender: Any) {
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        largerimages.image = Largerimages
  
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
