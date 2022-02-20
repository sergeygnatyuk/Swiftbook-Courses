//
//  NewEmojiTableViewController.swift
//  Lesson 2 EmojiReader
//
//  Created by Гнатюк Сергей on 12.03.2021.
//

import UIKit

final class NewEmojiTableViewController: UITableViewController {
    
    // MARK: - Properties
    public var emoji = Emoji(emoji: "", name: "", description: "", isFavourite: false)
    
    // MARK: - UI
    @IBOutlet weak var emojiTextField: UITextField!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var descriptionTextField: UITextField!
    @IBOutlet weak var saveButton: UIBarButtonItem!
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
        updateSaveBottonState()
    }
    
    //MARK: - UI
    @IBAction func textChanged(_ sender: UITextField) {
        updateSaveBottonState()
    }
    
    private func updateSaveBottonState() {
        let emojiText = emojiTextField.text ?? ""
        let nameText = nameTextField.text ?? ""
        let descriptionText = descriptionTextField.text ?? ""
        saveButton.isEnabled = !emojiText.isEmpty && !nameText.isEmpty && !descriptionText.isEmpty
    }
    
    private func updateUI() {
        emojiTextField.text = emoji.emoji
        nameTextField.text = emoji.name
        descriptionTextField.text = emoji.description
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        guard segue.identifier == "saveSegue" else { return }
        
        let emoji = emojiTextField.text ?? ""
        let name = nameTextField.text ?? ""
        let description = descriptionTextField.text ?? ""
        self.emoji = Emoji(emoji: emoji, name: name, description: description, isFavourite: self.emoji.isFavourite)
    }
}

