//
//  ComponentVC.swift
//  CommonUI
//
//  Created by sungals07 on 2021/09/30.
//

import UIKit

class ComponentVC: UIViewController {
    
    @IBOutlet weak var btnCustom: UIButton!
    
    @IBOutlet weak var btnTest: UIButton!
    
    
    @IBAction func touchTextBtn(_ sender: Any) {
        btnTest.isSelected = !btnTest.isSelected
        if #available (iOS 15.0, *) {
//            btnTest.backgroundColor = .white
//            btnTest.configuration = .plain()
            var config = btnTest.configuration
//            config?.baseForegroundColor = .white
            if btnTest.isSelected {
//                config?.baseBackgroundColor = UIColor (red: 52.0/255.0, green: 190.0/255.0, blue: 190.0/255.0, alpha: 1.0)
                config?.background.backgroundColor = UIColor (red: 52.0/255.0, green: 190.0/255.0, blue: 190.0/255.0, alpha: 1.0)
            } else {
//                config?.baseBackgroundColor = UIColor (red: 52.0/255.0, green: 190.0/255.0, blue: 190.0/255.0, alpha: 0.3)
                config?.background.backgroundColor = UIColor (red: 52.0/255.0, green: 190.0/255.0, blue: 190.0/255.0, alpha: 0.3)
            }
            btnTest.configuration = config
            
        }
        
    }
    
    @IBAction func touchBtn(_ sender: Any) {
        let button = sender as! UIButton
        button.isSelected = !button.isSelected
        if #available(iOS 15.0, *) {
            button.configurationUpdateHandler = { button in
                var config = button.configuration

                if button.state == .normal {
                    config?.image = UIImage(named: "commonCheckNone")!

                } else if button.state == .selected {
                    config?.image = UIImage(named: "commonCheckSelect")!
                    config?.baseBackgroundColor = .clear
                }
                else if button.state == .disabled {
                    if true {
                        config?.image = UIImage(named: "commonCheckDisable")!
                    } else {
                        config?.image = UIImage(named: "commonCheckDone")!
                    }
                }
                button.configuration = config
            }
        }
        else {
            if button.state == .normal {
                button.setImage(UIImage(named: "commonCheckNone")!, for: .normal)
            } else if button.state == .selected {
                button.setImage(UIImage(named: "commonCheckSelect")!, for: .selected)
            }
            else if button.state == .disabled {
                if true {
                    button.setImage(UIImage(named: "commonCheckDisable")!, for: .disabled)
                } else {
                    button.setImage(UIImage(named: "commonCheckDone")!, for: .disabled)
                }
            }
        }
    }
}

