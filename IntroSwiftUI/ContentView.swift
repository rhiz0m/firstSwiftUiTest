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

struct ContentView: View {
    
    let persons: [Person] = [Person(firstName: "Bruce", lastName: "Banner"), Person(firstName: "Steve", lastName: "Rodgers"), Person(firstName: "Black", lastName: "Widow")]
    
    var body: some View {
        ZStack{ Color.brown.ignoresSafeArea()
            VStack {
                Image(systemName: "globe").resizable().frame(width: 64, height: 64)
                    .imageScale(.large)
                    .foregroundColor(.cyan)
                //Spacer()
                Text("Hello,World").foregroundColor(.white).bold().font(.largeTitle)
                
                
                List(persons) { person in
                    Text("\(person.firstName) \(person.lastName)")
                }
                
                
                ForEach(persons) { person in
                    PersonView(person: person)
                }
                
                
                HStack {
                    Button(action: {
                        print("Button pressed")}, label: {
                            Text("Press me").foregroundColor(.white).frame(width: 200, height: 40).background(.black).cornerRadius(10)
                    })
                    Text("text!").foregroundColor(.white).font(.caption).padding()
                }

            }

            
        }
    }
}

struct PersonView: View {
    
    var person: Person
    
    var body: some View {
        HStack {
            Image(systemName: "person.circle")
            Text("\(person.firstName))")
            
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
