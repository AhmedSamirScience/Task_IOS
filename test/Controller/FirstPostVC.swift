//
//  ViewController.swift
//  test
//
//  Created by ahmed samir on 06/01/2024.
//

import UIKit

class FirstPostVC: UIViewController {

    var firstPost:Post?
    
    //MARK: - Outlet
    
    @IBOutlet weak var titleLBL: UILabel!
    
    @IBOutlet weak var titleDetailsLBL: UILabel!
    
    @IBOutlet weak var bodyLBL: UILabel!
    
    @IBOutlet weak var postLBL: UILabel!
    
    @IBOutlet weak var allPostsBTN: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        getPost()
       
    }

    
    //MARK: - Helper Funcation
    
    func getPost(){
        

        NetworkManager.shared.fetchData(from: Constants.postUrl) { (result: Result<Post, NetworkError>) in
            switch result {
            case .success(let post):
                // Handle the decoded data
          
                self.firstPost = post
                
                DispatchQueue.main.async {
                        
                    self.titleDetailsLBL.text = self.firstPost?.body
                    self.postLBL.text = self.firstPost?.title
          
                }
            case .failure(let error):
                // Handle the error
                print("Error: \(error)")
            }
        }
    }
 
    func setupUI(){
        allPostsBTN.layer.cornerRadius = 10
        
    }
    
    //MARK: - IBAction
    
    @IBAction func goingToAllPosts(_ sender: UIButton) {
        if let seePosts = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "AllPostsVC") as? AllPostsVC {
          
            seePosts.modalPresentationStyle = .fullScreen
            self.present(seePosts, animated: true, completion: nil)
        }
    }
    
}

