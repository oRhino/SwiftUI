//
//  ViewController.swift
//  One
//
//  Created by cyzone on 2020/7/30.
//

import UIKit
import SwiftUI


class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let label = UILabel(frame: CGRect(x: 100, y: 200, width: 200, height: 40))
        label.textColor = UIColor.black
        label.font = UIFont.boldSystemFont(ofSize: 14)
        label.text = "Hello world"
        view.addSubview(label)
        
        
        let btn = UIButton(frame: CGRect(x: 100, y: 260, width: 200, height: 40))
        btn.backgroundColor = .blue
        btn.addTarget(self, action: #selector(testAction), for: .touchUpInside)
        btn.setTitle("Go", for: .normal)
        view.addSubview(btn)
    }
    
    @objc func testAction(){
        
       let host =  UIHostingController(rootView: ButtonTest())
    
        self.navigationController?.pushViewController(host, animated: true)
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
