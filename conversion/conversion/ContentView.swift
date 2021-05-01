//
//  ContentView.swift
//  conversion
//
//  Created by tmaltbie on 4/20/21.
//

import SwiftUI

struct ContentView: View {
    
    private var units: [UnitLength] = [.meters, .kilometers, .miles, .feet, .inches]

    @State private var inputValue = ""
    @State private var inputUnit = 2
    @State private var outputUnit = 2
    
    private var convertedValue: Double {
        
        let input = Measurement(value: Double(inputValue) ?? 0, unit: units[inputUnit])
        return input.converted(to: units[outputUnit]).value
        
    }

    
    var body: some View {
        NavigationView {
            VStack {
                Section (header: Text("Convert")){
                    TextField("Value to Convert", text: $inputValue)
                        .multilineTextAlignment(.center)
                        .keyboardType(.decimalPad)
                }
                Section (header: Text("Input Unit")) {
                    Picker("Select a Unit", selection: $inputUnit) {
                        ForEach(0..<units.count) {
                            Text("\(self.units[$0].symbol)")
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
//                    Text("\(inputUnit)")
                }
                
                Section (header: Text("Into").padding(.top)){
                
                Picker("Select a Unit", selection: $outputUnit) {
                    ForEach(0..<units.count) {
                        Text("\(self.units[$0].symbol)")
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
//                    Text("\(outputUnit)")
                }
                Section {
                    Text("\(convertedValue)")
                        .padding(.top)
                }
            }
            .navigationTitle("Converrrrrsion")
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
