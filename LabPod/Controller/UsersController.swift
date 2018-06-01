import UIKit
import SVProgressHUD
import SwiftyJSON

class UsersController: UIViewController {
    
    @IBOutlet weak var usuarioLabel: UILabel!
    @IBOutlet weak var idText: UILabel!
    @IBOutlet weak var nameText: UILabel!
    @IBOutlet weak var usernameText: UILabel!
    @IBOutlet weak var cityText: UILabel!
    @IBOutlet weak var companyText: UILabel!
    @IBOutlet weak var emailText: UILabel!
    @IBOutlet weak var telefonoText: UILabel!
    @IBOutlet weak var websiteText: UILabel!
    var user : User? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.usuarioLabel.layer.borderWidth = 1
        self.usuarioLabel.layer.borderColor = UIColor.black.cgColor
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func consultarUsers(_ sender: UIButton) {
        SVProgressHUD.show(withStatus: "Cargando")
        AdministradorConexiones.getPostsEndpoint = "/users/"
        AdministradorConexiones.sharedInstance.getPostWithId( postId: 1, onSuccess: { json in
            DispatchQueue.main.async {
                self.user = User(id: json["id"].stringValue,
                                name: json["name"].stringValue,
                                username: json["username"].stringValue,
                                city: json["address"]["city"].stringValue,
                                company: json["company"]["name"].stringValue,
                                email: json["email"].stringValue,
                                phone: json["phone"].stringValue,
                                website: json["website"].stringValue)
                self.presentarInformacion()
                SVProgressHUD.dismiss()
            }
        }, onFailure: { error in
            SVProgressHUD.dismiss()
            let alert = UIAlertController(title: "Error", message: error.localizedDescription, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Aceptar", style: .default, handler: nil))
            self.show(alert, sender: nil)
        })
    }
    
    func presentarInformacion(){
        self.idText.text = self.user?.id
        self.nameText.text = self.user?.name
        self.usernameText.text = self.user?.username
        self.cityText.text = self.user?.city
        self.companyText.text = self.user?.company
        self.emailText.text = self.user?.email
        self.telefonoText.text = self.user?.phone
        self.websiteText.text = self.user?.website
    }
    
}
