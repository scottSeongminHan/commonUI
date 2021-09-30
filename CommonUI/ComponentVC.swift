//
//  ComponentVC.swift
//  CommonUI
//
//  Created by sungals07 on 2021/09/30.
//

import UIKit

class ComponentVC: UIViewController {
    
    @IBOutlet weak var btnCustom: UIButton!
    
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

