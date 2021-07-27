//
//  ImageVC.swift
//  NetworkRequests
//
//  Created by Евгений on 26.07.21.
//

import UIKit

class ImageVC: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchImage()
        activityIndicator.startAnimating()
        activityIndicator.hidesWhenStopped = true
    }
    
    private let imageUrl = "https://peoplelovescience.com/wp-content/uploads/2017/08/dsc4081-cc.jpg"

    private func fetchImage() {
        guard let url = URL(string: imageUrl) else { return }

        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print(error.localizedDescription)
                return
            }
            if let response = response {
                print(response)
            }
            if let data = data, let image = UIImage(data: data) {
                DispatchQueue.main.async {
                    self.activityIndicator.stopAnimating()
                    self.imageView.image = image
                }
            }
        }.resume()
    }
    
}
