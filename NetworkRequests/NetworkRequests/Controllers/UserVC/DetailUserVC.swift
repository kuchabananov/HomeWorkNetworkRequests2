//
//  DetailUserVC.swift
//  NetworkRequests
//
//  Created by Евгений on 26.07.21.
//

import UIKit

class DetailUserVC: UIViewController {
    
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var phoneLabel: UILabel!
    @IBOutlet weak var websiteLabel: UILabel!
    
    @IBOutlet weak var streetLabel: UILabel!
    @IBOutlet weak var suiteLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var zipcodeLabel: UILabel!
    
    @IBOutlet weak var companyNameLabel: UILabel!
    @IBOutlet weak var catchPhraseLabel: UILabel!
    @IBOutlet weak var bsLabel: UILabel!
    
    
    var user: User?
    

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        
    }
    
    private func setupUI () {
        nameLabel.text = user?.name
        usernameLabel.text = user?.username
        emailLabel.text = user?.email
        phoneLabel.text = user?.phone
        websiteLabel.text = user?.website
        
        streetLabel.text = user?.address?.street
        suiteLabel.text = user?.address?.suite
        cityLabel.text = user?.address?.city
        zipcodeLabel.text = user?.address?.zipcode
        
        companyNameLabel.text = user?.company?.name
        catchPhraseLabel.text = user?.company?.catchPhrase
        bsLabel.text = user?.company?.bs
    }
    
    
    

    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == "GoToGeo" else { return }
        let geoVC = segue.destination as! GeoUserVC
        geoVC.geo = user?.address?.geo
        geoVC.address = user?.address
    }
    
    @IBAction func goToGeoBtn(_ sender: UIButton) {
        performSegue(withIdentifier: "GoToGeo", sender: nil)
        
    }
    
}
