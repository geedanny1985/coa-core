-- Adds playercreateinfo entries for race+class combinations present in CharBaseInfo.dbc
-- but absent from the table.  Causes: "error creating character" (CHAR_CREATE_ERROR) for
-- any affected combo because Player::Create() fails when GetPlayerInfo() returns nullptr.
--
-- Scope:
--   * Standard races 1-11: cross-faction class combos enabled by the CoA DBC patch.
--   * Custom races 99 (Drakkin) and 100 (Drakonid): classes 7 (Shaman) and 11 (Druid).
--   * Race 98 (Drakonid, Horde): intentionally disabled in 3_races_1.4.sql; not restored here.
--
-- Start positions match the existing entries for each race (pulled from playercreateinfo).

INSERT IGNORE INTO `playercreateinfo`
    (`race`, `class`, `map`, `zone`, `position_x`, `position_y`, `position_z`, `orientation`)
VALUES
    -- Race 1 (Human) — Elwynn Forest
    (1,  7, 0,  12,  -8949.95, -132.493,  83.5312, 0),
    (1, 11, 0,  12,  -8949.95, -132.493,  83.5312, 0),

    -- Race 2 (Orc) — Durotar
    (2,  2, 1,  14,  -618.518, -4251.67,  38.718,  0),
    (2,  5, 1,  14,  -618.518, -4251.67,  38.718,  0),
    (2, 11, 1,  14,  -618.518, -4251.67,  38.718,  0),

    -- Race 3 (Dwarf) — Dun Morogh
    (3,  9, 0,   1,  -6240.32,  331.033, 382.758, 6.17716),
    (3, 11, 0,   1,  -6240.32,  331.033, 382.758, 6.17716),

    -- Race 4 (Night Elf) — Teldrassil
    (4,  2, 1, 141,  10311.3,   832.463, 1326.41, 5.69632),
    (4,  7, 1, 141,  10311.3,   832.463, 1326.41, 5.69632),
    (4,  9, 1, 141,  10311.3,   832.463, 1326.41, 5.69632),

    -- Race 5 (Undead) — Tirisfal Glades
    (5,  7, 0,  85,  1676.71,  1678.31,  121.67,  2.70526),
    (5, 11, 0,  85,  1676.71,  1678.31,  121.67,  2.70526),

    -- Race 6 (Tauren) — Mulgore
    (6,  4, 1, 215,  -2917.58, -257.98,   52.9968, 0),
    (6,  5, 1, 215,  -2917.58, -257.98,   52.9968, 0),
    (6,  8, 1, 215,  -2917.58, -257.98,   52.9968, 0),
    (6,  9, 1, 215,  -2917.58, -257.98,   52.9968, 0),

    -- Race 7 (Gnome) — Dun Morogh
    (7,  2, 0,   1,  -6240.32,  331.033, 382.758, 0),
    (7,  3, 0,   1,  -6240.32,  331.033, 382.758, 0),
    (7,  7, 0,   1,  -6240.32,  331.033, 382.758, 0),
    (7, 11, 0,   1,  -6240.32,  331.033, 382.758, 0),

    -- Race 8 (Troll) — Durotar
    (8,  2, 1,  14,  -618.518, -4251.67,  38.718,  0),

    -- Race 10 (Blood Elf) — Tirisfal Glades (CoA cross-faction start)
    (10,  7, 0,  85,  1676.71,  1678.31,  121.67,  2.70526),
    (10, 11, 0,  85,  1676.71,  1678.31,  121.67,  2.70526),

    -- Race 11 (Draenei) — Teldrassil (CoA cross-faction start)
    (11,  4, 1, 141,  10311.3,   832.463, 1326.41, 5.69632),
    (11,  9, 1, 141,  10311.3,   832.463, 1326.41, 5.69632),
    (11, 11, 1, 141,  10311.3,   832.463, 1326.41, 5.69632),

    -- Race 99 (Drakkin, Alliance) — Teldrassil
    (99,  7, 1, 141,  10311.3,   832.463, 1326.41, 5.69632),
    (99, 11, 1, 141,  10311.3,   832.463, 1326.41, 5.69632),

    -- Race 100 (Drakonid, Alliance) — Teldrassil
    (100,  7, 1, 141,  10311.3,   832.463, 1326.41, 5.69632),
    (100, 11, 1, 141,  10311.3,   832.463, 1326.41, 5.69632);
