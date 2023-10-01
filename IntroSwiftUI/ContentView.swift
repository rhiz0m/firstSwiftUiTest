//
//  ContentView.swift
//  IntroSwiftUI
//
//  Created by Andreas Antonsson on 2023-09-27.
//

import SwiftUI

struct Person: Identifiable {
    var id: UUID = UUID() // Creates a tag at every element in list
    var firstName: String
    var lastName: String
}
// 11.30


struct ContentView: View {
  
    // Takes in an struct of type Person
    let persons: [Person] = [Person(firstName: "Bruce", lastName: "Banner"), Person(firstName: "Steve", lastName: "Rodgers"), Person(firstName: "Black", lastName: "Widow")]
    
    var body: some View {
        
        NavigationStack {
        
            ZStack{ Color.brown.ignoresSafeArea()
                VStack(alignment: .leading) {
                    Image(systemName: "globe").resizable().frame(width: 64, height: 64)
                        .imageScale(.large)
                        .foregroundColor(.cyan)
                    //Spacer()
                    Text("Hello,World").foregroundColor(.white).bold().font(.largeTitle)
                    
                    /*
                    List(persons) { person in
                        Text("\(person.firstName) \(person.lastName)")
                    }
                    */
                    
                   
                    VStack(alignment: .leading, spacing: 10) {
                        ForEach(persons) { person in
                            PersonView(person: person)
                        }
                    }
                    
                    
                    
                    // To be able to navigate, we need a navigation link. Navigationlink is like a button
               /*   NavigationLink(destination: SecondScreenView(), label: {
                        HStack {
                            Text("Navigate").foregroundColor(.white).frame(width: 200, height: 40).background(.black).cornerRadius(10).padding(10)
                        }
                    }) */
              
                        Button(action: {
                            print("Button pressed")}, label:
                                {
                                HStack {
                                    Text("Press me").foregroundColor(.white).frame(width: 200, height: 40).background(.black).cornerRadius(10).padding(10)
                                }
                            })
                    }
            }
        }
    }
}

struct PersonView: View {
    
    var person: Person
    
    var body: some View {
        
        
        // Wrap all person content in a NavLink to be able to click on each name to get to SecondScreenView
      
     NavigationLink(destination: SecondScreenView(person: person), label: {
            HStack(alignment: .center) {
                Image(systemName: "person.circle")
                Text("\(person.firstName) \(person.lastName)").foregroundColor(.black)
            }})
    }
}


struct SecondScreenView: View {
    
    var person: Person
    
    var body: some View {
        VStack {
            Text("Welcome \(person.firstName) \(person.lastName)!")
            //Text("Welcome to second screen!")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
        //SecondScreenView()
        //PersonView(person: Person(firstName: "Andreas", lastName: "Antonsson"))
    
    }
}

// En struct kan inte ärva från en annan struct , som en klass kan. Struct behöver ingen init som en klass behöver.

 
