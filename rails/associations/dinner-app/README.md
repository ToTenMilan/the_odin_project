## dinner-app walkthrough

1. run `rails console`
2. create dinner host user `u = User.create(name: 'John')`
3. host a dinner by forst user `u.dinner.create(name: 'Sunday dinner')`
4. save first dinner in variable `d = Dinner.first`
5. create some guests for dinner `u2 = User.create(name: "Zoe")` and `u3 = User.create(name: "Joshua")`
6. invite guests to first dinner `d.guests = [u2, u3]`
7. test some methods:
* `u.invitations`
* `u.visited_dinners`
* `u.hosted_dinners`
* `d.invitations`
* `d.guests`
* `d.host`