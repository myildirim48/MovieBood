#  MovieBood
This is my app where i want to show what i know about iOS development. 
I use SwiftUI, MVVM-Repository, TMDB Database, Realm.

## Project Architecture

The app's architecture is MVVM + Repository Pattern. Let's see in a simple usage,
    
    View
        -> ViewModel
            -> Repository 
                    -> Service (RemoteService)
                        -> BaseService
                        
- **ViewModel**: Receives user actions from View and handles it. ViewModel holds the View's state. Interacts with repositories. 
- **Repository**: Gets data from RemoteService and converts it to UIModel then sends it to the ViewModel. 
- **RemoteService**: Gets data from remote and propagates it back to it's requester.


## Project Structure

| Folder        | Description                                                     |
|-------------------------|-------------------------------------------------------|
|**AppDelegateServices**|  Services that are dependent on AppDelegate will be defined here.|
|**DependencyInjections**| Dependency registrations will be defined here.|
|**Application**| Application specific classes will be defined here.|
|**Core**| Utility code that are not specific to this App will be defined here |

Structure of **Application** folder: 

| Folder        | Description                                                     |
|-------------------------|-------------------------------------------------------|
|**Network**| Anything related with remote connection and endpoints will be defined here.|
|**Modules**| Includes user faced part of the app. Mostly views.|
|**Data**| Includes all data integration classes. Also UIModels and back-end response models will be defined here.|

## List of Frameworks
| Dependency             | Description                                          |
|-------------------------|-------------------------------------------------------|
|**Resolver**| Dependency Injection / Service Locator framework|

## Gif 
 ![](https://github.com/myildirim48/MovieBood/blob/main/MovieBood.gif)
