//
//  webparser.swift
//  webparser
//
//  Created by Cherian Danny Joseph on 21/01/19.
//  Copyright © 2019 Cherian Danny Joseph. All rights reserved.
//

import Foundation
import Kanna



public class parser
{
    enum parser_condition {
        case text
        case html
    }
    // To check whethere opreation queue is in progress or not
    
    public init(){}
    // Getting the page HTML info of Title Discription & Preview_Image
    public func get_the_page_info(body_prase:[String],return_method:String,url_string:URL,_ completion: @escaping ((_ title: String?, _ description: String?, _ previewImage: String?,_ body_div:[String:[String]] ) -> Void), failure: @escaping ((_ errorMessage: String) -> Void))
    {
        let url_request = NSMutableURLRequest.init(url: url_string)
        
        var return_meth = parser_condition.text
        let useragent =  "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2227.1 Safari/537.36"
        
        //select the return method from enum
        if return_method == "HTML"
        {
            return_meth = parser_condition.html
        }
        
        url_request.setValue(useragent, forHTTPHeaderField: "User-Agent")
        
        //cancel out all current queue opreation
        //QueueinProgress.queue_opreation.cancelAllOperations()
        
        let session = URLSession.shared
        
        //IOS 9+ above methos
        session.dataTask(with: url_request as URLRequest) { (data: Data?, response:URLResponse?, error: Error?) in
            if error != nil {
                DispatchQueue.main.async(execute: {
                    failure("Url receive no response")
                })
                return
            }
            
            if let urlResponse = response as? HTTPURLResponse {
                if urlResponse.statusCode >= 200 && urlResponse.statusCode < 400 {
                    if let data = data {
                        
                        if let doc = try? Kanna.HTML(html: data, encoding: String.Encoding.utf8) {
                            let title = doc.title
                            var description: String? = nil
                            var previewImage: String? = nil
                            var body_div:[String:[String]] = [:]
                            if let nodes = doc.head?.xpath("//meta").enumerated() {
                                for node in nodes {
                                    //print(node.element["property"])
                                    if node.element["property"]?.contains("description") == true ||
                                        node.element["name"] == "description" {
                                        description = node.element["content"]
                                    }
                                    
                                    if node.element["property"]?.contains("image") == true &&
                                        node.element["content"]?.contains("http") == true {
                                        previewImage = node.element["content"]
                                    }
                                }
                            }
                            
                            for element in body_prase
                            {
                                
                                var contents = [String]()
                                switch return_meth {
                                case .text:
                                    for sec in doc.xpath("//*[@id='"+element+"'] | //*[@class='"+element+"']")
                                    {
                                        contents.append(sec.text!)
                                    }
                                    break
                                case .html:
                                    for sec in doc.xpath("//*[@id='"+element+"'] | //*[@class='"+element+"']")
                                    {
                                        contents.append(sec.toHTML!)
                                    }
                                    break
                                }
                                
                                body_div[element] = contents
                            }
                            
                            
                            DispatchQueue.main.async(execute: {
                                completion(title, description, previewImage,body_div )
                            })
                        }
                        
                    }
                } else {
                    DispatchQueue.main.async(execute: {
                        failure("Url received \(urlResponse.statusCode) response")
                    })
                    return
                }
            }
            
            
            }.resume()
    }
        
 
}
