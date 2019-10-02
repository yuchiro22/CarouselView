//
//  ViewController.swift
//  ErecipeTopPage
//
//  Created by 辻 悠一郎 on 2019/09/30.
//  Copyright © 2019 辻 悠一郎. All rights reserved.
//

import UIKit

protocol MenuCarouselViewProtocol: AnyObject {
    
}

final class ViewController: UIViewController {
    
    var presenter: MenuCarouselViewPresenterProtocol!

    var menuCarouselView: MenuCarouselView!
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        menuCarouselView.scrollToFirstItem()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let width = self.view.frame.width
        let height = self.view.frame.height
        
        menuCarouselView = MenuCarouselView(frame: CGRect(x: 0, y:0, width: width, height: height))
        menuCarouselView.center = CGPoint(x: width/2, y: height/2)
        self.view.addSubview(menuCarouselView)
        
        presenter.viewDidLoad()
    }
}

extension ViewController: MenuCarouselViewProtocol {
    
}

