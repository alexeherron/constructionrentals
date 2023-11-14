# Construction Rentals
Gaining insights fron 16 years of construction data, using python, SQL, and Tableau.

**Links to Tableau vizzes:** 

[Construction Rentals - all products](https://public.tableau.com/views/ConstructionRentals/Dashboard1?:language=en-US&:display_count=n&:origin=viz_share_link)

[Construction Rentals - aerator analysis](https://public.tableau.com/views/Aeratorrentalsradial/Aeratordashboard?:language=en-US&publish=yes&:display_count=n&:origin=viz_share_link)

# The data
[This dataset from Kaggle](https://www.kaggle.com/datasets/andersra/sales-data-from-a-rental-company) contains rental data from various contruction rental vendors in Denmark between 2004 and 2020.

## How It's Made:

**Tech used:** Python, SQL, Tableau

I used python for data exploration and cleaning, looking at safety stock, and focusing on inventory stress for one machine type: aerators. 
Then I used SQL to look at machine popularity and perform additional analysis on aerator rentals.

## Visualizations

Using Tableau, I first created [this dashboard](https://public.tableau.com/app/profile/alex.herron/viz/ConstructionRentals/Dashboard1), 
which visualizes orders per year, average rental duration per product class, and order volume by month.

<div class='tableauPlaceholder' id='viz1699996264247' style='position: relative'><noscript><a href='#'><img alt='Dashboard 1 ' src='https:&#47;&#47;public.tableau.com&#47;static&#47;images&#47;Co&#47;ConstructionRentals&#47;Dashboard1&#47;1_rss.png' style='border: none' /></a></noscript><object class='tableauViz'  style='display:none;'><param name='host_url' value='https%3A%2F%2Fpublic.tableau.com%2F' /> <param name='embed_code_version' value='3' /> <param name='site_root' value='' /><param name='name' value='ConstructionRentals&#47;Dashboard1' /><param name='tabs' value='no' /><param name='toolbar' value='yes' /><param name='static_image' value='https:&#47;&#47;public.tableau.com&#47;static&#47;images&#47;Co&#47;ConstructionRentals&#47;Dashboard1&#47;1.png' /> <param name='animate_transition' value='yes' /><param name='display_static_image' value='yes' /><param name='display_spinner' value='yes' /><param name='display_overlay' value='yes' /><param name='display_count' value='yes' /><param name='language' value='en-US' /></object></div>                

Then, I decided to go deeper on one product class: aerators. [this dashboard](https://public.tableau.com/app/profile/alex.herron/viz/Aeratorrentalsradial/Aeratordashboard?publish=yes) 
visualizes inventory stress and rental duration.

<div class='tableauPlaceholder' id='viz1699996649936' style='position: relative'><noscript><a href='#'><img alt='Aerator dashboard ' src='https:&#47;&#47;public.tableau.com&#47;static&#47;images&#47;Ae&#47;Aeratorrentalsradial&#47;Aeratordashboard&#47;1_rss.png' style='border: none' /></a></noscript><object class='tableauViz'  style='display:none;'><param name='host_url' value='https%3A%2F%2Fpublic.tableau.com%2F' /> <param name='embed_code_version' value='3' /> <param name='site_root' value='' /><param name='name' value='Aeratorrentalsradial&#47;Aeratordashboard' /><param name='tabs' value='no' /><param name='toolbar' value='yes' /><param name='static_image' value='https:&#47;&#47;public.tableau.com&#47;static&#47;images&#47;Ae&#47;Aeratorrentalsradial&#47;Aeratordashboard&#47;1.png' /> <param name='animate_transition' value='yes' /><param name='display_static_image' value='yes' /><param name='display_spinner' value='yes' /><param name='display_overlay' value='yes' /><param name='display_count' value='yes' /><param name='language' value='en-US' /><param name='filter' value='publish=yes' /></object></div>             
