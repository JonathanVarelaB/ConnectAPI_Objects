import UIKit
import SVProgressHUD
import SwiftyJSON

class CommentsController: UIViewController {
    
    @IBOutlet weak var labelComentario: UILabel!
    @IBOutlet weak var idText: UILabel!
    @IBOutlet weak var nombreText: UILabel!
    @IBOutlet weak var emailText: UILabel!
    @IBOutlet weak var cuerpoText: UILabel!
    var comment: Comment? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.labelComentario.layer.borderWidth = 1
        self.labelComentario.layer.borderColor = UIColor.black.cgColor
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func consultarComment(_ sender: UIButton) {
        SVProgressHUD.show(withStatus: "Cargando")
        AdministradorConexiones.getPostsEndpoint = "/comments/"
        AdministradorConexiones.sharedInstance.getPostWithId( postId: 1, onSuccess: { json in
            DispatchQueue.main.async {
                self.comment = Comment(id: json["id"].stringValue,
                                       name: json["name"].stringValue,
                                       body: json["body"].stringValue,
                                       email: json["email"].stringValue)
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
        self.idText.text = self.comment?.id
        self.nombreText.text = self.comment?.name
        self.emailText.text = self.comment?.email
        self.cuerpoText.text = self.comment?.body
    }
    
}
