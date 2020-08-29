//
//  ContactsAppTests.swift
//  ContactsAppTests
//
//  Created by Venkata harsha Balla on 8/29/20.
//  Copyright © 2020 BVH. All rights reserved.
//

import XCTest
import Contacts
@testable import ContactsApp

class ContactsAppTests: XCTestCase {

    func testViewControllerFilter() {
        
        let VC = ViewController()
        
        let filterContentTest: () = VC.filtercontent(for: "1234")
        
        XCTAssertNotNil(filterContentTest)
        
       
    }
    
    
     
}
