-- SELECT - Uncover the mysteries hidden within the "tribe" database.
SELECT * FROM tribe;

-- UPDATE - Infuse the tribe with new vitality by replenishing their food stores.
UPDATE tribe SET food_supply = 'new_value' WHERE name = 'tribe_name';

-- DELETE - Exile the tribe's former leader from their sacred grounds.
DELETE FROM tribe WHERE name = 'exiled_leader';

-- INSERT INTO - Extend a warm welcome to fresh faces joining the tribe.
INSERT INTO shaman (name, tribe_id) VALUES ('new_shaman_name', 'tribe_id');

-- CREATE DATABASE - Forge the foundation of a new harmonious tribe in the vast landscape.
CREATE DATABASE IF NOT EXISTS friendly_tribe;

-- ALTER DATABASE - Bestow upon the tribe a legendary name that shall echo through the ages.
ALTER DATABASE tribe RENAME TO legendary_tribe;

-- CREATE TABLE - Summon mystical shamans into the tribe, each with unique powers.
CREATE TABLE IF NOT EXISTS shaman (
    id INTEGER PRIMARY KEY,
    name TEXT,
    tribe_id INTEGER,
    FOREIGN KEY (tribe_id) REFERENCES tribe(id)
);

-- ALTER TABLE - Enhance the shaman's capabilities by gifting them new magical abilities.
ALTER TABLE shaman ADD COLUMN new_magic_ability TEXT;

-- DROP TABLE - Let the tribe fade into the mists of history, leaving behind tales of their grandeur.
DROP TABLE tribe;
