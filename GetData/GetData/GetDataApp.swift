//
//  GetDataApp.swift
//  GetData
//
//  Created by afnan saad on 22/02/1445 AH.
//

import SwiftUI
import Firebase

    

@main
struct GetDataApp: App {
    init(){
        
        
        FirebaseApp.configure()
        
        
    }
    var body: some Scene {
       
        WindowGroup {
            ContentView()
        }
    }
}
