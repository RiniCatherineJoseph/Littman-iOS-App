//
//  SettingsTableViewCell.swift
//  DANA
//
//  Created by Littman Library on 3/15/22.
//

import UIKit

class SettingsTableViewCell: UITableViewCell {

    
    @IBOutlet weak var aboutImage: UIImageView!
    @IBOutlet weak var settingsSwitch: UISwitch!

    
    @IBOutlet weak var titleLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        settingsSwitch.onTintColor = UIColor.red
    
        // Initialization code
    }
    @IBAction func swichChanged(_ sender: Any) {
        
        if (sender as AnyObject).tag == 1{
            if fontConstant.largeFont {
                fontConstant.largeFont = false
            }else {
                fontConstant.largeFont = true
            }
            NotificationCenter.default.post(name: Notification.Name("FontSwiched"), object: nil)
            
           
        } else if (sender as AnyObject).tag == 0{
            if self.traitCollection.userInterfaceStyle == .dark{
                self.window?.overrideUserInterfaceStyle = .light
                NotificationCenter.default.post(name: Notification.Name("ModeSwiched"), object: nil)
            }else{
                self.window?.overrideUserInterfaceStyle = .dark
                NotificationCenter.default.post(name: Notification.Name("ModeSwiched"), object: nil)
            }
        }
        
    }
    
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
