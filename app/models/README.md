## Models

![schema](/app/models/accountability_schema.png)

### User
- has username: must be unique
- has name
- has a password secured with bcrypt

### Session
- represents a single session where the user logs in and checks off boxes
- has many many checkoffs

### Item
- has text containing its value
- belongs to a user

### Checkoff
A datapoint for keeping track of a checked-off item
- belongs to a user
- belongs to an item
