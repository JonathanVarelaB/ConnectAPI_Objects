

import Foundation

class User{
    var id: String
    var name: String
    var username: String
    var city: String
    var company: String
    var email: String
    var phone: String
    var website: String
    
    init(id: String, name: String, username: String, city: String, company: String, email: String, phone: String, website: String){
        self.id = id
        self.name = name
        self.username = username
        self.city = city
        self.company = company
        self.email = email
        self.phone = phone
        self.website = website
    }
    
}
