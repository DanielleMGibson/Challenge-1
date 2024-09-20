//
//  ContentView.swift
//  Challenge 1
//
//  Created by Student on 9/19/24.
//

import SwiftUI

struct ContentView: View {

    @State private var inputValue = "sec"
    @State private var outputValue = "min"
    @State private var userInput: Double = 60

    @FocusState private var isFocused: Bool

   private let values = ["sec", "min", "hours", "days"]

    private var inputConverted: Double {

        let finalInput: Double = userInput

        switch inputValue {
        case "sec":
            return finalInput
        case "min":
            return finalInput * 60
        case "hours":
            return finalInput * 3600
        case "days":
            return finalInput * 86400
        default:
            return finalInput
        }
    }

   private var outputConverted: Double {

        let finalOutput: Double = inputConverted

        switch outputValue {
        case "sec":
            return finalOutput
        case "min":
            return finalOutput / 60
        case "hours":
            return finalOutput / 3600
        case "days":
            return finalOutput / 86400
        default:
            return finalOutput
        }

    }

    var body: some View {
            NavigationView{
                Form{
                    Section{
                        Picker("Input value", selection: $inputValue) {
                            ForEach(values, id: \.self){
                                Text("\($0)")
                            }
                        }
                    .pickerStyle(.segmented)
                }header: {
                    Text("Select Input")
                }

                Section{
                    Picker("Output value", selection: $outputValue) {
                        ForEach(values, id: \.self){
                            Text("\($0)")
                        }
                    }
                    .pickerStyle(.segmented)
                }header: {
                    Text("Select Output")
                }

                Section {
                    TextField("Insert input value", value: $userInput, format: .number)
                        .keyboardType(.numberPad)
                        .focused($isFocused)
                }header: {
                    Text("Insert input value")
                }

                Section {
                    Text(outputConverted.formatted(), format: .number)
                }header: {
                    Text("Result")
                }
            }
            .navigationTitle("Time Converter")
            .toolbar {
                ToolbarItemGroup(placement: .keyboard){
                    Spacer()
                    Button("Done"){
                        isFocused = false
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
