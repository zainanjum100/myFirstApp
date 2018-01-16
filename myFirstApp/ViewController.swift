//
//  ViewController.swift
//  myFirstApp
//
//  Created by ZainAnjum on 11/01/2018.
//  Copyright © 2018 itEmpire. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIScrollViewDelegate {

    let namelabel : UILabel = {
        let label = UILabel()
        label.text = "nawe"
        label.textColor = .black
        label.textAlignment = .center
        label.font = UIFont(name: "raleway-light", size: 12)
        return label
    }()
    let blackButton : UIButton = {
       let button = UIButton.cicularButton()
        button.setTitle("black", for:.normal)
        button.addTarget(self, action: #selector(handelButton), for: .touchUpInside)
        return button
    }()
    let darkGreyButton : UIButton = {
        let button = UIButton.cicularButton()
        button.setTitle("Grey", for: .normal)
        button.backgroundColor = UIColor.darkGray
        return button
    }()
    
    let blackView : UIView = {
       let view = UIView()
        view.backgroundColor = UIColor.black
        return view
    }()
    let orangeView : UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.orange
        return view
    }()
    
    
   
    @objc func handelButton() {
        self.present(secondViewController(), animated: true, completion: nil)
    }
    
   func setupViews() {
        self.view.addSubview(blackView)
        blackView.addSubview(namelabel)
    
        self.view.addSubview(orangeView)
        orangeView.addSubview(blackButton)
        orangeView.addSubview(darkGreyButton)
        
        self.view.addConstrainWithFormat(format: "H:|-20-[v0]-20-|", views: blackView)
        self.view.addConstrainWithFormat(format: "H:|-20-[v0]-20-|", views: orangeView)
        self.view.addConstrainWithFormat(format: "V:|-50-[v0(60)]-10-[v1(60)]", views: blackView, orangeView)
        
        blackView.addConstrainWithFormat(format: "H:|-40-[v0]", views: namelabel)
        blackView.addConstrainWithFormat(format: "V:|-20-[v0]", views: namelabel)
        
        orangeView.addConstrainWithFormat(format: "H:|-40-[v0(60)]-20-[v1(60)]", views: blackButton, darkGreyButton)
        orangeView.addConstrainWithFormat(format: "V:|[v0(60)]", views: blackButton)
        orangeView.addConstrainWithFormat(format: "V:|[v0(60)]", views: darkGreyButton)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.view.backgroundColor = .white
        setupViews()
    }
    

}

extension UIView {
    func addConstrainWithFormat(format: String, views: UIView...)  {
        var viewsDictionary = [String: UIView]()
        for(index, view) in views.enumerated(){
            let key = "v\(index)"
            view.translatesAutoresizingMaskIntoConstraints = false
            viewsDictionary[key] = view
        }
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: format, options: NSLayoutFormatOptions(), metrics: nil, views: viewsDictionary))
    }
}
extension UIButton {
    class func cicularButton() -> UIButton {
        let button = UIButton(type: .system)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = UIColor.black
        button.layer.cornerRadius = 30
        return button
    }
}







