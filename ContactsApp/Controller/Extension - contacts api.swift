//
//  Extension - contacts api.swift
//  ContactsApp
//
//  Created by Venkata harsha Balla on 8/28/20.
//  Copyright © 2020 BVH. All rights reserved.
//

import Foundation
import Contacts
import UIKit

extension ViewController {
    
    func fetchData() {
        
        let contactStore = CNContactStore()
        
        contactStore.requestAccess(for: .contacts) { (accessGrant, error) in
            if let error = error {
                
                print("there is an error - \(error)")
                
                let alertController = UIAlertController(title: "We need access to your contacts to display them", message: "Go to your settings and grant us permissions", preferredStyle: .alert)

                        alertController.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
                        
                       
                self.present(alertController, animated: true, completion: nil)
                
                return
                
            } else {
                
                if accessGrant {
                    
                    print("access is granted")
                    
                    let fetchKeys = [CNContactGivenNameKey, CNContactFamilyNameKey, CNContactPhoneNumbersKey]
                    
                    let request = CNContactFetchRequest(keysToFetch: fetchKeys as [CNKeyDescriptor])
                    
                    do {
                        
                          
                        try  contactStore.enumerateContacts(with: request) { (retrievedContact, stopPointer) in
                              
                          
                            let contactObject = contactsAspcts(contactOut: retrievedContact)
                            
                            self.allContacts.append(contactObject)
                          
                          }
                    } catch let error {
                        
                        print("falied to enumerate" , error)
                        
                    }

                } else {
                    
                    print("access is denied")
                    
                    
                    
                }
                
            }
        }
        
        
    }
    
}
