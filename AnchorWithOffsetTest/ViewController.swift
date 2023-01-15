import UIKit

class ViewController: UIViewController {

    @IBOutlet var fixedView : UIView!
    @IBOutlet var movableView : UIView!

    var currentConstraint: NSLayoutConstraint?
    lazy var anchor = movableView.leadingAnchor
        .anchorWithOffset(to: fixedView.centerXAnchor)

    override func viewDidLoad() {
        super.viewDidLoad()
        currentConstraint = anchor
            .constraint(equalTo: movableView.widthAnchor, multiplier: 0.5)
        currentConstraint?.isActive = true
    }

    @IBAction func sliderChanged (_ sender: UISlider) {
        let multiplier = CGFloat(sender.value)
        currentConstraint?.isActive = false
        currentConstraint = anchor
            .constraint(equalTo: movableView.widthAnchor, multiplier: multiplier)
        currentConstraint?.isActive = true
        UIView.animate(withDuration: 0.2) { [self] in
            view.layoutIfNeeded()
        }
    }

}
