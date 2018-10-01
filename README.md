# FlickrSearch
Flickr search application written in Swift. This project searches for images using Flickr API and displays in 3 column grid and provides endless scrolling. The data is paginated and service takes care of fetching data from Flickr service. The application MVVM architecture.


## Task
Mobile app uses the Flickr image search API and shows the results in a 3-column scrollable view.
- The app must let users enter queries, such as "kittens".
- The app must support endless scrolling, automatically requesting and displaying more images when the user scrolls to the bottom of the view.
- Do not use third-party libraries. They should not be needed for a project of this scale and we want to make sure you are familiar with the basics. 


## Getting Started

- Clone the repo and run FlickrSearch.xcodeproj
- Create a Flickr API key and replace placeholder with key in FlickrConstants.swift
- Run the project and search for any keyword like "kittens".

|![SearchPhoto](/Screenshot1.png?raw=true "Search Photo")


##  Flickr API

Images are retrieved by hitting the [Flickr API](https://www.flickr.com/services/api/flickr.photos.search.html).
- Search Path: https://api.flickr.com/services/rest/?method=flickr.photos.search&api_key={fickr_api_key}&format=json&nojsoncallback=1&safe_search=1&per_page={page_size}&text={search_text}&page={page_num}
-Example: https://api.flickr.com/services/rest/?method=flickr.photos.search&api_key=a4f28588b57387edc18282228da39744&format=json&nojsoncallback=1&safe_search=1&per_page=60&text=kittens&page=1
- Response includes an array of photo objects, each represented as:
``` swift
{
"id": "43213681030",
"owner": "164058447@N08",
"secret": "a4bf8df905",
"server": "1937",
"farm": 2,
"title": "Puss under the boot",
"ispublic": 1,
"isfriend": 0,
"isfamily": 0
}
```

We use the farm, server, id, and secret to build the image path.
- Image Path: http://farm{farm}.static.flickr.com/{server}/{id}_{secret}.jpg
- Example: https://farm8.staticflickr.com/7564/15981410640_a0d5006167_m.jpg
- Response object is the image file


## Class Details

### FlickrSearch

This module consists of all files related to Flickr search and presenting on UI.  A single view that contains a UICollectionView to display the retrieved images in a three-column layout. It supports endless scrolling and automatically loads next pages when the user approaches the end of the current page. The search bar supports searching for multi-word phrases not only a single keyword. The view supports all orientations and uses that autolayout to arrange items inside the collection view.


#### Views
- **ViewControllers**: This module consists of primary class FlickrCollectionViewController which consists of collection view and search text field. It also encapsulates functionality like fetching, refreshing and searching. On fetching data it binds this data with viewmodel and hence render it.
- **ImageCollectionViewCell**: This is the view which is reused for displaying images fetched from service. It also renders image by downloading it asyncronously using ImageDownloadManager and also handles some important usecase like cancelling downloading while recycling.

#### ViewModels
- **FlickrViewModel**: This class represents data to be rendered in FlickrCollectionViewController. 
- **ImageModel**: ImageModel represents data to be rendered in collection view cells, this is been generated while views are recycled.

### Models
- **FlickrSearchResults**: This class represents the structure of response of every page from flicker service. Its is codable and hence used for parsing
- **FlickrPhoto**: This class represents the structure of pagination response of page from flicker service. Its is codable and hence used for parsing
- **Photos**: This model represents data related to images been rendered. It encapsultes all related info and hence generates url for fetching images

### Services
- **FlickrSearchService**: This service class is responsible for preparing the request, fetching and parsing respone for consecutive pages. It internally uses NetworkManager to perform the request. 


### NetworkManager

This module consists of classes related to network used to fetch the stream of data, request and reachability to check internet availability.

- **NetworkManager**: This class will be basically used to fetch data from server. It is used to fetch data using http protocol like GET, POST. Has 2 methods on which fetches data as Data type and Image. It takes a URL and retrieve a stream of data contained at this URL no matter what kind of data it is. The advantage of this abstraction is that many other modules in the app can use the same module to retrieve different kinds of data such as images, json ... etc
- **ImageDownloadManager**: This class is responsible for caching, queuing and fetching images from server. It is uses ImageDownloadOperation to fetch the data from server.
- **ImageDownloadOperation**: This class uses the NetworkManager class to download an image from Flickr API and returns the image object.


### UnitTests

This module consists XCTTest classes for testing. 
- **FlickrNetworkTests**: This class tests the network interactions for fetching image and data, and vallidating its consistency. UI testing is not done due to time constraints.
