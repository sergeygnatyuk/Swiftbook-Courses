//
//  AddPhotoView+UIImagePickerControllerDelegate & UINavigationControllerDelegate.swift
//  iChat
//
//  Created by Гнатюк Сергей on 29.08.2021.
//

import UIKit

extension SetupProfileViewController: UIImagePickerControllerDelegate & UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        picker.dismiss(animated: true, completion: nil)
        guard let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage else { return }
        fullImageView.circleImageView.image = image
    }
}
