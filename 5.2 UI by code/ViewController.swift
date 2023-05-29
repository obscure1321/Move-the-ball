//
//  ViewController.swift
//  5.2 UI by code
//
//  Created by Miras Maratov on 13.05.2023.
//

import UIKit

class ViewController: UIViewController {
    // MARK: - property
    var mainButton = UIButton(frame: CGRect(x: 0, y: 0, width: 80, height: 80))
    var buttonUp = UIButton(frame: CGRect(x: 0, y: 0, width: 40, height: 40))
    var buttonDown = UIButton(frame: CGRect(x: 0, y: 0, width: 40, height: 40))
    var buttonRight = UIButton(frame: CGRect(x: 0, y: 0, width: 40, height: 40))
    var buttonLeft = UIButton(frame: CGRect(x: 0, y: 0, width: 40, height: 40))

    // MARK: - life cycle func
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
    }
}

// MARK: - flow funcs
private extension ViewController {
    
    @objc func  moveUp() {
        if mainButton.frame.origin.y >= 100 {
            self.mainButton.frame.origin.y -= 100
        }
    }
    
    @objc func  moveDown() {
        if mainButton.frame.origin.y <= buttonUp.frame.origin.y-180 {
            self.mainButton.frame.origin.y += 100
        }
    }
    
    @objc func  moveRight() {
        if mainButton.frame.origin.x <= view.frame.size.width-140 {
            self.mainButton.frame.origin.x += 100
        }
    }
    
    @objc func  moveLeft() {
        if mainButton.frame.origin.x >= 100 {
            self.mainButton.frame.origin.x -= 100
        }
    }
    
    func configureView(){
        
        mainButton.backgroundColor = .green
        self.view.addSubview(mainButton)
        mainButton.center = view.center
        mainButton.layer.cornerRadius = mainButton.frame.width / 2
        
        buttonUp.backgroundColor = .blue
        buttonUp.tintColor = .black
        buttonUp.setTitle("↑", for: .normal)
        self.view.addSubview(buttonUp)
        buttonUp.frame.origin.x = view.frame.midX - 20
        buttonUp.frame.origin.y = view.frame.size.height - buttonUp.frame.height * 3
        buttonUp.addTarget(self, action: #selector(moveUp), for: .touchUpInside)
        
        buttonDown.backgroundColor = .blue
        buttonDown.tintColor = .black
        buttonDown.setTitle("↓", for: .normal)
        self.view.addSubview(buttonDown)
        buttonDown.frame.origin.x = buttonUp.frame.origin.x
        buttonDown.frame.origin.y = view.frame.size.height - buttonUp.frame.height * 2 + 10
        buttonDown.addTarget(self, action: #selector(moveDown), for: .touchUpInside)
        
        buttonRight.backgroundColor = .blue
        buttonRight.tintColor = .black
        buttonRight.setTitle("→", for: .normal)
        self.view.addSubview(buttonRight)
        buttonRight.frame.origin.x = buttonUp.frame.origin.x + buttonUp.frame.width + 10
        buttonRight.frame.origin.y = buttonDown.frame.origin.y
        buttonRight.addTarget(self, action: #selector(moveRight), for: .touchUpInside)
        
        buttonLeft.backgroundColor = .blue
        buttonLeft.tintColor = .black
        buttonLeft.setTitle("←", for: .normal)
        self.view.addSubview(buttonLeft)
        buttonLeft.frame.origin.x = buttonUp.frame.origin.x - buttonUp.frame.width - 10
        buttonLeft.frame.origin.y = buttonDown.frame.origin.y
        buttonLeft.addTarget(self, action: #selector(moveLeft), for: .touchUpInside)

    }
}

