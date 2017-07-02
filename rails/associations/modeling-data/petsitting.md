## Project: [Warmup: Thinking Data First](https://www.theodinproject.com/courses/ruby-on-rails/lessons/associations?ref=lnav)

##### Lay out the data architecture you'd need to implement to build the following scenarios:

1. A site for pet-sitting (watching someone's pet while they're gone). People can babysit for multiple pets and pets can have multiple petsitters.

2. You like hosting people for dinner so you want to build a dinner party invitation site. A user can create parties, invite people to a party, and accept an invitation to someone else's party.

##### 1. pet-sitting
---
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
