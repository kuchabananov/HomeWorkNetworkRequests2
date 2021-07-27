//
//  MainVC.swift
//  NetworkRequests
//
//  Created by Евгений on 26.07.21.
//

import UIKit

enum UserActons: String, CaseIterable /* позволяет из перечисления сделать массив */ {
    case downloadImage = "Download Image"
    case users = "Users"
}

class MainVC: UICollectionViewController {
    
    private let userActions = UserActons.allCases


    override func viewDidLoad() {
        super.viewDidLoad()

    }

    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "User" {
            let userVC = segue.destination as! UsersVC
            userVC.fetchData()
        }
    }

    // MARK: UICollectionViewDataSource



    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        userActions.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "UserCell", for: indexPath) as! CollectionViewCell
        cell.userActionLabel.text = userActions[indexPath.item].rawValue
        return cell
    }

    // MARK: UICollectionViewDelegate

    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let userAction = userActions[indexPath.item]

        switch userAction {
        case .downloadImage:
            performSegue(withIdentifier: "Image", sender: self)
        case .users:
            performSegue(withIdentifier: "User", sender: self)
        }
    }

}

extension MainVC: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: (UIScreen.main.bounds.width - 20), height: 80)
    }
}
