//
//  ViewController.swift
//  popover-ref-man
//
//  Created by Olha Pavliuk on 19.01.2022.
//

import UIKit
import SwiftUI

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .green
        
        let w = view.frame.width, h = view.frame.height
        let button = UIButton(frame: CGRect(x: w/4, y: h/2-25, width: w/2, height: 50))
        button.setTitle("Choose the pill", for: .normal)
        button.addTarget(self, action: #selector(chooseThePill), for: .touchUpInside)
        view.addSubview(button)
    }

    private var contextMenu: UIHostingController<SwiftUIView>?
    
    @objc func chooseThePill() {
        let menuView = SwiftUIView {
            self.contextMenu?.dismiss(animated: true, completion: {
                self.contextMenu?.removeFromParent()
            })
        }
        
        contextMenu = UIHostingController(rootView: menuView)
        contextMenu!.preferredContentSize = CGSize(width: 34*5 + 15, height: 34)
        contextMenu!.modalPresentationStyle = .popover
        
        if let popoverController = contextMenu!.popoverPresentationController {
            popoverController.permittedArrowDirections = .down
            popoverController.sourceRect = CGRect(x: 100, y: 100, width: 100, height: 50)
            popoverController.sourceView = self.view
            popoverController.backgroundColor = .cyan
            self.present(contextMenu!, animated: true, completion: nil)
        }
    }

}

