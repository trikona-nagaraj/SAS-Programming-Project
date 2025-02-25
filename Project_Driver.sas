
/*******************************************************************************************/
/*	Author: Nagaraj Trikona										        Date: 8/5/22	   */
/*                                                                                         */
/*	Title:	Analysis On Guided Learning Hours in Further Education and Sixth Form Colleges */		
/*																				           */
/*				                                                    	Version: 1.0	   */
/*																				           */
/*	email: P2688243@my365.dmu.ac.uk						                Course: IMAT5168   */
/*	Module Leader : Anthony Williams                                                       */
/*  University: De Montfort University													   */					           */
/*******************************************************************************************/
  



/* Note :   The code below Executes the macro program ' ' which analysis the  Guided Learning Hours

            in Further Education and Sixth Form Colleges. Each step of the program will be recorded 
            
            as each of the dataset in the process will be saved into the library path with names specified 
            
            by you below */;  



                                                      /* Below Specify the library path to save the data */
libname lib 'Specify path here' ;                     /* Example: /home/u60875313/Project/Projectlib */
                        
                                                      /* Below Specify 6th form college dataset path */
Filename form6 ' Specify path here ' ;                /* Example: /home/u60875313/IMAT5168-6FORM.csv */


                                                      /* Specify the Name to save processed 6th form college dataset  in library */
%let Form6_data = %str(Specify name here);            /* Example: %let Form6_data = %str(sixthform)*/
                                                      /* Note : Do Not Use '' while giving name */

                                                      /* Below Specify the Further Education dataset path */
filename FE 'Specify path here';                      /* Example: /home/u60875313/IMAT5168-FE.csv */
                                                     
                                                      /* Specify the Name to save processed Further Education dataset in library */
%let FE_data = %str(Specify name here);               /* Example: %let FE_data = %str(FEdata)*/

                                                      /* Specify the Name to save Merged dataset in library */
%let Merged_data = %str(Specify name here);           /* Example: %let Merged_data = %str(MergedData)*/

                                                      /* Specify the Name to save Cleaned dataset in library */
%let Cleaned_data = %str(Specify name here);          /* Example: %let Cleaned_data = %str(CleanedData)*/

                                                      /* Specify the Name to save Modified(anomalies) dataset in library */
%let Modified_data = %str(Specify name here);         /* Example: %let Modified_data = %str(ModifiedData)*/

                                                      /* Specify the Name to save Transposed data (For Year= Year1,year2, year3) dataset in library */
%let Transposed_data = %str(Specify name here);       /* Example: %let Transposed_data = %str(TransposedData)*/
 
                                                      /* Specify the Main Program code path */
Filename main 'Specify path here';                    /* Example: /home/u60875313/main.sas */





%let Lib_path = lib;                                  /* Assigning 6th form data path as Macro */

%let Form6_path = form6;                              /* Assigning 6th form data path as Macro */
                                   
%let FE_data_path = FE;                               /* Assigning Further Education data path as Macro */

%let Main_Macro = %str(main);                         /* Assigning Main Program path as Macro*/

options symbolgen mprint mlogic;                      /* Shows values assigning to variables */

%include %str(&Main_Macro);                           /* Initializing Main Program */

options nosymbolgen nomprint nomlogic;











