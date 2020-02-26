//
//  ExpandViewController.swift
//  SlideshowApp
//
//  Created by asamuzak on 2020/02/27.
//  Copyright © 2020 asamuzak. All rights reserved.
//

import UIKit

class ExpandViewController: UIViewController {

    @IBOutlet weak var tapImageView: UIImageView!
    
    var image: UIImage?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let tapImage = image!
        tapImageView.image = tapImage
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
