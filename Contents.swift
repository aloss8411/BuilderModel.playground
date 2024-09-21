import UIKit

class ComponentsComplexView: UIView {
    var title: UILabel = UILabel()
    var subTitle: UILabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
