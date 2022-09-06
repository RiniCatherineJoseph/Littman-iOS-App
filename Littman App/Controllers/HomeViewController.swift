//
//  HomeViewController.swift
//  Littman App
//
//  Created by Littman Library on 8/2/22.
//

import UIKit

class HomeViewController: UIViewController,UICollectionViewDelegate, UICollectionViewDataSource {
  
    @IBOutlet weak var hamburgerIcon: UIBarButtonItem!
    @IBOutlet weak var publicationLabel: UILabel!
    
    @IBOutlet weak var eventLabel: UILabel!
    
    @IBOutlet weak var publicationCollectionView: UICollectionView!
    @IBOutlet weak var eventCollectionView: UICollectionView!
    var publicationseries : [String] = ["pubcn1","pubcn2","pubcn3","pubcn3"]
    var eventseries : [String] = ["event1","event2","event3","event3"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setUI()
        NotificationCenter.default.addObserver(self, selector: #selector(self.setUI), name: Notification.Name("ModeSwiched"), object: nil)
       
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        if self.traitCollection.userInterfaceStyle == .light{
            hamburgerIcon.tintColor = .black
        }
        else{
            hamburgerIcon.tintColor = .white
        }
    }
    
    @IBAction func showPublicationList(_ sender: Any) {
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        let nextViewController = storyBoard.instantiateViewController(withIdentifier:"ListVC" ) as! ListViewController
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "Selected New Publications", style: .plain, target: nil, action: nil)
        nextViewController.type = textConstants.publicationListTitle
        nextViewController.listPublicationArray = publicationseries
        self.navigationController?.pushViewController(nextViewController, animated: true)
    }
    
    @IBAction func showEventList(_ sender: Any) {
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        let nextViewController = storyBoard.instantiateViewController(withIdentifier:"ListVC" ) as! ListViewController
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "Events & Exhibits", style: .plain, target: nil, action: nil)
        nextViewController.type = textConstants.eventListTitle
        nextViewController.listEventArray = eventseries
        self.navigationController?.pushViewController(nextViewController, animated: true)
    }
    
    
    @objc func setUI() {
        
        let longTitleLabel = UILabel()
        longTitleLabel.text = textConstants.homeTitle
        longTitleLabel.font = UIFont(name: fontConstant.boldFont, size: 28)
        publicationLabel.font = UIFont(name: fontConstant.boldFont, size: 20)
        eventLabel.font = UIFont(name: fontConstant.boldFont, size: 20)
        longTitleLabel.sizeToFit()
        let leftItem = UIBarButtonItem(customView: longTitleLabel)
        self.navigationItem.leftBarButtonItem = leftItem
        
        if self.traitCollection.userInterfaceStyle == .dark {
            self.hamburgerIcon.tintColor = .white
        }else{
            self.hamburgerIcon.tintColor = .black
        }
    }
    
    
    //collection View
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == self.publicationCollectionView {
            return publicationseries.count
        }
        else {
            return eventseries.count
        }
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == self.publicationCollectionView {
            let pubCell = collectionView.dequeueReusableCell(withReuseIdentifier: textConstants.publicationCell, for: indexPath as IndexPath) as! HomeCollectionViewCell
            pubCell.cellImage.contentMode = UIView.ContentMode.scaleAspectFill
            pubCell.cellImage.image = UIImage(named: publicationseries[indexPath.row])
            
  
            return pubCell
        }

        else {
            let eventCell = collectionView.dequeueReusableCell(withReuseIdentifier: textConstants.eventCell, for: indexPath as IndexPath) as! HomeCollectionViewCell
            eventCell.cellImage.contentMode = UIView.ContentMode.scaleAspectFill
            eventCell.cellImage.image = UIImage(named: eventseries[indexPath.row])
 

            return eventCell
        }
    }
    

    @IBAction func showSettings(_ sender: Any) {
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        let nextViewController = storyBoard.instantiateViewController(withIdentifier: "littmansettings") as! SettingsViewController
        self.navigationController?.pushViewController(nextViewController, animated: true)
    }
    
}
