# Classifieds
The application is composed of 2 main targets. A tracking target and a UI target that changes dynamically depending on the user's interaction. The content of the UI module is loaded from an external API of pixabay.com.

# How the app works
* First time users will see a welcome screen with a set of 6 fixed categories. A first time user is one that have not yet clicked any category within the app.
* Non-first time users will see on startup a page with the most viewed category in the history of that user and a button to go to the screen with all the categories. 
* Different categories come up as resized cells with a cell size depending on how many times the user has clicked on them.
* There is a maximum of 2 resized cells in the collection view
* The number of times a user visits a category is saved in a local SQLite Database.
* When user clicks one category, they are presented with a list of 12 images for that category, loaded from pixabay API.
* Each of the items can be selected to see the detailed view of it

Sometimes the Welcome screen might show a different favourite category than it is on the top of the list in the category list. This is happens when two categories have the same number of clicks hence both are "favourite".

# Screenshots

![Screenshot1][1]     ![Screenshot2][2]

![Screenshot3][3]     ![Screenshot4][4]





[1]: ./Screenshot1.png
[2]: ./Screenshot2.png
[3]: ./Screenshot3.png
[4]: ./Screenshot4.png
