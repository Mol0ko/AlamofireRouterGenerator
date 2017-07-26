# AlamofireRouterGenerator

MacOS app for generating Swift 3 enum of NetworkRouter from Postman json collection. Enum corresponds to URLRequestConvertible protocol declared in Alamofire https://github.com/Alamofire/Alamofire.


Installation
------------

Go to [releases](https://github.com/Mol0ko/AlamofireRouterGenerator/releases) tab, download [.zip file](https://github.com/Mol0ko/AlamofireRouterGenerator/files/1175668/AlamofireRouterGenerator.zip)

Usage
-----

Paste your Postman Collection v2 to the left text field and generate you Alamofire Network Router.

Addition
--------

Avoid non ASCII symbols and duplicated names in your Postman Collection requests and folders.

All URLRequests in generated enum have application/json content-type and have no another headers by default.
