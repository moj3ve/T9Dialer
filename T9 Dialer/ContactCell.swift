//
//  ContactCell.swift
//  T9 Dialer
//
//  Created by Jun Lee on 8/30/17.
//  Copyright © 2017 Jun Lee. All rights reserved.
//

import UIKit

class ContactCell: UITableViewCell {
    @IBOutlet weak var contactPhoto: UIImageView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var number: UILabel!
    @IBOutlet weak var callButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        callButton.setTitle("📞\u{0000FE0E}", for: .normal)
    }
    
    @IBAction func call(_ sender: UIButton) {
        guard let phoneNumber = number.text else { return }
        let clearedNumber = clearPhoneNumber(phoneNumber)
        
        if let telURL = URL(string: "tel://\(clearedNumber)") {
            if UIApplication.shared.canOpenURL(telURL) {
                UIApplication.shared.open(telURL, options: [:], completionHandler: nil)
            }
        }
    }
    
    private func clearPhoneNumber(_ number: String)->String{
        var processedNumber = ""
        for char in number{
            if "0"..."9" ~= char{
                processedNumber.append(char)
            }
        }
        
        return processedNumber
    }
}
