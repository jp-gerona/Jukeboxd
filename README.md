# Jukeboxd

## What is Jukeboxd? 

It is your one-stop shop for everything vinyl. Whether you're a collector searching for that elusive record or a musician ready to press your latest masterpiece, Jukeboxd caters to all vinyl enthusiasts. Musicians can showcase and sell their music on this platform, reaching a passionate community of collectors who value the tangible experience of owning music. Jukeboxd supports all vinyl formats, from full-length albums to captivating EPs and collections of singles.

## Details regarding the creation of the website:

### 1. How to configure the project?

For you to start, you must have access to the project. Then, upon opening the project, you would be unable to access the site until you have established the database. To do so, you must find the "App_Data" folder and check for the database "mystore.mdf". Once you found the database, you would need to remove the folder with it and recreate the database in order for you to properly access it.

Once you have recreated the folder "App_Data" and database "mystore.mdf", you would need insert its contents through a new query and manually create four tables consisting of the accounts, records, cart, and orderlog. (Refer to the Jukeboxd-SQL-Statements.md file to insert the elements in the query).

### 2. How to run the project?

After inserting the elements/entities, you can proceed to open the asp file "home.aspx" to get started. Afterwards, once the home asp file is open on the screen, you may start the application using the option "ISS Express (Browser type)" to run the website.

### 3. Architecture of the project?

The overall structure is based on a website/e-commerce platform meant to sell a specific product for a target base of collectors and music-loving users. The website is split up into four sections that cover different retrievals and manipulation of the data. Jukeboxd features To handle users and handle integrity of the client's data, to publish and sell records based on specific interests, to allow the client to cart their orders and record purchases based on their activity. Then there are two types of users with different interfaces depending on the user. The first includes the admin account to handle both user accounts and artists' albums/records. Then the users can initially browse the site's homepage and search for anything of their interests. And are given the option to create an account to start purchasing. The code is ordered based on specific and organized data composed of the site's architecture. Including that of the Admin and Client type users that feature different prompts that are dependent on their type. The App_Code where specifically holds conditions and queries to hold the data of the users and manipulate the data to the database which is located in the App_Data folder.

In addition, the project has also separated instances such as the image resources of the site, scripts that handle the functionality of certain components of the site, and styles that shape the look of the website, inspired by the "new brutalism" style.

### 4. Features of the project?

Jukeboxd introduces several features that allow the customer to explore and find records of their interests. By browsing through the homepage, they would be able to things that they take an interest from. (Home)

<img src="https://github.com/cfd-alcantara/Jukeboxd/assets/154480145/0c66bcc9-c139-4a71-aee0-e26a3135261f" alt="1(1)" width="200"> 

Then they would be able to access the profile page where they would be first redirected to the login page to sign or enter the website using their created account. (Login/Signup)

<img src="https://github.com/cfd-alcantara/Jukeboxd/assets/154480145/da74abe9-6e11-4937-8919-5ac499bc2d62" alt="1(2)" width="200">
<img src="https://github.com/cfd-alcantara/Jukeboxd/assets/154480145/58565ed4-3717-45ce-ad1d-3ca631cddb41" alt="1(3)" width="200">
<img src="https://github.com/cfd-alcantara/Jukeboxd/assets/154480145/2b395143-aa98-416f-8079-ad3d379a0ce5" alt="1(4)" width="200">

Once the customer logs in, they may proceed to choose and add their product to their cart and checkout once they are done. (Product/Cart)

<img src="https://github.com/cfd-alcantara/Jukeboxd/assets/154480145/430625ca-93a5-473e-bf13-555830c1701f" alt="1(5)" width="200">
<img src="https://github.com/cfd-alcantara/Jukeboxd/assets/154480145/3d6423a7-3231-4784-b6cf-a3f8f58b7c9d" alt="1(6)" width="200">

On the other hand, the administrator would be greeted with an interface where they can access, add, and manipulate all of the products or records that our partnered companies provide, and handle all of the users through the database of the website. (Admin)

<img src="https://github.com/cfd-alcantara/Jukeboxd/assets/154480145/b25e401e-deef-4528-a620-64267793255e" alt="2(1)" width="200">
<img src="https://github.com/cfd-alcantara/Jukeboxd/assets/154480145/2ea1796e-2550-4968-a94d-c73b0939499c" alt="2(2)" width="200">
<img src="https://github.com/cfd-alcantara/Jukeboxd/assets/154480145/f1cf5e38-c8f4-48c2-a93f-2825de179253" alt="2(3)" width="200">
<img src="https://github.com/cfd-alcantara/Jukeboxd/assets/154480145/1f45e08f-4329-4f1f-a79e-750be34ab826" alt="2(4)" width="200">
<img src="https://github.com/cfd-alcantara/Jukeboxd/assets/154480145/be476c8d-23f2-4c41-b599-b009988d072a" alt="2(5)" width="200">


