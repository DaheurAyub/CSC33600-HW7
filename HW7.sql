-- CSC 33600 - Homework 7
-- Question 2: Create the users table

CREATE TABLE users (
    user_ID VARCHAR(10) PRIMARY KEY,
    user_name VARCHAR(100) NOT NULL,
    user_email VARCHAR(255) NOT NULL UNIQUE,
    social_media_account_type VARCHAR(50),
    accountHandle VARCHAR(100) NOT NULL UNIQUE,
    profile_url VARCHAR(255)
);

-- Supporting table for locations

CREATE TABLE location (
    location_ID INT AUTO_INCREMENT PRIMARY KEY,
    location_name VARCHAR(255) NOT NULL
);

-- Question 3: Create the following table

CREATE TABLE following (
    following_ID INT AUTO_INCREMENT PRIMARY KEY,
    user_ID VARCHAR(10) NOT NULL,
    follower_ID VARCHAR(10) NOT NULL,
    FOREIGN KEY (user_ID) REFERENCES users(user_ID),
    FOREIGN KEY (follower_ID) REFERENCES users(user_ID),
    UNIQUE (user_ID, follower_ID),
    CHECK (user_ID <> follower_ID)
);

-- Question 4: Create the user_check_in table

CREATE TABLE user_check_in (
    check_in_ID INT AUTO_INCREMENT PRIMARY KEY,
    user_ID VARCHAR(10) NOT NULL,
    location_ID INT NOT NULL,
    FOREIGN KEY (user_ID) REFERENCES users(user_ID),
    FOREIGN KEY (location_ID) REFERENCES location(location_ID)
);

-- Question 7: Find users who have no check-ins

SELECT
    u.user_name,
    COUNT(DISTINCT f.follower_ID) AS total_followers
FROM users u
LEFT JOIN following f
    ON u.user_ID = f.user_ID
LEFT JOIN user_check_in uc
    ON u.user_ID = uc.user_ID
WHERE uc.user_ID IS NULL
GROUP BY u.user_ID, u.user_name
ORDER BY u.user_name ASC, total_followers DESC;
