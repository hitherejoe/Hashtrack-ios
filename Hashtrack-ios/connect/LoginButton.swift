import UIKit

let kLoginButtonBackgroundColor = UIColor(displayP3Red: 31/255, green: 75/255, blue: 164/255, alpha: 1)
let kLoginButtonTintColor = UIColor.white
let kLoginButtonCornerRadius: CGFloat = 12.0

class LoginButton: UIButton {
    
    required override init(frame: CGRect) {
        super.init(frame: frame)
        configureUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.configureUI()
    }
    
    private func configureUI() {
        self.backgroundColor = kLoginButtonBackgroundColor
        self.layer.cornerRadius = kLoginButtonCornerRadius
        self.tintColor = kLoginButtonTintColor
        self.setTitle("Authenticate", for: .normal)
        self.setTitleColor(.white, for: .normal)
        self.contentEdgeInsets = UIEdgeInsets(top: 12.0, left: 20.0, bottom: 12.0, right: 20.0)
        self.translatesAutoresizingMaskIntoConstraints = false
    }
    
}

