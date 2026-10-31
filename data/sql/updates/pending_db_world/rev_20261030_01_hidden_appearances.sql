-- Hidden transmog: invisible item templates, one per wardrobe equipment slot (categories 1–14).
-- displayid=0 means no model; setting one of these as the active transmog hides that slot.
-- These items are never handed to players — the server injects them as always-collected
-- appearances in AscensionCompat.cpp::LoadPlayerState so every account sees them immediately.
SET NAMES utf8mb4;
START TRANSACTION;
INSERT IGNORE INTO `item_template`
    (`entry`, `class`, `subclass`, `SoundOverrideSubclass`, `name`, `displayid`, `Quality`,
     `BuyCount`, `InventoryType`, `AllowableClass`, `AllowableRace`, `ItemLevel`,
     `RequiredLevel`, `stackable`, `Material`, `sheath`, `VerifiedBuild`)
VALUES
    (9910001, 4,  0, -1, 'Ascension Hidden Head',     0, 4, 1,  1, -1, -1, 1, 1, 1, -1, 0, 12340),
    (9910002, 4,  0, -1, 'Ascension Hidden Shoulders', 0, 4, 1,  3, -1, -1, 1, 1, 1, -1, 0, 12340),
    (9910003, 4,  0, -1, 'Ascension Hidden Back',      0, 4, 1, 16, -1, -1, 1, 1, 1, -1, 0, 12340),
    (9910004, 4,  0, -1, 'Ascension Hidden Chest',     0, 4, 1,  5, -1, -1, 1, 1, 1, -1, 0, 12340),
    (9910005, 4,  0, -1, 'Ascension Hidden Tabard',    0, 4, 1, 19, -1, -1, 1, 1, 1, -1, 0, 12340),
    (9910006, 4,  0, -1, 'Ascension Hidden Shirt',     0, 4, 1,  4, -1, -1, 1, 1, 1, -1, 0, 12340),
    (9910007, 4,  0, -1, 'Ascension Hidden Wrists',    0, 4, 1,  9, -1, -1, 1, 1, 1, -1, 0, 12340),
    (9910008, 4,  0, -1, 'Ascension Hidden Hands',     0, 4, 1, 10, -1, -1, 1, 1, 1, -1, 0, 12340),
    (9910009, 4,  0, -1, 'Ascension Hidden Waist',     0, 4, 1,  6, -1, -1, 1, 1, 1, -1, 0, 12340),
    (9910010, 4,  0, -1, 'Ascension Hidden Legs',      0, 4, 1,  7, -1, -1, 1, 1, 1, -1, 0, 12340),
    (9910011, 4,  0, -1, 'Ascension Hidden Feet',      0, 4, 1,  8, -1, -1, 1, 1, 1, -1, 0, 12340),
    (9910012, 2, 19, -1, 'Ascension Hidden Ranged',    0, 4, 1, 26, -1, -1, 1, 1, 1,  2, 0, 12340),
    (9910013, 2,  1, -1, 'Ascension Hidden Mainhand',  0, 4, 1, 21, -1, -1, 1, 1, 1,  3, 0, 12340),
    (9910014, 2,  1, -1, 'Ascension Hidden Offhand',   0, 4, 1, 22, -1, -1, 1, 1, 1,  3, 0, 12340);
COMMIT;
