//
//  ImaGestures.swift
//  Image Picker App
//
//  Created by DCS on 04/07/21.
//  Copyright © 2021 DCS. All rights reserved.
//

import UIKit

class ImaGestures: UIViewController {

    
    
    //    private let img_lbl : UILabel = {
    //        let img = UILabel()
    //        img.text = "Select Image:"
    //        img.textColor = .white
    //        img.textAlignment = .center
    //        img.shadowColor = .darkGray
    //        img.textColor = .black
    //        return img
    //
    //    }()
    
    private let myImageView:UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.image = UIImage(named: "add-image-2")
        imageView.frame = CGRect(x: 100, y: 200, width: 200, height: 200)
        return imageView
    }()
    
    private let imagePicker:UIImagePickerController = {
        let imagePicker = UIImagePickerController()
        imagePicker.allowsEditing = false
        return imagePicker
    }()
    
    //    private let myButton:UIButton = {
    //        let button = UIButton()
    //        button.setTitle("choes", for: .normal)
    //        button.addTarget(self, action: #selector(handleButtonClick), for: .touchUpInside)
    //        button.backgroundColor = .blue
    //        button.layer.cornerRadius = 6
    //        return button
    //    }()
    
    @objc func handleButtonClick(){
        
    }
    override func viewDidLoad() {
        
        self.view.backgroundColor = .white
        title = "ImaGestures"
        super.viewDidLoad()
        print("run")
        view.addSubview(myImageView)
        //view.addSubview(img_lbl)
        //view.addSubview(myButton)
        
        imagePicker.delegate = self
        let alert = UIAlertController(title: "ImaGestures", message: "Please Tap On (+) To Select an Image 😊😜😊", preferredStyle: UIAlertController.Style.alert)
        
        // add an action (button)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
        
        // show the alert
        self.present(alert, animated: true, completion: nil)
        
        
        
        let tapGesture =  UITapGestureRecognizer(target: self, action: #selector(didTapView))
        tapGesture.numberOfTapsRequired = 1
        tapGesture.numberOfTouchesRequired = 1
        view.addGestureRecognizer(tapGesture)
        
        
        let pinchGesture = UIPinchGestureRecognizer(target: self, action: #selector(didPinchView))
        view.addGestureRecognizer(pinchGesture)
        
        let rotationGesture = UIRotationGestureRecognizer(target: self, action: #selector(didRotateView))
        view.addGestureRecognizer(rotationGesture)
        
        let leftSwipe = UISwipeGestureRecognizer(target: self, action: #selector(didSwipeView))
        leftSwipe.direction = .left
        view.addGestureRecognizer(leftSwipe)
        
        let rightSwipe = UISwipeGestureRecognizer(target: self, action: #selector(didSwipeView))
        rightSwipe.direction = .right
        view.addGestureRecognizer(rightSwipe)
        
        let upSwipe = UISwipeGestureRecognizer(target: self, action: #selector(didSwipeView))
        upSwipe.direction = .up
        view.addGestureRecognizer(upSwipe)
        
        let downSwipe = UISwipeGestureRecognizer(target: self, action: #selector(didSwipeView))
        downSwipe.direction = .down
        view.addGestureRecognizer(downSwipe)
        
        let panGesture = UIPanGestureRecognizer(target: self, action: #selector(didPanView))
        view.addGestureRecognizer(panGesture)
    }
    
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        // img_lbl.frame = CGRect(x: 30, y: 160, width: view.width - 40, height: 40)
        //       myImageView.frame = CGRect(x: 100, y: 200, width: 200, height: 200)
        // myButton.frame = CGRect(x: 20, y: myImageView.bottom + 40, width: view.width - 40, height: 100)
    }
    
}

extension ImaGestures:UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    @objc private func didTapView(_ gesture:UITapGestureRecognizer){
        
        print("tapped at location: \(gesture.location(in: view))")
        print("gallery called")
        imagePicker.sourceType = .photoLibrary
        DispatchQueue.main.async {
            self.present(self.imagePicker, animated: true)
        }
    }
    
    @objc private func didPinchView(_ gesture:UIPinchGestureRecognizer){
        
        myImageView.transform = CGAffineTransform(scaleX: gesture.scale, y: gesture.scale)
    }
    
    
    @objc private func didRotateView(_ gesture:UIRotationGestureRecognizer){
        
        myImageView.transform = CGAffineTransform(rotationAngle: gesture.rotation)
    }
    
    
    @objc private func didSwipeView(_ gesture:UISwipeGestureRecognizer){
        
        if gesture.direction == .left{
            UIView.animate(withDuration: 0.2, animations: {
                self.myImageView.frame = CGRect(x: self.myImageView.frame.origin.x - 40, y: self.myImageView.frame.origin.y, width: 200, height: 200)
            })
            
        } else if gesture.direction == .right{
            UIView.animate(withDuration: 0.2, animations: {
                self.myImageView.frame = CGRect(x: self.myImageView.frame.origin.x + 40, y: self.myImageView.frame.origin.y, width: 200, height: 200)
            })
            
        } else if gesture.direction == .up {
            UIView.animate(withDuration: 0.2, animations: {
                self.myImageView.frame = CGRect(x: self.myImageView.frame.origin.x, y: self.myImageView.frame.origin.y - 40, width: 200, height: 200)
            })
        } else if gesture.direction == .down{
            UIView.animate(withDuration: 0.2, animations: {
                self.myImageView.frame = CGRect(x: self.myImageView.frame.origin.x, y: self.myImageView.frame.origin.y + 40, width: 200, height: 200)
            })
        } else {
            
            print("Direction Could not be detect")
        }
    }
    
    @objc private func didPanView(_ gesture:UIPanGestureRecognizer){
        
        let x = gesture.location(in: view).x
        let y = gesture.location(in: view).y
        
        myImageView.center = CGPoint(x: x, y: y )
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        if let selectedImage = info[.originalImage] as? UIImage {
            myImageView.image = selectedImage
        }
        
        picker.dismiss(animated: true)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true)
    }


}
