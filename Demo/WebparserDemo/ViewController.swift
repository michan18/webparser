//
//  ViewController.swift
//  WebparserDemo
//
//  Created by Cherian Danny Joseph on 21/01/19.
//  Copyright © 2019 Cherian Danny Joseph. All rights reserved.
//

import UIKit
import webparser

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let url = parser.init()
        
        //Provide URL to parse
        let url_string = URL(string: "https://www.news18.com/news/tennis/stefanos-tsitsipas-knocks-defending-champion-roger-federer-out-of-australian-open-2008223.html?ref=hp_top_pos_4")
        //Return Method: HTML or TEXT
        url.get_the_page_info(body_prase: ["article_body","content_2008223"], return_method: "HTML", url_string: url_string!, {(title, description, previewImage,body_div) -> Void in
            
            print(body_div["article_body"])
        }
            , failure: { (errorMessage) -> Void in
                print(errorMessage)
        })

        
        // Do any additional setup after loading the view, typically from a nib.
    }


}

