//
//  ViewController.swift
//  Snapchat
//
//  Created by Mac 12 on 26/05/22.
//copiaaaa

import UIKit
import FirebaseCore
import FirebaseAuth
import FacebookLogin

class iniciarSesionViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    @IBAction func iniciarSesionTapped(_ sender: Any){
        Auth.auth().signIn(withEmail: emailTextField.text!, password: passwordTextField.text!) { (user, error) in print("INTENTANDO INICIAR SESION")
            if error != nil{
                print("Se presentò el siguiente error: \(error)")
            }else{
                print("Inicio de sesion exitoso")
            }
        }
    }
    @IBAction func BotonISFacebook(_ sender: Any) {
        let loginManager = LoginManager()
                loginManager.logIn(permissions: ["publicprofile","email"], viewController: self) { (result) in
                    switch result {
                    case .success(granted: let granted, declined: let declined, token: let token):
                        let credential = FacebookAuthProvider.credential(withAccessToken: token?.tokenString ??withAccessToken: <#String#>)

                        Auth.auth().signIn(with: credential) { (result, error) in
                            print("Iniciando sesion con Facebook...")
                            if error != nil{
                                print("Se presento el siguiente error (error)")
                            }else{
                                print("Se inicio sesion con Facebook!!")
                            }
                        }
                    case .cancelled:
                        break
                    case .failed():
                        break
                    }
                }
            }
    }
