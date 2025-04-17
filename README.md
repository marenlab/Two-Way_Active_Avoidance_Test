# Two-Way Active Avoidance Test

This function streamlines the visualization and organization of experimental data from the Colbourn active avoidance chamber by aligning the outputs with distinct event types recorded throughout the session.
<br /> 
------------------
Script: Avoidance_Analyse<br /> 
Main Call<br /> 
– Analyze one or more *.csv files.<br /> 
– This script relies on the following function: Avoidance_conditioning.m<br /> 
<br /> 
Required Files<br /> 
– *.csv files generated by the Colbourn active avoidance chamber.<br /> 
<br /> 
------------------
Function: Avoidance_conditioning<br /> 
<br /> 
INPUT:<br /> 
input_settings – Settings for the experiment (e.g., thresholds, parameters).<br /> 
raw_data – The input dataset from a *.CSV file generated by the Colbourn active avoidance chamber. The spreadsheet consists of five columns:<br /> 
<br /> 
Arbitrary timestamps (no alignment with the time course of the experiment).<br /> 
Time in MM:SS:FFF format (minutes/seconds/milliseconds).<br /> 
Event labels: "Entry" and "Exit" corresponding to the start of periods during programmed stimuli.<br /> 
Numerical labels for the events described in column 5.<br /> 
Descriptive event labels including:<br /> 
  – "Acclimatation": Baseline period.<br /> 
  – "Right/Left Entrance": Animal enters the shuttle.<br /> 
  – "Right/Left Exit": Animal exits the shuttle.<br /> 
  – "Pav CS": Start of Pavlovian conditioning, followed by an "US".<br /> 
  – "CS": Conditioned stimulus.<br /> 
  – "ITI": Inter-trial interval.<br /> 
  – "CS Remainder": Reinforcing conditioned stimulus after a "CS".<br /> 
  – "after CS": Events occurring after the CS Remainder (renamed to "Silence gap after CS remainder").<br /> 
<br /> 
OUTPUT:<br /> 
Summary – A summary of all shuttle events during the experimental session.<br /> 
Intervals – Time intervals corresponding to each CS, CS remainder, after-CS, ITI, and US.<br /> 
Output_Events – Annotated events for each phase, organized in a cell array:<br /> 
  • Column 1: Acclimation phase.<br /> 
  • Column 2: Pavlovian CS phase.<br /> 
  • Column 3: CS, US, and ITI periods.<br /> 
<br /> 
For Output_Events{X}, each spreadsheet consists of:<br /> 
– Column 1: Time course of the experiment.<br /> 
– Column 2: Shuttle direction.<br /> 
– Column 3: Phase during which the shuttle occurred.<br /> 
– Column 4: Description of the phase.<br /> 
– Column 5: Delta t (time difference) from the previous event to the shuttle event.<br /> 
– Column 6: Description of the event that preceded the shuttle event.<br /> 
<br /> 
------------------
Script: Avoidance_stats<br /> 
<br /> 
INPUT:<br /> 
The input dataset comes from the Summary output, which includes all total shuttles from the experimental phase for all animals.<br /> 
<br /> 
OUTPUT:<br /> 
Stats.summary → A 1x3 cell array, where:<br /> 
– Column 1 → Acclimation phase<br /> 
– Column 2 → Pavlovian CS phase<br /> 
– Column 3 → CS, US, and ITI periods of the avoidance session<br /> 
<br /> 
Within each cell, each column corresponds to one animal for the respective event.<br /> 
The order of animals follows the structure of the original upload folder and can be verified using: header.Filename_csv<br /> 
<br /> 
The output also includes a *.csv file containing all data, with each experimental phase separated by blank lines.
<br /> 
------------------
Script: Avoidance_plots Script<br /> 
Just basic plots<br /> 
<br /> 
------------------
Author:<br /> 
Flavio Mourao and Samantha Plas<br /> 
<br /> 
Contact:<br /> 
Email: mourao.fg@illinois.edu<br /> 
Maren Lab – Beckman Institute for Advanced Science and Technology<br /> 
University of Illinois Urbana-Champaign.<br /> 
<br /> 
Started in: 04/2025<br /> 
Last update: 04/2025<br /> 
