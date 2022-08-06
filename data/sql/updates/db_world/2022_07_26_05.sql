-- DB update 2022_07_26_04 -> 2022_07_26_05
--
/*  Vile Familiar - GUID 4701  */


SET @NPC := 4701;
SET @PATH := @NPC * 10;

UPDATE `creature` SET `position_x` = -35.7399, `position_y` = -4228.09, `position_z` = 65.2618, `orientation` = 3.89663 WHERE `guid` = @NPC;

DELETE FROM `creature_addon` WHERE `guid` = @NPC;
INSERT INTO `creature_addon` (`guid`, `path_id`) VALUES (@NPC, @PATH);
UPDATE `creature` SET `MovementType` = 2 WHERE `guid` = @NPC;

DELETE FROM `waypoint_data` where `id` = @PATH;
INSERT INTO `waypoint_data` (`id`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `delay`) VALUES
(@PATH, 1, -35.7399, -4228.09, 65.2618, 100.0, 0),
(@PATH, 2, -25.1474, -4238.52, 68.0743, 100.0, 0),
(@PATH, 3, -28.5747, -4245.48, 68.4759, 100.0, 0),
(@PATH, 4, -23.6166, -4258.85, 66.6592, 100.0, 0),
(@PATH, 5, -35.6993, -4270.22, 66.894, 100.0, 0),
(@PATH, 6, -56.3938, -4280.35, 70.0308, 100.0, 0),
(@PATH, 7, -53.3781, -4302.13, 69.8885, 100.0, 0),
(@PATH, 8, -39.7387, -4310.99, 70.2738, 100.0, 0),
(@PATH, 9, -53.3781, -4302.13, 69.8885, 100.0, 0),
(@PATH, 10, -56.3938, -4280.35, 70.0308, 100.0, 0),
(@PATH, 11, -35.6993, -4270.22, 66.894, 100.0, 0),
(@PATH, 12, -23.6166, -4258.85, 66.6592, 100.0, 0),
(@PATH, 13, -28.5747, -4245.48, 68.4759, 100.0, 0),
(@PATH, 14, -25.1474, -4238.52, 68.0743, 100.0, 0),
(@PATH, 15, -35.7399, -4228.09, 65.2619, 100.0, 0),
(@PATH, 16, -49.5318, -4222.88, 62.2678, 100.0, 0);


/*  Vile Familiar - GUID 4705  */


SET @NPC := 4705;
SET @PATH := @NPC * 10;

UPDATE `creature` SET `position_x` = -152.718, `position_y` = -4264.43, `position_z` = 61.5234, `orientation` = 1.04177 WHERE `guid` = @NPC;

DELETE FROM `creature_addon` WHERE `guid` = @NPC;
INSERT INTO `creature_addon` (`guid`, `path_id`) VALUES (@NPC, @PATH);
UPDATE `creature` SET `MovementType` = 2 WHERE `guid` = @NPC;

DELETE FROM `waypoint_data` where `id` = @PATH;
INSERT INTO `waypoint_data` (`id`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `delay`) VALUES
(@PATH, 1, -152.718, -4264.43, 61.5234, 100.0, 0),
(@PATH, 2, -150.795, -4251.99, 59.8122, 100.0, 0),
(@PATH, 3, -140.417, -4234.24, 58.089, 100.0, 0),
(@PATH, 4, -127.943, -4230.0, 57.2045, 100.0, 0),
(@PATH, 5, -110.444, -4210.7, 54.7955, 100.0, 0),
(@PATH, 6, -96.4095, -4201.51, 51.431, 100.0, 0),
(@PATH, 7, -80.8383, -4204.42, 49.8348, 100.0, 0),
(@PATH, 8, -79.6806, -4223.97, 53.0284, 100.0, 0),
(@PATH, 9, -83.5118, -4242.02, 52.784, 100.0, 0),
(@PATH, 10, -96.4792, -4250.83, 51.9981, 100.0, 0),
(@PATH, 11, -83.5118, -4242.02, 52.784, 100.0, 0),
(@PATH, 12, -79.6806, -4223.97, 53.0284, 100.0, 0),
(@PATH, 13, -80.8383, -4204.42, 49.8348, 100.0, 0),
(@PATH, 14, -96.4095, -4201.51, 51.431, 100.0, 0),
(@PATH, 15, -110.265, -4210.5, 54.7808, 100.0, 0),
(@PATH, 16, -127.943, -4230.0, 57.2045, 100.0, 0),
(@PATH, 17, -140.286, -4234.02, 58.09, 100.0, 0),
(@PATH, 18, -150.776, -4251.96, 59.792, 100.0, 0),
(@PATH, 19, -152.797, -4264.3, 61.4815, 100.0, 0),
(@PATH, 20, -145.721, -4275.72, 63.287, 100.0, 0);

/*  Sen'jin Watcher - GUID 6401  */


SET @NPC := 6401;
SET @PATH := @NPC * 10;

UPDATE `creature` SET `position_x` = -820.061, `position_y` = -4892.82, `position_z` = 19.3183, `orientation` = 3.33843 WHERE `guid` = @NPC;

DELETE FROM `creature_addon` WHERE `guid` = @NPC;
INSERT INTO `creature_addon` (`guid`, `path_id`) VALUES (@NPC, @PATH);
UPDATE `creature` SET `MovementType` = 2 WHERE `guid` = @NPC;

DELETE FROM `waypoint_data` where `id` = @PATH;
INSERT INTO `waypoint_data` (`id`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `delay`) VALUES
(@PATH, 1, -820.061, -4892.82, 19.3183, 100.0, 0),
(@PATH, 2, -814.445, -4894.38, 19.1953, 100.0, 0),
(@PATH, 3, -810.197, -4898.55, 19.2201, 100.0, 0),
(@PATH, 4, -805.71, -4902.39, 19.3582, 100.0, 0),
(@PATH, 5, -800.273, -4902.95, 19.4798, 100.0, 0),
(@PATH, 6, -794.502, -4901.52, 19.5224, 100.0, 0),
(@PATH, 7, -791.733, -4902.05, 19.5467, 100.0, 0),
(@PATH, 8, -789.871, -4904.44, 19.5926, 100.0, 0),
(@PATH, 9, -790.881, -4909.7, 19.5959, 100.0, 0),
(@PATH, 10, -793.125, -4911.08, 19.5652, 100.0, 0),
(@PATH, 11, -798.939, -4909.47, 19.4492, 100.0, 0),
(@PATH, 12, -801.808, -4908.93, 19.3913, 100.0, 0),
(@PATH, 13, -804.86, -4909.7, 19.3525, 100.0, 0),
(@PATH, 14, -808.699, -4913.92, 19.2707, 100.0, 0),
(@PATH, 15, -811.502, -4919.28, 19.3742, 100.0, 0),
(@PATH, 16, -815.664, -4923.35, 19.5169, 100.0, 0),
(@PATH, 17, -821.037, -4926.27, 19.7472, 100.0, 0),
(@PATH, 18, -824.913, -4930.46, 20.2496, 100.0, 0),
(@PATH, 19, -825.216, -4933.02, 20.4924, 100.0, 0),
(@PATH, 20, -822.131, -4938.15, 20.9481, 100.0, 0),
(@PATH, 21, -822.812, -4941.48, 21.2641, 100.0, 0),
(@PATH, 22, -828.34, -4939.55, 21.1166, 100.0, 0),
(@PATH, 23, -831.006, -4931.77, 20.6677, 100.0, 0),
(@PATH, 24, -833.433, -4930.48, 20.7289, 100.0, 0),
(@PATH, 25, -835.654, -4928.46, 20.7985, 100.0, 0),
(@PATH, 26, -839.542, -4923.88, 20.6797, 100.0, 0),
(@PATH, 27, -840.869, -4921.56, 20.6249, 100.0, 0),
(@PATH, 28, -842.204, -4918.86, 20.5327, 100.0, 0),
(@PATH, 29, -842.497, -4916.01, 20.4017, 100.0, 0),
(@PATH, 30, -840.453, -4910.24, 20.1169, 100.0, 0),
(@PATH, 31, -838.588, -4907.94, 19.9559, 100.0, 0),
(@PATH, 32, -833.656, -4904.45, 19.8107, 100.0, 0),
(@PATH, 33, -831.472, -4902.45, 19.8099, 100.0, 0),
(@PATH, 34, -829.256, -4897.08, 19.89, 100.0, 0),
(@PATH, 35, -828.472, -4894.54, 19.858, 100.0, 0);


/*  Sen'jin Watcher - GUID 7318  */


SET @NPC := 7318;
SET @PATH := @NPC * 10;

DELETE FROM `creature_addon` WHERE `guid` = @NPC;
INSERT INTO `creature_addon` (`guid`, `path_id`) VALUES (@NPC, @PATH);
UPDATE `creature` SET `MovementType` = 2 WHERE `guid` = @NPC;

DELETE FROM `waypoint_data` where `id` = @PATH;
INSERT INTO `waypoint_data` (`id`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `delay`) VALUES
(@PATH, 1, -751.532, -4937.42, 22.0626, 1.39087, 0),
(@PATH, 2, -749.446, -4925.95, 21.7179, 1.40658, 0),
(@PATH, 3, -748.146, -4909.12, 21.6451, 1.53224, 0),
(@PATH, 4, -749.044, -4894.65, 21.3131, 1.80792, 0),
(@PATH, 5, -758.065, -4886.38, 20.7674, 2.42367, 0),
(@PATH, 6, -769.284, -4881.33, 20.2048, 2.81558, 0),
(@PATH, 7, -786.327, -4873.79, 19.3151, 2.69777, 0),
(@PATH, 8, -800.025, -4868.83, 19.0121, 2.81558, 0),
(@PATH, 9, -814.01, -4868.4, 19.1711, 3.05199, 0),
(@PATH, 10, -830.176, -4867.12, 20.0416, 3.19336, 0),
(@PATH, 11, -840.925, -4866.71, 20.9414, 3.11796, 0),
(@PATH, 12, -852.233, -4866.44, 20.6684, 3.11796, 0),
(@PATH, 13, -862.73, -4866.2, 19.5395, 3.11796, 0),
(@PATH, 14, -877.267, -4867.57, 15.675, 3.35358, 0),
(@PATH, 15, -889.625, -4876.12, 11.69, 4.09814, 0),
(@PATH, 16, -892.882, -4882.87, 10.4069, 4.41387, 0),
(@PATH, 17, -894.161, -4891.19, 9.9882, 4.72724, 0),
(@PATH, 18, -891.952, -4904.18, 11.096, 5.00292, 0),
(@PATH, 19, -887.942, -4917.59, 13.5855, 5.00292, 0),
(@PATH, 20, -885.714, -4929.01, 15.4245, 4.84505, 0),
(@PATH, 21, -884.325, -4939.42, 16.5051, 4.84505, 0),
(@PATH, 22, -882.937, -4949.83, 17.3169, 4.84505, 0),
(@PATH, 23, -881.758, -4958.38, 17.6026, 5.00292, 0),
(@PATH, 24, -877.399, -4967.48, 17.6634, 5.3964, 0),
(@PATH, 25, -869.496, -4975.38, 16.6692, 5.55427, 0),
(@PATH, 26, -860.011, -4982.71, 14.9847, 5.67208, 0),
(@PATH, 27, -852.52, -4987.43, 14.0936, 5.78989, 0),
(@PATH, 28, -840.341, -4990.7, 14.844, 6.18102, 0),
(@PATH, 29, -830.497, -4989.98, 15.4556, 0.13345, 0),
(@PATH, 30, -819.594, -4986.79, 16.2936, 0.369069, 0),
(@PATH, 31, -809.257, -4982.2, 17.4642, 0.446824, 0),
(@PATH, 32, -793.258, -4973.57, 18.1898, 0.486879, 0),
(@PATH, 33, -775.559, -4963.22, 20.2241, 0.564633, 0),
(@PATH, 34, -763.732, -4955.73, 21.347, 0.564633, 0),
(@PATH, 35, -757.087, -4948.8, 21.8513, 0.878007, 0),
(@PATH, 36, -750.98, -4940.85, 22.1672, 0.995817, 0);


/*  Sen'jin Watcher - GUID 7324  */


SET @NPC := 7324;
SET @PATH := @NPC * 10;

UPDATE `creature` SET `position_x` = -772.175, `position_y` = -4941.56, `position_z` = 36.863, `orientation` = 2.03416 WHERE `guid` = @NPC;

DELETE FROM `creature_addon` WHERE `guid` = @NPC;
INSERT INTO `creature_addon` (`guid`, `path_id`) VALUES (@NPC, @PATH);
UPDATE `creature` SET `MovementType` = 2 WHERE `guid` = @NPC;

DELETE FROM `waypoint_data` where `id` = @PATH;
INSERT INTO `waypoint_data` (`id`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `delay`) VALUES
(@PATH, 1, -772.175, -4941.56, 36.863, 100.0, 0),
(@PATH, 2, -774.724, -4940.84, 38.2501, 100.0, 0),
(@PATH, 3, -777.686, -4940.8, 38.2811, 100.0, 0),
(@PATH, 4, -779.612, -4942.97, 38.2811, 100.0, 0),
(@PATH, 5, -781.083, -4945.55, 38.2811, 100.0, 0),
(@PATH, 6, -786.085, -4947.83, 38.2811, 100.0, 0),
(@PATH, 7, -788.325, -4946.54, 38.2811, 100.0, 0),
(@PATH, 8, -789.578, -4943.82, 38.2811, 100.0, 0),
(@PATH, 9, -789.76, -4940.87, 38.2811, 100.0, 0),
(@PATH, 10, -784.81, -4937.9, 38.2811, 100.0, 0),
(@PATH, 11, -779.324, -4939.52, 38.2811, 100.0, 0),
(@PATH, 12, -776.578, -4940.72, 38.2811, 100.0, 0),
(@PATH, 13, -768.679, -4942.92, 34.9, 100.0, 0),
(@PATH, 14, -766.035, -4944.11, 33.9918, 100.0, 0),
(@PATH, 15, -763.665, -4945.41, 32.7905, 100.0, 0),
(@PATH, 16, -762.145, -4947.73, 31.7292, 100.0, 0),
(@PATH, 17, -762.604, -4953.17, 29.8729, 100.0, 0),
(@PATH, 18, -764.436, -4955.34, 29.2952, 100.0, 0),
(@PATH, 19, -767.039, -4956.27, 28.2648, 100.0, 0),
(@PATH, 20, -772.457, -4955.5, 26.0306, 100.0, 0),
(@PATH, 21, -779.579, -4952.01, 22.2463, 100.0, 0),
(@PATH, 22, -782.32, -4950.71, 22.2463, 100.0, 0),
(@PATH, 23, -786.267, -4947.33, 22.2463, 100.0, 0),
(@PATH, 24, -786.019, -4944.63, 22.2463, 100.0, 0),
(@PATH, 25, -781.034, -4943.89, 22.2463, 100.0, 0),
(@PATH, 26, -778.747, -4948.8, 22.2463, 100.0, 0),
(@PATH, 27, -777.972, -4951.7, 22.2463, 100.0, 0),
(@PATH, 28, -771.84, -4955.62, 26.2679, 100.0, 0),
(@PATH, 29, -769.283, -4956.47, 27.5535, 100.0, 0),
(@PATH, 30, -766.381, -4956.36, 28.4894, 100.0, 0),
(@PATH, 31, -763.87, -4955.03, 29.4397, 100.0, 0),
(@PATH, 32, -762.094, -4952.75, 30.1289, 100.0, 0),
(@PATH, 33, -761.814, -4947.37, 31.8481, 100.0, 0),
(@PATH, 34, -763.198, -4945.0, 32.8622, 100.0, 0),
(@PATH, 35, -768.301, -4942.61, 34.8163, 100.0, 0);

/*  Den Grunt - GUID 7656  */


SET @NPC := 7656;
SET @PATH := @NPC * 10;

UPDATE `creature` SET `position_x` = -600.043, `position_y` = -4342.45, `position_z` = 37.8159, `orientation` = 1.11138 WHERE `guid` = @NPC;

UPDATE `creature_addon` set `path_id` = @PATH WHERE `guid` = @NPC;
UPDATE `creature` SET `MovementType` = 2 WHERE `guid` = @NPC;

DELETE FROM `waypoint_data` where `id` = @PATH;
INSERT INTO `waypoint_data` (`id`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `delay`) VALUES
(@PATH, 1, -600.043, -4342.45, 37.8159, 100.0, 0),
(@PATH, 2, -599.399, -4324.38, 37.5988, 100.0, 0),
(@PATH, 3, -599.657, -4312.29, 37.5986, 100.0, 0),
(@PATH, 4, -599.869, -4298.37, 37.811, 100.0, 0),
(@PATH, 5, -599.768, -4307.47, 37.5992, 100.0, 0),
(@PATH, 6, -599.445, -4319.6, 37.5986, 100.0, 0),
(@PATH, 7, -599.705, -4334.79, 37.5988, 100.0, 0),
(@PATH, 8, -600.446, -4349.94, 38.131, 100.0, 0),
(@PATH, 9, -600.588, -4362.75, 38.8676, 100.0, 0),
(@PATH, 10, -601.845, -4378.2, 39.9664, 100.0, 0),
(@PATH, 11, -601.612, -4395.27, 42.6652, 100.0, 0),
(@PATH, 12, -600.024, -4410.47, 43.5231, 100.0, 0),
(@PATH, 13, -594.057, -4427.35, 42.4307, 100.0, 0),
(@PATH, 14, -579.457, -4457.44, 41.9763, 100.0, 0),
(@PATH, 15, -573.993, -4468.27, 42.2239, 100.0, 0),
(@PATH, 16, -570.217, -4476.48, 42.5183, 100.0, 0),
(@PATH, 17, -569.013, -4485.33, 42.566, 100.0, 0),
(@PATH, 18, -570.17, -4497.38, 42.5664, 100.0, 0),
(@PATH, 19, -578.906, -4511.47, 42.5098, 100.0, 0),
(@PATH, 20, -581.195, -4514.85, 42.4688, 100.0, 0),
(@PATH, 21, -572.172, -4501.6, 42.5659, 100.0, 0),
(@PATH, 22, -569.257, -4490.21, 42.5659, 100.0, 0),
(@PATH, 23, -569.142, -4481.09, 42.566, 100.0, 0),
(@PATH, 24, -571.964, -4472.59, 42.4032, 100.0, 0),
(@PATH, 25, -578.171, -4460.08, 41.9867, 100.0, 0),
(@PATH, 26, -583.786, -4448.55, 41.618, 100.0, 0),
(@PATH, 27, -589.919, -4434.83, 42.0238, 100.0, 0),
(@PATH, 28, -597.115, -4418.48, 43.1092, 100.0, 0),
(@PATH, 29, -600.253, -4403.03, 43.6641, 100.0, 0),
(@PATH, 30, -601.071, -4387.19, 41.4481, 100.0, 0),
(@PATH, 31, -600.667, -4370.0, 39.3044, 100.0, 0),
(@PATH, 32, -600.132, -4356.39, 38.4777, 100.0, 0);

/*  Clattering Scorpid - GUID 7953  */


SET @NPC := 7953;
SET @PATH := @NPC * 10;

DELETE FROM `creature_addon` WHERE `guid` = @NPC;
INSERT INTO `creature_addon` (`guid`, `path_id`) VALUES (@NPC, @PATH);
UPDATE `creature` SET `MovementType` = 2 WHERE `guid` = @NPC;

DELETE FROM `waypoint_data` where `id` = @PATH;
INSERT INTO `waypoint_data` (`id`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `delay`) VALUES
(@PATH, 1, -103.086, -4657.6, 33.6479, 100.0, 0),
(@PATH, 2, -85.3881, -4677.97, 32.5394, 100.0, 0),
(@PATH, 3, -81.7362, -4701.13, 30.2284, 100.0, 0),
(@PATH, 4, -70.1425, -4695.94, 30.9405, 100.0, 0),
(@PATH, 5, -59.5394, -4681.0, 33.771, 100.0, 0),
(@PATH, 6, -54.5816, -4677.98, 35.3588, 100.0, 0),
(@PATH, 7, -49.7002, -4676.23, 38.9528, 100.0, 0),
(@PATH, 8, -46.3046, -4673.13, 41.046, 100.0, 0),
(@PATH, 9, -44.1007, -4670.26, 41.0807, 100.0, 0),
(@PATH, 10, -44.0761, -4665.47, 38.7072, 100.0, 0),
(@PATH, 11, -44.3984, -4659.13, 35.8799, 100.0, 0),
(@PATH, 12, -40.1175, -4644.03, 36.3342, 100.0, 0),
(@PATH, 13, -34.7326, -4631.52, 40.2554, 100.0, 0),
(@PATH, 14, -33.4486, -4622.9, 43.117, 100.0, 0),
(@PATH, 15, -45.7339, -4611.2, 44.6652, 100.0, 0),
(@PATH, 16, -59.8055, -4613.19, 43.9173, 100.0, 0),
(@PATH, 17, -72.1956, -4616.84, 41.993, 100.0, 0),
(@PATH, 18, -82.2069, -4628.65, 38.7271, 100.0, 0),
(@PATH, 19, -89.89, -4632.09, 38.1229, 100.0, 0),
(@PATH, 20, -103.297, -4625.97, 39.8145, 100.0, 0),
(@PATH, 21, -112.51, -4623.24, 41.5492, 100.0, 0),
(@PATH, 22, -116.701, -4640.65, 36.011, 100.0, 0),
(@PATH, 23, -116.177, -4648.41, 34.4998, 100.0, 0);

/*  Dire Mottled Boar - GUID 8539  */


SET @NPC := 8539;
SET @PATH := @NPC * 10;

DELETE FROM `creature_addon` WHERE `guid` = @NPC;
INSERT INTO `creature_addon` (`guid`, `path_id`) VALUES (@NPC, @PATH);
UPDATE `creature` SET `MovementType` = 2 WHERE `guid` = @NPC;

DELETE FROM `waypoint_data` where `id` = @PATH;
INSERT INTO `waypoint_data` (`id`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `delay`) VALUES
(@PATH, 1, -214.372, -4845.64, 29.1291, 100.0, 0),
(@PATH, 2, -225.02, -4850.37, 30.6568, 100.0, 0),
(@PATH, 3, -235.224, -4854.72, 31.7916, 100.0, 0),
(@PATH, 4, -247.126, -4856.09, 31.6676, 100.0, 0),
(@PATH, 5, -256.584, -4848.05, 31.4637, 100.0, 0),
(@PATH, 6, -269.014, -4841.03, 32.0333, 100.0, 0),
(@PATH, 7, -289.34, -4837.1, 34.9092, 100.0, 0),
(@PATH, 8, -310.287, -4836.23, 39.2223, 100.0, 0),
(@PATH, 9, -320.813, -4838.24, 39.9581, 100.0, 0),
(@PATH, 10, -330.673, -4844.51, 40.5147, 100.0, 0),
(@PATH, 11, -333.401, -4850.53, 40.7722, 100.0, 0),
(@PATH, 12, -328.735, -4858.96, 40.7124, 100.0, 0),
(@PATH, 13, -321.563, -4868.14, 40.2101, 100.0, 0),
(@PATH, 14, -317.509, -4873.85, 39.4117, 100.0, 0),
(@PATH, 15, -306.572, -4879.36, 36.7733, 100.0, 0),
(@PATH, 16, -292.646, -4884.23, 33.3096, 100.0, 0),
(@PATH, 17, -280.699, -4884.3, 31.3057, 100.0, 0),
(@PATH, 18, -270.147, -4887.51, 29.426, 100.0, 0),
(@PATH, 19, -265.117, -4889.67, 28.3422, 100.0, 0),
(@PATH, 20, -252.422, -4898.02, 27.9178, 100.0, 0),
(@PATH, 21, -246.598, -4899.89, 27.4249, 100.0, 0),
(@PATH, 22, -239.562, -4898.45, 29.0681, 100.0, 0),
(@PATH, 23, -234.568, -4895.74, 29.3167, 100.0, 0),
(@PATH, 24, -226.236, -4890.71, 29.3149, 100.0, 0),
(@PATH, 25, -217.424, -4884.85, 29.7653, 100.0, 0),
(@PATH, 26, -211.227, -4871.29, 29.6777, 100.0, 0),
(@PATH, 27, -210.178, -4858.07, 29.221, 100.0, 0);

/*  Clattering Scorpid - GUID 10474  */


SET @NPC := 10474;
SET @PATH := @NPC * 10;

DELETE FROM `creature_addon` WHERE `guid` = @NPC;
INSERT INTO `creature_addon` (`guid`, `path_id`) VALUES (@NPC, @PATH);
UPDATE `creature` SET `MovementType` = 2 WHERE `guid` = @NPC;

DELETE FROM `waypoint_data` where `id` = @PATH;
INSERT INTO `waypoint_data` (`id`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `delay`) VALUES
(@PATH, 1, -406.087, -4716.63, 44.8804, 100.0, 0),
(@PATH, 2, -408.276, -4708.65, 45.1308, 100.0, 0),
(@PATH, 3, -409.576, -4703.31, 40.2804, 100.0, 0),
(@PATH, 4, -412.923, -4691.66, 39.5794, 100.0, 0),
(@PATH, 5, -419.728, -4679.76, 38.7276, 100.0, 0),
(@PATH, 6, -428.741, -4672.17, 37.967, 100.0, 0),
(@PATH, 7, -439.755, -4664.31, 40.0006, 100.0, 0),
(@PATH, 8, -456.36, -4658.33, 40.9741, 100.0, 0),
(@PATH, 9, -460.767, -4666.47, 39.0189, 100.0, 0),
(@PATH, 10, -467.21, -4674.15, 36.7182, 100.0, 0),
(@PATH, 11, -478.211, -4682.6, 38.8073, 100.0, 0),
(@PATH, 12, -489.172, -4689.26, 36.6404, 100.0, 0),
(@PATH, 13, -494.44, -4693.17, 36.7468, 100.0, 0),
(@PATH, 14, -482.252, -4697.46, 36.8586, 100.0, 0),
(@PATH, 15, -470.356, -4697.13, 38.0726, 100.0, 0),
(@PATH, 16, -455.515, -4698.51, 38.4622, 100.0, 0),
(@PATH, 17, -444.913, -4710.9, 37.4488, 100.0, 0),
(@PATH, 18, -433.46, -4722.15, 38.8961, 100.0, 0),
(@PATH, 19, -424.593, -4731.05, 40.0664, 100.0, 0),
(@PATH, 20, -415.99, -4737.86, 40.2052, 100.0, 0),
(@PATH, 21, -409.609, -4729.68, 41.9805, 100.0, 0),
(@PATH, 22, -406.009, -4721.75, 41.9123, 100.0, 0);


/*  Vile Familiar - GUID 12169  */


SET @NPC := 12169;
SET @PATH := @NPC * 10;

UPDATE `creature` SET `position_x` = -107.068, `position_y` = -4306.76, `position_z` = 62.6159, `orientation` = 6.04921 WHERE `guid` = @NPC;

DELETE FROM `creature_addon` WHERE `guid` = @NPC;
INSERT INTO `creature_addon` (`guid`, `path_id`) VALUES (@NPC, @PATH);
UPDATE `creature` SET `MovementType` = 2 WHERE `guid` = @NPC;

DELETE FROM `waypoint_data` where `id` = @PATH;
INSERT INTO `waypoint_data` (`id`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `delay`) VALUES
(@PATH, 1, -107.068, -4306.76, 62.6159, 100.0, 0),
(@PATH, 2, -124.8, -4318.37, 66.0147, 100.0, 0),
(@PATH, 3, -139.239, -4303.63, 66.1942, 100.0, 0),
(@PATH, 4, -143.22, -4283.83, 64.4553, 100.0, 0),
(@PATH, 5, -129.423, -4280.46, 64.745, 100.0, 0),
(@PATH, 6, -109.47, -4285.22, 63.7303, 100.0, 0),
(@PATH, 7, -94.2235, -4292.27, 60.9362, 100.0, 0);

/*  Clattering Scorpid - GUID 12264  */


SET @NPC := 12264;
SET @PATH := @NPC * 10;

UPDATE `creature` SET `position_x` = -121.162, `position_y` = -4709.15, `position_z` = 27.93, `orientation` = 0.263307 WHERE `guid` = @NPC;

DELETE FROM `creature_addon` WHERE `guid` = @NPC;
INSERT INTO `creature_addon` (`guid`, `path_id`) VALUES (@NPC, @PATH);
UPDATE `creature` SET `MovementType` = 2 WHERE `guid` = @NPC;

DELETE FROM `waypoint_data` where `id` = @PATH;
INSERT INTO `waypoint_data` (`id`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `delay`) VALUES
(@PATH, 1, -121.162, -4709.15, 27.93, 100.0, 0),
(@PATH, 2, -103.324, -4704.22, 28.4752, 100.0, 0),
(@PATH, 3, -91.8912, -4693.48, 30.4882, 100.0, 0),
(@PATH, 4, -98.0826, -4668.58, 32.5437, 100.0, 0),
(@PATH, 5, -108.558, -4659.12, 33.0813, 100.0, 0),
(@PATH, 6, -123.121, -4652.93, 33.8118, 100.0, 0),
(@PATH, 7, -137.574, -4653.24, 35.3335, 100.0, 0),
(@PATH, 8, -152.153, -4651.58, 37.4562, 100.0, 0),
(@PATH, 9, -167.803, -4649.81, 37.7494, 100.0, 0),
(@PATH, 10, -186.079, -4647.93, 38.5911, 100.0, 0),
(@PATH, 11, -188.795, -4657.63, 36.2397, 100.0, 0),
(@PATH, 12, -189.618, -4669.97, 33.4692, 100.0, 0),
(@PATH, 13, -198.707, -4679.42, 33.1351, 100.0, 0),
(@PATH, 14, -209.977, -4691.24, 32.6171, 100.0, 0),
(@PATH, 15, -217.987, -4698.61, 31.033, 100.0, 0),
(@PATH, 16, -221.252, -4706.95, 29.1452, 100.0, 0),
(@PATH, 17, -226.853, -4716.18, 29.2998, 100.0, 0),
(@PATH, 18, -228.244, -4721.6, 29.3076, 100.0, 0),
(@PATH, 19, -222.968, -4725.64, 29.6394, 100.0, 0),
(@PATH, 20, -217.048, -4728.59, 31.5374, 100.0, 0),
(@PATH, 21, -209.686, -4728.02, 32.0704, 100.0, 0),
(@PATH, 22, -196.465, -4727.24, 32.0757, 100.0, 0),
(@PATH, 23, -178.542, -4717.88, 31.7107, 100.0, 0),
(@PATH, 24, -175.455, -4698.0, 32.316, 100.0, 0),
(@PATH, 25, -153.919, -4700.8, 30.4153, 100.0, 0),
(@PATH, 26, -141.606, -4706.08, 28.791, 100.0, 0),
(@PATH, 27, -132.901, -4712.47, 27.927, 100.0, 0);

/*  Razormane Scout - GUID 12307  */


SET @NPC := 12307;
SET @PATH := @NPC * 10;

UPDATE `creature` SET `position_x` = 69.2959, `position_y` = -4609.61, `position_z` = 48.2853, `orientation` = 0.64357 WHERE `guid` = @NPC;

DELETE FROM `creature_addon` WHERE `guid` = @NPC;
INSERT INTO `creature_addon` (`guid`, `path_id`) VALUES (@NPC, @PATH);
UPDATE `creature` SET `MovementType` = 2 WHERE `guid` = @NPC;

DELETE FROM `waypoint_data` where `id` = @PATH;
INSERT INTO `waypoint_data` (`id`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `delay`) VALUES
(@PATH, 1, 69.2959, -4609.61, 48.2853, 100.0, 10000),
(@PATH, 2, 72.8356, -4591.06, 55.2529, 100.0, 0),
(@PATH, 3, 76.6362, -4578.17, 56.5297, 100.0, 0),
(@PATH, 4, 84.8748, -4572.65, 56.1986, 100.0, 0),
(@PATH, 5, 93.5395, -4567.38, 55.1739, 100.0, 0),
(@PATH, 6, 95.7022, -4560.2, 54.7452, 100.0, 0),
(@PATH, 7, 90.0297, -4556.16, 54.7916, 100.0, 0),
(@PATH, 8, 84.1164, -4557.37, 54.8289, 100.0, 0),
(@PATH, 9, 79.8056, -4559.84, 54.9896, 100.0, 0),
(@PATH, 10, 74.5471, -4569.52, 55.9016, 100.0, 0),
(@PATH, 11, 75.6316, -4575.49, 56.3877, 100.0, 0),
(@PATH, 12, 81.4626, -4576.27, 56.6136, 100.0, 0),
(@PATH, 13, 84.9299, -4571.12, 55.8428, 100.0, 0),
(@PATH, 14, 84.1083, -4562.97, 54.7466, 100.0, 0),
(@PATH, 15, 82.6289, -4555.58, 55.1128, 100.0, 0),
(@PATH, 16, 83.1458, -4551.12, 55.8152, 100.0, 0),
(@PATH, 17, 88.5177, -4548.67, 56.596, 100.0, 20000),
(@PATH, 18, 85.0209, -4556.79, 54.8304, 100.0, 0),
(@PATH, 19, 81.9841, -4566.79, 55.1042, 100.0, 0),
(@PATH, 20, 78.8213, -4577.88, 56.6008, 100.0, 0),
(@PATH, 21, 75.8794, -4588.68, 56.083, 100.0, 0),
(@PATH, 22, 72.7215, -4599.41, 52.3967, 100.0, 0);

/*  Dire Mottled Boar - GUID 12312  */


SET @NPC := 12312;
SET @PATH := @NPC * 10;

UPDATE `creature` SET `position_x` = -61.8657, `position_y` = -4828.86, `position_z` = 22.6982, `orientation` = 1.96017 WHERE `guid` = @NPC;

DELETE FROM `creature_addon` WHERE `guid` = @NPC;
INSERT INTO `creature_addon` (`guid`, `path_id`) VALUES (@NPC, @PATH);
UPDATE `creature` SET `MovementType` = 2 WHERE `guid` = @NPC;

DELETE FROM `waypoint_data` where `id` = @PATH;
INSERT INTO `waypoint_data` (`id`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `delay`) VALUES
(@PATH, 1, -61.8657, -4828.86, 22.6982, 100.0, 0),
(@PATH, 2, -74.1842, -4823.68, 23.4622, 100.0, 0),
(@PATH, 3, -83.4586, -4827.15, 23.5508, 100.0, 0),
(@PATH, 4, -91.9781, -4833.29, 23.7535, 100.0, 0),
(@PATH, 5, -103.712, -4841.91, 22.8193, 100.0, 0),
(@PATH, 6, -114.994, -4850.2, 21.4633, 100.0, 0),
(@PATH, 7, -126.212, -4858.57, 20.7062, 100.0, 0),
(@PATH, 8, -130.104, -4870.51, 20.677, 100.0, 0),
(@PATH, 9, -127.47, -4878.73, 21.0682, 100.0, 0),
(@PATH, 10, -118.877, -4883.74, 21.1563, 100.0, 0),
(@PATH, 11, -107.751, -4884.02, 20.3514, 100.0, 0),
(@PATH, 12, -99.2225, -4885.73, 18.9527, 100.0, 0),
(@PATH, 13, -83.4712, -4889.91, 17.615, 100.0, 0),
(@PATH, 14, -76.0254, -4891.22, 17.5674, 100.0, 0),
(@PATH, 15, -68.0709, -4887.69, 17.682, 100.0, 0),
(@PATH, 16, -60.9011, -4879.28, 18.6881, 100.0, 0),
(@PATH, 17, -58.3497, -4872.06, 20.4372, 100.0, 0),
(@PATH, 18, -55.5972, -4863.78, 20.8662, 100.0, 0),
(@PATH, 19, -54.8455, -4852.25, 21.3061, 100.0, 0),
(@PATH, 20, -56.5215, -4843.12, 22.1018, 100.0, 0);


/*  Razormane Scout - GUID 12316  */


SET @NPC := 12316;
SET @PATH := @NPC * 10;

DELETE FROM `creature_addon` WHERE `guid` = @NPC;
INSERT INTO `creature_addon` (`guid`, `path_id`) VALUES (@NPC, @PATH);
UPDATE `creature` SET `MovementType` = 2 WHERE `guid` = @NPC;

DELETE FROM `waypoint_data` where `id` = @PATH;
INSERT INTO `waypoint_data` (`id`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `delay`) VALUES
(@PATH, 1, 124.53, -4582.72, 63.7189, 100.0, 0),
(@PATH, 2, 133.618, -4582.61, 63.8564, 100.0, 0),
(@PATH, 3, 138.082, -4583.02, 62.9627, 100.0, 0),
(@PATH, 4, 141.923, -4585.0, 65.7188, 100.0, 0),
(@PATH, 5, 145.08, -4587.58, 64.9695, 100.0, 20000),
(@PATH, 6, 141.282, -4584.24, 65.4642, 100.0, 0),
(@PATH, 7, 137.239, -4583.36, 62.5436, 100.0, 0),
(@PATH, 8, 134.007, -4582.37, 63.8799, 100.0, 0),
(@PATH, 9, 123.97, -4582.68, 63.7515, 100.0, 0),
(@PATH, 10, 117.123, -4580.07, 62.112, 100.0, 0),
(@PATH, 11, 110.209, -4572.99, 57.9044, 100.0, 0),
(@PATH, 12, 102.608, -4566.32, 55.3204, 100.0, 20000),
(@PATH, 13, 110.348, -4573.89, 58.1059, 100.0, 0),
(@PATH, 14, 116.007, -4578.7, 61.2531, 100.0, 0),
(@PATH, 15, 121.21, -4582.27, 63.9267, 100.0, 0);

/*  Dire Mottled Boar - GUID 12943  */


SET @NPC := 12943;
SET @PATH := @NPC * 10;

UPDATE `creature` SET `position_x` = -200.386, `position_y` = -4883.89, `position_z` = 27.1407, `orientation` = 3.59203 WHERE `guid` = @NPC;

DELETE FROM `creature_addon` WHERE `guid` = @NPC;
INSERT INTO `creature_addon` (`guid`, `path_id`) VALUES (@NPC, @PATH);
UPDATE `creature` SET `MovementType` = 2 WHERE `guid` = @NPC;

DELETE FROM `waypoint_data` where `id` = @PATH;
INSERT INTO `waypoint_data` (`id`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `delay`) VALUES
(@PATH, 1, -200.386, -4883.89, 27.1407, 100.0, 0),
(@PATH, 2, -193.105, -4896.78, 25.5057, 100.0, 0),
(@PATH, 3, -187.962, -4899.92, 23.7865, 100.0, 0),
(@PATH, 4, -182.618, -4903.26, 19.2486, 100.0, 0),
(@PATH, 5, -170.129, -4906.9, 19.2486, 100.0, 0),
(@PATH, 6, -156.713, -4894.43, 19.5028, 100.0, 0),
(@PATH, 7, -146.434, -4884.93, 20.0447, 100.0, 0),
(@PATH, 8, -126.3, -4870.36, 21.0744, 100.0, 0),
(@PATH, 9, -129.568, -4853.1, 20.1477, 100.0, 0),
(@PATH, 10, -117.071, -4842.32, 21.1624, 100.0, 0),
(@PATH, 11, -103.254, -4835.31, 23.3766, 100.0, 0),
(@PATH, 12, -100.011, -4829.95, 23.8422, 100.0, 0),
(@PATH, 13, -105.703, -4815.96, 24.8568, 100.0, 0),
(@PATH, 14, -111.89, -4808.07, 25.1118, 100.0, 0),
(@PATH, 15, -123.375, -4813.62, 24.5666, 100.0, 0),
(@PATH, 16, -146.001, -4825.22, 23.1651, 100.0, 0),
(@PATH, 17, -153.565, -4838.05, 21.2692, 100.0, 0),
(@PATH, 18, -168.864, -4845.25, 20.7892, 100.0, 0),
(@PATH, 19, -182.876, -4852.28, 22.8461, 100.0, 0),
(@PATH, 20, -192.274, -4840.5, 25.7954, 100.0, 0),
(@PATH, 21, -196.924, -4835.91, 26.8833, 100.0, 0),
(@PATH, 22, -201.854, -4832.7, 24.8223, 100.0, 0),
(@PATH, 23, -209.203, -4836.12, 24.9899, 100.0, 0),
(@PATH, 24, -214.462, -4839.38, 27.5361, 100.0, 0),
(@PATH, 25, -223.442, -4846.79, 29.9977, 100.0, 0),
(@PATH, 26, -226.932, -4855.15, 31.4781, 100.0, 0),
(@PATH, 27, -218.524, -4863.81, 30.614, 100.0, 0),
(@PATH, 28, -206.247, -4873.63, 28.7488, 100.0, 0);

/*  Kul Tiras Marine - GUID 12998  */


SET @NPC := 12998;
SET @PATH := @NPC * 10;

UPDATE `creature` SET `position_x` = -230.719, `position_y` = -5125.15, `position_z` = 42.4774, `orientation` = 4.53786 WHERE `guid` = @NPC;

DELETE FROM `creature_addon` WHERE `guid` = @NPC;
INSERT INTO `creature_addon` (`guid`, `path_id`) VALUES (@NPC, @PATH);
UPDATE `creature` SET `MovementType` = 2 WHERE `guid` = @NPC;

DELETE FROM `waypoint_data` where `id` = @PATH;
INSERT INTO `waypoint_data` (`id`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `delay`) VALUES
(@PATH, 1, -230.719, -5125.15, 42.4774, 100.0, 0),
(@PATH, 2, -230.686, -5131.19, 45.7119, 100.0, 0),
(@PATH, 3, -229.064, -5132.69, 45.8029, 100.0, 0),
(@PATH, 4, -222.909, -5132.9, 49.2699, 100.0, 0),
(@PATH, 5, -221.358, -5132.17, 49.2699, 100.0, 0),
(@PATH, 6, -221.043, -5127.19, 49.2699, 100.0, 0),
(@PATH, 7, -224.449, -5124.92, 49.2699, 100.0, 0),
(@PATH, 8, -225.147, -5115.53, 49.3237, 100.0, 0),
(@PATH, 9, -224.832, -5124.48, 49.2703, 100.0, 0),
(@PATH, 10, -220.976, -5127.14, 49.2703, 100.0, 0),
(@PATH, 11, -221.009, -5131.62, 49.2703, 100.0, 0),
(@PATH, 12, -223.324, -5132.8, 49.2703, 100.0, 0),
(@PATH, 13, -229.317, -5132.73, 45.712, 100.0, 0),
(@PATH, 14, -230.802, -5130.94, 45.712, 100.0, 0),
(@PATH, 15, -230.745, -5125.24, 42.477, 100.0, 0),
(@PATH, 16, -229.071, -5123.85, 42.477, 100.0, 0),
(@PATH, 17, -221.9, -5124.38, 38.2719, 100.0, 0),
(@PATH, 18, -220.41, -5126.12, 38.2719, 100.0, 0),
(@PATH, 19, -220.741, -5128.71, 38.2719, 100.0, 0),
(@PATH, 20, -224.215, -5129.94, 38.2719, 100.0, 0),
(@PATH, 21, -231.927, -5129.92, 34.0668, 100.0, 0),
(@PATH, 22, -233.333, -5128.56, 34.0668, 100.0, 0),
(@PATH, 23, -232.741, -5126.2, 34.0668, 100.0, 0),
(@PATH, 24, -229.79, -5125.62, 34.0668, 100.0, 0),
(@PATH, 25, -228.711, -5122.72, 34.0653, 100.0, 0),
(@PATH, 26, -228.582, -5108.82, 34.0653, 100.0, 0),
(@PATH, 27, -228.8, -5098.57, 41.3473, 100.0, 0),
(@PATH, 28, -231.072, -5095.27, 41.3473, 100.0, 0),
(@PATH, 29, -235.625, -5093.99, 41.3473, 100.0, 0),
(@PATH, 30, -252.0, -5094.0, 41.3473, 100.0, 0),
(@PATH, 31, -232.244, -5094.07, 41.3473, 100.0, 0),
(@PATH, 32, -228.875, -5098.53, 41.3473, 100.0, 0),
(@PATH, 33, -228.729, -5108.67, 34.0658, 100.0, 0),
(@PATH, 34, -229.067, -5111.95, 34.0658, 100.0, 0),
(@PATH, 35, -234.399, -5112.87, 34.0658, 100.0, 0),
(@PATH, 36, -252.847, -5113.07, 34.0658, 100.0, 0),
(@PATH, 37, -231.446, -5112.98, 34.0658, 100.0, 0),
(@PATH, 38, -228.84, -5117.89, 34.0658, 100.0, 0),
(@PATH, 39, -228.85, -5124.55, 34.0658, 100.0, 0),
(@PATH, 40, -231.059, -5125.75, 34.0658, 100.0, 0),
(@PATH, 41, -233.287, -5126.61, 34.0658, 100.0, 0),
(@PATH, 42, -233.166, -5129.52, 34.0658, 100.0, 0),
(@PATH, 43, -231.672, -5129.95, 34.0669, 100.0, 0),
(@PATH, 44, -224.454, -5129.98, 38.2726, 100.0, 0),
(@PATH, 45, -221.865, -5129.24, 38.2726, 100.0, 0),
(@PATH, 46, -220.17, -5126.07, 38.2726, 100.0, 0),
(@PATH, 47, -221.888, -5124.38, 38.2719, 100.0, 0),
(@PATH, 48, -229.382, -5123.85, 42.4772, 100.0, 0);

/*  Clattering Scorpid - GUID 13002  */


SET @NPC := 13002;
SET @PATH := @NPC * 10;

UPDATE `creature` SET `position_x` = -327.766, `position_y` = -4760.08, `position_z` = 36.6491, `orientation` = 6.08023 WHERE `guid` = @NPC;

DELETE FROM `creature_addon` WHERE `guid` = @NPC;
INSERT INTO `creature_addon` (`guid`, `path_id`) VALUES (@NPC, @PATH);
UPDATE `creature` SET `MovementType` = 2 WHERE `guid` = @NPC;

DELETE FROM `waypoint_data` where `id` = @PATH;
INSERT INTO `waypoint_data` (`id`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `delay`) VALUES
(@PATH, 1, -327.766, -4760.08, 36.6491, 100.0, 0),
(@PATH, 2, -307.026, -4757.96, 36.3603, 100.0, 0),
(@PATH, 3, -286.811, -4756.11, 34.1922, 100.0, 0),
(@PATH, 4, -272.284, -4754.77, 34.1844, 100.0, 0),
(@PATH, 5, -265.5, -4753.05, 33.6913, 100.0, 0),
(@PATH, 6, -256.536, -4741.59, 32.2737, 100.0, 0),
(@PATH, 7, -256.426, -4725.89, 33.2756, 100.0, 0),
(@PATH, 8, -257.675, -4709.1, 34.2231, 100.0, 0),
(@PATH, 9, -260.288, -4699.09, 37.0144, 100.0, 0),
(@PATH, 10, -264.176, -4694.38, 38.3938, 100.0, 0),
(@PATH, 11, -269.589, -4690.96, 38.8834, 100.0, 0),
(@PATH, 12, -280.665, -4690.68, 39.2254, 100.0, 0),
(@PATH, 13, -291.292, -4693.17, 39.4739, 100.0, 0),
(@PATH, 14, -303.736, -4689.96, 41.9234, 100.0, 0),
(@PATH, 15, -311.884, -4690.42, 41.0454, 100.0, 0),
(@PATH, 16, -321.512, -4692.89, 40.3765, 100.0, 0),
(@PATH, 17, -337.345, -4696.95, 38.814, 100.0, 0),
(@PATH, 18, -347.369, -4707.03, 38.2411, 100.0, 0),
(@PATH, 19, -357.466, -4726.06, 38.4795, 100.0, 0),
(@PATH, 20, -361.583, -4734.52, 39.4971, 100.0, 0),
(@PATH, 21, -366.072, -4742.29, 38.7492, 100.0, 0),
(@PATH, 22, -369.61, -4747.54, 40.3396, 100.0, 0),
(@PATH, 23, -361.003, -4753.41, 37.5095, 100.0, 0),
(@PATH, 24, -345.576, -4759.72, 36.8648, 100.0, 0);



/*  Hexed Troll - GUID 13026  */


SET @NPC := 13026;
SET @PATH := @NPC * 10;

UPDATE `creature` SET `position_x` = -1138.31, `position_y` = -5597.88, `position_z` = 7.61002, `orientation` = 3.24477 WHERE `guid` = @NPC;

DELETE FROM `creature_addon` WHERE `guid` = @NPC;
INSERT INTO `creature_addon` (`guid`, `path_id`) VALUES (@NPC, @PATH);
UPDATE `creature` SET `MovementType` = 2 WHERE `guid` = @NPC;

DELETE FROM `waypoint_data` where `id` = @PATH;
INSERT INTO `waypoint_data` (`id`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `delay`) VALUES
(@PATH, 1, -1138.31, -5597.88, 7.61002, 100.0, 0),
(@PATH, 2, -1148.76, -5592.07, 8.36803, 100.0, 0),
(@PATH, 3, -1153.21, -5584.65, 8.89221, 100.0, 0),
(@PATH, 4, -1161.68, -5573.5, 8.47221, 100.0, 0),
(@PATH, 5, -1164.14, -5566.63, 8.27151, 100.0, 0),
(@PATH, 6, -1157.9, -5555.72, 7.68995, 100.0, 0),
(@PATH, 7, -1153.67, -5550.14, 7.69433, 100.0, 0),
(@PATH, 8, -1147.32, -5541.78, 7.18916, 100.0, 0),
(@PATH, 9, -1144.69, -5538.37, 7.33432, 100.0, 0),
(@PATH, 10, -1137.1, -5531.1, 6.45399, 100.0, 0),
(@PATH, 11, -1130.09, -5526.81, 7.79135, 100.0, 0),
(@PATH, 12, -1124.47, -5527.46, 8.42845, 100.0, 0),
(@PATH, 13, -1115.83, -5535.14, 8.6434, 100.0, 0),
(@PATH, 14, -1106.94, -5544.4, 7.6163, 100.0, 0),
(@PATH, 15, -1098.62, -5551.2, 9.11498, 100.0, 0),
(@PATH, 16, -1098.47, -5559.96, 8.45261, 100.0, 0),
(@PATH, 17, -1103.26, -5568.14, 7.54396, 100.0, 0),
(@PATH, 18, -1109.9, -5578.23, 7.82146, 100.0, 0),
(@PATH, 19, -1117.06, -5586.63, 8.32589, 100.0, 0),
(@PATH, 20, -1127.57, -5595.51, 7.71829, 100.0, 0);


/*  Vile Familiar - GUID 13062  */


SET @NPC := 13062;
SET @PATH := @NPC * 10;

UPDATE `creature` SET `position_x` = -154.199, `position_y` = -4357.06, `position_z` = 66.8175, `orientation` = 3.49807 WHERE `guid` = @NPC;

DELETE FROM `creature_addon` WHERE `guid` = @NPC;
INSERT INTO `creature_addon` (`guid`, `path_id`) VALUES (@NPC, @PATH);
UPDATE `creature` SET `MovementType` = 2 WHERE `guid` = @NPC;

DELETE FROM `waypoint_data` where `id` = @PATH;
INSERT INTO `waypoint_data` (`id`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `delay`) VALUES
(@PATH, 1, -154.199, -4357.06, 66.8175, 100.0, 0),
(@PATH, 2, -139.779, -4370.04, 66.2358, 100.0, 0),
(@PATH, 3, -132.177, -4361.44, 67.0957, 100.0, 0),
(@PATH, 4, -129.829, -4346.96, 66.2549, 100.0, 0),
(@PATH, 5, -127.669, -4337.69, 64.1934, 100.0, 0),
(@PATH, 6, -113.978, -4332.43, 65.8378, 100.0, 0),
(@PATH, 7, -95.8724, -4329.41, 64.5048, 100.0, 0),
(@PATH, 8, -78.0683, -4330.18, 66.9585, 100.0, 0),
(@PATH, 9, -69.2985, -4337.84, 67.894, 100.0, 0),
(@PATH, 10, -53.1216, -4331.94, 68.3126, 100.0, 0),
(@PATH, 11, -69.2985, -4337.84, 67.894, 100.0, 0),
(@PATH, 12, -78.0683, -4330.18, 66.9585, 100.0, 0),
(@PATH, 13, -95.8724, -4329.41, 64.5048, 100.0, 0),
(@PATH, 14, -113.978, -4332.43, 65.8378, 100.0, 0),
(@PATH, 15, -127.627, -4337.51, 64.1911, 100.0, 0),
(@PATH, 16, -129.829, -4346.96, 66.2549, 100.0, 0),
(@PATH, 17, -132.177, -4361.44, 67.0957, 100.0, 0),
(@PATH, 18, -139.779, -4370.04, 66.2358, 100.0, 0),
(@PATH, 19, -154.199, -4357.06, 66.8175, 100.0, 0),
(@PATH, 20, -162.918, -4360.37, 67.2569, 100.0, 0);
