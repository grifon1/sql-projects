--Q1. Create a table called stocks where you will be inserting your data.
--A1. First create the table and assign data type for each variable.  
CREATE TABLE IF NOT EXISTS stocks (
	datetime TEXT,
	symbol TEXT,
	name TEXT,
	price NUMERIC,
	volume NUMERIC,
	open NUMERIC,
	high NUMERIC,
	low NUMERIC
);

--Next, we add in the historical price data for our 10 stocks.
INSERT INTO stocks
VALUES (
'2022-08-22 00:00:00','AAPL','AAPL',167.57,69026810,169.69,169.86,167.14)
('2022-08-19 00:00:00','AAPL','AAPL',171.52,70346300,173.03,173.74,171.31),
('2022-08-18 00:00:00','AAPL','AAPL',174.15,62290080,173.75,174.9,173.12),
('2022-08-17 00:00:00','AAPL','AAPL',174.55,79542040,172.77,176.15,172.57),
('2022-08-16 00:00:00','AAPL','AAPL',173.03,56377050,172.78,173.71,171.66),
('2022-08-15 00:00:00','AAPL','AAPL',173.19,54091690,171.52,173.39,171.35),
('2022-08-12 00:00:00','AAPL','AAPL',172.1,68039380,169.82,172.17,169.4),
('2022-08-11 00:00:00','AAPL','AAPL',168.49,57149160,170.06,170.99,168.19),
('2022-08-10 00:00:00','AAPL','AAPL',169.24,70170540,167.68,169.34,166.9),
('2022-08-09 00:00:00','AAPL','AAPL',164.92,63135500,164.02,165.82,163.25),
('2022-08-08 00:00:00','AAPL','AAPL',164.87,60362340,166.37,167.81,164.2),
('2022-08-05 00:00:00','AAPL','AAPL',165.35,56696990,163.21,165.85,163),
('2022-08-04 00:00:00','AAPL','AAPL',165.81,55474140,166.01,167.19,164.43),
('2022-08-03 00:00:00','AAPL','AAPL',166.13,82507490,160.84,166.59,160.75),
('2022-08-02 00:00:00','AAPL','AAPL',160.01,59907030,160.1,162.41,159.63),
('2022-08-01 00:00:00','AAPL','AAPL',161.51,67829380,161.01,163.59,160.89),
('2022-07-29 00:00:00','AAPL','AAPL',162.51,101786900,161.24,163.63,159.5),
('2022-07-28 00:00:00','AAPL','AAPL',157.35,81378730,156.98,157.64,154.41),
('2022-07-27 00:00:00','AAPL','AAPL',156.79,78620690,152.58,157.33,152.16),
('2022-07-26 00:00:00','AAPL','AAPL',151.6,55138690,152.27,153.09,150.8),
('2022-07-25 00:00:00','AAPL','AAPL',152.95,53623950,154.01,155.04,152.28),
('2022-08-22 00:00:00','SBUX','SBUX',84.95,5915201,85.38,85.55,84.34),
('2022-08-19 00:00:00','SBUX','SBUX',86.92,4597726,87.77,87.97,86.55),
('2022-08-18 00:00:00','SBUX','SBUX',88.55,3428312,88.03,88.78,87.68),
('2022-08-17 00:00:00','SBUX','SBUX',88.35,3831252,88.4,89,87.86),
('2022-08-16 00:00:00','SBUX','SBUX',89.4,4580845,88.78,89.93,88.54),
('2022-08-15 00:00:00','SBUX','SBUX',89.16,5600991,88.11,89.25,88.01),
('2022-08-12 00:00:00','SBUX','SBUX',88.31,5153974,87.31,88.4,87.19),
('2022-08-11 00:00:00','SBUX','SBUX',87.27,5595696,86.94,87.55,86.5),
('2022-08-10 00:00:00','SBUX','SBUX',86.49,5072324,86.5,86.9,86.09),
('2022-08-09 00:00:00','SBUX','SBUX',84.84,3498395,85.74,85.83,84.46),
('2022-08-08 00:00:00','SBUX','SBUX',85.72,4885102,86.15,86.86,85.42),
('2022-08-05 00:00:00','SBUX','SBUX',85.73,4835081,85.76,86.15,84.92),
('2022-08-04 00:00:00','SBUX','SBUX',86.88,7086693,87.21,88.28,86.57),
('2022-08-03 00:00:00','SBUX','SBUX',87.27,12915670,86.01,87.97,83.91),
('2022-08-02 00:00:00','SBUX','SBUX',83.71,7254737,84.7,85.14,83.62),
('2022-08-01 00:00:00','SBUX','SBUX',84.91,7313697,84.19,85.59,84.03),
('2022-07-29 00:00:00','SBUX','SBUX',84.78,5802700,84.6,84.98,83.93),
('2022-07-28 00:00:00','SBUX','SBUX',84.67,5594602,83.19,84.89,82.82),
('2022-07-27 00:00:00','SBUX','SBUX',82.96,6372575,81.23,83.41,81.12),
('2022-07-26 00:00:00','SBUX','SBUX',80.31,6587009,81.22,81.42,80),
('2022-07-25 00:00:00','SBUX','SBUX',81.5,5861107,83.59,83.7,81.04),
('2022-08-22 00:00:00','MSFT','MSFT',277.75,25061070,282.08,282.46,277.22),
('2022-08-19 00:00:00','MSFT','MSFT',286.15,20570030,288.9,289.25,285.56),
('2022-08-18 00:00:00','MSFT','MSFT',290.17,17186190,290.19,291.91,289.08),
('2022-08-17 00:00:00','MSFT','MSFT',291.32,18253360,289.74,293.35,289.47),
('2022-08-16 00:00:00','MSFT','MSFT',292.71,18102880,291.99,294.04,290.42),
('2022-08-15 00:00:00','MSFT','MSFT',293.47,18085650,291,294.18,290.11),
('2022-08-12 00:00:00','MSFT','MSFT',291.91,22619680,288.48,291.91,286.94),
('2022-08-11 00:00:00','MSFT','MSFT',287.02,20065940,290.85,291.21,286.51),
('2022-08-10 00:00:00','MSFT','MSFT',289.16,24687850,288.17,289.81,286.94),
('2022-08-09 00:00:00','MSFT','MSFT',282.3,23405240,279.64,283.08,277.61),
('2022-08-08 00:00:00','MSFT','MSFT',280.32,18757820,284.05,285.92,279.32),
('2022-08-05 00:00:00','MSFT','MSFT',282.91,16774610,279.15,283.65,278.68),
('2022-08-04 00:00:00','MSFT','MSFT',283.65,18098670,281.8,283.8,280.17),
('2022-08-03 00:00:00','MSFT','MSFT',282.47,23518870,276.76,283.5,276.61),
('2022-08-02 00:00:00','MSFT','MSFT',274.82,22754180,276,277.89,272.38),
('2022-08-01 00:00:00','MSFT','MSFT',278.01,21539580,277.82,281.28,275.84),
('2022-07-29 00:00:00','MSFT','MSFT',280.74,32152750,277.7,282,276.63),
('2022-07-28 00:00:00','MSFT','MSFT',276.41,33459330,269.75,277.84,267.87),
('2022-07-27 00:00:00','MSFT','MSFT',268.74,45994050,261.16,270.05,258.85),
('2022-07-26 00:00:00','MSFT','MSFT',251.9,39347960,259.86,259.88,249.57),
('2022-07-25 00:00:00','MSFT','MSFT',258.83,21056000,261,261.5,256.81),
('2022-08-22 00:00:00','CSCO','CSCO',47.71,20534050,48.47,48.5,47.52),
('2022-08-19 00:00:00','CSCO','CSCO',48.7,23130410,49.01,49.46,48.54),
('2022-08-18 00:00:00','CSCO','CSCO',49.37,39999940,49.8,50,49.11),
('2022-08-17 00:00:00','CSCO','CSCO',46.66,27975610,46.36,47.1,46.23),
('2022-08-16 00:00:00','CSCO','CSCO',46.77,21153700,46.57,47.01,46.44),
('2022-08-15 00:00:00','CSCO','CSCO',46.59,15456070,46.39,46.62,46.03),
('2022-08-12 00:00:00','CSCO','CSCO',46.61,16967590,46.09,46.61,45.97),
('2022-08-11 00:00:00','CSCO','CSCO',45.9,15849320,46.11,46.43,45.77),
('2022-08-10 00:00:00','CSCO','CSCO',46.02,18935430,45.71,46.06,45.43),
('2022-08-09 00:00:00','CSCO','CSCO',44.92,12826330,45.15,45.18,44.72),
('2022-08-08 00:00:00','CSCO','CSCO',45.02,15466670,45.49,45.52,44.86),
('2022-08-05 00:00:00','CSCO','CSCO',45.01,19533920,44.91,45.07,44.54),
('2022-08-04 00:00:00','CSCO','CSCO',45.38,15249320,45.9,45.93,45.01),
('2022-08-03 00:00:00','CSCO','CSCO',45.71,14943770,44.9,45.82,44.79),
('2022-08-02 00:00:00','CSCO','CSCO',44.92,15005410,45.52,45.7,44.9),
('2022-08-01 00:00:00','CSCO','CSCO',45.28,14153360,45.06,45.43,44.76),
('2022-07-29 00:00:00','CSCO','CSCO',45.37,23701680,45.11,45.49,44.83),
('2022-07-28 00:00:00','CSCO','CSCO',45.62,17576190,44.88,45.87,44.71),
('2022-07-27 00:00:00','CSCO','CSCO',44.64,22348960,44.19,44.79,43.83),
('2022-07-26 00:00:00','CSCO','CSCO',43.83,19513030,44.37,44.54,43.75),
('2022-07-25 00:00:00','CSCO','CSCO',44.34,12954740,44.66,44.66,44.11),
('2022-08-22 00:00:00','QCOM','QCOM',141.61,6736816,145.3,145.81,141.1),
('2022-08-19 00:00:00','QCOM','QCOM',147.6,5400320,149.29,150.38,146.9),
('2022-08-18 00:00:00','QCOM','QCOM',151.38,7808233,148.07,152.91,147.76),
('2022-08-17 00:00:00','QCOM','QCOM',148.53,5169594,148.23,149.63,146.36),
('2022-08-16 00:00:00','QCOM','QCOM',150.03,5270822,151.45,152.49,148.85),
('2022-08-15 00:00:00','QCOM','QCOM',152.13,4502857,150.32,152.7,148.4),
('2022-08-12 00:00:00','QCOM','QCOM',151.29,4967492,148,151.47,147.18),
('2022-08-11 00:00:00','QCOM','QCOM',147.83,6243214,148.31,151.64,147.02),
('2022-08-10 00:00:00','QCOM','QCOM',146.99,6839997,145.85,147.18,143.69),
('2022-08-09 00:00:00','QCOM','QCOM',142.51,6770803,145.59,146.5,141.31),
('2022-08-08 00:00:00','QCOM','QCOM',147.81,5564307,149.81,151.19,146.55),
('2022-08-05 00:00:00','QCOM','QCOM',150.21,5041315,148.57,151.28,147.67),
('2022-08-04 00:00:00','QCOM','QCOM',151.01,6254693,148.68,151.16,147.71),
('2022-08-03 00:00:00','QCOM','QCOM',149.16,6890200,147.66,150.34,146.59),
('2022-08-02 00:00:00','QCOM','QCOM',147.03,5946415,145.69,149.4,144.84),
('2022-08-01 00:00:00','QCOM','QCOM',147.43,7611417,144.31,149.46,144.07),
('2022-07-29 00:00:00','QCOM','QCOM',145.06,11749400,144.6,145.31,140.67),
('2022-07-28 00:00:00','QCOM','QCOM',146.45,17050980,149.78,149.99,143),
('2022-07-27 00:00:00','QCOM','QCOM',153.42,12863030,151.53,154.8,150.55),
('2022-07-26 00:00:00','QCOM','QCOM',149.97,5941787,152.62,152.7,149.81),
('2022-07-25 00:00:00','QCOM','QCOM',153.25,4928925,152.8,154.04,151.67),
('2022-08-22 00:00:00','META','META',163.05,19499710,165.49,165.49,162.26),
('2022-08-19 00:00:00','META','META',167.96,26240800,170.2,172.32,167.05),
('2022-08-18 00:00:00','META','META',174.66,18844450,174.34,175.76,171.86),
('2022-08-17 00:00:00','META','META',174.85,20118130,176.76,178.14,174.17),
('2022-08-16 00:00:00','META','META',179.47,21156710,179.44,180.99,177.04),
('2022-08-15 00:00:00','META','META',180.89,15878670,178.96,181.44,178.2),
('2022-08-12 00:00:00','META','META',180.5,21274050,180.81,181.46,178.91),
('2022-08-11 00:00:00','META','META',177.49,24079060,179.71,183.1,176.37),
('2022-08-10 00:00:00','META','META',178.34,30262130,175.99,180.48,173.95),
('2022-08-09 00:00:00','META','META',168.53,18655060,168.95,169.53,166.6),
('2022-08-08 00:00:00','META','META',170.25,27299110,168,177.51,167.13),
('2022-08-05 00:00:00','META','META',167.11,25832700,166.99,171.61,165.8),
('2022-08-04 00:00:00','META','META',170.57,23938210,168.3,172.15,166.8),
('2022-08-03 00:00:00','META','META',168.8,31717530,162.69,169.54,161.57),
('2022-08-02 00:00:00','META','META',160.19,27374520,158.31,162.24,158.01),
('2022-08-01 00:00:00','META','META',159.93,40596700,157.25,165.19,155.23),
('2022-07-29 00:00:00','META','META',159.1,42065400,157.69,160.14,155.17),
('2022-07-28 00:00:00','META','META',160.72,73214330,161.06,161.51,154.85),
('2022-07-27 00:00:00','META','META',169.58,43846560,162.59,170.87,162.02),
('2022-07-26 00:00:00','META','META',159.15,28468420,165.94,166,157.95),
('2022-07-25 00:00:00','META','META',166.65,26166330,169,170.57,164.81),
('2022-08-22 00:00:00','AMZN','AMZN',133.22,50461500,135.72,136.32,132.85),
('2022-08-19 00:00:00','AMZN','AMZN',138.23,47792840,140.47,141.11,137.91),
('2022-08-18 00:00:00','AMZN','AMZN',142.3,37458740,141.32,142.77,140.38),
('2022-08-17 00:00:00','AMZN','AMZN',142.1,48149780,142.69,143.38,140.78),
('2022-08-16 00:00:00','AMZN','AMZN',144.78,59102860,143.91,146.57,142),
('2022-08-15 00:00:00','AMZN','AMZN',143.18,39014580,142.8,143.76,141.49),
('2022-08-12 00:00:00','AMZN','AMZN',143.55,47643480,142.05,143.57,140.12),
('2022-08-11 00:00:00','AMZN','AMZN',140.64,44867340,143.86,144.49,139.76),
('2022-08-10 00:00:00','AMZN','AMZN',142.69,54773820,142.9,144.6,141.01),
('2022-08-09 00:00:00','AMZN','AMZN',137.83,40434720,138.05,138.95,136.21),
('2022-08-08 00:00:00','AMZN','AMZN',139.41,52303480,142.05,144.23,138.29),
('2022-08-05 00:00:00','AMZN','AMZN',140.8,50686870,140.1,142.86,139.6),
('2022-08-04 00:00:00','AMZN','AMZN',142.57,70585020,140.58,143.56,139.55),
('2022-08-03 00:00:00','AMZN','AMZN',139.52,71827780,136.21,140.49,136.05),
('2022-08-02 00:00:00','AMZN','AMZN',134.16,61922430,134.72,137.44,134.09),
('2022-08-01 00:00:00','AMZN','AMZN',135.39,76846910,134.96,138.83,133.51),
('2022-07-29 00:00:00','AMZN','AMZN',134.95,148892900,134.9,137.65,132.41),
('2022-07-28 00:00:00','AMZN','AMZN',122.28,82245540,121.57,122.84,118.08),
('2022-07-27 00:00:00','AMZN','AMZN',120.97,61582020,117.31,121.9,117.16),
('2022-07-26 00:00:00','AMZN','AMZN',114.81,67075060,115.79,118.15,114.53),
('2022-07-25 00:00:00','AMZN','AMZN',121.14,50221260,122.7,123.64,120.03),
('2022-08-22 00:00:00','TSLA','TSLA',869.74,18614450,875.74,877.2,858.89),
('2022-08-19 00:00:00','TSLA','TSLA',890,20465130,897,901.08,877.5),
('2022-08-18 00:00:00','TSLA','TSLA',908.61,15833510,918,919.5,905.56),
('2022-08-17 00:00:00','TSLA','TSLA',911.99,22921990,910.19,928.97,900.1),
('2022-08-16 00:00:00','TSLA','TSLA',919.69,29378770,935,944,908.65),
('2022-08-15 00:00:00','TSLA','TSLA',927.96,29786390,905.36,939.4,903.69),
('2022-08-12 00:00:00','TSLA','TSLA',900.09,26552430,868.25,900.48,855.1),
('2022-08-11 00:00:00','TSLA','TSLA',859.89,23385020,889.54,894.71,857.5),
('2022-08-10 00:00:00','TSLA','TSLA',883.07,31639620,891.2,892.53,850.11),
('2022-08-09 00:00:00','TSLA','TSLA',850,28748230,870.88,877.19,838.06),
('2022-08-08 00:00:00','TSLA','TSLA',871.27,33121760,885,915.6,867.26),
('2022-08-05 00:00:00','TSLA','TSLA',864.51,37724300,908.01,913.82,856.63),
('2022-08-04 00:00:00','TSLA','TSLA',925.9,24085440,933,940.82,915),
('2022-08-03 00:00:00','TSLA','TSLA',922.19,26697040,915,928.65,903.45),
('2022-08-02 00:00:00','TSLA','TSLA',901.76,31859160,882.01,923.5,878),
('2022-08-01 00:00:00','TSLA','TSLA',891.83,39014300,903.83,935.63,885),
('2022-07-29 00:00:00','TSLA','TSLA',891.45,31770960,842.1,894.96,837.3),
('2022-07-28 00:00:00','TSLA','TSLA',842.7,28241000,840.2,849.9,818.4),
('2022-07-27 00:00:00','TSLA','TSLA',824.46,29370000,791.43,827.78,785.37),
('2022-07-26 00:00:00','TSLA','TSLA',776.58,22273590,799.54,801.93,768.79),
('2022-07-25 00:00:00','TSLA','TSLA',805.3,21357840,816.65,822.44,802.2),
('2022-08-22 00:00:00','AMD','AMD',92.84,61837280,94.4,95.02,92.36),
('2022-08-19 00:00:00','AMD','AMD',95.95,67221690,98.67,99.25,94.59),
('2022-08-18 00:00:00','AMD','AMD',100.44,76059520,97.74,101.07,96.73),
('2022-08-17 00:00:00','AMD','AMD',98.27,63735580,99.26,99.64,96.73),
('2022-08-16 00:00:00','AMD','AMD',100.2,60220670,100.84,101.45,98.32),
('2022-08-15 00:00:00','AMD','AMD',101.01,61327140,100.51,101.85,99.8),
('2022-08-12 00:00:00','AMD','AMD',100.83,72316350,99.2,101.4,98.48),
('2022-08-11 00:00:00','AMD','AMD',98.12,77516860,99.93,102.37,98),
('2022-08-10 00:00:00','AMD','AMD',99.05,83416120,98.45,99.35,95.61),
('2022-08-09 00:00:00','AMD','AMD',95.54,89473660,97.95,98.05,93.67),
('2022-08-08 00:00:00','AMD','AMD',100.07,92692590,100.06,101.8,97.99),
('2022-08-05 00:00:00','AMD','AMD',102.31,93859880,101.05,103.86,100.98),
('2022-08-04 00:00:00','AMD','AMD',103.91,125855800,97.5,104.59,97.26),
('2022-08-03 00:00:00','AMD','AMD',98.09,131142000,94.83,98.77,93.62),
('2022-08-02 00:00:00','AMD','AMD',99.29,116734100,95.71,100.92,95.36),
('2022-08-01 00:00:00','AMD','AMD',96.78,96477500,95.59,98.39,93.96),
('2022-07-29 00:00:00','AMD','AMD',94.47,76630710,90.7,94.81,90.56),
('2022-07-28 00:00:00','AMD','AMD',91.67,79009190,90.42,92.22,88.59),
('2022-07-27 00:00:00','AMD','AMD',89.82,78301560,86.94,90.62,86.29),
('2022-07-26 00:00:00','AMD','AMD',85.25,69180370,87,87.75,84.71),
('2022-07-25 00:00:00','AMD','AMD',87.54,70083010,86.57,87.6,85.12),
('2022-08-22 00:00:00','NFLX','NFLX',226.54,8630094,232.55,233.48,224.59),
('2022-08-19 00:00:00','NFLX','NFLX',241.16,7504707,240.95,243.29,235.68),
('2022-08-18 00:00:00','NFLX','NFLX',245.17,5280387,241.96,246.48,239.28),
('2022-08-17 00:00:00','NFLX','NFLX',241.15,5627224,241.18,244.24,237.56),
('2022-08-16 00:00:00','NFLX','NFLX',245.69,5136806,247.16,249.29,244.03),
('2022-08-15 00:00:00','NFLX','NFLX',249.11,6527391,248.11,251.99,247.51),
('2022-08-12 00:00:00','NFLX','NFLX',249.3,6098531,244.81,249.41,243.76),
('2022-08-11 00:00:00','NFLX','NFLX',242.7,8780062,244.68,251.62,241.51),
('2022-08-10 00:00:00','NFLX','NFLX',244.11,9254760,236.99,244.54,236.6),
('2022-08-09 00:00:00','NFLX','NFLX',229.94,6181194,231.62,232.2,224.65),
('2022-08-08 00:00:00','NFLX','NFLX',233.49,10997410,227.49,241.96,226.41),
('2022-08-05 00:00:00','NFLX','NFLX',226.78,5539733,225.3,228.62,222.87),
('2022-08-04 00:00:00','NFLX','NFLX',229.91,7142741,227.68,232.07,225.05),
('2022-08-03 00:00:00','NFLX','NFLX',226.73,6400701,224.79,228.1,222.42),
('2022-08-02 00:00:00','NFLX','NFLX',221.42,6361327,222.76,228.2,220.88),
('2022-08-01 00:00:00','NFLX','NFLX',226.21,5525044,223.1,228.39,221),
('2022-07-29 00:00:00','NFLX','NFLX',224.9,9064937,223.29,230.75,222.4),
('2022-07-28 00:00:00','NFLX','NFLX',226.02,8972738,224.6,228.1,219.67),
('2022-07-27 00:00:00','NFLX','NFLX',226.75,10508390,216.48,227.78,214.58),
('2022-07-26 00:00:00','NFLX','NFLX',213.91,9508532,216.66,219.39,211.64),
('2022-07-25 00:00:00','NFLX','NFLX',218.51,10935250,221.31,225.23,216.35);

--Q2. What are the distinct stocks in the table?
--A2. Apple, Starbucks, Microsoft, Cisco, Qualcomm, Meta, Amazon, Tesla, AMD, and Netflix
SELECT DISTINCT(symbol)
FROM stocks;

--Q3. Query all data for a single stock. Do you notice any overall trends?
--A3. Apple stock is trending steadily upwards in price. From July 25th through August 22nd, the average stock price was $165.41. 
--    The Maximum price during a trade day was 176.15. The Minimum price during a trade day was $150.80.
SELECT * FROM stocks
WHERE symbol = "AAPL"
ORDER BY datetime desc;

SELECT * FROM stocks
WHERE symbol = "AAPL"
ORDER BY price desc;

SELECT 
	ROUND(AVG(price), 2) AS 'Avg Price' ,
	MAX(high) AS 'Max Price' , 
	MIN(low) AS 'Lowest Price' FROM stocks
WHERE symbol = "AAPL";

--Q4. Which rows have a price above 100? Between 40 to 50, etc.?
--A4.All stocks except Starbucks, Cisco, and AMD had stock prices greater than 100. 
-----Cisco had stock prices mainly between 40 and 50 dollars. Tesla was the only stock that had prices greater than $500 per share.
SELECT datetime, symbol, price FROM stocks
WHERE price > 100;

SELECT datetime, symbol, price FROM stocks
WHERE price < 100;

SELECT datetime, symbol, price FROM stocks
WHERE price BETWEEN 40 AND 50;

SELECT datetime, symbol, price FROM stocks
WHERE price > 500;


--Q5. Sort the table by price. What are the minimum and maximum prices?
--A5. The highest price between July 25th and August 22nd was on August 15th with Tesla's stock priced at $927.96 per share.
------The lowest price between July 25th and August 22nd was on July 26th with Cisco's stock price at $43.83 per share.
SELECT * FROM stocks
ORDER BY price desc
LIMIT 1;

SELECT * FROM stocks
ORDER BY price asc
LIMIT 1;

--Q6. Explore using aggregate functions to look at key statistics about the data (eg. min, max, average)
--A6. This is a start, but it doesn't tell us much about these stocks unless they are separated from each other using a group by function.
SELECT MAX(price) FROM stocks;
SELECT MIN(price) FROM stocks;
SELECT AVG(price) FROM stocks;
SELECT SUM(volume) FROM stocks;

--Q7. Group the data by stock and repeat. How do the stocks compare to each other?
--A7. Aggregating data by stock, we see that Tesla, Microsoft, and Netflix have the top 3 stock prices during the time period.
------Cisco, Starbucks, and AMD are the bottom 3 stock prices during the time period.
------AMD, Apple, and Amazon had the top 3 stock volume sold during the time period, while Starbucks, Qualcomm, and Netflix had the bottom 3 stock volume sold.
SELECT MAX(price), symbol FROM stocks
GROUP BY symbol
ORDER BY MAX(price) desc;

SELECT MIN(price), symbol FROM stocks
GROUP BY symbol
ORDER BY MIN(price) asc;

SELECT ROUND(AVG(price),2) AS 'Avg Price', symbol FROM stocks
GROUP BY symbol
ORDER BY AVG(price) desc;

SELECT SUM(volume), symbol FROM stocks
GROUP BY symbol
ORDER BY SUM(volume) desc;



--Q8. Group the data by day or hour of day. Does day of week or time of day impact prices?
--A8. The highest average price occurred on Friday, on average, during the 21 trading days between July 25th and August 22nd. 
------This price was $226.32. Wednesday and Thursday's prices were less than $1 away from the Friday price
------The lowest average price occurred on Tuesday at $219.94.

--This query shows  the average price across all 21 trading days-worth of data. But we do not have day of the week here.
SELECT datetime, AVG(price) FROM stocks
GROUP BY datetime
ORDER BY datetime desc;
--We use strftime to extract the day of the week from our datetime string to see if prices are higher on, say, Monday, than on Friday.
SELECT 
	strftime('%w', datetime) AS 'Weekday', 
	ROUND(AVG(price),2) AS 'Avg Daily Price' 
FROM stocks
GROUP BY strftime('%w', datetime)
ORDER BY strftime('%w', datetime);


--Q9. Which of the rows have a price greater than the average of all prices in the dataset?
--A9. An embedded select statement in the where function lets us show only data where the price is higher than the overall average price.
SELECT * FROM stocks
WHERE price > (SELECT AVG(price) FROM stocks)
ORDER BY price desc;


--Q10.1 In addition to the built-in aggregate functions, explore ways to calculate other key statistics about the data, such as the median or variance.
--A10.1a This way ranks the price in order, giving them a percent rank. 
--------In a table with an even number of rows, you would need to take the average of the two values that border 0.50.
--------Here, you will see that rows 105 and 106 are below and above the .50 mark, respectively. Therefore, you would add the two prices and divide by 2 to calculate the median
SELECT symbol, 
price, 
PERCENT_RANK() OVER(
	ORDER BY price
) LENGTHPERCENTRANK
FROM stocks;


--A10.1b This is a more automated way of finding out the median, but you need to change the number in the commented section based on whether the number of values in your table is odd or even.
SELECT AVG(price)
FROM (SELECT price
	FROM stocks
	ORDER BY price
	--Change number after % if Row count is odd = 1, Row count is even = 2
	LIMIT (2 - (SELECT COUNT(*) FROM stocks) % 2) 
	OFFSET (SELECT (COUNT(*) - 1) / 2
			FROM stocks));
			
			
--Q10.2 Calculating Variance
--Unable to calculate std deviation (which is just the square root of variance) because we lack the sqrt function in SQLite. Can possibly add it by using a compile-time function SQLITE_ENABLE_MATH_FUNCTIONS
SELECT SUM((price-(SELECT AVG(price) FROM stocks)) *
			(price-(SELECT AVG(price) FROM stocks)) ) / (COUNT(price)-1) AS variance --Remove the -1 if calculating population variance. Leave it if doing sample variance.
FROM stocks;
--A10.2. Variance for the overall stock price of this sample of stocks is 52244.76
--------Used n-1 formula because this is a sample of stocks data, not a complete population containing ALL data.


--Q11. Refactor the data in 2 tables - stock_info to store general info about the stock itself (i.e. symbol, name) 
--and stock_prices to store the collected data on price (i.e. symbol, datetime, price).
CREATE TABLE IF NOT EXISTS stock_info AS 
SELECT symbol, name
FROM stocks;

--Data carried over from the main table had many multiple duplicates of stock names, so we need to clean them up. 
DELETE FROM stock_info
WHERE rowid NOT IN (
	SELECT MIN(rowid)
	FROM stock_info
GROUP BY symbol);

--stock_prices has all the pricing data, but no company identifier besides the stock symbol.
CREATE TABLE IF NOT EXISTS stock_prices AS 
SELECT symbol, datetime, price, volume, open, high, low
FROM stocks;


--Adding in names to stock symbols
UPDATE stock_info
SET name = "Apple"
WHERE symbol = "AAPL";

UPDATE stock_info
SET name = "Starbucks"
WHERE symbol = "SBUX";

UPDATE stock_info
SET name = "Microsoft"
WHERE symbol = "MSFT";

UPDATE stock_info
SET name = "Cisco"
WHERE symbol = "CSCO";

UPDATE stock_info
SET name = "Qualcomm"
WHERE symbol = "QCOM";

UPDATE stock_info
SET name = "Meta"
WHERE symbol = "META";

UPDATE stock_info
SET name = "Amazon"
WHERE symbol = "AMZN";

UPDATE stock_info
SET name = "Tesla"
WHERE symbol = "TSLA";

UPDATE stock_info
SET name = "AMD"
WHERE symbol = "AMD";

UPDATE stock_info
SET name = "Netflix"
WHERE symbol = "NFLX";

--In larger databases, separating the data into two tables like this will save space and query time.
SELECT price, name FROM stock_info
INNER JOIN stock_prices 
	on stock_info.symbol = stock_prices.symbol;