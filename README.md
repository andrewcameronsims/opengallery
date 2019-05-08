# Open Gallery
## The Online Art Gallery
Andrew Sims and Seep Gulati

[Github Repository](https://github.com/andrewcameronsims/opengallery)

## 

## Short Answer Questions

### 1. What is the need (i.e., challenge) that you will be addressing in your project?

Many people desire to own an original piece of art that they can display in their home. 
In our project, we are providing an online venue for the purchase and sale of original
pieces of art.

### 2. Identify the problem you’re trying to solve by building this particular marketplace App? Why is it a problem that needs solving?

Even if the desire to purchase original artworks is widespread, there are artificial
barriers in place which prevent this. These barriers exist both on the side of purchase
and the side of sale. These partly have to do with the complex institutions which
surround this market, and partly to do with geographical limitations. For example,
the modish nature of gallerists and other players may exclude outsiders who have a
legitimate niche in the market. Likewise, the geographical limitations of brick-and-mortar
galleries may limit buyers to those who can visit those locations.

### 3. Describe the project will you be conducting and how. your App will address the needs.

Our application will lower traditional barriers to the purchase and sale of original
art, bypassing traditional gatekeepers and tastemakers such as gallerists, critics,
and curators. By using Open Gallery, artists will be able to strike out on their own
without having to come to terms with the baroque and difficult institutions of the
art-world, and the ease with which purchases can be made online will make owning 
original pieces of art an experience that is open to all. At the same time, this means 
that our platform ensures that a greater diversity of style is available on the market. 
We want there to be something for everyone.

### 4. Describe the network infrastructure the App may be based on.

We have deployed our app using the Heroku cloud service, which is a containerization
ecosystem. Heroku runs containers called *dynos* which package together an application
and all its dependencies. Dyno's don't themselves have a permanent filesystem for
storage and rely on a database for persisting data. The end user is able to use our
app through HTTP request-and-response cycles between the browser and the Heroku dynos.

### 5. Identify and describe the software to be used in your App.



### 6. Identify the database to be used in your App and provide a justification for your choice.

We are using a Postgresql relational database. The advantages of relational databases
are their reliabity, simplicity, and efficiency in processing queries. Furthermore,
relational databases are compatible with a wide range of different softwares for the
other abstraction layers (in this case, Rails).

### 7. Identify and describe the production database setup (i.e. postgres instance).

Postgresql is an open source implementation of the relational database architecture.
This is the database setup that we have been using in our production as well as our
development environments. This ensures consistency across those contexts. The Ruby gem
that is required to use this system is installed as a dependency in our Bundle file and
Heroku takes care of most of the details during deployment. Most of our interaction with the database is done through ActiveRecord.  We have occasionally needed
to reset and reseed the database remotely and this can be done by running
`heroku pg:reset DATABASE` and `heroku run rails db:seed` at the terminal.

### 8. Describe the architecture of your App.

Our application follows the standard Model-View-Controller (MVC) architecture.

### 9. Explain the different high-level components (abstractions) in your App.
### 10. Detail any third party services that your App will use.

* Mailgun
* Stripe
* AWS S3
* Ruby gems

### 11. Describe (in general terms) the data structure of marketplace apps that are similar to your own (e.g. eBay, Airbnb).

* Etsy database?

### 12. Discuss the database relations to be implemented.

* users
* workshops
* pieces
* followers

### 13. Describe your project’s models in terms of the relationships (active record associations) they have with each other.

* all workshops belong to a user
* all pieces belong to a workshop
* some pieces belong to a user
* all followers belong to a user and a workshop

### 14. Provide your database schema design.

* Attach image

### 15. Provide User stories for your App.

* Copy paste and proofread stories

### 16. Provide Wireframes for your App.

* Attach figma images

### 17. Describe the way tasks are allocated and tracked in your project.

* Attach images of Trello, slack and discuss git workflow

### 18. Discuss how Agile methodology is being implemented in your project.

* Daily standups
* Parallel development (not styling last) for MVP as soon as possible

### 19. Provide an overview and description of your Source control process.

* Typical git workflow

### 20. Provide an overview and description of your Testing process.

* Lots of manual testing, different monitors etc.

### 21. Discuss and analyse requirements related to information system security.

* Authenticity tokens to prevent CSRF
* Authorisation of user requests

### 22. Discuss methods you will use to protect information and data.

* Authentication and authorisation

### 23. Research what your legal obligations are in relation to handling user data.

In order to maximise the reach of our app, we have decided to make it GDPR compliant.
