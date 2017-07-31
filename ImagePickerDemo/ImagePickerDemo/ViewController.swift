//
//  ViewController.swift
//  ImagePickerDemo
//
//  Created by Akhilesh Gandotra on 17/01/17.
//  Copyright © 2017 Akhilesh Gandotra. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var changeImageBtn: ImagePickerButton!
    @IBOutlet weak var imageView: UIImageView!
    
    
    
    //MARK: Usage of picker button
    override func viewDidLoad() {
        super.viewDidLoad()
        self.changeImageBtn.imageCallBack = { [weak self] (result) in
            switch result {
            case .success(let filePath):
               self?.imageView.image = UIImage(contentsOfFile: filePath)
            case .error(let error):
                print(error.localizedDescription)
                self?.showAlertWith(message: error.localizedDescription)
            }
        }
    }
}

