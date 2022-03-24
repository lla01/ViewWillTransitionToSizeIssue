
import Foundation
import UIKit

class PopOverViewController: UIViewController {

    @IBOutlet private var actualSizeLabel: UILabel?
    @IBOutlet private var vwttsLabel: UILabel?
    @IBOutlet private var barButton: UIBarButtonItem?

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        if presentingViewController == nil {
            title = "Correct 🙂"
            barButton?.isEnabled = true
        } else {
            title = "Hmm.. 🤨"
            barButton?.isEnabled = false
        }
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()

        actualSizeLabel?.text = formatSize(view.bounds.size)
        checkMatch()
    }

    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)

        vwttsLabel?.text = formatSize(size)
        checkMatch()
    }

    @IBAction
    func buttonAction() {
        guard let theSameAgain = UIStoryboard(name: "Main", bundle: nil).instantiateInitialViewController() else { return }
        present(theSameAgain, animated: true)
    }

    private func formatSize(_ size: CGSize) -> String {
        return "\(size.width) x \(size.height)"
    }

    private func checkMatch() {
        if actualSizeLabel?.text == vwttsLabel?.text {
            vwttsLabel?.textColor = .black
        } else {
            vwttsLabel?.textColor = .red
        }
    }
}
