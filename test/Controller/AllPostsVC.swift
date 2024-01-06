//
//  AllPostsVC.swift
//  test
//
//  Created by ahmed samir on 06/01/2024.
//

import UIKit

class AllPostsVC: UIViewController {

    @IBOutlet weak var backBTN: UIButton!
    @IBOutlet weak var postsTV: UITableView!
    
    var posts: [Post] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTV()
        getPosts()
    }
    
    func getPosts(){
        
        NetworkManager.shared.fetchData(from: Constants.postsUrl) { (result: Result<[Post], NetworkError>) in
                   switch result {
                   case .success(let receivedPosts):
                       // Update UI on the main thread
                       self.posts = receivedPosts
                       
                       DispatchQueue.main.async {
                           
                           self.postsTV.reloadData()
                          
                       }
                   case .failure(let error):
                       // Handle the error
                       print("Error: \(error)")
                   }
               }
    }
    
    func setupTV(){
      
   
        postsTV.register(UINib(nibName: "PostTableViewCell", bundle: nil), forCellReuseIdentifier: "PostTableViewCell")
        postsTV.estimatedRowHeight = 100
            postsTV.rowHeight = UITableView.automaticDimension
    }
    
    //MARK: - IBAction
    
    @IBAction func goBackBTN(_ sender: UIButton) {
        self.dismiss(animated: true)
        
    }
    
 

}
extension AllPostsVC:UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      
        let cell = tableView.dequeueReusableCell(withIdentifier: "PostTableViewCell", for: indexPath) as! PostTableViewCell
          
        
 
        
        cell.titlePostLBL?.text = posts[indexPath.row].title
        cell.bodyPostLBL?.text = posts[indexPath.row].body
 
       cell.idLBL?.text = "\(posts[indexPath.row].id)"


        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
     return UITableView.automaticDimension
       
     }
    
}
