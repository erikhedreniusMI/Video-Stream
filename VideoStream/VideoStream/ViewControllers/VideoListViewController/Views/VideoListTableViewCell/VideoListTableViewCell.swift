import UIKit

final class VideoListTableViewCell: UITableViewCell {
    @IBOutlet private var videoImageView: UIImageView!
    @IBOutlet private var titleLabel: UILabel!
    @IBOutlet private var descriptionLabel: UILabel!
    @IBOutlet private var tagContainerView: UIView!
    @IBOutlet private var tagLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()

        tagContainerView.layer.cornerRadius = 4
    }

    func configure(withVideoItem videoItem: VideoItem) {
        titleLabel.text = videoItem.name
        descriptionLabel.text = videoItem.description

        switch videoItem.type {
        case .stream:
            tagContainerView.backgroundColor = .blue
            tagLabel.text = "STREAM"
        case .local:
            tagContainerView.backgroundColor = .darkGray
            tagLabel.text = "LOCAL"
        }
    }
}
