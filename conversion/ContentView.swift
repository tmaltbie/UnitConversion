//
//  ContentView.swift
//  conversion
//
//  Created by tmaltbie on 4/20/21.
//

import SwiftUI

struct ContentView: View {
    
    @State private var initUnit = ""
    @State private var fromUnit = "miles"
    @State private var intoUnit = "inches"
    
    var valueConversion: Double {
        var initUnitDbl = Double(initUnit)
        
        let convertedToInches = [
            "meters": 39.37,
            "kilometers": 39370,
            "miles": 63360,
            "feet": 12,
            "inches": 1
        ]
        
        
        
        return 2.0
    }
    
    var unitOne = ["meters", "kilometers", "miles", "feet", "inches"]
    var unitTwo = ["meters", "kilometers", "miles", "feet", "inches"]
    
    var body: some View {
        NavigationView {
            VStack {
                Section (header: Text("Convert")){
                    TextField("Value to Convert", text: $initUnit)
                        .multilineTextAlignment(.center)
                        .keyboardType(.decimalPad)
                
                Picker("Select a Unit", selection: $fromUnit) {
                    ForEach(unitOne, id: \.self) {
                        Text($0)
                        }
                    }
                    .pickerStyle(MenuPickerStyle())
                    Text("\(fromUnit)")
                        .padding(.bottom)
                }
                
                Section (header: Text("Into")){
                
                Picker("Select a Unit", selection: $intoUnit) {
                    ForEach(unitTwo, id: \.self) {
                        Text($0)
                        }
                    }
                    .pickerStyle(MenuPickerStyle())
                    
                    Text("\(intoUnit)")
                }
            } 
            .navigationTitle("Conversion")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
