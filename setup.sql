-- One row per person with a northwindsupply account.
CREATE TABLE dbo.users (
    id          INT          NOT NULL PRIMARY KEY,  -- unique id for each user
    name        VARCHAR(100) NOT NULL,              -- the user's full name
    email       VARCHAR(255) NOT NULL UNIQUE,
    city        VARCHAR(100) NULL,
    state       CHAR(2)      NULL,
    signup_date DATE         NOT NULL
);

-- One row per order placed.
CREATE TABLE dbo.orders (
    id           INT           NOT NULL PRIMARY KEY, -- unique id for each order
    user_id      INT           NOT NULL,             -- who placed it -> users.id
    order_date   DATE          NOT NULL,
    status       VARCHAR(20)   NOT NULL,             -- shipped / pending / cancelled
    total_amount DECIMAL(10,2) NOT NULL,
    CONSTRAINT FK_orders_users FOREIGN KEY (user_id) REFERENCES dbo.users(id)
);
