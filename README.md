# Setup

This iOS app uses [CocoaPods](https://cocoapods.org/) for dependency management.
For convenience pods have been committed to this repo.
Open the project with the `TradeRev Code challenge.xcworkspace` file.  

# Notes

- This app is written using `Swift 3.3`.
- There are [unit tests](https://github.com/dma41683/mobile-coding-challenge/blob/master/TradeRev%20Code%20challenge/TradeRev%20Code%20challengeTests/TradeRev_Code_challengeTests.swift) that you can run.
- Unit test requires that the host application be set to `None` for the test target, else it will try to run the tests against live data (and fail!) instead of the mock data I have provided. The `Host Application` should already of been set to `None` for the `TradeRev Code challengeTests` target under `General`

# Mobile Developer Coding Challenge

This is a coding challenge for prospective mobile developer applicants applying through http://work.traderev.com/

## Goal:

#### Build simple app that allows viewing and interacting with a grid of curated photos from Unsplash

- [ ] Fork this repo. Keep it public until we have been able to review it.
- [ ] Android: _Java_ or _Kotlin_ | iOS: _Swift 3_
- [ ] Unsplash API docs are here: https://unsplash.com/documentation.
- [ ] Grid of photos should preserve the aspect ratio of the photos it's displaying, meaning you shouldn't crop the image in any way.
- [ ] Grid should work in both portrait and landscape orientations of the device.
- [ ] Grid should support pagination, i.e. you can scroll on grid of photos infinitely.
- [ ] When user taps on a photo on the grid it should show the photo in full screen with more information about the photo.
- [ ] When user swipes on a photo in full screen, it should show the the next photo and preserve current photos location on the grid, so when she dismisses the full screen, grid of photos should contain the last photo she saw.

### Evaluation:
- [ ] Solution compiles. If there are necessary steps required to get it to compile, those should be covered in README.md.
- [ ] No crashes, bugs, compiler warnings
- [ ] App operates as intended
- [ ] Conforms to SOLID principles
- [ ] Code is easily understood and communicative
- [ ] Commit history is consistent, easy to follow and understand
