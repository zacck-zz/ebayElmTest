# TreeBayIsaacOsiemo
Coding exercise during interview stages of Isaac Osiemo

Please pick one of the two exercises below, either the GO or Elm one. Please let us know via email to 
DL-eCG-DL-eCG-TreeBay-hiring@ebay.com when you're done. You can also use this address to ask questions if you need to.
All in all, you shouldn't need to spend more than a couple of hours on this.

Happy hacking!


#Go
Create a reverse proxy that changes the host, but also adds/changes a url parameter.
The host and url parameter should be configurable in a very simple way.
Setup your proxy to run inside a docker.

Remember to use proper software engineering principles like testing and writing concise, but readable code.
Also please document how to do a simple curl to your reverse proxy running in a docker, so that we can also do a manual test.

#Elm
Implement a search form for a subset of the Ebay API
https://developer.ebay.com/api-docs/buy/browse/resources/item_summary/methods/search
https://developer.ebay.com/api-docs/buy/static/ref-buy-browse-filters.html

We only require you to implement the following fields:
q: string -- A string consisting of one or more keywords that are used to search for items on eBay. The * character is not allowed.
sellerAccountType: {INDIVIDUAL} or {BUSINESS}
price: Both min and max are optional, but if one is filled in then the priceCurrency is required.
priceCurrency: USD, EUR, GBP, CAD, don't worry about all the other possible currencies.

All fields are optional except q, which is required.
When the search button is clicked the url should be updated to reflect the current state of the form.
Please do not do a search call to the ebay api, simply update the url.
We don't want to make this exercise too time consuming.
Remember to use proper software engineering principles like testing and writing concise, but readable code.
Bonus: Load the state from the url.
