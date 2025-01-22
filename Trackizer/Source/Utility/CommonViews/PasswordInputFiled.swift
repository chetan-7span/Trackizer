//
//  PasswordInputFiled.swift
//  Trackizer
//
//  Created by Chetan Hedamba on 21/01/25.
//
import Combine
import SwiftUI

public struct PasswordInputFiled: View {
    
    public enum InputMask {
        case alphaNumeric, numeric
        
        var keyboardType: UIKeyboardType {
            switch self {
            case .alphaNumeric:
                return  .asciiCapable
            case .numeric:
                return .numberPad
            }
        }
        
        func text(_ text: String) -> String {
            switch self {
            case .alphaNumeric: return text.filter { String($0).isAlphanumeric }
            default: return text
            }
        }
    }
    
    // MARK: - Constants
    let cornerRaidus = 16.0
    
    // MARK: - Properties
    @Binding var text: String
    var placeholder: String
    var errorMessage: String?
    var title: String
    var textLimit: Int?
    var mask: InputMask?
    let accessibilityIdPrefix: String
    var isDisabled: Bool
    
    @State private var isPasswordVisible: Bool = false
    
    private var titleAccessibilityId: String {
        accessibilityIdPrefix + "title"
    }
    
    private var textAccessibilityId: String {
        accessibilityIdPrefix + "text"
    }
    
    private var errorAccessibilityId: String {
        accessibilityIdPrefix + "error"
    }
    
    @FocusState private var isFocused: Bool
    
    // MARK: - Computed Properties
    var borderColor: Color {
        if isFocused {
            return (DesignSystem.Colors.orange)
        }else if isDisabled {
            return (DesignSystem.Colors.grey50)
        }else {
            return errorMessage?.isEmpty ?? true ?
            (DesignSystem.Colors.grey70) :
            (DesignSystem.Colors.dangerDefault)
        }
    }
    
    var backgroundColor: Color {
        return isDisabled ?  (DesignSystem.Colors.grey50) : Color.clear
    }
    
    var shouldShowError: Bool {
        !isFocused && !(errorMessage?.isEmpty ?? true)
    }
    
    public init(text: Binding<String>,
                placeholder: String,
                errorMessage: String? = nil,
                title: String,
                textLimit: Int? = nil,
                mask: InputMask? = nil,
                accessibilityIdPrefix: String,
                isDisabled:Bool = false
    )
    {
        self._text = text
        self.placeholder = placeholder
        self.errorMessage = errorMessage
        self.title = title
        self.textLimit = textLimit
        self.mask = mask
        self.accessibilityIdPrefix = accessibilityIdPrefix
        self.isDisabled = isDisabled
        isFocused = false
    }
    
    @ViewBuilder
    var txtFiled: some View {
        if isPasswordVisible {
            TextField("",
                      text: $text,
                      prompt: Text(placeholder).foregroundColor(DesignSystem.Colors.grey70)
            ).foregroundColor(DesignSystem.Colors.white)
                .font(Font.preferredFontStyle(.body, .regular))
        }else{
            SecureField("",
                        text: $text,
                        prompt:Text(placeholder).foregroundColor(DesignSystem.Colors.grey70)
            ).foregroundColor(DesignSystem.Colors.white)
                .font(Font.preferredFontStyle(.body, .regular))
        }
    }
    // MARK: - View Property
    public var body: some View {
        ZStack {
            HStack {
                txtFiled
                    .onReceive(Just(text)) { _ in
                        text = text.replacingOccurrences(of: " ", with: "")
                        text = mask?.text(text) ?? text
                        guard let textLimit else { return }
                        limitText(textLimit)
                    }
                    .focused($isFocused)
                    .keyboardType(mask?.keyboardType ?? .default)
                    .padding()
                
                // Eye Button to toggle password visibility
                Button(action: {
                    isPasswordVisible.toggle()
                }) {
                    
                    Image(isPasswordVisible ? .icnHidePassword : .icnShowPassowrd)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 24, height: 24)
                    
                        .padding(.trailing, 10)
                }
            }.frame(height: 54)
        }
        .accentColor(DesignSystem.Colors.orange)
        .disableAutocorrection(true)
        .roundedBorder(cornerRadius: cornerRaidus,
                       backgroundColor: backgroundColor,
                       borderColor: borderColor)
        .title(text: title,
               accessibilityId: titleAccessibilityId)
        .error(shouldShow: shouldShowError,
               text: errorMessage ?? "",
               accessibilityId: errorAccessibilityId)
        .disabled(isDisabled)
        
    }
    
}

private extension PasswordInputFiled {
    
    func mask(_ mask: InputMask?) {
        if let masked = mask?.text(text) {
            text = masked
        }
    }
    
    func limitText(_ maxLimit: Int) {
        if text.count > maxLimit {
            text = String(text.prefix(maxLimit))
        }
    }
}


#Preview {
    PasswordInputFiled(text: .constant("Guardiuan ID"), placeholder: "Guardiuan ID", title: "Guardiuan ID", textLimit: 10, mask: .numeric, accessibilityIdPrefix: "Guardiuan ID")
}
