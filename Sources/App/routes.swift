import Vapor

/// Register your application's routes here.
public func routes(_ router: Router) throws {

    let userController = UserController()
    router.get("users", use: userController.list)
    router.post("users", use: userController.create)
}


/*func callWebService() {
    // Show MBProgressHUD Here
    var config                              :URLSessionConfiguration!
    var urlSession                          :URLSession!
    config = URLSessionConfiguration.default
    urlSession = URLSession(configuration: config)
    // MARK:- HeaderField
    let HTTPHeaderField_ContentType         = "Content-Type"

    // MARK:- ContentType
    let ContentType_ApplicationJson         = "application/json"

    //MARK: HTTPMethod
    let HTTPMethod_Get                      = "GET"

    let callURL = URL.init(string: "https://itunes.apple.com/in/rss/newapplications/limit=10/json")

    var request = URLRequest.init(url: callURL!)

    request.timeoutInterval = 60.0 // TimeoutInterval in Second
    request.cachePolicy = URLRequest.CachePolicy.reloadIgnoringLocalCacheData
    request.addValue(ContentType_ApplicationJson, forHTTPHeaderField: HTTPHeaderField_ContentType)
    request.httpMethod = HTTPMethod_Get

    let dataTask = urlSession.dataTask(with: request) { (data,response,error) in
        if error != nil{
            return
        }
        do {
            let resultJson = try JSONSerialization.jsonObject(with: data!, options: []) as? [String:AnyObject]
            print("Result",resultJson!)
        } catch {
            print("Error -> \(error)")
        }
    }
    dataTask.resume()
}
 */
