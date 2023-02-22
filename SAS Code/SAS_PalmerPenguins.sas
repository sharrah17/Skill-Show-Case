* Below is a simple example of my SAS skills.


data palmerPenguins;


	input species $ island $ bill_length_mm bill_depth_mm
	flipper_length_mm body_mass_g sex $ year $;

	*Prob 3;
	if bill_length_mm >= 30 and bill_length_mm <= 34.99 then bill_length_Category = 1; else
	if bill_length_mm >= 35 and bill_length_mm <= 39.99 then bill_length_Category = 2; else
	if bill_length_mm >= 40 and bill_length_mm <= 44.99 then bill_length_Category = 3; else
	if bill_length_mm >= 45 and bill_length_mm <= 49.99 then bill_length_Category = 4; else
	if bill_length_mm >= 50 and bill_length_mm <= 54.99 then bill_length_Category = 5; else
	if bill_length_mm >= 55 and bill_length_mm <= 59.99 then bill_length_Category = 6;
	
	*proc print data = palmerPenguins;
	
	proc means data = palmerPenguins;
	var bill_length_mm;
	
	proc freq data = palmerPenguins;
	tables bill_length_Category;
	

	*Histogram for body mass;
	proc sgplot data = palmerpenguins;
		histogram body_mass_g;
		title 'Distribution of body_mass_g';
	
	*Histogram for body mass by species;
	proc univariate data = palmerPenguins;
  		class species;
  		var body_mass_g;
  		histogram body_mass_g / kernel overlay;

	
	*Box plot for flipper length;
	proc sgplot data = palmerPenguins;
   		vbox flipper_length_mm;
   		title 'Distribution of flipper_length_mm';

	*Box plot for flipper length by species;
	proc sgplot data = palmerPenguins;
   		vbox flipper_length_mm / category = species;
   		title 'Distribution of flipper_length_mm';
  

	*Scatter plot of two variables;
	proc sgscatter  data  = palmerPenguins;
   		plot bill_length_mm * flipper_length_mm;
   		title 'Scatter PLot Prob 6';


	*Summary stats for 3 variables;
	proc means data = palmerPenguins;
	var bill_depth_mm;
	
	proc univariate data = palmerPenguins;
	var bill_depth_mm;
	
	proc means data = palmerPenguins;
	var flipper_length_mm;
	
	proc univariate data = palmerPenguins;
	var flipper_length_mm;
	
	proc means data = palmerPenguins;
	var body_mass_g;
	
	proc univariate data = palmerPenguins;
	var body_mass_g;
	
	
	*Linear Regression;
	proc reg data = palmerPenguins;
		model bill_length_mm = flipper_length_mm;
		
		
		
		