# NavigationStackSampleApp
This is a SwiftUI demo app which showcases the use of `NavigationStack` with deeplinking in a common navigation setup.

<img width="1511" alt="Screenshot 2022-10-20 at 15 50 30" src="https://user-images.githubusercontent.com/17743607/196967263-f5aa40ba-3767-47a3-8017-35759abb31a3.png">

## Deep links 
The deep links are handled by `executeDeepLink(url: URL)` function in `Router` object. The deep links are firstly parsed from the URLs and then authorized by `DeepLinkAuthorizator`. There are multiple authorization levels defined by `DeepLinkAuthorizationLevel` enum. Each deep link can have a different authorization level defined by `NavigationRoute` protocol, in case the deep link authorization level is aligned with the application's state a `DeepLinkError.unathorized` is thrown.

On top of that the deep link path components can be combined recursivly like so 

`navigation://loremipsum.com/characters/character/1/character/2/character/1`.

I've also provided an example that uses not just the URL's path but also the query. This deep link has an authorization level `premiumUser`, so in order to test it you first need to go to settings/profile and enable premium. 

`navigation://loremipsum.com/characters/character/1?sheet=test`

### Valid deep link URL examples with respective authorization levels:
`none`
- navigation://loremipsum.com/onboarding
- navigation://loremipsum.com/onboarding/step1
- navigation://loremipsum.com/onboarding/step1/step2

`onboardingCompleted`
- navigation://loremipsum.com/login
- navigation://loremipsum.com/login/registration
- navigation://loremipsum.com/login/forgotpassword

`signedInUser`
- navigation://loremipsum.com/episodes
- navigation://loremipsum.com/episodes/episode/1
- navigation://loremipsum.com/episodes/episode/1/episode/2
- navigation://loremipsum.com/settings
- navigation://loremipsum.com/settings/profile
- navigation://loremipsum.com/characters
- navigation://loremipsum.com/characters/character/1
- navigation://loremipsum.com/characters/character/1/character/2

`premiumUser`
- navigation://loremipsum.com/characters/character/1/character/2?sheet=test
