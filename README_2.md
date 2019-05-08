
Andrew Sims and Seep Gulati

[Published Application](http://open-gallery.herokuapp.com)

[Github Repository](https://github.com/andrewcameronsims/opengallery)

Description of your project, including,

Problem definition / purpose
An online marketplace to connect visual artists and art-lovers. Our platform gives visual artists the opportunity not only to sell their works but also to set-up patronage relationships with art-lovers who can choose to “follow” them and be the first to see new works as they go up for sale. The products are original visual “pieces”(either painting, drawings, or sculpture) -- basically things that you would find in a gallery which has pieces for sale.


Functionality / features

Browse products


Screenshots


Tech stack (e.g. html, css, deployment platform, etc)



Instructions on how to setup, configure and use your App.


Design documentation including,
- Design process
- User stories

A workflow diagram of the user journey/s.

Wireframes

Database Entity Relationship Diagrams


Details of planning process including,
Project plan & timeline
Screenshots of Trello board(s)

## Short Answer Questions

### 5. Identify and describe the software to be used in your App.
Our application utilizes Ruby version '2.5.1'and following softwares: 

* Ruby on Rails provided us with a structure for our Ruby code,allowing us to launch application faster. 
* Visual Studio Code helped us in writing our source-code and supported debugging. 
* Ruby gems as a packet manager gave us access to various libraries and programs and easily manage the installation process.

Gem dependencies:

gem 'rails', '~> 5.2.3'
gem 'pg', '>= 0.18', '< 2.0' 
gem 'puma', '~> 3.11'  
gem 'sass-rails', '~> 5.0'
gem 'devise', '~> 4.6' 
gem 'cancancan', '~> 3.0'
gem 'faker', '~> 1.9'
gem 'aws-sdk-s3', '~> 1.36'
gem 'bootstrap', '~> 4.3'
gem 'jquery-rails', '~> 4.3'
gem 'stripe', '~> 4.16'
gem 'pry', '~> 0.12.2'
gem 'dotenv-rails', groups: %i[development test]
gem 'jbuilder', '~> 2.5'
gem 'coffee-rails', '~> 4.2'
gem 'turbolinks', '~> 5'
gem 'bootsnap', '>= 1.1.0'
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]

Our application is action-packed with authentication (Devise), authorization (CanCanCan), image uploading capablity through *third-party services (AWS), payment system (Stripe), transactional emails (Mailgun), filtering capablity images (API) and deployed on Heroku.
*Third-party applications are mentioned in detail on Answer 10.

### 9. Explain the different high-level components (abstractions) in your App.

The abstractions used in our application are as follows:
* Rails Active Record to interact with database (without writing SQL statements), allowing us to seamlessly treat a model as a Ruby object. This is extremely helpful for creating, retrieving, updating, and deleting objects without any query language to the database.
* Rails Action View form helpers help us in writing less lines of code.
* Resources method creates all standard RESTful actions, in few lines of code.
* Active Storage facilitates uploading files to a cloud storage service like Amazon S3 and attaching those files to Active Record objects.

### 10. Detail any third party services that your App will use.
Apart from the Ruby Gem depencies mentioned in question 5, our application 
* Mailgun - Provides the application with mailer functionlity. Buyers and Sellers recieve purchase invoices through emails.
* Stripe - Implements a payment system for our application by charging appropriate amount through credit card.
* Amazon web services - Provides on-demand cloud image storage services.
* Fontawesome - Provides icons for follower action.
* Bootstrap - Provides CSS support for styling.

### 14. Provide your database schema design.

* Attach new image

### 15. Provide User stories for your App.

User story 1:
As a User (role), 
I want to browse all the products.(action)
So that I can select and buy the piece I like. (business-goal/reasoning)



As a Artist (role)
I can add my piece.(action)
So that Users can buy it from the 





Artist can:
Add new pieces with fixed pricing
View entire pieces listing
Manage inventory and delivery
Update pieces
Delete pieces

Admin can:
Add artists
Block/unblock artists
Flag/unflag buyers
All functions






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
