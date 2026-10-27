# CSC 33600 — Homework 7

## Question 1: Relational Data Model (2NF)

### Entity Relationship Diagram

```mermaid
erDiagram
    USERS ||--o{ FOLLOWING : follows
    USERS ||--o{ FOLLOWING : has_followers
    USERS ||--o{ USER_CHECK_IN : makes
    LOCATION ||--o{ USER_CHECK_IN : contains

    USERS {
        VARCHAR user_ID PK
        VARCHAR user_name
        VARCHAR user_email
        VARCHAR social_media_account_type
        VARCHAR accountHandle
        VARCHAR profile_url
    }

    FOLLOWING {
        INT following_ID PK
        VARCHAR user_ID FK
        VARCHAR follower_ID FK
    }

    LOCATION {
        INT location_ID PK
        VARCHAR location_name
    }

    USER_CHECK_IN {
        INT check_in_ID PK
        VARCHAR user_ID FK
        INT location_ID FK
    }
}
```

### Primary Keys

* USERS: `user_ID`
* FOLLOWING: `following_ID`
* LOCATION: `location_ID`
* USER_CHECK_IN: `check_in_ID`

### Foreign Keys

* FOLLOWING.`user_ID` references USERS.`user_ID`.
* FOLLOWING.`follower_ID` references USERS.`user_ID`.
* USER_CHECK_IN.`user_ID` references USERS.`user_ID`.
* USER_CHECK_IN.`location_ID` references LOCATION.`location_ID`.

### Relationship Cardinalities

* One user can have multiple following relationships.
* One user can have multiple followers.
* One user can have multiple check-ins.
* One location can be associated with multiple check-ins.

The FOLLOWING table resolves the many-to-many relationship between users and users. USER_CHECK_IN resolves the many-to-many relationship between users and locations.
