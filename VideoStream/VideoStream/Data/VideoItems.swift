final class VideoItems {
    static let shared = VideoItems()

    let videoItems: [VideoItem] = [
        VideoItem(
            urlString: "http://d3rlna7iyyu8wu.cloudfront.net/skip_armstrong/skip_armstrong_multi_language_subs.m3u8",
            name: "Skip Armstrong",
            description: "Short film about the filmmaker Skip Armstrong.",
            type: .stream),
        VideoItem(
            urlString: "",
            name: "Trailer",
            description: "A new trailer for a movie.",
            type: .local),
        VideoItem(
            urlString: "",
            name: "Forest landscapes",
            description: "Looking at landscape clips filmed by a drone.",
            type: .local),
    ]
}
