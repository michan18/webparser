# webparser
A web parser for iOS to parser a particular html tag by id or class elements

Webparser is now available for CocoaPods! Simply include 'webparser' in your podfile.

## How to use WebParsing

Suppose, we have a file like the following as HTML tag
```HTML
 <div id="page" class="configurable story " data-story-id="world-europe-46955006">      
   <div role="main"> 
     <div class="container-width-only">
     </div>
   </div
 </div>
 ```
 you can parse the page by either the id or class parameter
 
```swift
  import webparser
   
  let url = parser.init()
   
  url.get_the_page_info(body_prase: ["page","container-width-only"], return_method: "HTML", url_string: url_string!,      {(title, description, previewImage,body_div) -> Void in
            
            print(body_div["article_body"])
        }
            , failure: { (errorMessage) -> Void in
                print(errorMessage)
        })
 ```
 
## Steps & functions

Initialise  parser.init()

Now you can use the function

```swift 
get_the_page_info(body_prase:[String],return_method:String,url_string:URL,_ completion: @escaping ((_ title: String?, _ description: String?, _ previewImage: String?,_ body_div:[String:[String]] ) -> Void), failure: @escaping ((_ errorMessage: String) -> Void))
```
Input parameters: 
  1) body_prase --> String Array eg) ["page","container-width-only"]
  2)return_method ---> String which will accepet either "HTML" or "TEXT
  3)url_string ---> URL datatype
 
Output Parameter:
 1) title: String?, --> will return Titte of the page
 2) description: String?,--> will return Description of the page 
 3) previewImage:: String? will return preview image of the page just like seen in facebook  
 4) body_div:[String:[String]] --> which will parse the url will return a array dictionary with key ad Input parameter given     in body_prase


