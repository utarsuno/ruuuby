CREATE TABLE generics {
    generic_id serial PRIMARY KEY,
    description VARCHAR(37) NOT NULL,
    created_on TIMESTAMP NOT NULL,
    last_accessed TIMESTAMP
};
