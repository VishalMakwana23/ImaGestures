//
//  ViewController.swift
//  Image Picker App
//
//  Created by DCS on 01/07/21.
//  Copyright © 2021 DCS. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    private let imageGestures : UIImageView = {
        let gender = UIImageView()
        gender.contentMode = .scaleAspectFit
        gender.image = UIImage(named: "touch-screen")
        return gender
    }()
    
    
    private let Continue_btn : UIButton = {
        let con = UIButton()
        con.setTitle("Continue", for: .normal)
        con.addTarget(self, action: #selector(goto), for: .touchUpInside)
        con.backgroundColor = .gray
        con.setTitleColor(.white, for: .normal)
        con.layer.cornerRadius = 25
        return con
    } ()
    
    @objc func goto()
    {
        let ig = ImaGestures() //change it
        navigationController?.pushViewController(ig, animated: true)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(imageGestures)
        view.addSubview(Continue_btn)
        title = "Home"
        self.view.backgroundColor = .brown
        
        
        let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
        backgroundImage.image = UIImage(named: "bg1.jpg")
        backgroundImage.contentMode =  UIView.ContentMode.scaleAspectFill
        self.view.insertSubview(backgroundImage, at: 0)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        imageGestures.frame = CGRect(x: 20, y: 230, width: view.width - 40, height: 120)
        Continue_btn.frame = CGRect(x: 20, y: imageGestures.bottom + 50, width: view.width - 40, height: 40)
    }


}
