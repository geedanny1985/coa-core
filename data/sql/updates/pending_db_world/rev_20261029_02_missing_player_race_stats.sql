-- Populate player_race_stats for all custom CoA races.
--
-- Root cause: 1_world.sql uses a staging DB (coa_custom_stage) that was never applied
-- on fresh source builds, and 3_races_1.4.sql used chain-SELECT that depended on
-- intermediate custom races already being in the table. The result: every custom race
-- (9, 12-32, 47+) was missing, causing CHAR_CREATE_ERROR on character creation.
--
-- Sources for stat values:
--   Races 9, 12-31  : 1_world.sql player_race_stats_add VALUES
--   Race 32, 47-77  : 3_races_1.4.sql template-copy mappings (templates now inline)
--   Race 103        : 7_grummle.sql
--   Races 75, 78, 80-83, 85-87, 89-90, 97, 99-102, 104, 106-107, 109-110, 112:
--                     no source SQL found; faction inferred from playercreateinfo
--                     start zone; nearest canonical race used as template.
START TRANSACTION;

DELETE FROM `player_race_stats` WHERE `Race` IN (
    9, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31,
    32,
    47, 48, 49, 50, 51, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63,
    65, 66, 67, 68, 69, 70, 71, 72, 74, 75, 77, 78,
    80, 81, 82, 83, 85, 86, 87, 89, 90,
    97, 99, 100, 101, 102, 103, 104, 106, 107, 109, 110, 112
);

INSERT INTO `player_race_stats` (`Race`, `Strength`, `Agility`, `Stamina`, `Intellect`, `Spirit`) VALUES
-- Races 9, 12-31 (from 1_world.sql player_race_stats_add)
(9,  -5,  2, 0,  3,  0),
(12,  1,  2, 0, -4,  1),
(13, -4,  4, 0,  0,  0),
(14, -3,  2, 0,  3, -2),
(15,  5, -4, 1, -4,  2),
(16,  5, -4, 1, -1, -1),
(17,  5, -4, 1, -4,  2),
(18,  5, -4, 1, -1, -1),
(19, -5,  2, 0,  3,  0),
(20,  5, -4, 1, -4,  2),
(21, -4,  4, 0,  0,  0),
(22,  1, -3, 0,  0,  2),
(23,  3, -3, 1, -3,  2),
(24,  1,  2, 0, -4,  1),
(25,  1,  2, 0, -4,  1),
(26, -1, -2, 0, -2,  5),
(27,  5, -4, 1, -1, -1),
(28,  1,  2, 0, -4,  1),
(29,  5, -4, 1, -4,  2),
(30, -5,  2, 0,  3,  0),
(31, -5,  2, 0,  3,  0),
-- Race 32 (3_races_1.4.sql: copy Race=1 Human)
(32,  0,  0, 0,  0,  0),
-- Races 47-77 (3_races_1.4.sql template mappings, stats resolved from DB)
(47, -4,  4, 0,  0,  0),
(48,  5, -4, 1, -1, -1),
(49,  3, -3, 1, -3,  2),
(50,  5, -4, 1, -4,  2),
(51, -1, -2, 0, -2,  5),
(53,  3, -3, 1, -3,  2),
(54, -3,  2, 0,  3, -2),
(55,  3, -3, 1, -3,  2),
(56, -4,  4, 0,  0,  0),
(57, -5,  2, 0,  3,  0),
(58, -3,  2, 0,  3, -2),
(59, -3,  2, 0,  3, -2),
(60, -3,  2, 0,  3, -2),
(61, -4,  4, 0,  0,  0),
(62,  1, -3, 0,  0,  2),
(63, -3,  2, 0,  3, -2),
(65,  0,  0, 0,  0,  0),
(66,  5, -4, 1, -4,  2),
(67, -5,  2, 0,  3,  0),
(68,  5, -4, 1, -1, -1),
(69,  5, -4, 1, -1, -1),
(70, -4,  4, 0,  0,  0),
(71, -4,  4, 0,  0,  0),
(72, -3,  2, 0,  3, -2),
(74, -5,  2, 0,  3,  0),
(75, -4,  4, 0,  0,  0),
(77, -3,  2, 0,  3, -2),
(78,  0,  0, 0,  0,  0),
-- Races 80-112: faction from playercreateinfo start zone; template = nearest canonical race
(80,  0,  0, 0,  0,  0),
(81,  3, -3, 1, -3,  2),
(82,  0,  0, 0,  0,  0),
(83,  3, -3, 1, -3,  2),
(85, -4,  4, 0,  0,  0),
(86,  3, -3, 1, -3,  2),
(87,  3, -3, 1, -3,  2),
(89,  3, -3, 1, -3,  2),
(90, -1, -2, 0, -2,  5),
(97,  0,  0, 0,  0,  0),
(99, -4,  4, 0,  0,  0),
(100,-4,  4, 0,  0,  0),
(101,-1, -2, 0, -2,  5),
(102, 5, -4, 1, -4,  2),
(103,-5,  2, 0,  3,  0),
(104, 3, -3, 1, -3,  2),
(106, 5, -4, 1, -4,  2),
(107,-4,  4, 0,  0,  0),
(109,-4,  4, 0,  0,  0),
(110,-4,  4, 0,  0,  0),
(112, 5, -4, 1, -4,  2);

COMMIT;
