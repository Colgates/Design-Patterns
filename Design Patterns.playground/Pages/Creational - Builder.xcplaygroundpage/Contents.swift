// MARK: - Creational Pattern

import UIKit

protocol ThemeProtocol {
    var background: UIColor { get }
    var textColor: UIColor { get }
}

protocol ThemeBuilderProtocol {
    func setBackground(color: UIColor)
    func setText(color: UIColor)
    func createTheme() -> ThemeProtocol?
}

class Theme: ThemeProtocol {
    var background: UIColor
    var textColor: UIColor
    
    init(background: UIColor, textColor: UIColor) {
        self.background = background
        self.textColor = textColor
    }
}

class ThemeBuilder: ThemeBuilderProtocol {
    private var backgroundColor: UIColor?
    private var textColor: UIColor?
    
    func setBackground(color: UIColor) {
        self.backgroundColor = color
    }
    
    func setText(color: UIColor) {
        self.textColor = color
    }
    
    func createTheme() -> ThemeProtocol? {
        guard let backgroundColor = backgroundColor, let textColor = textColor else {
            return nil
        }
        
        return Theme(background: backgroundColor, textColor: textColor)
    }
}

let builder = ThemeBuilder()
builder.setText(color: .white)
builder.setBackground(color: .blue)
let theme = builder.createTheme()
