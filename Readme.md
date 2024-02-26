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
• What order is the data displayed in? Can the user switch between different sort
• options?
• How does the user navigate back and forth between the list of starships and a
specific starship’s details?
• What happens if an API call fails?

### Implementation/Ideas

Don't map all elements to allow flexibility in the API

In memory store backing favourites repository

iPad split view, iPhone push

Navigator

Accessibility action



