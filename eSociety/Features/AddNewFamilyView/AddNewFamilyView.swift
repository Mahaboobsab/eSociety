//
//  AddNewFamilyView.swift
//  eSociety
//
//  Created by Meheboob on 26/08/25.
//

import SwiftUI
import SwiftData

struct AddNewFamilyView: View {
    //Swift Data
    @Environment(\.modelContext) private var modelContext
    var existingResident: Resident? = nil

        
    let ownerOptions = [kOwnerOption, kTenantOption, kFamilyMemberOption, kOtherOption]
    let maintenanceOptions = [kMonthlyOption, kQuarterlyOption, kYearlyOption]
    
    let fieldHeight: CGFloat = 60

    @State private var flatNumber = ""
    @State private var emailID = ""
    @State private var ownerName = ""
    @State private var ownershipType = kOwnerOption
    @State private var contactNumber = ""
    @State private var selectedDate = Date()
    @State private var residentCount = ""
    @State private var maintenanceType = kMonthlyOption
    

    init(existingResident: Resident? = nil) {
        self.existingResident = existingResident
        _flatNumber = State(initialValue: existingResident?.flatNumber ?? "")
        _emailID = State(initialValue: existingResident?.emailID ?? "")
        _ownerName = State(initialValue: existingResident?.ownerName ?? "")
        _ownershipType = State(initialValue: existingResident?.ownershipType ?? kOwnerOption)
        _contactNumber = State(initialValue: existingResident?.contactNumber ?? "")
        _selectedDate = State(initialValue: existingResident?.moveInDate ?? Date())
        _residentCount = State(initialValue: existingResident.map { "\($0.numberOfResidents)" } ?? "")
        _maintenanceType = State(initialValue: existingResident?.maintenanceCategory ?? kMonthlyOption)
    }

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                
                Text(kManageFamiliesTitle.localized)
                    .font(AppFont.robotoBold(size: 28))
                    .foregroundColor(.primary)
                
                Text(kAddNewFamilyTitle.localized)
                    .font(AppFont.robotoRegular(size: 22))
                
                Group {
                    labeledTextField(kFlatNumberLabel.localized, placeholder: kFlatNumberPlaceholder.localized, text: $flatNumber)
                    labeledTextField(kEmailIDLabel.localized, placeholder: kEmailIDPlaceholder.localized, text: $emailID)
                    labeledTextField(kOwnerNameLabel.localized, placeholder: kOwnerNamePlaceholder.localized, text: $ownerName)
                    
                    labeledPicker(kOwnershipTypeLabel.localized, selection: $ownershipType, options: ownerOptions.map { $0.localized })
                    
                    labeledTextField(kContactNumberLabel.localized, placeholder: kContactNumberPlaceholder.localized, text: $contactNumber)
                    
                    Text(kMoveInDateLabel.localized)
                        .font(AppFont.robotoRegular(size: 18))
                    
                    ZStack {
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(Color.gray, lineWidth: 1)
                            .frame(height: fieldHeight)
                        
                        DatePicker("", selection: $selectedDate, displayedComponents: [.date])
                            .datePickerStyle(.compact)
                            .labelsHidden()
                            .padding(.horizontal)
                    }
                    
                    labeledTextField(kResidentCountLabel.localized, placeholder: kResidentCountPlaceholder.localized, text: $residentCount)
                    
                    labeledPicker(kMaintenanceCategoryLabel.localized, selection: $maintenanceType, options: maintenanceOptions.map { $0.localized })
                }
                
                Button(action: {
                    saveData()
                }) {
                    Text(kSubmitButton.localized)
                        .frame(maxWidth: .infinity, minHeight: fieldHeight)
                        .foregroundColor(.white)
                        .background(Color.black)
                        .cornerRadius(8)
                        .font(.headline)
                }
            }
            .padding()
        }
    }
    
    // MARK: - Reusable Components
    
    func labeledTextField(_ label: String, placeholder: String, text: Binding<String>) -> some View {
        VStack(alignment: .leading, spacing: 4) {
            Text(label)
                .font(AppFont.robotoRegular(size: 18))
            
            TextField(placeholder, text: text)
                .font(AppFont.robotoRegular(size: 18))
                .padding()
                .frame(height: fieldHeight)
                .overlay(RoundedRectangle(cornerRadius: 8).stroke(Color.gray, lineWidth: 1))
        }
    }

    
    func labeledPicker(_ label: String, selection: Binding<String>, options: [String]) -> some View {
        VStack(alignment: .leading, spacing: 4) {
            Text(label)
                .font(AppFont.robotoRegular(size: 18))
            
            Menu {
                ForEach(options, id: \.self) { option in
                    Button(option) {
                        selection.wrappedValue = option
                    }
                }
            } label: {
                HStack {
                    Text(selection.wrappedValue)
                        .foregroundColor(.primary)
                    Spacer()
                    Image(systemName: "chevron.down")
                        .foregroundColor(.gray)
                }
                .padding()
                .frame(height: fieldHeight)
                .overlay(RoundedRectangle(cornerRadius: 8).stroke(Color.gray, lineWidth: 1))
            }
        }
    }
    
    //MARK: Swift Data
    
    func saveData() {
        if let resident = existingResident {
            // Edit flow
            resident.flatNumber = flatNumber
            resident.emailID = emailID
            resident.ownerName = ownerName
            resident.ownershipType = ownershipType
            resident.contactNumber = contactNumber
            resident.moveInDate = selectedDate
            resident.numberOfResidents = Int(residentCount) ?? 1
            resident.maintenanceCategory = maintenanceType
        } else {
            // Create flow
            let newResident = Resident(
                flatNumber: flatNumber,
                emailID: emailID,
                ownerName: ownerName,
                ownershipType: ownershipType,
                contactNumber: contactNumber,
                moveInDate: selectedDate,
                numberOfResidents: Int(residentCount) ?? 1,
                maintenanceCategory: maintenanceType
            )
            modelContext.insert(newResident)
        }
        do {
            try modelContext.save()
            print("Saved successfully")
            // Optionally dismiss or navigate back
        } catch {
            print("Save failed: \(error)")
        }
    }
}


#Preview {
    AddNewFamilyView()
}
