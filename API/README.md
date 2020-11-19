# API

A simple API for requesting different endpoints.

## Dog Breed Name List

Retrieves the available dog breed names

```swift
API.dogs.list(success: { response in
    print("\(response.breeds)")
}, error: {
    // Called on Error
})
```

## Dog Image List for Dog Name

Retrieves an image list based on a dog name.
Use `API.DogCeoImagesQueryParams(with: name)` to create query params.

It will result a Dog List.

```swift
let name = dogNames.first!
let params = API.DogCeoImagesQueryParams(with: name)
API.dogs.images(params, success: { response in
    print("\(response.first)")
}, error: {
    // Called on Error
})
```

## Random Dog Image for Dog Name

Retrieves an random image based on a dog name.
Use `API.DogCeoImagesQueryParams(with: name)` to create query params.

It will result a single Dog.

```swift
let name = dogNames.first!
let params = API.DogCeoImagesQueryParams(with: name)
API.dogs.randomImage(params, success: { response in
    print("\(response.breed)")
}, error: {
    // Called on Error
})
```
## Dog

This holds the results of the API queries.

### Instance Properties
 
 #### breed: String

Holds the breed name

#### imageURL: String

Holds the image url

#### image?: Data

Holds the image data.

### Instance Methods

#### fetchImage(success, error)

This will download the image from the `self.imageURL` url. It will return the data on success.
