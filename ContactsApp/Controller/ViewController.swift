//
//  ViewController.swift
//  ContactsApp
//
//  Created by Venkata harsha Balla on 8/27/20.
//  Copyright © 2020 BVH. All rights reserved.
//

import UIKit


private let cellId = "contactCell"

class ViewController: UITableViewController, UISearchResultsUpdating {
    
    
    
    
   // the contacts array
    
    var allContacts = [contactsAspcts]()
    


    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupNavBar()
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellId)
        
        
        fetchData()
        
        searchBarUI()
    
        
    }

    
    
    func setupNavBar()  {
    
        navigationItem.title = "Your Contacts"
        navigationController?.navigationBar.prefersLargeTitles = true
        
    }
    
    
    //MARK: SEARCH VIEW CONTROLLER - START
    
    var searchViewController: UISearchController = UISearchController(searchResultsController: nil)
    
     var searchResults: [contactsAspcts] = []
    
    
    func searchBarUI() {
           
           searchViewController.searchResultsUpdater = self
           
        searchViewController.hidesNavigationBarDuringPresentation = true
        
        searchViewController.obscuresBackgroundDuringPresentation = true
        
        
           searchViewController.searchBar.placeholder = "Search contacts by family name"
           
           searchViewController.searchBar.barTintColor = UIColor.yellow
           
           searchViewController.obscuresBackgroundDuringPresentation = false
           
           definesPresentationContext = true
           
           navigationItem.hidesSearchBarWhenScrolling = false
           
           navigationItem.searchController = searchViewController
           
           
           
       }
    
    func updateSearchResults(for searchController: UISearchController) {
        
        let textToBeLowercased = searchViewController.searchBar.text?.lowercased()
        
        filtercontent(for: textToBeLowercased!)
        
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
        
        
    }
    
    
    func filtercontent(for searchText: String) {
        
        searchResults = self.allContacts.filter({ (contact) -> Bool in
            
            return contact.contactOut.familyName.lowercased().range(of: searchText) != nil
            
            
        })
        
        
            
        
    }
    
    //MARK: SEARCH VIEW CONTROLLER - END
    
    
    
    

}

extension ViewController {
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headLabel = UILabel()
    
        headLabel.backgroundColor = .black
        
        return headLabel
    }
    
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        
        return 10
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
        

    }
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    

        if searchViewController.isActive {
            
            return searchResults.count
            
        } else {
            
            return allContacts.count
            
        }
        
        
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        if searchViewController.isActive {
            
            let cell = ContactShowCell(style: .subtitle, reuseIdentifier: cellId)
             
             cell.textLabel?.text = "\(searchResults[indexPath.row].contactOut.familyName)"
             
             cell.detailTextLabel?.text = (searchResults[indexPath.row].contactOut.phoneNumbers.first?.value.stringValue)
             
            

             return cell
            
            
        } else {
            
            let cell = ContactShowCell(style: .subtitle, reuseIdentifier: cellId)
             
             cell.textLabel?.text = "\(allContacts[indexPath.row].contactOut.familyName)" + " " + "\(allContacts[indexPath.row].contactOut.givenName)"
             
             cell.detailTextLabel?.text = (allContacts[indexPath.row].contactOut.phoneNumbers.first?.value.stringValue)
             
            

             return cell
            
        }
        
        
        
    }
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let nextVC = DetailViewController()
        
        if searchViewController.isActive {
            
            nextVC.familyNamePassedOver = searchResults[indexPath.row].contactOut.familyName
            nextVC.givenNamePassedOver = searchResults[indexPath.row].contactOut.givenName
            
            
            if let phoneToPass = searchResults[indexPath.row].contactOut.phoneNumbers.first?.value.stringValue {
                
                nextVC.phonenumberPassedOver = phoneToPass
                
            }
            
            
        } else {
            
            nextVC.familyNamePassedOver = allContacts[indexPath.row].contactOut.familyName
                   nextVC.givenNamePassedOver = allContacts[indexPath.row].contactOut.givenName
                   
                   
                   if let phoneToPass = allContacts[indexPath.row].contactOut.phoneNumbers.first?.value.stringValue {
                       
                       nextVC.phonenumberPassedOver = phoneToPass
                       
                   }
        }
        
        
        
        
       
        
        navigationController?.pushViewController(nextVC, animated: true)
        
    }
    
   

    
}





