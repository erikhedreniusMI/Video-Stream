import AVFoundation
import AVKit
import UIKit

final class VideoViewController: AVPlayerViewController {
    private let videoItem: VideoItem

    init(videoItem: VideoItem) {
        self.videoItem = videoItem

        super.init(nibName: String(describing: VideoViewController.self), bundle: nil)
    }

    required init?(coder: NSCoder) {
        return nil
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        guard let url = URL(string: videoItem.urlString) else {
            showError()
            return
        }

        player = AVPlayer(url: url)
        player?.play()
    }
}

private extension VideoViewController {
    func showError() {
        let alert = UIAlertController(title: LocalConstants.errorTitle, message: LocalConstants.errorMessage, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: LocalConstants.errorOk, style: .default, handler: { _ in
            self.dismiss(animated: true)
        }))

        present(alert, animated: true, completion: nil)
    }
}

private extension VideoViewController {
    struct LocalConstants {
        static let errorTitle: String = "Error"
        static let errorMessage: String = "Video could not be played"
        static let errorOk: String = "OK"
    }
}
