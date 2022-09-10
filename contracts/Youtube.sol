//SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.0;

contract YouTube {
    // declarinng the videocount 0 by default
    uint256 public videoCount = 0;
    // name of your contract
    string public name = "YouTube";
    // creating a mapping of videoCount to Video
    mapping(uint256 => Video) public videos;

    //  Create a struct called 'Video' with the following properties:
    struct Video {
        uint256 id:
        string hash;
        string title;
        string description;
        string location;
        string category;
        string thumbnailHash;
        string date;
        address author;
    }

    // Create a 'VideoUploaded' event that emits the properties of the video
    event VideoUploaded (
        uint256 id,
        string hash,
        string title,
        string description,
        string location,
        string category,
        string thumbnailHash,
        string date,
        address author
    );


    constructor() {}


    // function to upload a video
    function uploadVideo(
        string memory _videoHash,
        string memory _title,
        string memory _description,
        string memory _location,
        string memory _category,
        string memory _thumbnailHash,
        string memory _date
    ) public {
        // validating the video hash, title nad author's address
        require(bytes(_videoHash).length > 0);
        require(bytes(_title).length > 0);
        require(msg.sender != address(0));

        // incrementing the video count
        videoCount++;

        // adding the video to the contract
        videos[videoCount] = Video(
            videoCount,
            _videoHash,
            _title,
            _description,
            _location,
            _category,
            _thumbnailHash,
            _date,
            msg.sender
        );

        // triggering the event
        emit VideoUploaded(
            videoCount,
            _videoHash,
            _title,
            _description,
            _location,
            _category,
            _thumbnailHash,
            _date,
            msg.sender
        );
    }
}