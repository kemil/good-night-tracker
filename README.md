# Good Night Tracker

This app help users to track their sleep hours

## API Documentatios

### Users
Get all users  
```
GET /users
```
Get user detail, with followers, followings, and clocked in records
```
GET /users//:id

example: 
  {
    "id": 1,
    "name": "Jerry",
    "followers": [
        {
            "id": 2,
            "name": "Tom",
            "created_at": "2023-06-19T09:41:40.677Z",
            "updated_at": "2023-06-19T09:41:40.677Z"
        },
        {
            "id": 3,
            "name": "Joe",
            "created_at": "2023-06-19T09:41:40.680Z",
            "updated_at": "2023-06-19T09:41:40.680Z"
        }
    ],
    "followings": [],
    "clocked_ins": [
        {
            "id": 1,
            "start_date": "2023-06-18T09:41:40.690Z",
            "end_date": "2023-06-19T11:04:06.190Z",
            "duration": "1 day"
        },
        {
            "id": 5,
            "start_date": "2023-06-19T14:06:29.711Z",
            "end_date": "2023-06-19T15:38:43.237Z",
            "duration": "about 2 hours"
        }
    ],
    "url": "http://localhost:3000/users/1.json"
  }
```
Create new user
```
POST /users
```
Update existing user
```
PUT /users/:id
```
Follow a user
```
POST /users/:id/follow/:following_id
```
Unfollow a user
```
POST /users/:id/follow/:following_id
```
Delete a user
```
DELETE /users/:id
``` 

### Clocked In
Get all clocked In record
```
GET /clocked_ins
```
Get user detail, with related user and duration
```
GET /clocked_ins/:id

example:
  {
    "id": 4,
    "start_date": "2023-06-19T11:04:11.796Z",
    "end_date": "2023-06-19T14:02:00.075Z",
    "duration": "about 3 hours",
    "user_id": 3,
    "user": {
        "id": 3,
        "name": "Joe",
        "created_at": "2023-06-19T09:41:40.680Z",
        "updated_at": "2023-06-19T09:41:40.680Z"
    },
    "created_at": "2023-06-19T11:04:11.796Z",
    "updated_at": "2023-06-19T11:04:11.796Z",
    "url": "http://localhost:3000/clocked_ins/4.json"
  }
```
Create new locked in
```
POST /clocked_ins
```
Update existing locked in
```
PUT /clocked_ins/:id
```
Delete a locked in
```
DELETE /clocked_ins/:id
``` 
### Follow
Get all follow record
```
GET /follows
```
Get follow detail
```
GET /follows/:id
```
Create new follow
```
POST /follows
```
Update existing follow
```
PUT /follows/:id
```
Delete a follow
```
DELETE /follows/:id
``` 