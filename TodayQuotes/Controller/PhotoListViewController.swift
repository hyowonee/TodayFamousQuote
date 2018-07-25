//
//  PhotoListViewController.swift
//  TodayQuotes
//
//  Created by Hyowon Choi on 2018. 7. 11..
//  Copyright © 2018년 Hyowonee. All rights reserved.
//

import UIKit
import RealmSwift

class PhotoListViewController: UIViewController {
    
    @IBOutlet var photoCollectionView: UICollectionView!
    
    // 데이터베이스 안의 이미지 수로 변경 해야함
    var photos: [UIImage] = []
    let picker = UIImagePickerController()
    var newImage: UIImage? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.picker.sourceType = .photoLibrary
        self.picker.allowsEditing = false
        self.picker.delegate = self
    }
    
    @IBAction func addPhoto() {
        self.present(self.picker, animated: true)
        
    }
}

extension PhotoListViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.photos.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let photoCell = collectionView.dequeueReusableCell(withReuseIdentifier: "PhotoCell", for: indexPath) as! PhotoCell
        photoCell.photoView.image = newImage
        return photoCell
    }
}

extension PhotoListViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        //        var newImage: UIImage? = nil
        if let possibleImage = info["UIImagePickerControllerEditedImage"] as? UIImage {
            newImage = possibleImage
        } else if let possibleImage = info["UIImagePickerControllerOriginalImage"] as? UIImage {
            newImage = possibleImage
        }
        
        self.photos.append(newImage!)
        self.photoCollectionView.insertItems(at: [IndexPath(row: self.photos.count - 1, section: 0)])
        
        picker.dismiss(animated: true, completion: nil)
    }
}
