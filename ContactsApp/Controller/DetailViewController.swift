//
//  DetailViewController.swift
//  ContactsApp
//
//  Created by Venkata harsha Balla on 8/28/20.
//  Copyright © 2020 BVH. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    var givenNamePassedOver : String = ""
    
    var familyNamePassedOver: String = ""
    
    var phonenumberPassedOver: String = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        
       
        
        setupViews()
        
        configureLabels()
        
        
        
        
    }
    
    private let familyNameLabel : UILabel = {
       
        let Flabel = UILabel()
        
        Flabel.translatesAutoresizingMaskIntoConstraints = false
        
        Flabel.isUserInteractionEnabled = false
        
        Flabel.backgroundColor = .white
        
        Flabel.textAlignment = .center
        
        Flabel.tintColor = .black
        
        return Flabel
        
        
    }()
   
    private let givenNameLabel : UILabel = {
       
        let Glabel = UILabel()
        
        Glabel.translatesAutoresizingMaskIntoConstraints = false
        
        Glabel.isUserInteractionEnabled = false
        
        Glabel.backgroundColor = .white
        
        Glabel.tintColor = .black
        
        Glabel.textAlignment = .center
        
        return Glabel
        
        
    }()
    
    private let phoneNumberLabel : UILabel = {
       
        let  Plabel = UILabel()
        
        Plabel.translatesAutoresizingMaskIntoConstraints = false
        
        Plabel.isUserInteractionEnabled = false
        
        Plabel.backgroundColor = .white
        
        Plabel.tintColor = .black
        
        Plabel.textAlignment = .center
        
        return Plabel
        
        
    }()
    
    func setupViews() {
        
        view.addSubview(familyNameLabel)
        view.addSubview(givenNameLabel)
        view.addSubview(phoneNumberLabel)
        view.backgroundColor = .white
        
        familyNameLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 100).isActive = true
        familyNameLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 5).isActive = true
        familyNameLabel.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 5).isActive = true
        familyNameLabel.bottomAnchor.constraint(equalTo: givenNameLabel.topAnchor).isActive = true
        
        
        givenNameLabel.topAnchor.constraint(equalTo: familyNameLabel.bottomAnchor).isActive = true
        givenNameLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 5).isActive = true
        givenNameLabel.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 5).isActive = true
        givenNameLabel.bottomAnchor.constraint(equalTo: phoneNumberLabel.topAnchor).isActive = true
        
        
        phoneNumberLabel.topAnchor.constraint(equalTo: givenNameLabel.bottomAnchor).isActive = true
        phoneNumberLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 5).isActive = true
        phoneNumberLabel.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 5).isActive = true
        
    }

    
    func configureLabels() {
        
        if familyNamePassedOver.isEmpty {
            
            familyNameLabel.text = "Family Name: Not Available"
            
        } else {
            
            familyNameLabel.text = "Family Name: \(familyNamePassedOver)"
            
        }
        
        if givenNamePassedOver.isEmpty {
            
            givenNameLabel.text = "Given Name: Not Available"
            
        } else {
            
            givenNameLabel.text = "Given Name: \(givenNamePassedOver)"
            
        }
        
        if phonenumberPassedOver.isEmpty {
            
            phoneNumberLabel.text = "Phone Number : Not Available"
            
            
        } else {
            
            phoneNumberLabel.text = "Phone Number : \(phonenumberPassedOver)"
            
        }
        
    }
    
    
}
