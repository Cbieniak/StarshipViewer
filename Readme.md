# iOS Code challenge

### Brief
Build a simple application that displays a collection of Star Wars starships and allows the
user to “favourite” the starships that appeal to them.

### Requirements
• Fetch a single page of data from the following API: https://swapi.dev/api/starships/
• Display the collection of starships. On this screen present 2+ properties for each entry
• Allow the user to click on a starship to view more details about it.
• Users should be able to “favourite” starships from both screens. Don’t worry about
• persistence across sessions (DB/SharedPrefs/etc); in-memory is fine. However
consider that the solution might be extended in the future to support this.
• Use any third-party libraries to help with your implementation
• Concise, understandable code. Try not to over-engineer, however the solution should
• be maintainable and production ready.
• Document any UX/UI/architecture/requirements assumptions.

### Considerations
• How does the user know which items have been favorited?
 - Blue star on detail and list view
• What order is the data displayed in? Can the user switch between different sort options?
 - Sorted as per the remote api, with the option to sort by name 
• How does the user navigate back and forth between the list of starships and a specific starship’s details?
 - Typical iOS navigation provided as a navigation stack
• What happens if an API call fails?
 - User is shown an error screen

### Assumptions

Starship details api provides no new data. So we don't make an additional call when the user visits details. This vastly simplifies the details screens by removing a point of failure. As well as saves the user time and resources that would be expended on an unneeded network request

The api data does not change often. This allows us to reduce the number of calls we make to the api, only doing so when the device has no data or has faced an error.



