##### Plan out what data models you would need to allow users to be on the site (don't worry about login/logout or securing the passwords right now), to submit links ("posts"), and to comment on links. Users do NOT need to be able to comment on comments... each comment refers to a Post.

| users | | |
--- | --- | ---
id | integer
username | string
**has_many** | **:posts**
**has_many** | **:comments**

| posts | | |
--- | --- | ---
id | integer
link | string
user_id | integer
**belongs_to** | **:user**
**has_many** | **:comments**

| comments | | |
--- | --- | ---
id | integer
body | text
user_id | integer
post_id | integer
**belongs_to** | **:post**
**belongs_to** | **:user**
