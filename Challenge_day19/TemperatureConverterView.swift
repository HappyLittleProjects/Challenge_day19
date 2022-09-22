//
//  ContentView.swift
//  Challenge_day19
//
//  Created by Linda Lau on 9/21/22.
//

import SwiftUI

struct TemperatureConverterView: View {
    @State private var userInput : Double = 0.0
    @State private var inputUnit : TemperatureUnit = TemperatureUnit.F
    
    enum TemperatureUnit : String, Identifiable, CaseIterable{
        case F
        case C
        case K
        
        var name: String{
            rawValue.capitalized
        }
        
        var id: String {
            name
        }
    }
    
    // convert user input to fahrenheit
    var fahrenheit : Double {
        switch inputUnit{
        case TemperatureUnit.C:
            return (userInput * 9 / 5) + 32
        case TemperatureUnit.K:
            return (celsius * 9 / 5) + 32
        default:
            return userInput
        }
    }
    
    // convert user input to celsius
    var celsius : Double {
        switch inputUnit{
        case TemperatureUnit.F:
            return (userInput - 32) * 5 / 9
        case TemperatureUnit.K:
            return userInput - 273.15
        default:
            return userInput
        }
    }
    
    // convert user input to kelvin
    var kelvin : Double {
        if inputUnit == TemperatureUnit.K {
            return userInput
        }
        else{
            return celsius + 273.15
        }
    }
    
    var body: some View {
        NavigationView {
            Form{
                Section{
                    HStack{
                        Spacer()
                        Text("Enter Temperature: ")
                        TextField("Temperature", value: $userInput, format: .number)
                            .keyboardType(.decimalPad)
                            .multilineTextAlignment(.center)
                        Spacer()
                    }
                    Picker("Units", selection: $inputUnit){
                        ForEach(TemperatureUnit.allCases, id: \.id){ unit in
                            Text(unit.name)
                                .tag(unit)
                        }
                    }
                    .pickerStyle(.segmented)
                }
                Section{
                    Text("\(fahrenheit) F")
                    Text("\(celsius) C")
                    Text("\(kelvin) K")
                } header: {
                    Text("Conversions: ")
                }
            }
            .navigationTitle("Temperature Converter")
        }
    }
}

struct TemperatureConverterView_Previews: PreviewProvider {
    static var previews: some View {
        TemperatureConverterView()
    }
}
