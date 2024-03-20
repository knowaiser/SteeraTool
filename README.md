# SteeraTool
SteeraTool is a customizable data generation tool that allows for the adjustment of roads, sensors, and car static characteristics.

## Prerequisites
- MATLAB (R2023a or later)
- SIMULINK
- Toolboxes: Automated Driving Toolbox, 
              Embedded Coder, 
              Model Predictive Control Toolbox, 
              Simulink Control Design
## Contents
This repository contains three main folders 
- The Data Generator: this is the MATLAB/Simulink simulator file.
- The Datasets: this folder contains examples of the datasets that can be generated using the tool. All datasets are in .xlsx format.
- The Roads, actors, sensors: This folder contains files that were created using the Driving Scenario Designer App in MATLAB. It has different shaped raods: S-shaped, L-shaped, Zigzag, and Oval-shaped. Plus, the folder contains the files for the sensors customized to match the actor and sensors described by [nuSences: A multimodal dataset for autonomous driving](https://arxiv.org/pdf/1903.11027v5.pdf) All the files in this folder can be accessed using Scenario Designer App on MATLAB and can be added to Simulink models.

## Installation
- MATLAB and Simulink Installation: Ensure MATLAB and Simulink are installed on your computer. If not, visit [the official MATLAB website](https://www.mathworks.com/) for installation instructions.
- Save the Data Generator folder to your MATLAB/Simulink path.
- Open the .slx file either from the MATLAB navigation sidebar or by running this MATLAB syntax:
  ```Matlab
  open_system("LaneFollowingTestBenchExample")
  ```
- The model contains three main subsystems: 1) a subsystem to estimate the lane center based on vision data, 2) a sensor fusion subsystem to process signals coming from the vehicle radar and camera, and finally, 3) a model predictive control (MPC) controller.
- The default road is the S-shaped road. You can choose from the following road name:
    - 'Zigzag_edited'
    - 'L_shaped'
    - 'S_shaped'
    - 'Oval_edited_clock'
    - 'Oval_edited_counter'
- To change the selected road, run this MATLAB syntax:
    ```Matlab
    helperLFSetUp('L_shaped');
    ```


