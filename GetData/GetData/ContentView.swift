//
//  ContentView.swift
//  GetData
//
//  Created by afnan saad on 22/02/1445 AH.
//

import SwiftUI
import FirebaseFirestoreSwift
import FirebaseFirestore
struct Student:Identifiable{
    var name:String
    var id = UUID()
    
}

class ViewModel:ObservableObject{
    
    @Published var list = [Student]()
    
    func getData(){
        
        let d = Firestore.firestore()
        
        d.collection("Student").getDocuments { snapshot, error in
            if error == nil{
                if let snapshot = snapshot{

                    DispatchQueue.main.async {
                        
                        self.list = snapshot.documents.map{
                                
                                d in
                                
                                return Student(name:d["name"] as? String ?? "")
                                
                            }

                       
                           
                    }
                
                }
            }
        }
    } //get
}





struct ContentView: View {
    @ObservedObject var model = ViewModel()
    var body: some View {
        VStack {
            List(model.list){ item in
                
                Text(item.name)
                
                
                
                
            }
        }
    }
    init(){
        model.getData()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
