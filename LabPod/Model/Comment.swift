
import Foundation

class Comment{
    var id: String
    var name: String
    var email: String
    var body: String
    
    init(id: String, name: String, body: String, email: String){
        self.id = id
        self.name = name
        self.body = body
        self.email = email
    }
}
