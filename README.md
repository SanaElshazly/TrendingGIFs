# GIF Me
Latest trending GIFs using Giphy’s API

![image](https://user-images.githubusercontent.com/6953604/57995347-dad24180-7ac1-11e9-87ce-d6b1861aa3c0.png)

![](https://img.shields.io/badge/Swift-4.2-orange.svg)

A sample app created in Swift 4.2 showcasing loading, and a list of animated GIF images presented in UICollectionView. You can also click on the animated GIF to view it in a zoomed display.

## Architecture

Applying VIPER architecture, this allowed me to move some responsibility from the presenter to the Interactor. Leaving the presenter with UI events handling and preparing the data that comes from the Interactor to be displayed on the View. Then, the Interactor is only responsible for the business logic and fetching data from any source available. Taking into consideration that the view controller has a reference that conform routing protocols for the navigation logic and data passing between views. In VIPER architecture, communication between objects is based on protocols, which helps to create class spy to test the abstracted functionality for each layer.



![image](https://user-images.githubusercontent.com/6953604/57993716-79f33b00-7aba-11e9-9421-7144341990cd.png)

In VIPER, the communication between Interactor and Presenter, and View and Presenter is bidirectional.

## Running the App 

To run GIF Me app, follow these steps:
1. Check out this repo: `git clone https://github.com/SanaElshazly/TrendingGIFs.git`
2. Go to the terminal, go to podfile folder and write the command `pod install`
3. Build and run.

## Third Party Libraries

[Reusable](https://github.com/AliSoftware/Reusable): A swift mixin for reusing views easily and in a type-safe way.

[SDWebImage](https://github.com/SDWebImage/SDWebImage): Asynchronous image downloader as a UIImageView category, used for easily downloading and fetching the GIF animated images in the UICollectionView.

## GIFs Rendering

After exploring the Giphy API response and doing some research I came to a decision regarding which format to use to render the animated images. In the UICollectionView fetching, I decided to use the `preview_gif` image object, as it's limited to 50kb and it displays the first 1-2 seconds of the GIF, and hence, it's better for previewing purposes. 

When it comes to displaying the animated image in the second screen, I chose the `fixed_width` image object using the URL for GIF in .MP4 format from the property `mp4` . There is many reasons behind this decision, the first one that it was already mentioned in the API documentation this it's good for mobile use. The second reason is that even though animated GIFs are used mainly for short videos, they result in large files, heavy bandwidth utilization, slow loading times, and sub-optimal user experience. Also, resizing and manipulating animated GIFs to match the graphic design of your app might be a lengthy, cpu-intensive process, as it consists of dozens or even hundreds of frames being manipulated individually. So why not reduce the size of animated GIFs by using modern video formats instead? To conclude, I ended up choosing `MP4` format as I found it has the least size among all the other formats, this means that you save a big percentage of your bandwidth and load time, while showing the same animation to your users.


## Error Handling

I used the `Result Pattern` for error handling, means we have an enum with 2 cases, one for success with associated type, and one for failure with error type. In addition to using a switch statement to switch between the 2 cases, which allows powerful pattern matching, and ensures all possible results are covered.


## Todos
Some nice-to-haves to be implemented:
 - Write Unit Tests and UI Tests
 - Implement the prefetching UICollectionView API
