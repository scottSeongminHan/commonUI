//
//  ViewController.swift
//  CommonUI
//
//  Created by sungals07 on 2021/09/28.
//

import UIKit

class ViewController: UIViewController {

    let items = ["component", "color"] // list of itmes
    
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        tableView.estimatedRowHeight = 55
        tableView.rowHeight = UITableView.automaticDimension

        tableView.register(UINib(nibName: "\(STableViewCell.self)", bundle: Bundle.main), forCellReuseIdentifier: "\(STableViewCell.self)")
        // register class방식은 xib가 load되기 전이라, 해당 outlet에 직접 값을 대입할 수 없다.
//        tableView.register(STableViewCell.self, forCellReuseIdentifier: "\(STableViewCell.self)")
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "componentVCSegue" {
            // do something...
        }
    }
    
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "\(STableViewCell.self)", for: indexPath) as! STableViewCell

        cell.lbTitle.text = items[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let row = indexPath.row
        
        if row == 0 {
            performSegue(withIdentifier: "componentVCSegue", sender: nil)
        }
    }
    
}
