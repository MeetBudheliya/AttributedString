//
//  ViewController.swift
//  AttributedString
//
//  Created by Adsum MAC 1 on 03/09/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var lbl: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
       
                // create attributed string
                let myString = "Adm No: JTS009 | X - A"
        let id = myString.slice(from: ":", to: "|")
      
        
        let seperators = myString.components(separatedBy: id ?? "")
        let firstTexts = NSMutableAttributedString(string: seperators[0])
        let classText = NSMutableAttributedString(string: seperators[1])
        let stdID = NSMutableAttributedString(string: id ?? "", attributes: [.foregroundColor: UIColor.red])
        
        firstTexts.append(stdID)
        firstTexts.append(classText)
        lbl.attributedText = firstTexts
    }


}

//MARK:- String Function to set color
extension String {
    func slice(from: String, to: String) -> String? {
        guard let rangeFrom = range(of: from)?.upperBound else { return nil }
        guard let rangeTo = self[rangeFrom...].range(of: to)?.lowerBound else { return nil }
        return String(self[rangeFrom..<rangeTo])
    }
}
