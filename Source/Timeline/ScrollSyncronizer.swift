import UIKit

class ScrollSynchronizer: NSObject, UIScrollViewDelegate {

  var views = Set<UIScrollView>()

  init(views: [UIScrollView] = [UIScrollView]()) {
    self.views = Set(views)
    super.init()
    views.forEach{$0.delegate = self}
  }

  func add(view: UIScrollView) {
    view.delegate = self
    views.insert(view)
  }

  var previousContentOffset = CGPoint.zero

  func scrollViewDidScroll(_ scrollView: UIScrollView) {
    let contentOffset = scrollView.contentOffset
    for view in views {
      if view == scrollView {continue}
      view.contentOffset = contentOffset
    }
  }
}
