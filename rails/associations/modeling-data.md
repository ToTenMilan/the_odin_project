## Project: [Warmup: Thinking Data First](https://www.theodinproject.com/courses/ruby-on-rails/lessons/associations?ref=lnav)

##### Lay out the data architecture you'd need to implement to build the following scenarios:

1. A site for pet-sitting (watching someone's pet while they're gone). People can babysit for multiple pets and pets can have multiple petsitters.

2. You like hosting people for dinner so you want to build a dinner party invitation site. A user can create parties, invite people to a party, and accept an invitation to someone else's party. [Working app](https://github.com/ToTenMilan/the_odin_project/blob/master/rails/associations/dinner-app) with set models and relations
---
### 1. Pet-sitting app
| pets | | |
--- | --- | ---
id | integer
name | string
phone_number | string
**has_many** | **:visits**
**has_many** | **:petsitters** | **through:** **:visits**

| visits | | |
--- | --- | ---
id | integer
pet_id | integer
petsitter_id | integer
visit_date | datetime
**belongs_to** | **:pet**
**belongs_to** | **:petsitter**


| petsitters | | |
--- | --- | ---
id | integer
name | string
phone_number | string
**has_many** | **:visits**
**has_many** | **:pets** | **through:** **:visits**
---

### 2. Dinner app
| dinners | | | |
--- | --- | --- | ---
id | integer
name | string | index
place | string
date | datetime
host_id | integer
**has_many** | **:invitations** | **foreign_key: :visited_dinner_id**
**has_many** | **:guests** | **through: :invitations** | **source: :guest**
**belongs_to** | **:host** | **class_name: 'User'**

| users | | | |
--- | --- | --- | ---
id | integer
name | string
email | string
**has_many** | **:invitations** | **foreign_key: :guest_id**
**has_many** | **:visited_dinners** | **through: :invitations**
**has_many** | **:hosted_dinners** | **foreign_key: :host_id** | **class_name: 'Dinner'**

| invitations | | | |
--- | --- | --- | ---
id | integer
guest_id | integer
visited_dinner_id | integer
**belongs_to** | **:guest** | **class_name: 'User'**
**belongs_to** | **:visited_dinner** | **class_name: 'Dinner'**