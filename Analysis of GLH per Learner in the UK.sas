/*******************************************************************************************/
/*	Author: Nagaraj Trikona							 	           
/*                                                                                                
/*	Title:	Analysis On Guided Learning Hours in Further Education and Sixth Form Colleges   		
/*										                 
/*******************************************************************************************/
 

      
/***************/
/* Data step   */
/***************/


/***********************************************/
/*   Importing  'Sixth Form Colleges'  dataset */
/***********************************************/
;

data &Lib_path..&Form6_data ;                              /* Introducing data step */

        INFILE  &Form6_path                               /* Importing data */
                              dsd                         /* Handling Continuous delimeters */ 
                              dlm=','                     /* Setting delimeter ',' */
                              firstobs=2                  /* Reading data from second observation to avoid header*/
                              missover    ;               /* Avoiding skip of records at the end of line due to missing value*/
       
        informat                                          /* Specifying informat for variable data*/
                    Institute_Type   $18.                 /* placing maximum size of the variable value*/
                    Region           $24. ;                     
        Input                                             /* Inputting variables */
	               	                                      /* $ Specifies categorical value */
	               
	                Institute_Type   $                    /* Type of Instiitute */
                    Region           $                    /* Institute Region */
                    Glh_year_1                            /* Year 1 Learning hours */
                    learners_year_1                       /* Learners count Year 1  */
                    Glh_year_2                            /* Year 2 Learning hours */
                    learners_year_2                       /* Learners count Year 2  */
                    Glh_year_3                            /* Year 3 Learning hours */
                    learners_year_3  ;                    /* Learners count Year 3  */
                   
        if Region = '' then delete   ;                    /* Deleting records with missing data in 'Region'
                                                            which removes the totalcumulated value present in between the data*/
        
        run;
        

title 'Sixth Form college Dataset';                        /* Specifying Title */

proc print                                                /* Printing the dataset imported */
	   
	   data = &Lib_path..&Form6_data label;
      
run;


/**********************************************/
/* Importing  'Further Education' dataset     */  
/**********************************************/ 

DATA &Lib_path..&FE_data  ;                                       /* Introducing data step */

        INFILE &FE_data_path                              /* Importing data */
                              dsd                         /* Handling Continuous delimeters */ 
                              dlm=','                     /* Setting delimeter ',' */
                              firstobs=2                  /* Reading data from second observation to avoid header*/
                              missover    ;               /* Avoiding skip of records at the end of line due to missing value*/
       
        informat                                          /* Specifying informat for variable data*/
                    Institute_Type   $18.                 /* placing maximum size of the variable value*/
                    Region           $24. ;                     
        Input                                             /* Inputting variables */
	               	                                      /* $ Specifies categorical value */
	               
	                Institute_Type   $                    /* Type of Instiitute */
                    Region           $                    /* Institute Region */
                    Glh_year_1                            /* Year 1 Learning hours */
                    learners_year_1                       /* Learners count Year 1  */
                    Glh_year_2                            /* Year 2 Learning hours */
                    learners_year_2                       /* Learners count Year 2  */
                    Glh_year_3                            /* Year 3 Learning hours */
                    learners_year_3  ;                    /* Learners count Year 3  */
                   
        if Region = '' then delete   ;                    /* Deleting records with missing data in 'Region'
                                                            which removes the totalcumulated value present in between the data*/
        
        run;

title 'Further Education dataset';                                        /* Specifying Title */

proc print                                                                /* Printing the dataset imported */
	   
	   data = &Lib_path..&FE_data label;
	  
run;


/**********************************************/
/*   Merging FORM6_DATA  and  FE_DATA         */  
/**********************************************/

data &Lib_path..&Merged_data ;                                       /* Specifying the dataset name to be saved */
  
  set                                                      /* Adding lib1.FORM6_DATA and lib1.FE_DATA using set cammand */ 
        &Lib_path..&Form6_data 
        &Lib_path..&FE_data; 
 
  label		                                               /* Labeling the data */
		
        Institute_Type    = 'Type of Instiitute'              
        Region            = 'Institute Region'
        Glh_year_1        = 'Year 1 Learning hours'
        learners_year_1   = 'Learners count Year 1'
        Glh_year_2        = 'Year 2 Learning hours'
        learners_year_2   = 'Learners count Year 2'
        Glh_year_3        = 'Year 3 Learning hours'
        learners_year_3   = 'Learners count Year 3' 
        ;
   
run;

title 'Dataset After Merging';                                                 /* Specifying Title */

proc print                                                                     /* Printing Merged dataset */
          data= &Lib_path..&Merged_data 
          label                                                                /* Specifying to label the data */
          ;

run;


/*************************************************************/
/*  Looking missing values and Total value count in the data */  
/*************************************************************/

title 'Looking Into Missing Value Count';                    

proc means                                                   /* Using proc means to list n nmiss min max maxdec values of the data */
          data = &Lib_path..&Merged_data          
          n nmiss min max maxdec= 0;
      
     var                                                     /* Listing variables to obtain means */
        Glh_year_1 
        learners_year_1 
        Glh_year_2 
        learners_year_2 
        Glh_year_3 
        learners_year_3;
run;



/***************************************************************************/ 
/*   Data Cleaning :                                                       */    
/*                              Handling missing values ,                  */
/*                              Calculating Average_Glh_Hours,             */ 
/*                              Total GLH/Learner and                      */
/*                              specifying the size of the Institute       */
/*                                                                         */
/***************************************************************************/


/* we see that there are missing values in the data therfore, 
   treating missing values with 'mean' and 
   removing the missing values which cannot be treated with 'mean' due to insufficient information */



data  &Lib_path..&Cleaned_data;

      set &Lib_path..&Merged_data;                                         /* Includes the data to present constructing dataset*/ 
                   
                           												   /* Deleting the missing value*/                          												  
      if learners_year_1  = . AND learners_year_2  = . 
       
                 then delete ;      
           
           else if learners_year_2 =. AND learners_year_3 = . 
            
                 then delete ;
           
           else if learners_year_3 =. AND learners_year_1 = . 
           
                 then delete ;
            
      if learners_year_1 = . 
       
                 then  learners_year_1 = ((learners_year_2 + learners_year_3)/2) ;
       
           else if learners_year_2 = . 
         
                 then  learners_year_2 = ((learners_year_1 + learners_year_3)/2) ;
           
            else if learners_year_3 = . 
                 
                 then  learners_year_3 = ((learners_year_2 + learners_year_1)/2) ;
        
     if Glh_year_1  = . AND Glh_year_2  = . 
        
                 then delete ;
     
            else if Glh_year_2 =. AND Glh_year_3 = . 
            
                 then delete ;
            
            else if Glh_year_3 =. AND Glh_year_1 = . 
            
                 then delete ;
            
                 
      if Glh_year_1 = . 
      
                 then  Glh_year_1 = ((Glh_year_2 + Glh_year_3)/2) ;
      
            else if Glh_year_2 = . 
            
                  then  Glh_year_2 = ((Glh_year_1 + Glh_year_3)/2) ;
             
            else if Glh_year_3 = . 
            
                  then  Glh_year_3 = ((Glh_year_2 + Glh_year_1)/2) ;
              

                                                   /* Finding Average glh hours to to specify Size of Institute*/ 
                                                  
           Average_Glh_Hours = ((Glh_year_1 + Glh_year_2 + Glh_year_3)/3) ;                                   
            
           Glh_per_learner_1     =   (Glh_year_1 / learners_year_1) ;
          
           Glh_per_learner_2     =   (Glh_year_2 / learners_year_2) ;
          
           Glh_per_learner_3     =   (Glh_year_3 / learners_year_3) ;
           
           Total_Glh_per_learner =   ((Glh_year_1 + Glh_year_2 + Glh_year_3) 
                                         
                                      / (learners_year_1 + learners_year_2 + learners_year_3)) ;
          
  
  
  format Size $15. ;                                                  /* Specifying length of the size variable */
  
  label		                                                          /* Labeling the data */		
           Average_Glh_Hours     = 'Average Glh Hours'
           Glh_per_learner_1     = 'GLH per Learner year 1' 
           Glh_per_learner_2     = 'GLH per Learner year 2' 
           Glh_per_learner_3     = 'GLH per Learner year 3' 
           Total_Glh_per_learner = 'Overall GLH per Learner' 
           Size                  = 'Size Of Institute'
           ;
 		
 	
          if Average_Glh_Hours > 3000000 	then Size ='Large' ;
           
                 else if 2000000 <= Average_Glh_Hours < 3000000 
                   
                               then Size ='Large-medium';
                               
                 else if 1000000 <= Average_Glh_Hours < 2000000 
                   
                               then Size ='Medium';
 		          
 	             else if 500000 <= Average_Glh_Hours < 1000000 
 	                         
 	                           then Size ='Small-medium' ;
 		  				
 	             else if Average_Glh_Hours < 500000 
 	             
 	                           then Size ='Small';
 		  							                 
                 run;      

title 'Dataset After Data Cleaning ';                                      /* Specifying Title */

proc print 
      
      data = &Lib_path..&Cleaned_data label;
run;       

ods exclude enginehost;

title ' Variable Information ';         

proc contents                                                              /* Looking into variable information */
             data = &Lib_path..&Cleaned_data ;

run;

ods select all;


/*******************************************************************************************/
/*                            Finding Anaomalies and Refining the data                     */ 
/*******************************************************************************************/




/* identifying extreme values which may affect analysis  writing out to table called extremes */;

ods select none;
ods output 
  
       ExtremeObs= EXTREMES ;
       
proc univariate 
       
       data= &Lib_path..&Cleaned_data;
       var Total_Glh_per_learner ;
   
run;

ods select all;

title 'Below Are Extreme values in the Total Glh/Learner';

proc print 

       data=EXTREMES;
       
run;


/* Looking  whether Extreme Values Lie below (mean + 3 std) also Normality of data */


title 'Looking into Distribution Of Total_Glh_per_learner and Outliers Position';

proc univariate 

        data= &Lib_path..&Cleaned_data normal ;
       
        var 
	          Total_Glh_per_learner  ;
	          
   	    histogram / KERNEL normal(mu= est sigma= est) ;
       
        qqplot / normal(mu= est sigma= est) ;
        
        inset n nmiss min q1 median q3 max skew kurt / position= SE ;

run;


/*****************************************************************/
/* Looking into box plot w.r.t  institute type to find outliers  */
/*****************************************************************/


/*******************************/
/* Box plot on Total Learners  */ 
/*******************************/


title ' Looking For Outliers In Total_Glh_per_learner ';

proc sgplot 
       
       data = &Lib_path..&Cleaned_data;
       
       vbox Total_Glh_per_learner; 
       
       xaxis label="Institute_Type";
       
       keylegend / title="distribution of Total_Glh_per_learner vs Institute_Type";
       

run; 

/*****************************************/
/* Applying log on Total_Glh_per_learner */
/*****************************************/

data &Lib_path..&Modified_data;                                                /* Saving log value in New dataset */

      set &Lib_path..&Cleaned_data;
   
      log_Glh_per_learner = log(Total_Glh_per_learner);	                       /* Log transformation */
  

run;

title 'Modified Dataset After Refining Anomalies';


Proc print 
    
        data = &Lib_path..&Modified_data label;
run;


/***********************************************************/
/* Comparing log_Glh_per_learner and Total_Glh_per_learner */
/***********************************************************/


title 'Comparing Total_Glh_per_learner and log_Glh_per_learner';

proc univariate 
 
    data = &Lib_path..&Modified_data ;
	
	var Total_Glh_per_learner log_Glh_per_learner;

   	histogram / KERNEL normal(mu= est sigma= est) ;
       
    qqplot / normal(mu= est sigma= est) ;
        
    inset n nmiss min q1 median q3 max skew kurt / position= SE ;

    run;


/* The above observation state that the distribution is tends to be a ' Normal distribution / gaussian distribution '
   After appling the log to the glh learners */


/*******************************/
/* Box plot on Total glh hours */ 
/*******************************/

title ' Looking For Outliers In log_Glh_per_learner ';

proc sgplot 

       data = &Lib_path..&Modified_data ;
       
       vbox log_Glh_per_learner;
       
       xaxis label="Institute_Type";
       
       keylegend / title="distribution of log_Glh_per_learner ";

run; 


/****************************************************************************************************/
/*                                                                                                  */
/*                                      Exploratory Data Analysis                                   */
/*                                                                                                  */
/****************************************************************************************************/


/********************************/
/* Summarizing Output Variables */
/********************************/


title ' Distribution of log_Glh_per_learner ';

proc univariate

             data     = &Lib_path..&Modified_data ;
             var         log_Glh_per_learner;
             histogram /
             normal;
run;



/*************************************/
/* Summarizing Independent Variables */
/*************************************/


title ' Summarizing Institute_Type ';

proc freq

	            data = &Lib_path..&Modified_data;
	            table Institute_Type  ;                   /* summarizing Institute_Type */
	
run;


title ' Summarizing Region of the Institute ';

proc freq
	         data = &Lib_path..&Modified_data;
	         table Region;                              /* summarizing  Region */
run;

title ' Summarizing Size of the Institute  ';

proc freq
	   
	         data = &Lib_path..&Modified_data;
	         table Size;                                /* summarizing Institute size */
run;



/**********************************************************************/
/* Finding relationships between independent and dependent variables  */
/**********************************************************************/




                 /* Analysis on Total_Glh_per_learner by Institute_Type and Size */
                
                 /****************************************************************/




title1 ' Analysis on Total_Glh_per_learner by Institute_Type and Size ';

title2 ' Summarizing Institute_Type by Size ';

proc freq
	            data = &Lib_path..&Modified_data;
	            
	            table Institute_Type * Size ;                                   /* summarizing Institute_Type */
	
run;

proc tabulate	                                                                /* Relationship between Institute_Type and Size */
            
              data = &Lib_path..&Modified_data;
  
              class Institute_Type Size ;                                       /* dividing the Total_Glh_per_learner into groups by  Institute_Type */
            
              var 
                   Total_Glh_per_learner ;                                      /* Calculate descriptive statistics for Total_Glh_per_learner */ 
                 
              table  (Total_Glh_per_learner) * Institute_Type * Size            /* For each  Institute_Type showing the summary 	*/  
                    
                    , (n nmiss min q1 median q3 max mean std);
                   
run;




                 /* Analysis on the effect of region and year on Total_Glh_per_learner */
                
                 /**********************************************************************/



title1 ' Analysis on the effect of region and year on Total_Glh_per_learner '; 

proc tabulate	                                                              /* Relationship between Region of institute and year wise Total_Glh_per_learner */
             
           data = &Lib_path..&Modified_data;
  
           class Region  ;                                                    /* dividing the Total_Glh_per_learner into groups by  Region */
            
           var 
                 Glh_per_learner_1
                 Glh_per_learner_2
                 Glh_per_learner_3;                                           /* Calculate descriptive statistics for Total_Glh_per_learner */                   
                                  
           table  Region * (Glh_per_learner_1 Glh_per_learner_2 Glh_per_learner_3)
                           , n min q1 median q3 max ;
                                                                              /* For Region  Year showing the summary 	*/                                                      
           run;

 
 
  
/****************************************************************************************************/
/*                                                                                                  */
/*                                      Statistical modelling                                       */
/*                                                                                                  */
/****************************************************************************************************/


/****************************************************************************/ 
/* Examining effect of Institute_Type on glh/learner Through 't-test'       */
/****************************************************************************/ 


title1 'Examining Effect of Institute_Type on glh/learner  Through t-test';

                                                                  /* Looking into Means in Glh_per_learner variable */
title2 'Looking Into Means in Glh_per_learner variable';

proc means 
                data = &Lib_path..&Modified_data;
                  
                class Institute_Type;
                  
                var log_Glh_per_learner;                      /* Here we have used unmodified glh per learner */
run;
                                                                 /* Looking into Normality in Glh_per_learner */

title 'Scatter Plot between Institute_Type and glh/learner';
                        
proc sgplot
	             data = &Lib_path..&Modified_data;
	             
	             scatter 
	             
	             x=Institute_Type y=log_Glh_per_learner;
	             
	             yaxis min=0;
run;

title 'Box Plot between Institute_Type and glh/learner';

proc sgplot
	             data = &Lib_path..&Modified_data;
	             
	             vbox 
	             
	             log_Glh_per_learner / group=Institute_Type;
	             
	             yaxis min=0;
run;


title 'Looking Into Normality in Glh_per_learner';

proc univariate
	            
	            data = &Lib_path..&Modified_data;
	            
	            var log_Glh_per_learner;                          /* Here we have used modified glh per learner */
	            
	            qqplot log_Glh_per_learner / normal(mu=est sigma=est); 
run;


                                                                /* Performing t-test */
title 'Performing t-test';

ods graphics on;

proc ttest 
               data= &Lib_path..&Modified_data;
               
               class Institute_Type;
               
               var log_Glh_per_learner;     
run;
                                                               /* Viewing  the Residuals */
title 'Viewing  the Residuals';

proc GLM 
                data= &Lib_path..&Modified_data;
                
                class Institute_Type;
                
                model log_Glh_per_learner = Institute_Type;
                
                means Institute_Type / lsd hovtest=levene ;
                
                output out= LongRes p= predicted r= residual;

quit;
                                                              /* Checking normality for the residuals */

title 'Plotting Residuals';

ods select TestsForNormality Histogram QQPlot PPPlot ;

proc univariate 
                
                data= LongRes normal ;
                
                var residual ;
                
                histogram / normal(mu= est sigma= est) kernel(color=red) ;
                
                ppplot / normal(mu= est sigma= est) ;
                
                qqplot / normal(mu= est sigma= est) ;
                
                inset n nmiss min q1 median q3 max skew kurt / position= SE ;
run;


ods graphics off;
 
   
   
   

/****************************************************************************/ 
/* Examining Effect of Region on glh/learner Through 'ANOVA'                */
/****************************************************************************/


title1 'Effect of Region on glh/learner Through ANOVA';
title2 'Looking Into Means in Glh_per_learner variable';

proc means 
	              data = &Lib_path..&Modified_data  n mean std fw=5 maxdec=1 nonobs;
	              
	              class Region;
	              
	              var log_Glh_per_learner;
run;

                   /* Difficult to tell,  as the standard deviations overlap with the means,  East Midlands and 
                          West Midlands are the only centres that look like they have a different pass rates.  */
                         

title 'Scatter Plot between Region and glh/learner';
                        
proc sgplot
	             data = &Lib_path..&Modified_data;
	             
	             scatter 
	             
	             x=Region y=log_Glh_per_learner;
	             
	             yaxis min=0;
run;

title 'Box Plot between Region and glh/learner';

proc sgplot
	             data = &Lib_path..&Modified_data;
	             
	             vbox 
	             
	             log_Glh_per_learner / group=Region;
	             
	             yaxis min=0;
run;

                   /* Both the above plots seem to confirm our hunch that there is no difference between the groups */
                   /* examine proc univariate to see if there is a "normal" distribution within groups not group obs 
                 are small  */

title 'Univariate Analysis On Region and glh/learner';

proc univariate 
	             data = &Lib_path..&Modified_data;
                 
                 class Region;
	             
	             var log_Glh_per_learner;
	             
	             qqplot /normal(mu=est sigma=est);
	             
	             histogram /normal;
run;

title 'Applying ANOVA On Region and glh/learner';

proc GLM 
                 data= &Lib_path..&Modified_data;
                 
                 class Region;
                 
                 model log_Glh_per_learner = Region;
                 
                 means Region / lsd hovtest=levene ;
                 
                 output out= LongRes p= predicted r= residual;
quit;

title 'Univariate Analysis On Residuals'; 

proc univariate 
                 data= LongRes normal ;
                 
                 var residual ;
                 
                 histogram / normal(mu= est sigma= est) kernel(color=red) ;
                 
                 ppplot / normal(mu= est sigma= est) ;
                 
                 qqplot / normal(mu= est sigma= est) ;
                 
                 inset n nmiss min q1 median q3 max skew kurt / position= SE ;
run;

   

/****************************************************************************/ 
/* Examining effect of Institution_Size on glh/learner Through 'ANOVA'      */
/****************************************************************************/

title 'Effect of Institution_Size on glh/learner Through ANOVA';

proc means 
	           data = &Lib_path..&Modified_data  n mean std fw=5 maxdec=1 nonobs;
	           
	           class Size;
	           
	           var log_Glh_per_learner;
run;

                   /* Difficult to tell,  as the standard deviations overlap with the means,  East Midlands and 
                          West Midlands are the only centres that look like they have a different pass rates.  */


title 'Scatter Plot by Institution_Size';

proc sgplot
	           data = &Lib_path..&Modified_data ;
	           
	           scatter 
	           
	           x=Size y=log_Glh_per_learner;
	           
	           yaxis min=0;
run;

title 'Box Plot Institution_Size and glh/learner';

proc sgplot
	          data = &Lib_path..&Modified_data ;
	          
	          vbox 
	          
	          log_Glh_per_learner / group=Size;
	          
	          yaxis min=0;
run;

                   /* Both the above plots seem to confirm our hunch that there is no difference between the groups */
                   /* examine proc univariate to see if there is a "normal" distribution within groups not group obs 
                 are small  */

title 'Univariate Analysis On Institution_Size and glh/learner';

proc univariate 
	          
	          data = &Lib_path..&Modified_data ;
              
              class Size;
	          
	          var log_Glh_per_learner;
	          
	          qqplot /normal(mu=est sigma=est);
	          
	          histogram /normal;
run;

title 'Applying ANOVA On Institution_Size and glh/learner';

proc GLM 
              data= &Lib_path..&Modified_data;
             
              class Size;
              
              model log_Glh_per_learner = Size;
              
              means Size / lsd hovtest=levene ;
              
              output out= LongRes p= predicted r= residual;
quit;

title 'Univariate Analysis On Residuals';

proc univariate 
              
              data= LongRes normal ;
              
              var residual ;
              
              histogram / normal(mu= est sigma= est) kernel(color=red) ;
              
              ppplot / normal(mu= est sigma= est) ;
              
              qqplot / normal(mu= est sigma= est) ;
              
              inset n nmiss min q1 median q3 max skew kurt / position= SE ;
run;



/****************************************************************************/ 
/* Examining effect of Year on glh/learner Through 'ANOVA'                  */
/****************************************************************************/


title1 'Examining Effect of Year on glh/learner  Through ANOVA Test ';



/* Creating a new dataset with glh/learner variable for three years  */


Proc transpose 
          
                 data = &Lib_path..&Modified_data 
			   
			     out  = &Lib_path..&Transposed_data(keep = glh_year glh_per_year1)
			   
			     name= glh_year
			   
			     Prefix = glh_per_year;
			   
			     Var  Glh_per_learner_1 Glh_per_learner_2 Glh_per_learner_3 ;
			   
			     by Institute_Type Region notsorted ;
run;



                                                           /* Looking into Means in Glh_per_learner variable */
                                                           
title2 'Looking Into Means in Glh_per_learner variable';

proc means 
	              data = &Lib_path..&Transposed_data n mean std fw=5 maxdec=1 nonobs;
	          
	              class glh_year;
	          
	              var glh_per_year1;
run;

title 'Scatter Plot between Years and glh/learner';

proc sgplot
	              data = &Lib_path..&Transposed_data ;
	          
	              scatter 
	          
	              x=glh_year y=glh_per_year1;
	           
	              yaxis min=0;
run;

title 'Box Plot between Years and glh/learner';

proc sgplot
	              data = &Lib_path..&Transposed_data ;
	
	              vbox 
	         
	              glh_per_year1 / group=glh_year;
	         
	              yaxis min=0;
run;

                   /* Both the above plots seem to confirm our hunch that there is no difference between the groups */
                   /* examine proc univariate to see if there is a "normal" distribution within groups not group obs 
                 are small  */

title 'Univariate Analysis On Years and glh/learner';

proc univariate 
	             data = &Lib_path..&Transposed_data ;
    
                 class glh_year;
	
	             var glh_per_year1;
	
	             qqplot /normal(mu=est sigma=est);
	
	             histogram /normal;
run;

title 'Applying ANOVA On Years and glh/learner';

proc GLM 
                data = &Lib_path..&Transposed_data;
               
                class glh_year;
              
                model glh_per_year1 = glh_year;
   
                means glh_year / lsd hovtest=levene ;
   
                output out= LongRes p= predicted r= residual;
quit;

title 'Univariate Analysis On Residuals';

proc univariate 
                data= LongRes normal ;
           
                var residual ;
    
                histogram / normal(mu= est sigma= est) kernel(color=red) ;
   
                ppplot / normal(mu= est sigma= est) ;
    
                qqplot / normal(mu= est sigma= est) ;
    
                inset n nmiss min q1 median q3 max skew kurt / position= SE ;
run;


   
   
