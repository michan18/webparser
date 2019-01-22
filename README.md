# webparser
A web parser for iOS to parser a particular html tag by id or class elements

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
 
For that first import the module
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
