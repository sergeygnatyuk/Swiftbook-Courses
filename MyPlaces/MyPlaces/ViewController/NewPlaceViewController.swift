//
//  NewPlaceViewController.swift
//  Lesson 2 MyPlaces
//
//  Created by Гнатюк Сергей on 16.03.2021.
//

import UIKit

final class NewPlaceViewController: UITableViewController {
    
    // UI
    @IBOutlet weak var placeImage: UIImageView!
    @IBOutlet weak var saveButton: UIBarButtonItem!
    @IBOutlet weak var placeName: UITextField!
    @IBOutlet weak var placeLocation: UITextField!
    @IBOutlet weak var placeType: UITextField!
    @IBOutlet weak var ratingControl: RatingControl!
    
    // Properties
    let indexCell = 0
    let titleCamera = "Camera"
    let titlePhoto = "Photo"
    let titleCancel = "Cancel"
    let forKeyTitleTextAlignment = "titleTextAlignment"
    let forKeyImage = "image"
    var currentPlace: Place!
    var imageIsChanged = false
    let incSegueIdentifier = "showPlace"
    var segueIdentifier = "showMap"
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        //Hide line under cell
        tableView.tableFooterView = UIView(frame: CGRect(x: 0, y: 0, width: tableView.frame.size.width, height: 1))
        //Button Save disabled by default
        saveButton.isEnabled = false
        placeName.addTarget(self, action: #selector(textFieldChanged), for: .editingChanged)
        setupEditScreen()
    }
    //MARK: - Table View Delegate
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == indexCell {
            let cameraIcon = #imageLiteral(resourceName: "Gallery")
            let photoIcon = #imageLiteral(resourceName: "Camera")
            let actionSheet = UIAlertController(title: nil,
                                                message: nil,
                                                preferredStyle: .actionSheet)
            let camera = UIAlertAction(title: titleCamera, style: .default) { _ in
                self.chooseImagePicker(source: .camera)
            }
            //add little image when selected camera or libary
            camera.setValue(cameraIcon, forKey: forKeyImage)
            camera.setValue(CATextLayerAlignmentMode.left, forKey: forKeyTitleTextAlignment)
            let photo = UIAlertAction(title: titlePhoto, style: .default) { _ in
                self.chooseImagePicker(source: .photoLibrary)
            }
            //add little image when selected camera or libary
            photo.setValue(photoIcon, forKey: forKeyImage)
            photo.setValue(CATextLayerAlignmentMode.left, forKey: forKeyTitleTextAlignment)
            let cancel = UIAlertAction(title: titleCancel, style: .cancel)
            actionSheet.addAction(camera)
            actionSheet.addAction(photo)
            actionSheet.addAction(cancel)
            present(actionSheet, animated: true)
        } else {
            view.endEditing(true)
        }
    }
    
    //MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let identifier = segue.identifier,
              let mapViewController = segue.destination as? MapViewController else { return }
        mapViewController.incomeSegueIdentifier = identifier
        mapViewController.mapViewControllerDelegate = self
        if identifier == incSegueIdentifier {
            mapViewController.place.name = placeName.text!
            mapViewController.place.location = placeLocation.text
            mapViewController.place.type = placeType.text
            mapViewController.place.imageData = placeImage.image?.pngData()
        }
    }
    
    func savePlace() {
        let image = imageIsChanged ? placeImage.image : #imageLiteral(resourceName: "icons8-столовые-приборы-50")
        let imageData = image?.pngData()
        let newPlace = Place(name: placeName.text!,
                             location: placeLocation.text,
                             type: placeType.text,
                             imageData: imageData,
                             rating: Double(ratingControl.rating))
        if currentPlace != nil {
            try! realm.write {
                currentPlace?.name = newPlace.name
                currentPlace?.location = newPlace.location
                currentPlace?.type = newPlace.type
                currentPlace?.imageData = newPlace.imageData
                currentPlace?.rating = newPlace.rating
            }
        } else {
            StorageManager.saveObject(newPlace)
        }
    }
    
    private func setupEditScreen() {
        if currentPlace != nil {
            setupNavigationBar()
            imageIsChanged = true
            guard let data = currentPlace?.imageData, let image = UIImage(data: data) else { return }
            
            placeImage.image = image
            placeImage.contentMode = .scaleAspectFill
            placeName.text = currentPlace?.name
            placeLocation.text = currentPlace?.location
            placeType.text = currentPlace?.type
            ratingControl.rating = Int(currentPlace.rating)
        }
    }
    
    private func setupNavigationBar() {
        if let topItem = navigationController?.navigationBar.topItem {
            topItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        }
        navigationItem.leftBarButtonItem = nil
        title = currentPlace?.name
        saveButton.isEnabled = true
        
    }
    
    // MARK: - Actions
    @IBAction func cancelAction(_ sender: Any) {
        dismiss(animated: true)
    }
}

//MARK: - Text field Delegate
extension NewPlaceViewController: UITextFieldDelegate {
    //Hide the keyboard by clicking on Done
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    //Button Save is available when filing Name field
    @objc private func textFieldChanged() {
        if placeName.text?.isEmpty == false {
            saveButton.isEnabled = true
        } else {
            saveButton.isEnabled = false
        }
    }
}

//MARK: - Work with image
extension NewPlaceViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    func chooseImagePicker(source: UIImagePickerController.SourceType) {
        if UIImagePickerController.isSourceTypeAvailable(source){
            let imagePicker = UIImagePickerController()
            imagePicker.delegate = self
            imagePicker.allowsEditing = true
            imagePicker.sourceType = source
            present(imagePicker, animated: true, completion: nil)
        }
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        placeImage.image = info[.editedImage ] as? UIImage
        placeImage.contentMode = .scaleAspectFill
        placeImage.clipsToBounds = true
        imageIsChanged = true
        dismiss(animated: true)
    }
}

extension NewPlaceViewController: MapViewControllerDelegate {
    func getAddress(_ address: String?) {
        placeLocation.text = address
    }
}
















