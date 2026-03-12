# diceRoller - Sensor Mini-App

## Project Overview
This application is a SwiftUI-based dice roller that utilizes the device's motion sensors to detect physical movement and trigger a random dice roll.

## Option Chosen
**Option B: Dice Roller**

## Logic Explanation
The app uses the **CoreMotion** framework to monitor device movement. 
* **Sensor Type:** I implemented `deviceMotion` updates specifically to access `userAcceleration`. This is superior to raw accelerometer data because it filters out gravity, ensuring the dice doesn't roll just by tilting the phone.
* **Math:** The app calculates the magnitude of the 3D acceleration vector using the formula:  
  $$\sqrt{x^2 + y^2 + z^2}$$
* **Shake Detection:** When this magnitude exceeds the defined threshold, a random integer between 1 and 6 is generated.

## Threshold & Cooldown
To ensure a high-quality user experience and prevent "spamming" rolls:
* **Threshold:** Set to **1.5**. This requires a deliberate, firm shake to trigger the roll, preventing accidental triggers from natural hand tremors.
* **Cooldown:** A **0.6-second cooldown** timer is active after every roll. This ensures that one physical shake results in exactly one dice result, even if the motion data spikes multiple times during that second.

## MVVM Folder Structure
The project strictly follows the MVVM architectural pattern to keep logic decoupled from the UI:

* **Managers/**
    * `MotionManager.swift`: Handles CoreMotion setup, starts/stops updates, and processes raw sensor math.
* **ViewModels/**
    * `DiceViewModel.swift`: Owns the sensor layer, manages the `diceValue` state, handles the cooldown logic, and prepares data for the View.
* **Views/**
    * `ContentView.swift`: The main UI container with the Start/Stop controls and background styling.
    * `DiceView.swift`: A programmatic SwiftUI view that renders the red die and black pips based on the current value.

## Screenshots
![App Interface](diceRoller/screenshot1.PNG)
![Dice Roll Result](diceRoller/screenshot2.PNG)

