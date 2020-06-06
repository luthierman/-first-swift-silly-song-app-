//
//  ViewController.swift
//  sill song 2
//
//  Created by david on 6/5/20.
//  Copyright © 2020 david. All rights reserved.
//
// Based off of udacity Swift for Devs course project

import UIKit
import Foundation
func shortNameFromName(_ name: String) -> String {
    var name = name
    //let lowercase = name.lowercased()
    //let vowelSet = CharacterSet(charactersIn: "aeiou")
    
    name.remove(at: name.startIndex)
    return name
}


func lyricsForName(lyricsTemplate: String, fullName: String) -> String {
    var newlyrics = lyricsTemplate.replacingOccurrences(of: "<FULL_NAME>", with: fullName)
    newlyrics = newlyrics.replacingOccurrences(of: "<SHORT_NAME>", with: shortNameFromName(fullName))
    return newlyrics
}

// join an array of strings into a single template string:
let bananaFanaTemplate = [
    "<FULL_NAME>, <FULL_NAME>, Bo B<SHORT_NAME>",
    "Banana Fana Fo F<SHORT_NAME>",
    "Me My Mo M<SHORT_NAME>",
    "<FULL_NAME>"].joined(separator: "\n")


class ViewController: UIViewController {

    @IBOutlet weak var nameField: UITextField!
    
    @IBOutlet weak var lyricsView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameField.delegate = self
    }

    @IBAction func reset(_ sender: Any) {
        nameField.text = ""
        lyricsView.text = ""
    }
    
    @IBAction func displayLyrics(_ sender: Any) {
        lyricsView.text = lyricsForName(lyricsTemplate: bananaFanaTemplate, fullName: nameField.text!)
        
    }
}

extension ViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return false
    }
}

