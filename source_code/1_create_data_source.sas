
/*  Create Source Data  */

/* STEP 1: CUSTOMERS TABLE */

data work.customers;

    length
        customer_id $5
        customer_name $30
        country $20
        customer_type $15
        risk_category $10;

    infile datalines dsd dlm=',' truncover;

    input
        customer_id :$5.
        customer_name :$30.
        country :$20.
        customer_type :$15.
        risk_category :$10.
        registration_date :yymmdd10.;

    format registration_date yymmdd10.;

datalines;
C001,Sara Ali,Egypt,Individual,Low,2023-07-18
C002,Mariam Tarek,UAE,Individual,Low,2022-10-13
C003,Sara Gamal,Saudi Arabia,Individual,Low,2022-06-28
C004,Mostafa Said,Jordan,Individual,Medium,2022-03-07
C005,Ahmed Mahmoud,Kuwait,Individual,Low,2023-03-24
C006,Mariam Farouk,Egypt,Individual,Low,2025-05-17
C007,Ahmed Gamal,UAE,Individual,Low,2023-02-12
C008,Hana Said,Saudi Arabia,Individual,Medium,2023-03-28
C009,Khaled Rashad,Jordan,Corporate,Low,2023-07-24
C010,Ahmed Samir,Kuwait,Individual,Low,2025-11-30
C011,Nada Ibrahim,Egypt,Individual,Low,2023-07-24
C012,Omar Adel,UAE,Individual,Medium,2023-11-21
C013,Sara Mahmoud,Saudi Arabia,Individual,High,2024-02-18
C014,Sara Nasser,Jordan,Individual,Low,2023-12-06
C015,Dina Mostafa,Kuwait,Individual,Low,2022-03-30
C016,Khaled Gamal,Egypt,Individual,Medium,2022-09-13
C017,Amr Mahmoud,UAE,Individual,Low,2025-02-04
C018,Salma Saleh,Saudi Arabia,Corporate,Low,2024-01-11
C019,Mostafa Adel,Jordan,Individual,Low,2025-12-13
C020,Ali Hassan,Kuwait,Individual,Medium,2025-09-16
C021,Mariam Hany,Egypt,Individual,Low,2022-06-13
C022,Mariam Ahmed,UAE,Individual,Low,2024-02-18
C023,Karim Mansour,Saudi Arabia,Individual,Low,2025-07-25
C024,Farah Samir,Jordan,Individual,Medium,2024-01-29
C025,Farah Adel,Kuwait,Individual,Low,2025-10-04
C026,Karim Mahmoud,Egypt,Individual,High,2025-06-01
C027,Nour Gamal,UAE,Corporate,Low,2026-02-02
C028,Mariam Samir,Saudi Arabia,Individual,Medium,2024-08-04
C029,Amr Mostafa,Jordan,Individual,Low,2025-08-03
C030,Hana Tarek,Kuwait,Individual,Low,2025-11-03
C031,Hassan Hassan,Egypt,Individual,Low,2023-04-15
C032,Mohamed Ibrahim,UAE,Individual,Medium,2024-04-01
C033,Karim Mahmoud,Saudi Arabia,Individual,Low,2023-03-09
C034,Mostafa Ibrahim,Jordan,Individual,Low,2023-03-12
C035,Laila Fathy,Kuwait,Individual,Low,2025-08-09
C036,Khaled Khaled,Egypt,Corporate,Medium,2023-06-27
C037,Omar Tarek,UAE,Individual,Low,2025-02-23
C038,Hana Mostafa,Saudi Arabia,Individual,Low,2025-04-12
C039,Nada Rashad,Jordan,Individual,High,2024-03-28
C040,Farah Tarek,Kuwait,Individual,Medium,2022-10-11
C041,Tarek Younis,Egypt,Individual,Low,2022-07-06
C042,Mohamed Ahmed,UAE,Individual,Low,2022-11-10
C043,Nour Said,Saudi Arabia,Individual,Low,2025-05-06
C044,Ali Fathy,Jordan,Individual,Medium,2024-02-21
C045,Dina Mansour,Kuwait,Corporate,Low,2024-12-19
C046,Karim Gamal,Egypt,Individual,Low,2022-01-24
C047,Sara Gamal,UAE,Individual,Low,2023-07-01
C048,Hassan Ahmed,Saudi Arabia,Individual,Medium,2023-08-25
C049,Nada Samir,Jordan,Individual,Low,2024-07-18
C050,Ahmed Mostafa,Kuwait,Individual,Low,2024-10-22
;
run;


/* STEP 2: ACCOUNTS TABLE */

data work.accounts;

    length
        account_id $5
        customer_id $5
        account_type $15
        account_status $10;

    infile datalines dsd dlm=',' truncover;

    input
        account_id :$5.
        customer_id :$5.
        account_type :$15.
        account_status :$10.
        opening_date :yymmdd10.
        initial_balance :best32.;

    format opening_date yymmdd10.
           initial_balance comma12.2;

datalines;
A001,C001,Savings,Active,2023-01-01,138085
A002,C002,Current,Active,2022-08-06,233201
A003,C003,Savings,Active,2025-07-04,83235
A004,C004,Current,Active,2025-08-01,138080
A005,C005,Savings,Active,2025-06-01,57143
A006,C006,Current,Active,2022-11-10,103019
A007,C007,Savings,Active,2022-11-27,146394
A008,C008,Current,Active,2024-12-22,245777
A009,C009,Savings,Active,2022-01-02,162009
A010,C010,Current,Active,2023-10-26,133085
A011,C011,Savings,Active,2022-02-09,34325
A012,C012,Current,Active,2024-01-14,235351
A013,C013,Savings,Active,2023-09-22,67770
A014,C014,Current,Active,2022-04-29,68143
A015,C015,Savings,Active,2025-03-07,25645
A016,C016,Current,Active,2022-06-25,196865
A017,C017,Savings,Inactive,2024-09-22,218915
A018,C018,Current,Active,2022-05-22,204387
A019,C019,Savings,Active,2024-12-26,205758
A020,C020,Current,Active,2022-09-15,38657
A021,C021,Savings,Active,2025-09-13,129592
A022,C022,Current,Active,2025-01-30,48287
A023,C023,Savings,Active,2023-06-27,143326
A024,C024,Current,Active,2025-05-27,115923
A025,C025,Savings,Active,2023-03-10,248509
A026,C026,Current,Active,2025-01-09,202988
A027,C027,Savings,Active,2026-02-03,185844
A028,C028,Current,Active,2023-02-16,191895
A029,C029,Savings,Active,2023-10-01,109593
A030,C030,Current,Active,2025-10-07,175361
A031,C031,Savings,Active,2024-02-04,119845
A032,C032,Current,Active,2024-11-25,123354
A033,C033,Savings,Active,2022-09-05,69986
A034,C034,Current,Inactive,2023-04-06,21784
A035,C035,Savings,Active,2023-11-24,10514
A036,C036,Current,Active,2025-04-19,150207
A037,C037,Savings,Active,2023-04-17,159256
A038,C038,Current,Active,2023-03-28,6885
A039,C039,Savings,Active,2022-05-26,190556
A040,C040,Current,Active,2025-07-16,20433
A041,C041,Savings,Active,2023-04-14,22668
A042,C042,Current,Active,2022-03-06,230348
A043,C043,Savings,Active,2023-11-08,23574
A044,C044,Current,Active,2024-11-18,67391
A045,C045,Savings,Active,2023-07-25,180368
A046,C046,Current,Active,2024-09-21,61160
A047,C047,Savings,Active,2025-01-09,39684
A048,C048,Current,Active,2026-01-21,236311
A049,C049,Savings,Active,2025-03-15,156050
A050,C050,Current,Active,2024-08-26,68700
A051,C001,Savings,Inactive,2024-08-26,216680
A052,C002,Current,Active,2024-04-13,54914
A053,C003,Savings,Active,2022-07-13,30409
A054,C004,Current,Active,2025-09-11,117997
A055,C005,Savings,Active,2023-12-27,116038
A056,C006,Current,Active,2024-04-21,127427
A057,C007,Savings,Active,2026-02-02,19200
A058,C008,Current,Active,2025-10-11,176299
A059,C009,Savings,Active,2025-08-16,30799
A060,C010,Current,Active,2022-05-05,110544
;
run;


/* STEP 3: TRANSACTIONS TABLE */

data work.transactions;

    length
        transaction_id $8
        sender_account $5
        receiver_account $5
        transaction_type $15
        currency $3
        channel $12
        transaction_status $12;

    infile datalines dsd dlm=',' truncover;

    input
        transaction_id :$8.
        sender_account :$5.
        receiver_account :$5.
        transaction_date :yymmdd10.
        transaction_type :$15.
        amount :best32.
        currency :$3.
        channel :$12.
        transaction_status :$12.;

    format transaction_date yymmdd10.
           amount comma12.2;

datalines;
T0001,A047,A022,2026-10-26,Transfer,49931,EGP,ATM,Pending
T0002,A028,A012,2026-10-09,Deposit,83082,EGP,Mobile,Completed
T0003,A042,A035,2026-10-27,Transfer,12745,EGP,ATM,Completed
T0004,A014,A056,2026-10-13,Transfer,17418,EGP,Branch,Completed
T0005,A019,A028,2026-10-23,Deposit,1368,EGP,Mobile,Completed
T0006,A048,A021,2026-10-02,Transfer,90909,EGP,Online,Completed
T0007,A033,A006,2026-10-28,Payment,33907,EGP,Online,Completed
T0008,A008,A057,2026-10-19,Payment,30209,EGP,Mobile,Completed
T0009,A043,A038,2026-10-19,Withdrawal,2236,EGP,Branch,Completed
T0010,A009,A043,2026-10-21,Withdrawal,3845,EGP,ATM,Completed
T0011,A005,A035,2026-10-07,Withdrawal,1185,EGP,Branch,Completed
T0012,A011,A029,2026-10-27,Withdrawal,5256,EGP,Mobile,Pending
T0013,A017,A008,2026-10-29,Transfer,10093,EGP,Online,Completed
T0014,A014,A044,2026-10-21,Withdrawal,4240,EGP,Mobile,Completed
T0015,A054,A018,2026-10-02,Transfer,2832,EGP,ATM,Completed
T0016,A036,A001,2026-10-04,Transfer,22877,EGP,Online,Completed
T0017,A009,A003,2026-10-10,Withdrawal,52535,EGP,Online,Completed
T0018,A023,A050,2026-10-18,Deposit,1366,EGP,ATM,Completed
T0019,A012,A048,2026-10-30,Withdrawal,3472,EGP,Mobile,Completed
T0020,A056,A003,2026-10-28,Deposit,11539,EGP,Branch,Pending
T0021,A015,A002,2026-10-22,Payment,3364,EGP,Branch,Completed
T0022,A042,A033,2026-10-13,Withdrawal,326,EGP,Branch,Completed
T0023,A007,A039,2026-10-14,Withdrawal,2669,EGP,ATM,Pending
T0024,A017,A003,2026-10-23,Deposit,95575,EGP,Online,Completed
T0025,A028,A005,2026-10-31,Withdrawal,64363,EGP,Branch,Completed
T0026,A021,A026,2026-10-23,Withdrawal,9170,EGP,ATM,Pending
T0027,A040,A037,2026-10-10,Deposit,5013,EGP,Online,Completed
T0028,A051,A038,2026-10-20,Withdrawal,82954,EGP,Online,Completed
T0029,A051,A058,2026-10-31,Payment,92561,EGP,Branch,Completed
T0030,A053,A049,2026-10-08,Withdrawal,1940,EGP,Mobile,Pending
T0031,A031,A040,2026-10-28,Transfer,50485,EGP,ATM,Completed
T0032,A026,A016,2026-10-05,Transfer,973,EGP,ATM,Completed
T0033,A036,A016,2026-10-30,Transfer,85901,EGP,Branch,Completed
T0034,A040,A053,2026-10-24,Deposit,45861,EGP,ATM,Completed
T0035,A017,A049,2026-10-08,Withdrawal,20879,EGP,ATM,Completed
T0036,A046,A019,2026-10-08,Withdrawal,2851,EGP,Online,Pending
T0037,A015,A025,2026-10-23,Payment,7104,EGP,Branch,Completed
T0038,A027,A004,2026-10-07,Deposit,27560,EGP,ATM,Completed
T0039,A001,A023,2026-10-10,Deposit,96582,EGP,Online,Completed
T0040,A015,A018,2026-10-14,Deposit,69057,EGP,ATM,Pending
T0041,A054,A030,2026-10-30,Payment,76645,EGP,Mobile,Completed
T0042,A042,A028,2026-10-05,Deposit,6647,EGP,Branch,Pending
T0043,A030,A021,2026-10-11,Deposit,2379,EGP,ATM,Completed
T0044,A048,A035,2026-10-02,Withdrawal,1936,EGP,Online,Pending
T0045,A054,A002,2026-10-20,Payment,87070,EGP,Mobile,Pending
T0046,A030,A045,2026-10-09,Withdrawal,1474,EGP,Branch,Completed
T0047,A038,A002,2026-10-30,Withdrawal,.,EGP,Online,Completed
T0048,A038,A045,2026-10-27,Payment,40866,EGP,Mobile,Completed
T0049,A035,A028,2026-10-22,Withdrawal,664,EGP,ATM,Completed
T0050,A007,A028,2026-10-31,Withdrawal,3866,EGP,Branch,Completed
T0051,A030,A028,2026-10-27,Withdrawal,13044,EGP,ATM,Pending
T0052,A049,A030,2026-10-19,Deposit,5940,EGP,Online,Completed
T0053,A014,A023,2026-10-26,Withdrawal,61211,EGP,Mobile,Pending
T0054,A006,A016,2026-10-24,Deposit,56499,EGP,ATM,Completed
T0055,A029,A051,2026-10-01,Transfer,78005,EGP,Online,Completed
T0056,A043,A038,2026-10-12,Deposit,22397,EGP,Branch,Completed
T0057,A045,A030,2026-10-09,Withdrawal,40814,EGP,Online,Completed
T0058,A008,A048,2026-10-18,Payment,12090,EGP,Branch,Completed
T0059,A054,A013,2026-10-10,Payment,3056,EGP,Online,Completed
T0060,A003,A004,2026-10-18,Withdrawal,1134,EGP,Branch,Completed
T0061,A031,A029,2026-10-11,Payment,-635,EGP,ATM,Completed
T0062,A005,A037,2026-10-21,Transfer,9888,EGP,Mobile,Pending
T0063,A008,A036,2026-10-25,Deposit,12395,EGP,ATM,Completed
T0064,A020,A056,2026-10-19,Deposit,32894,EGP,Mobile,Pending
T0065,A041,A014,2026-10-09,Transfer,47782,EGP,Mobile,Pending
T0066,A001,A027,2026-10-15,Deposit,6069,EGP,Branch,Completed
T0067,A005,A044,2026-10-08,Withdrawal,4931,EGP,Online,Pending
T0068,A059,A018,2026-10-27,Payment,6954,EGP,Branch,Completed
T0069,A008,A030,2026-10-23,Withdrawal,90597,EGP,ATM,Completed
T0070,A006,A039,2026-10-02,Deposit,2740,EGP,Mobile,Pending
T0071,A044,A054,2026-10-28,Transfer,2307,EGP,ATM,Completed
T0072,A059,A018,2026-10-06,Deposit,7989,EGP,ATM,Completed
T0073,A999,A043,2026-10-04,Payment,18488,EGP,ATM,Completed
T0074,A030,A006,2026-10-11,Withdrawal,77976,EGP,Mobile,Completed
T0075,A027,A004,2026-10-07,Withdrawal,4183,EGP,Branch,Pending
T0076,A060,A019,2026-10-15,Deposit,56365,EGP,Online,Completed
T0077,A036,A001,2026-10-18,Deposit,12362,EGP,Mobile,Pending
T0078,A032,A060,2026-10-23,Withdrawal,13959,EGP,ATM,Pending
T0079,A030,A036,2026-10-05,Deposit,91616,EGP,Online,Completed
T0080,A018,A050,2026-10-26,Deposit,2884,EGP,Branch,Completed
T0081,A054,A038,2026-10-19,Deposit,19632,EGP,Branch,Completed
T0082,A036,A049,2026-10-18,Deposit,49727,EGP,Online,Completed
T0083,A015,A055,2026-10-25,Deposit,86993,EGP,ATM,Completed
T0084,A043,A051,2026-10-27,Payment,41547,EGP,Branch,Completed
T0085,A056,A055,2026-10-15,Transfer,27011,EGP,Online,Completed
T0086,A056,A042,2026-10-05,Transfer,69375,EGP,ATM,Completed
T0087,A055,A022,2026-10-28,Deposit,2694,EGP,Mobile,Pending
T0088,A041,A044,2026-10-30,Withdrawal,1963,EGP,Mobile,Completed
T0089,A011,A998,2026-10-10,Transfer,15629,EGP,Branch,Completed
T0090,A028,A010,2026-10-08,Deposit,4736,EGP,Mobile,Completed
T0091,A040,A044,2026-10-08,Deposit,9689,EGP,Branch,Completed
T0092,A017,A043,2026-10-01,Deposit,2456,EGP,ATM,Completed
T0093,A038,A020,2026-10-21,Deposit,2148,EGP,ATM,Completed
T0094,A007,A016,2026-10-13,Withdrawal,.,EGP,ATM,Completed
T0095,A001,A037,2026-10-28,Transfer,55162,EGP,Branch,Pending
T0096,A041,A013,2026-10-20,Withdrawal,8183,EGP,ATM,Completed
T0097,A038,A024,2026-10-24,Payment,67823,EGP,ATM,Pending
T0098,A013,A009,2026-10-26,Withdrawal,4448,EGP,Branch,Completed
T0099,A052,A019,2026-10-24,Withdrawal,1043,EGP,Online,Completed
T0100,A055,A052,2026-10-18,Withdrawal,17929,EGP,Mobile,Completed
T0101,A024,A044,2026-10-24,Withdrawal,4888,EGP,Online,Completed
T0102,A002,A040,2026-10-29,Withdrawal,85852,EGP,Branch,Completed
T0103,A008,A009,2026-10-02,Transfer,2593,EGP,Online,Pending
T0104,A025,A030,2026-10-12,Deposit,79379,EGP,Mobile,Completed
T0105,A040,A027,2026-10-31,Withdrawal,17141,EGP,ATM,Pending
T0106,A055,A024,2026-10-04,Withdrawal,16753,EGP,Branch,Pending
T0107,A012,A055,2026-10-27,Deposit,850,EGP,Branch,Pending
T0108,A009,A051,2026-10-19,Payment,52152,EGP,Online,Pending
T0109,A022,A050,2026-10-05,Transfer,42038,EGP,Branch,Pending
T0110,A008,A043,2026-10-28,Transfer,1179,EGP,Branch,Completed
T0111,A012,A017,2026-10-02,Payment,39896,EGP,Mobile,Completed
T0112,A029,A050,2026-10-12,Transfer,54038,EGP,Mobile,Completed
T0113,A030,A042,2026-10-31,Transfer,20695,EGP,Mobile,Completed
T0114,A046,A059,2026-10-15,Transfer,761,EGP,Online,Completed
T0115,A040,A041,2026-10-19,Withdrawal,24575,EGP,ATM,Completed
T0116,A007,A051,2026-10-23,Transfer,12045,EGP,Online,Completed
T0117,A022,A053,2026-10-15,Deposit,8115,EGP,Branch,Completed
T0118,A024,A010,2026-10-22,Deposit,649,EGP,ATM,Completed
T0119,A048,A024,2026-10-26,Payment,98608,EGP,Branch,Completed
T0120,A027,A023,2026-10-28,Deposit,14425,EGP,Mobile,Pending
T0121,A010,A043,2026-10-16,Payment,16472,EGP,Mobile,Completed
T0122,A037,A015,2026-10-26,Deposit,-2290,EGP,Mobile,Pending
T0123,A018,A045,2026-10-25,Withdrawal,2883,EGP,Online,Completed
T0124,A005,A010,2026-10-24,Transfer,22382,EGP,ATM,Completed
T0125,A022,A011,2026-10-12,Withdrawal,2757,EGP,Online,Pending
T0126,A049,A040,2026-10-02,Transfer,19519,EGP,ATM,Completed
T0127,A018,A001,2026-10-25,Transfer,19087,EGP,ATM,Completed
T0128,A003,A015,2026-10-13,Transfer,162,EGP,Online,Completed
T0129,A019,A021,2026-10-04,Transfer,4174,EGP,ATM,Pending
T0130,A033,A036,2026-10-27,Withdrawal,18011,EGP,Mobile,Completed
T0131,A059,A005,2026-10-28,Withdrawal,78008,EGP,ATM,Completed
T0132,A008,A026,2026-10-01,Withdrawal,1507,EGP,ATM,Completed
T0133,A016,A028,2026-10-19,Deposit,7577,EGP,Branch,Pending
T0134,A022,A050,2026-10-06,Transfer,94547,EGP,Online,Completed
T0135,A023,A047,2026-10-31,Payment,8368,EGP,Online,Pending
T0136,A039,A010,2026-10-25,Transfer,85811,EGP,ATM,Completed
T0137,A056,A041,2026-10-11,Payment,7237,EGP,Branch,Completed
T0138,A038,A004,2026-10-12,Transfer,2642,EGP,Mobile,Completed
T0139,A054,A019,2026-10-03,Transfer,21615,EGP,Mobile,Completed
T0140,A059,A052,2026-10-19,Payment,87341,EGP,Online,Completed
T0141,A029,A007,2026-10-26,Withdrawal,.,EGP,Online,Completed
T0142,A029,A034,2026-10-17,Payment,17217,EGP,ATM,Completed
T0143,A044,A039,2026-10-02,Withdrawal,37387,EGP,ATM,Completed
T0144,A017,A047,2026-10-28,Payment,7670,EGP,Branch,Completed
T0145,A009,A039,2026-10-23,Transfer,74372,EGP,Branch,Pending
T0146,A999,A045,2026-10-27,Transfer,3568,EGP,Branch,Completed
T0147,A012,A014,2026-10-11,Deposit,1672,EGP,Mobile,Completed
T0148,A055,A051,2026-10-04,Transfer,2858,EGP,Online,Pending
T0149,A054,A045,2026-10-25,Payment,6431,EGP,Online,Completed
T0150,A040,A019,2026-10-25,Deposit,22498,EGP,ATM,Pending
T0151,A024,A044,2026-10-31,Deposit,75052,EGP,ATM,Pending
T0152,A053,A013,2026-10-26,Payment,6709,EGP,Mobile,Completed
T0153,A019,A006,2026-10-25,Payment,2334,EGP,ATM,Completed
T0154,A059,A015,2026-10-27,Deposit,2963,EGP,ATM,Completed
T0155,A016,A025,2026-10-03,Withdrawal,1939,EGP,Branch,Pending
T0156,A009,A003,2026-10-10,Deposit,83799,EGP,Mobile,Completed
T0157,A002,A017,2026-10-07,Payment,24951,EGP,Mobile,Completed
T0158,A016,A020,2026-10-04,Transfer,2053,EGP,Mobile,Completed
T0159,A039,A035,2026-10-01,Payment,1276,EGP,Branch,Pending
T0160,A037,A027,2026-10-06,Transfer,33870,EGP,Mobile,Completed
T0161,A056,A031,2026-10-02,Deposit,13311,EGP,Mobile,Completed
T0162,A016,A047,2026-10-22,Transfer,4866,EGP,Branch,Completed
T0163,A053,A042,2026-10-06,Deposit,4020,EGP,ATM,Completed
T0164,A019,A013,2026-10-02,Payment,65642,EGP,ATM,Completed
T0165,A017,A003,2026-10-25,Payment,31265,EGP,Branch,Completed
T0166,A008,A052,2026-10-12,Deposit,19409,EGP,Online,Completed
T0167,A045,A032,2026-10-12,Withdrawal,18910,EGP,Online,Completed
T0168,A021,A007,2026-10-03,Withdrawal,83447,EGP,ATM,Pending
T0169,A045,A029,2026-10-12,Deposit,16552,EGP,Mobile,Completed
T0170,A043,A041,2026-10-13,Withdrawal,4303,EGP,ATM,Completed
T0171,A009,A005,2026-10-08,Withdrawal,3066,EGP,Online,Completed
T0172,A024,A029,2026-10-25,Transfer,9511,EGP,ATM,Completed
T0173,A042,A018,2026-10-08,Transfer,90410,EGP,ATM,Completed
T0174,A017,A050,2026-10-09,Deposit,1857,EGP,Mobile,Pending
T0175,A055,A005,2026-10-15,Payment,66889,EGP,Branch,Completed
T0176,A036,A035,2026-10-10,Withdrawal,72381,EGP,Online,Completed
T0177,A013,A051,2026-10-05,Payment,72303,EGP,Branch,Completed
T0178,A052,A998,2026-10-05,Transfer,77187,EGP,ATM,Completed
T0179,A050,A027,2026-10-27,Transfer,15388,EGP,ATM,Completed
T0180,A009,A057,2026-10-27,Payment,1157,EGP,Mobile,Pending
T0181,A020,A011,2026-10-06,Withdrawal,16338,EGP,Mobile,Completed
T0182,A013,A041,2026-10-31,Withdrawal,1125,EGP,Online,Pending
T0183,A011,A043,2026-10-20,Withdrawal,-472,EGP,Branch,Pending
T0184,A050,A037,2026-10-14,Transfer,62967,EGP,Branch,Completed
T0185,A016,A052,2026-10-26,Deposit,34564,EGP,Mobile,Pending
T0186,A029,A027,2026-10-16,Deposit,16147,EGP,Branch,Completed
T0187,A026,A009,2026-10-25,Withdrawal,23404,EGP,Online,Completed
T0188,A008,A018,2026-10-15,Payment,.,EGP,ATM,Completed
T0189,A016,A056,2026-10-29,Payment,2782,EGP,Online,Completed
T0190,A033,A030,2026-10-16,Withdrawal,5759,EGP,ATM,Pending
T0191,A014,A038,2026-10-12,Transfer,89866,EGP,ATM,Completed
T0192,A035,A001,2026-10-28,Transfer,59664,EGP,Branch,Completed
T0193,A024,A003,2026-10-13,Transfer,23409,EGP,Branch,Completed
T0194,A025,A033,2026-10-15,Withdrawal,9216,EGP,Branch,Completed
T0195,A036,A024,2026-10-25,Payment,24741,EGP,Mobile,Completed
T0196,A003,A009,2026-10-23,Withdrawal,3980,EGP,Online,Completed
T0197,A060,A040,2026-10-11,Payment,69089,EGP,ATM,Completed
T0198,A031,A053,2026-10-01,Withdrawal,79596,EGP,Branch,Completed
T0199,A039,A031,2026-10-09,Payment,520,EGP,ATM,Pending
T0200,A053,A044,2026-10-08,Transfer,4790,EGP,ATM,Completed
T0201,A027,A010,2026-10-14,Payment,86814,EGP,Mobile,Pending
T0202,A034,A014,2026-10-18,Withdrawal,22218,EGP,Online,Completed
T0203,A059,A035,2026-10-11,Withdrawal,2265,EGP,Online,Completed
T0204,A036,A020,2026-10-08,Withdrawal,11792,EGP,ATM,Completed
T0205,A036,A060,2026-10-30,Withdrawal,8993,EGP,ATM,Completed
T0206,A050,A052,2026-10-05,Withdrawal,14425,EGP,ATM,Completed
T0207,A048,A031,2026-10-07,Payment,98664,EGP,Branch,Pending
T0208,A007,A040,2026-10-24,Payment,2086,EGP,Online,Completed
T0209,A007,A027,2026-10-11,Deposit,25679,EGP,Online,Completed
T0210,A042,A060,2026-10-29,Deposit,11535,EGP,Branch,Completed
T0211,A059,A050,2026-10-03,Payment,6222,EGP,Online,Completed
T0212,A054,A026,2026-10-26,Deposit,1626,EGP,Branch,Completed
T0213,A060,A022,2026-10-10,Deposit,4550,EGP,ATM,Completed
T0214,A015,A052,2026-10-04,Withdrawal,58720,EGP,Online,Completed
T0215,A048,A022,2026-10-26,Withdrawal,48002,EGP,ATM,Completed
T0216,A033,A021,2026-10-03,Deposit,11054,EGP,Branch,Pending
T0217,A001,A017,2026-10-13,Payment,13748,EGP,Mobile,Completed
T0218,A042,A024,2026-10-23,Payment,8873,EGP,Online,Completed
T0219,A999,A033,2026-10-30,Withdrawal,73174,EGP,Online,Pending
T0220,A009,A031,2026-10-05,Deposit,18626,EGP,Online,Pending
T0221,A044,A049,2026-10-20,Transfer,94228,EGP,Branch,Completed
T0222,A059,A037,2026-10-04,Transfer,51497,EGP,Online,Pending
T0223,A021,A055,2026-10-17,Deposit,1052,EGP,ATM,Completed
T0224,A030,A009,2026-10-17,Deposit,32567,EGP,ATM,Completed
T0225,A047,A002,2026-10-13,Withdrawal,124,EGP,ATM,Completed
T0226,A045,A005,2026-10-18,Transfer,20468,EGP,ATM,Pending
T0227,A050,A009,2026-10-25,Deposit,17533,EGP,ATM,Completed
T0228,A044,A043,2026-10-28,Payment,48392,EGP,ATM,Pending
T0229,A047,A015,2026-10-27,Transfer,85686,EGP,ATM,Completed
T0230,A053,A015,2026-10-08,Deposit,2935,EGP,Mobile,Completed
T0231,A052,A043,2026-10-14,Transfer,2071,EGP,Mobile,Completed
T0232,A039,A044,2026-10-23,Transfer,6449,EGP,Online,Pending
T0233,A049,A056,2026-10-25,Transfer,1247,EGP,Branch,Completed
T0234,A016,A020,2026-10-29,Payment,12243,EGP,Branch,Completed
T0235,A036,A038,2026-10-29,Payment,.,EGP,Branch,Completed
T0236,A051,A034,2026-10-11,Deposit,9889,EGP,Online,Completed
T0237,A016,A055,2026-10-08,Withdrawal,32552,EGP,ATM,Completed
T0238,A036,A034,2026-10-05,Deposit,13355,EGP,Mobile,Completed
T0239,A055,A024,2026-10-03,Payment,74436,EGP,Mobile,Completed
T0240,A013,A052,2026-10-25,Payment,11844,EGP,Mobile,Pending
T0241,A060,A013,2026-10-31,Transfer,12949,EGP,Online,Completed
T0242,A050,A019,2026-10-13,Deposit,16772,EGP,Branch,Completed
T0243,A030,A007,2026-10-26,Deposit,11656,EGP,ATM,Completed
T0244,A037,A056,2026-10-08,Payment,-4844,EGP,ATM,Completed
T0245,A010,A013,2026-10-11,Payment,23670,EGP,Branch,Completed
T0246,A049,A053,2026-10-16,Deposit,3875,EGP,Online,Completed
T0247,A012,A059,2026-10-29,Transfer,34742,EGP,Mobile,Completed
T0248,A027,A009,2026-10-27,Payment,656,EGP,ATM,Completed
T0249,A004,A040,2026-10-21,Deposit,25866,EGP,ATM,Completed
T0250,A002,A034,2026-10-24,Withdrawal,27246,EGP,ATM,Pending
T0251,A007,A059,2026-10-04,Payment,11289,EGP,Branch,Completed
T0252,A051,A026,2026-10-03,Withdrawal,3426,EGP,Online,Completed
T0253,A044,A053,2026-10-28,Transfer,8063,EGP,ATM,Completed
T0254,A004,A011,2026-10-01,Payment,81873,EGP,Branch,Completed
T0255,A058,A034,2026-10-30,Transfer,11927,EGP,Branch,Completed
T0256,A060,A005,2026-10-22,Withdrawal,4548,EGP,Branch,Completed
T0257,A014,A038,2026-10-05,Deposit,46292,EGP,Online,Completed
T0258,A044,A058,2026-10-18,Withdrawal,35279,EGP,Branch,Completed
T0259,A007,A028,2026-10-08,Transfer,24830,EGP,Mobile,Completed
T0260,A051,A029,2026-10-16,Payment,23121,EGP,Online,Completed
T0261,A006,A050,2026-10-20,Withdrawal,7408,EGP,Online,Completed
T0262,A046,A051,2026-10-21,Payment,3291,EGP,Mobile,Completed
T0263,A020,A029,2026-10-12,Withdrawal,937,EGP,ATM,Completed
T0264,A036,A033,2026-10-14,Transfer,71388,EGP,Mobile,Completed
T0265,A056,A025,2026-10-01,Withdrawal,36101,EGP,Online,Pending
T0266,A044,A025,2026-10-06,Payment,14867,EGP,Online,Completed
T0267,A011,A998,2026-10-09,Deposit,20867,EGP,Branch,Pending
T0268,A047,A041,2026-10-16,Payment,8505,EGP,Mobile,Completed
T0269,A022,A054,2026-10-20,Deposit,19425,EGP,Online,Completed
T0270,A021,A039,2026-10-31,Payment,15295,EGP,Branch,Completed
T0271,A048,A045,2026-10-21,Deposit,12943,EGP,Branch,Completed
T0272,A024,A008,2026-10-30,Payment,48583,EGP,Mobile,Completed
T0273,A046,A014,2026-10-15,Withdrawal,666,EGP,Branch,Pending
T0274,A017,A043,2026-10-05,Deposit,83860,EGP,ATM,Completed
T0275,A035,A033,2026-10-30,Deposit,72124,EGP,Mobile,Completed
T0276,A050,A016,2026-10-22,Withdrawal,98822,EGP,ATM,Completed
T0277,A051,A028,2026-10-04,Transfer,54098,EGP,Online,Completed
T0278,A024,A026,2026-10-15,Payment,2925,EGP,Branch,Completed
T0279,A059,A006,2026-10-04,Payment,15220,EGP,Online,Completed
T0280,A023,A031,2026-10-04,Deposit,15450,EGP,Mobile,Completed
T0281,A002,A055,2026-10-11,Transfer,1446,EGP,Online,Completed
T0282,A036,A028,2026-10-31,Deposit,.,EGP,ATM,Completed
T0283,A002,A048,2026-10-20,Payment,24405,EGP,Mobile,Pending
T0284,A014,A018,2026-10-25,Transfer,4829,EGP,Branch,Completed
T0285,A013,A030,2026-10-04,Withdrawal,66078,EGP,ATM,Completed
T0286,A038,A008,2026-10-12,Withdrawal,63986,EGP,Mobile,Pending
T0287,A021,A008,2026-10-08,Withdrawal,73929,EGP,Online,Completed
T0288,A027,A039,2026-10-05,Deposit,88788,EGP,Online,Pending
T0289,A032,A019,2026-10-05,Payment,19778,EGP,Mobile,Completed
T0290,A009,A013,2026-10-27,Deposit,21562,EGP,ATM,Completed
T0291,A046,A054,2026-10-15,Deposit,1470,EGP,Online,Completed
T0292,A999,A018,2026-10-08,Withdrawal,99140,EGP,ATM,Completed
T0293,A037,A008,2026-10-09,Withdrawal,82850,EGP,Online,Completed
T0294,A007,A048,2026-10-27,Payment,6056,EGP,Branch,Completed
T0295,A029,A056,2026-10-04,Payment,70957,EGP,ATM,Pending
T0296,A040,A009,2026-10-26,Payment,6945,EGP,Branch,Pending
T0297,A021,A046,2026-10-10,Withdrawal,92425,EGP,Mobile,Pending
T0298,A049,A051,2026-10-14,Transfer,2371,EGP,Online,Completed
T0299,A054,A016,2026-10-25,Deposit,60221,EGP,ATM,Completed
T0300,A029,A005,2026-10-21,Transfer,61467,EGP,Branch,Completed
T0301,A032,A021,2026-10-19,Transfer,863,EGP,ATM,Pending
T0302,A028,A053,2026-10-07,Deposit,15579,EGP,Online,Completed
T0303,A051,A022,2026-10-29,Transfer,476,EGP,Mobile,Pending
T0304,A029,A030,2026-10-01,Deposit,1757,EGP,Branch,Completed
T0305,A042,A024,2026-10-09,Transfer,-2602,EGP,Online,Completed
T0306,A042,A006,2026-10-23,Transfer,108,EGP,Online,Pending
T0307,A034,A044,2026-10-15,Transfer,16258,EGP,Online,Completed
T0308,A005,A015,2026-10-13,Transfer,8381,EGP,Branch,Pending
T0309,A025,A050,2026-10-27,Payment,94534,EGP,Mobile,Pending
T0310,A029,A023,2026-10-24,Payment,1340,EGP,Mobile,Completed
T0311,A009,A049,2026-10-04,Deposit,2979,EGP,Online,Completed
T0312,A042,A006,2026-10-08,Withdrawal,51928,EGP,Online,Completed
T0313,A019,A042,2026-10-02,Payment,4154,EGP,ATM,Completed
T0314,A034,A057,2026-10-01,Withdrawal,75703,EGP,ATM,Completed
T0315,A035,A044,2026-10-06,Deposit,697,EGP,Branch,Pending
T0316,A003,A060,2026-10-02,Deposit,14387,EGP,ATM,Completed
T0317,A006,A041,2026-10-18,Payment,2373,EGP,Online,Pending
T0318,A035,A021,2026-10-13,Transfer,2640,EGP,Online,Completed
T0319,A060,A028,2026-10-04,Deposit,550,EGP,Mobile,Pending
T0320,A045,A001,2026-10-06,Deposit,92793,EGP,Branch,Pending
T0321,A012,A009,2026-10-24,Withdrawal,5961,EGP,Branch,Completed
T0322,A017,A046,2026-10-19,Transfer,19915,EGP,Mobile,Completed
T0323,A055,A037,2026-10-06,Withdrawal,38487,EGP,Mobile,Pending
T0324,A048,A033,2026-10-01,Transfer,13013,EGP,Branch,Completed
T0325,A059,A010,2026-10-06,Transfer,18741,EGP,Online,Completed
T0326,A059,A047,2026-10-11,Withdrawal,738,EGP,Mobile,Pending
T0327,A015,A052,2026-10-17,Transfer,7258,EGP,Branch,Completed
T0328,A006,A036,2026-10-15,Transfer,63219,EGP,Branch,Pending
T0329,A030,A024,2026-10-19,Deposit,.,EGP,Mobile,Completed
T0330,A002,A015,2026-10-18,Withdrawal,25191,EGP,ATM,Completed
T0331,A007,A014,2026-10-17,Payment,3539,EGP,Branch,Completed
T0332,A003,A059,2026-10-08,Deposit,36128,EGP,Mobile,Pending
T0333,A041,A053,2026-10-13,Transfer,23606,EGP,Online,Pending
T0334,A019,A017,2026-10-28,Withdrawal,15690,EGP,Branch,Pending
T0335,A005,A013,2026-10-05,Transfer,8462,EGP,ATM,Completed
T0336,A027,A008,2026-10-18,Withdrawal,19808,EGP,Branch,Completed
T0337,A006,A011,2026-10-26,Withdrawal,430,EGP,Mobile,Pending
T0338,A023,A026,2026-10-17,Transfer,2548,EGP,ATM,Completed
T0339,A036,A048,2026-10-18,Payment,875,EGP,Mobile,Completed
T0340,A004,A054,2026-10-25,Payment,11492,EGP,Mobile,Completed
T0341,A059,A053,2026-10-03,Transfer,628,EGP,Mobile,Completed
T0342,A008,A003,2026-10-31,Deposit,81774,EGP,ATM,Completed
T0343,A002,A025,2026-10-22,Deposit,1515,EGP,Branch,Completed
T0344,A029,A057,2026-10-05,Transfer,14670,EGP,ATM,Completed
T0345,A006,A018,2026-10-13,Payment,3534,EGP,Mobile,Completed
T0346,A051,A046,2026-10-12,Deposit,70093,EGP,Branch,Completed
T0347,A018,A012,2026-10-01,Withdrawal,12176,EGP,Mobile,Completed
T0348,A034,A023,2026-10-25,Payment,57487,EGP,Online,Completed
T0349,A035,A053,2026-10-26,Transfer,23864,EGP,Online,Pending
T0350,A016,A038,2026-10-11,Withdrawal,71095,EGP,Online,Pending
T0351,A054,A052,2026-10-29,Deposit,15127,EGP,Mobile,Completed
T0352,A004,A015,2026-10-20,Payment,263,EGP,Branch,Pending
T0353,A052,A009,2026-10-11,Payment,2750,EGP,Online,Completed
T0354,A055,A034,2026-10-28,Withdrawal,76851,EGP,Mobile,Completed
T0355,A020,A021,2026-10-05,Payment,3678,EGP,Branch,Pending
T0356,A043,A998,2026-10-27,Payment,3199,EGP,Online,Completed
T0357,A045,A037,2026-10-13,Transfer,66709,EGP,Online,Completed
T0358,A060,A032,2026-10-05,Withdrawal,12798,EGP,Online,Completed
T0359,A053,A046,2026-10-22,Withdrawal,3758,EGP,Online,Completed
T0360,A023,A017,2026-10-26,Transfer,6577,EGP,ATM,Pending
T0361,A057,A027,2026-10-16,Deposit,2977,EGP,ATM,Pending
T0362,A011,A029,2026-10-03,Transfer,5657,EGP,Mobile,Completed
T0363,A022,A011,2026-10-29,Deposit,1418,EGP,Branch,Completed
T0364,A046,A002,2026-10-14,Payment,3656,EGP,Branch,Pending
T0365,A999,A027,2026-10-23,Withdrawal,2406,EGP,Mobile,Completed
T0366,A037,A036,2026-10-27,Deposit,-3602,EGP,Mobile,Completed
T0367,A053,A043,2026-10-21,Deposit,1735,EGP,Online,Completed
T0368,A006,A031,2026-10-28,Transfer,18024,EGP,Branch,Completed
T0369,A042,A035,2026-10-13,Payment,3139,EGP,ATM,Completed
T0370,A017,A029,2026-10-15,Withdrawal,1953,EGP,Online,Completed
T0371,A006,A043,2026-10-12,Deposit,4931,EGP,ATM,Completed
T0372,A035,A044,2026-10-28,Deposit,12721,EGP,Mobile,Completed
T0373,A058,A055,2026-10-23,Transfer,92740,EGP,Online,Completed
T0374,A049,A029,2026-10-06,Payment,1835,EGP,ATM,Completed
T0375,A044,A028,2026-10-07,Payment,66910,EGP,Mobile,Completed
T0376,A025,A036,2026-10-13,Withdrawal,.,EGP,ATM,Completed
T0377,A027,A010,2026-10-05,Transfer,23438,EGP,Branch,Completed
T0378,A017,A025,2026-10-21,Deposit,4786,EGP,Online,Completed
T0379,A026,A010,2026-10-20,Deposit,68449,EGP,Online,Completed
T0380,A048,A031,2026-10-30,Withdrawal,5662,EGP,Branch,Completed
T0381,A054,A019,2026-10-28,Transfer,64384,EGP,ATM,Completed
T0382,A018,A047,2026-10-14,Transfer,19474,EGP,ATM,Completed
T0383,A053,A004,2026-10-17,Payment,15194,EGP,Online,Completed
T0384,A012,A013,2026-10-29,Payment,13175,EGP,Mobile,Completed
T0385,A046,A013,2026-10-09,Withdrawal,77028,EGP,Mobile,Completed
T0386,A016,A024,2026-10-16,Deposit,20551,EGP,Branch,Pending
T0387,A054,A058,2026-10-09,Transfer,2435,EGP,Online,Pending
T0388,A055,A015,2026-10-21,Payment,78674,EGP,Mobile,Completed
T0389,A031,A059,2026-10-05,Payment,58081,EGP,Branch,Completed
T0390,A028,A058,2026-10-13,Withdrawal,13257,EGP,Branch,Completed
T0391,A038,A007,2026-10-01,Withdrawal,24456,EGP,Mobile,Completed
T0392,A005,A022,2026-10-09,Withdrawal,2368,EGP,Online,Pending
T0393,A058,A004,2026-10-26,Deposit,28336,EGP,ATM,Completed
T0394,A017,A059,2026-10-14,Deposit,3280,EGP,Branch,Pending
T0395,A044,A035,2026-10-21,Deposit,3036,EGP,Online,Completed
T0396,A007,A031,2026-10-05,Withdrawal,68992,EGP,Mobile,Pending
T0397,A023,A015,2026-10-24,Withdrawal,15856,EGP,Branch,Completed
T0398,A055,A008,2026-10-16,Transfer,24015,EGP,Online,Completed
T0399,A056,A044,2026-10-13,Withdrawal,3484,EGP,Online,Completed
T0400,A027,A037,2026-10-29,Deposit,1273,EGP,ATM,Completed
T0401,A041,A012,2026-10-11,Transfer,138,EGP,Online,Pending
T0402,A032,A051,2026-10-25,Transfer,19211,EGP,ATM,Completed
T0403,A025,A001,2026-10-02,Payment,67233,EGP,Online,Completed
T0404,A044,A001,2026-10-21,Payment,1953,EGP,Mobile,Completed
T0405,A033,A038,2026-10-10,Payment,6498,EGP,ATM,Completed
T0406,A028,A057,2026-10-22,Payment,2907,EGP,Online,Completed
T0407,A002,A015,2026-10-08,Payment,1830,EGP,Mobile,Completed
T0408,A046,A042,2026-10-26,Transfer,95088,EGP,Mobile,Completed
T0409,A043,A007,2026-10-21,Transfer,8794,EGP,ATM,Completed
T0410,A036,A017,2026-10-16,Payment,5304,EGP,Mobile,Completed
T0411,A040,A039,2026-10-23,Transfer,15000,EGP,Branch,Completed
;
run;