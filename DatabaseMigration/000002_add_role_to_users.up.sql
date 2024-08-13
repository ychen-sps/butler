BEGIN;

CREATE TYPE enum_role AS ENUM (
        'kids',
        'parents',
        'admin'
);

ALTER TABLE users ADD COLUMN role enum_role;

COMMIT;
