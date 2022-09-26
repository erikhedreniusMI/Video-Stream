import UIKit

final class VideoListViewController: UIViewController {
    @IBOutlet private var tableView: UITableView!

    private let videoItems = VideoItems.shared.videoItems

    override func viewDidLoad() {
        super.viewDidLoad()

        setupTableView()
    }
}

private extension VideoListViewController {
    func setupTableView() {
        tableView.register(UINib(nibName: LocalConstants.videoListTableViewCell, bundle: nil), forCellReuseIdentifier: LocalConstants.videoListTableViewCell)
        tableView.delegate = self
        tableView.dataSource = self
    }
}

extension VideoListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        videoItems.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier:
            String(describing: VideoListTableViewCell.self))
            as? VideoListTableViewCell else { return UITableViewCell() }

        cell.selectionStyle = .none
        cell.configure(withVideoItem: videoItems[indexPath.row])

        return cell
    }
}

extension VideoListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let videoItem = VideoItems.shared.videoItems[indexPath.row]
        let videoViewController = VideoViewController(videoItem: videoItem)

        present(videoViewController, animated: true)
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return LocalConstants.cellHeight
    }
}

private extension VideoListViewController {
    struct LocalConstants {
        static let videoListTableViewCell: String = "VideoListTableViewCell"
        static let cellHeight: CGFloat = 180
    }
}
