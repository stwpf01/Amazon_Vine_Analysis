# Amazon_Vine_Analysis

## Overview

The purpose of this analysis was to look at the Amazon Vine program and determine whether or not there is a bias from people in the program. In order to do that, a dataset (in this case Books_v1_00) was chosen from a list of  
Amazon Reviews datasets. Four dataframes were then made of this dataset using Spark, splitting the various columns of data, then sending these dataframes to a server in PostgreSQL. It was here where the rest of the querying took place, and questions such as what percentage of reviews are five-stars in the Vine program. The initial extracting of the dataset can be found in the [Amazon_Reviews_ETL](https://github.com/stwpf01/Amazon_Vine_Analysis/blob/main/Amazon_Reviews_ETL.ipynb) file, while the more specific querying can be found in the [Vine_Review_Analysis](https://github.com/stwpf01/Amazon_Vine_Analysis/blob/main/Vine_Review_Analysis.sql) file. Results are below.

## Results


### Total Reviews


![Paid_Total](https://github.com/stwpf01/Amazon_Vine_Analysis/blob/main/Images/paidtotal.png)


![Unpaid_Total](https://github.com/stwpf01/Amazon_Vine_Analysis/blob/main/Images/unpaidtotal.png)


- Total amount of reviews where the customer paid for the Vine program is 5333.
- Total amount from non-Vine users was 156262.
- Vast majority of users who leave reviews are not participating in the Amazon Vine program.

### Five Star Reviews


![Five_Paid](https://github.com/stwpf01/Amazon_Vine_Analysis/blob/main/Images/fivepaid.png)


![Five_Unpaid](https://github.com/stwpf01/Amazon_Vine_Analysis/blob/main/Images/fiveunpaid.png)


- Amount of reviews that were rated five-stars in the `star_rating` column from Vine users is 2069.
- Amount of five-star reviews from non-Vine users is 56733.
- Same outcome as the total votes between Vine and non-Vine users. Most are not using the Amazon Vine program.

### Percentage Between Total Reviews and Five-Star Reviews


![Paid_Percent](https://github.com/stwpf01/Amazon_Vine_Analysis/blob/main/Images/paidpercent.png)


![Unpaid_Percent](https://github.com/stwpf01/Amazon_Vine_Analysis/blob/main/Images/unpaidpercent.png)


![SQLFunction](https://github.com/stwpf01/Amazon_Vine_Analysis/blob/main/Images/sqlfunction.png)

- The percentage of reviews with five-star ratings in the `star_rating` column for Vine users is 38.79%, or 39% rounded.
- The percentage of reviews with five-star ratings for non-Vine users is 36.30%, or 36% rounded.
- In order to find the percentage in SQL, a function was created (Divide two values, multiply the results by 100).
- As shown in the percentage images, a decimal was added to the values in order for the function to work correctly.
- This was due to making the datatype of the `x` and `y` values in the function `double precision`.


## Summary

Based on the results there is a slight favorability bias in Vine users of an extra 3% compared to non-Vine users. This slight increase in five-star reviews is possibly due to people paying for a service, meaning customers are more excited about a service so their overall use of it is a more positive experience (As long as the service is considered a good deal; the opposite can also be true if the service is deemed poor comparatively). Another analysis to determine biases in the Amazon Vine program would be to look at the `verified-purchases` and compare that to `star-rating` and whether or not a verified purchase is more likely to have five-star reviews compared to non-verified purchases. 