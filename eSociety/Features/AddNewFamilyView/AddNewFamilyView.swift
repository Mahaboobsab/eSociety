//
//  AddNewFamilyView.swift
//  eSociety
//
//  Created by Meheboob on 27/08/25.
//

import SwiftUI
import SwiftData

/// A view that allows adding or editing a family's details in the society management system.
struct AddNewFamilyView: View {
    
    // MARK: - SwiftData Environment
    
    /// Provides access to the SwiftData model context for CRUD operations.
    @Environment(\.modelContext) private var modelContext
    
    /// If not `nil`, indicates that we are editing an existing resident.
    var existingResident: Resident? = nil
    
    // MARK: - Options
    
    /// Ownership type options for the family.
    let ownerOptions = [kOwnerOption, kTenantOption, kFamilyMemberOption, kOtherOption]
    
    /// Maintenance category options.
    let maintenanceOptions = [kMonthlyOption, kQuarterlyOption, kYearlyOption]
    
    /// Default height for form fields.
    let fieldHeight: CGFloat = 60
    
    // MARK: - Form Fields (State)
    
    /// Flat number of the family.
    @State private var flatNumber = ""
    /// Email ID of the family head/owner.
    @State private var emailID = ""
    /// Owner or tenant name.
    @State private var ownerName = ""
    /// Selected ownership type (owner/tenant/family member/other).
    @State private var ownershipType = kOwnerOption
    /// Contact number of the family.
    @State private var contactNumber = ""
    /// Move-in date.
    @State private var selectedDate = Date()
    /// Number of residents in the family.
    @State private var residentCount = ""
    /// Selected maintenance payment frequency.
    @State private var maintenanceType = kMonthlyOption
    
    // MARK: - Initializer
    
    /// Initializes the view with an existing resident if editing.
    ///
    /// - Parameter existingResident: An optional `Resident` object.
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
    
    // MARK: - View Body
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                
                Text(kManageFamiliesTitle.localized)
                    .font(AppFont.robotoBold(size: 28))
                    .foregroundColor(.primary)
                
                Text(kAddNewFamilyTitle.localized)
                    .font(AppFont.robotoRegular(size: 22))
                
                // MARK: Input Fields
                Group {
                    labeledTextField(kFlatNumberLabel.localized, placeholder: kFlatNumberPlaceholder.localized, text: $flatNumber)
                    labeledTextField(kEmailIDLabel.localized, placeholder: kEmailIDPlaceholder.localized, text: $emailID)
                    labeledTextField(kOwnerNameLabel.localized, placeholder: kOwnerNamePlaceholder.localized, text: $ownerName)
                    
                    labeledPicker(kOwnershipTypeLabel.localized, selection: $ownershipType, options: ownerOptions.map { $0.localized })
                    
                    labeledTextField(kContactNumberLabel.localized, placeholder: kContactNumberPlaceholder.localized, text: $contactNumber)
                    
                    // Move-in Date Picker
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
                
                // Submit Button
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
    
    /// Creates a reusable labeled text field.
    ///
    /// - Parameters:
    ///   - label: The label to show above the field.
    ///   - placeholder: The placeholder text inside the field.
    ///   - text: The binding to update the field value.
    /// - Returns: A styled `TextField` inside a `VStack`.
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
    
    /// Creates a reusable labeled picker (menu).
    ///
    /// - Parameters:
    ///   - label: The label to show above the picker.
    ///   - selection: The binding for the selected option.
    ///   - options: A list of selectable options.
    /// - Returns: A styled `Menu` component.
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
    
    // MARK: - Data Persistence
    
    /// Saves or updates the resident details in the SwiftData model.
    ///
    /// - Author: Meheboob Nadaf
    /// - Complexity: O(1) for insert/update, O(n) for saving depending on context size.
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
            Logger.debug("Saved successfully")
            // Optionally dismiss or navigate back
        } catch {
            Logger.debug("Save failed: \(error)")
        }
    }
}

#Preview {
    AddNewFamilyView()
}
