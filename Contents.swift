import UIKit

///元件的內容
class ComponentsComplexView: UIView {
    weak var title: UILabel?
    weak var subTitle: UILabel?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUIs()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    ///可以在這邊設定UIView的一些基礎設定
    func setupUIs() { }
}

///回傳Self創造鏈式
protocol ComponentsViewBuilder {
    func addMainTitle(_ text: String) -> Self
    func addSubTitle(_ text: String) -> Self
    func build() -> ComponentsComplexView
}

class ComplexViewBuilder: ComponentsViewBuilder {
    private var view = ComponentsComplexView()
    
    func addMainTitle(_ text: String) -> Self {
        let label = UILabel()
        label.text = text
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.topAnchor.constraint(equalTo: view.topAnchor, constant: 5).isActive = true
        label.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 12).isActive = true
        label.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 12).isActive = true
        view.title = label
        view.addSubview(label)
        return self
    }
    
    func addSubTitle(_ text: String) -> Self {
        let label = UILabel()
        label.text = text
        label.font = UIFont.systemFont(ofSize: 14)
        view.subTitle = label
        view.addSubview(label)
        
        guard let title = view.title else {
            return self
        }
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.topAnchor.constraint(equalTo: title.bottomAnchor, 
                                   constant: 10).isActive = true
        label.leadingAnchor.constraint(equalTo: title.leadingAnchor).isActive = true
        label.trailingAnchor.constraint(equalTo: title.trailingAnchor).isActive = true
        
        return self
    }
    
    func build() -> ComponentsComplexView {
        return view
    }
}

class ViewController: UIViewController {
    
    var complexView: ComponentsComplexView!
    
    override func viewDidLoad() {
         complexView = ComplexViewBuilder()
            .addMainTitle("This is a title")
            .build()
        
        view.addSubview(complexView)
    }
}
