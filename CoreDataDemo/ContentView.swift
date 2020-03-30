//
//  ContentView.swift
//  CoreDataDemo
//
//  Created by Isc. Torres on 3/25/20.
//  Copyright © 2020 isctorres. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @Environment(\.managedObjectContext) var moc
    @FetchRequest (entity: Student.entity(), sortDescriptors:[]) var students : FetchedResults<Student>
    var body: some View {
        VStack{
            List{
                ForEach(students, id:\.id ){ student in
                    Text(student.name ?? "Unknown")
                }
            }
            Button("Add"){
                let firstName = ["Rubensin","Yaretzin","Patricia","Ruben"]
                let lastName = ["Arzate","Otero","Torres","Frias"]
                let chosenFirstName = firstName.randomElement()!
                let chosenLastName = lastName.randomElement()!
                
                let student = Student(context: self.moc)
                student.id = UUID()
                student.name = "\(chosenFirstName) \(chosenLastName)"
                try? self.moc.save()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
