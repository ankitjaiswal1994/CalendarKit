import UIKit

public class TimelineContainerController: UIViewController {
  lazy var timeline = TimelineView()
  lazy var container: TimelineContainer = {
    let view = TimelineContainer(timeline)
    view.addSubview(timeline)
    return view
  }()

  public override func loadView() {
    view = container
  }

  public override func viewDidLayoutSubviews() {
    super.viewDidLayoutSubviews()
    container.contentSize = timeline.frame.size
  }
}
