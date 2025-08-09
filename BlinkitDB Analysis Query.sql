select * from blinkit_data;

use blinkit;

select count(*) from blinkit_data;

update blinkit_data
SET Item_fat_content = 
case 
WHEN Item_fat_content IN ('LF', 'low fat') Then 'Low Fat'
WHEN Item_fat_content = 'reg' THEN 'Regular' 
ELSE Item_fat_content
END;

SELECT DISTINCT(Item_fat_content) FROM blinkit_data;

select Item_fat_content 
from blinkit_data 
where Item_fat_content = 'Regular';

select cast(sum(sales) / 1000000 as decimal(10,2)) as Total_Sales_Millions 
from blinkit_data;

select cast(avg(sales) as decimal(10,1)) as Avg_Sales 
from blinkit_data;

select count(*) as Num_of_Items from blinkit_data;

select cast(sum(sales) / 1000000 as decimal(10,2)) as Total_Sales_Millions 
from blinkit_data
where item_fat_content = 'Low Fat';

select cast(avg(sales) as decimal(10,1)) as Avg_Sales 
from blinkit_data
where outlet_establishment_year = 2022;

select count(*) as Num_of_Items 
from blinkit_data
where outlet_establishment_year = 2022;

select cast(avg(rating) as decimal(10,2)) as Avg_Rating from blinkit_data;

select item_fat_content, sum(sales) as Total_sales
from blinkit_data
group by item_fat_content
order by total_sales desc;

select item_fat_content,
	cast(sum(sales) / 1000000 as decimal(10,2)) as Total_Sales_Millions,
	cast(avg(sales) as decimal(10,1)) as Avg_Sales,
	cast(avg(rating) as decimal(10,2)) as Avg_Rating
from blinkit_data
group by item_fat_content
order by Total_Sales_Millions desc;

select item_fat_content,
	cast(sum(sales) / 1000000 as decimal(10,2)) as Total_Sales_Millions,
	cast(avg(sales) as decimal(10,1)) as Avg_Sales,
	cast(avg(rating) as decimal(10,2)) as Avg_Rating
from blinkit_data
where outlet_establishment_year = 2020
group by item_fat_content
order by Total_Sales_Millions desc;


select item_type, -- Top 5 items
	cast(sum(sales) as decimal(10,2)) as Total_Sales,
	cast(avg(sales) as decimal(10,1)) as Avg_Sales,
	cast(avg(rating) as decimal(10,2)) as Avg_Rating
from blinkit_data
group by item_type
order by Total_Sales desc
limit 5;


select item_type, -- Bottom 5 items
	cast(sum(sales) as decimal(10,2)) as Total_Sales,
	cast(avg(sales) as decimal(10,1)) as Avg_Sales,
	cast(avg(rating) as decimal(10,2)) as Avg_Rating
from blinkit_data
group by item_type
order by Total_Sales
limit 5;


select outlet_location_type, item_fat_content,
	cast(sum(sales) as decimal(10,2)) as Total_Sales,
from blinkit_data
group by outlet_location_type, item_fat_content
order by Total_Sales_Millions desc;


select outlet_establishment_year,
	cast(sum(sales) as decimal(10,2)) as Total_Sales,
	cast(avg(sales) as decimal(10,1)) as Avg_Sales,
	count(*) as Num_of_Items,
	cast(avg(rating) as decimal(10,2)) as Avg_Rating
from blinkit_data
group by outlet_establishment_year
order by Total_sales desc;


SELECT 
    Outlet_Size, 
    CAST(SUM(Sales) AS DECIMAL(10,2)) AS Total_Sales,
    CAST((SUM(sales) * 100.0 / SUM(SUM(Sales)) OVER()) AS DECIMAL(10,2)) AS Sales_Percentage
FROM blinkit_data
GROUP BY Outlet_Size
ORDER BY Total_Sales DESC;


select outlet_location_type,
	cast(sum(sales) as decimal(10,2)) as Total_Sales,
	CAST((SUM(sales) * 100.0 / SUM(SUM(Sales)) OVER()) AS DECIMAL(10,2)) AS Sales_Percentage,
	cast(avg(sales) as decimal(10,1)) as Avg_Sales,
	count(*) as Num_of_Items,
	cast(avg(rating) as decimal(10,2)) as Avg_Rating
from blinkit_data
group by outlet_location_type
order by Total_sales desc;


select outlet_type,
	cast(sum(sales) as decimal(10,2)) as Total_Sales,
	CAST((SUM(sales) * 100.0 / SUM(SUM(Sales)) OVER()) AS DECIMAL(10,2)) AS Sales_Percentage,
	cast(avg(sales) as decimal(10,1)) as Avg_Sales,
	count(*) as Num_of_Items,
	cast(avg(rating) as decimal(10,2)) as Avg_Rating
from blinkit_data
group by outlet_type
order by Total_sales desc;
