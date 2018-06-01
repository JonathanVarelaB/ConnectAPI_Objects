import Foundation
import SwiftyJSON

class AdministradorConexiones: NSObject {
    
    let baseURL = "https://jsonplaceholder.typicode.com"
    static let sharedInstance = AdministradorConexiones()
    static var getPostsEndpoint = ""
    
    func getPostWithId(postId: Int, onSuccess: @escaping(JSON) -> Void, onFailure: @escaping(Error) -> Void){
        let url : String = baseURL + AdministradorConexiones.getPostsEndpoint +  String(postId)
        let request: NSMutableURLRequest = NSMutableURLRequest(url: NSURL(string: url)! as URL)
        request.httpMethod = "GET"
        let session = URLSession.shared
        let task = session.dataTask(with: request as URLRequest, completionHandler: {data, response, error -> Void in
            do {
                let result = try JSON(data: data!)
                onSuccess(result)
            }
            catch {
                onFailure(error)
            }
        })
        task.resume()
    }
}

