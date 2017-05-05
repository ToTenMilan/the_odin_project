## Exercises from [Active Record Basics project](https://www.theodinproject.com/courses/ruby-on-rails/lessons/building-with-active-record). Data models are not yet tested in development

### Ex. 1. Online learning platform
##### You are building an online learning platform (much like this!). You've got many different courses, each with a title and description, and each course has multiple lessons. Lesson content consists of a title and body text.

| **courses** | | |
--- | --- | ---
id | integer
title | string | [present, unique]
description | text | [present, unique]
created_at | datetime
updated_at | datetime
| |
**has_many:** | **lessons**

| **lessons** | | |
--- | --- | ---
id | integer
title | string | [present, unique]
body | text | [present, unique]
course_id | integer | [present]
created_at | datetime
updated_at | datetime
| |
**belongs_to** | **course**

### Ex. 2 Profile tab
##### You are building the profile tab for a new user on your site. You are already storing your user's username and email, but now you want to collect demographic information like city, state, country, age and gender. Think -- how many profiles should a user have? How would you relate this to the User model?

| **users** | | |
--- | --- | ---
username | string | [present, unique, index, case insensitive]
email | string | [present, unique, index, email format, case insensitive]
| |
**has_one** | **:profile** |
**has_one** | **:city** | **through: :profiles**
**has_one** | **:state** | **through: :profiles**
**has_one** | **:country** | **through: :profiles**

| **profiles** | | |
--- | --- | ---
id | integer
age | integer | only_integers
gender | string
city_id | integer
state_id | integer
country_id | integer
user_id | integer
| |
**belongs_to** | **:user**
**belongs_to** | **:city**
**belongs_to** | **:state**
**belongs_to** | **:country**

| **cities** | | |
--- | --- | ---
id | integer
name | string | [present, chars 3-50, chars only, case insensitive]
||
**has_many** | **:profiles**
**has_many** | **:users** | **through: :profiles**

| **states** | | |
--- | --- | ---
id | integer
name | string | [present, chars 3-50, unique, chars only, case insensitive]
||
**has_many** | **:profiles**
**has_many** | **:users** | **through: :profiles**

| **countries** | | |
--- | --- | ---
id | integer
name | string | [present, chars 3-50, unique, chars only, case insensitive]
||
**has_many** | **:profiles**
**has_many** | **:users** | **through: :profiles**

### Ex. 3 Pinterestlike app
##### You want to build a virtual pinboard, so you'll have users on your platform who can create "pins". Each pin will contain the URL to an image on the web. Users can comment on pins (but can't comment on comments).

You want to build a virtual pinboard, so you'll have users on your platform who can create "pins". Each pin will contain the URL to an image on the web. Users can comment on pins (but can't comment on comments).

| users | | |
--- | --- | ---
id | integer
username | string | [present, unique, case insesitive]
email | string | [present, unique, case insensitive, email format]
||
**has_many** | **:comments**
**has_many** | **:pins**

| comments | | |
--- | --- | ---
id | integer
pin_id | integer
user_id | integer
body | text | [present, length >= 2]
**belongs_to** | **:user**
**belongs_to** | **:pin**

| pins | | |
--- | --- | ---
id | integer
user_id | integer
image | string | [present, url format]
||
**has_many** | **:comments**
**belongs_to** | **:user**

### Ex 4. Hacker News
##### You want to build a message board like Hacker News. Users can post links. Other users can comment on these submissions or comment on the comments. How would you make sure a comment knows where in the heirarchy it lives?


| users | | |
--- | --- | ---
id | integer
username | string | [present, unique, case insesitive]
email | string | [present, unique, case insensitive, email format]
||
**has_many** | **:links**
**has_many** | **:comments** | **through: :links**

| links | | |
--- | --- | ---
id | integer
link | string | [present, link format]
user_id | integer
||
**has_many** | **comments** | **as: :commentable**
**belongs_to** | **:user**


| comments | | |
--- | --- | ---
id | integer
body | text
commentable | references | [polymorphic, index]
||
**belongs_to** | **:commentable** | **polymorphic: true**
**has_many** | **:comments** | **as: :commentable**
**belongs_to** | **:user** | **through: :links**

