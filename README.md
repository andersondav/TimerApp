# Timer App

# Description

- Recreate Onyx timer app
- Set up routines of exercises that can be played through

# Required User Stories

- [ ]  User can create exercises with a name, description, and (default) time length
    - The time length can be overridden when adding the exercise to a routine
- [ ]  User can create routines with exercises, a name, description
    - Can also specify whether or not to add rest between each exercise, and how long that rest should be
- [ ]  User can play through the routine, which will run through the exercises and rests for their time period
    - Add sound effects for last x seconds of exercise and switching exercises
- [ ]  Routines and exercises are saved
    - To start, they’ll be saved on device

# Future User Stories

- [ ]  Add ability to add images for exercieses and routines
- [ ]  Add voice to count down last x seconds of exercise
- [ ]  Save exercises off device
    - Will require account creation and login flow
- [ ]  Exercises/routines can have editable/custom sounds
- [ ]  Stats page
    - Most used exercises
    - Most frequent routines
    - Total time spent in routines

# Screens

- Main page will be a tab controller of 3 tabs: routines, exercises, settings
- Routines screen
    - will list all created routines, and + button to add a new routine through routine creation page
    - Can click on a routine in the list to go to routine detail page
- Routine detail page
    - Shows routine name, description, and total time
    - Lists names of all exercises/rests in the routine and their durations
    - Functionalities
        - Add exercises
            - Pops up a list of all available exercises to add one to routine
        - Re-order exercises/rests
        - Delete exercises
        - Replace exercises?
- Routine creation page
    - TBD
- Exercises screen
    - will list all created exercises, and + button to add a new exercise through exercise creation page
    - Can click on an exercise in the list to go to exercise detail page
- Exercise detail page
    - View exercise name, description, and duration
- Exercise creation page
    - Entry fields for exercise name, description, and duration
- Settings
    - Exercise Time Override (ETO) switch
        - If on, an exercise added to a routine will have its own duration
        - Default is off

# Models

- Exercise
    - Name: String
    - Description: String
- Event (protocol)
    - Display name: String
    - Display description: String?
- ExerciseEvent: Event
    - Exercise: Exercise
        - Saves some memory if a exercise is used often by not duplicating its name and description
    - Duration (seconds): Int
        - If a routine has no default exercise duration set or ETO is enabled, when this exercise is added to a routine, this value will be used for the exercies’s duration
    - Display name: Exercise’s name
    - Display description: Exercise’s description
- RestEvent: Event
    - Duration (seconds): Int
        - These will be created as part of routine construction, but the user can edit them later on
    - Display name: Rest
    - Display description: nil
- Routine
    - Name: String
    - Description: String
    - Events: List of exercises/rests that are part of the routine (in order)
    - Rest length (seconds): Int?
        - Must be greater than 0
        - Function
            - If not null, this value will be used to add rests between each exercise when the routine is initially created, and to add rest when adding a new exercise while editing the routine
    - Default exercise duration (seconds): Int?
        - Must be greater than 0
        - Function
            - If not null and ETO is disabled, all exercises added to this routine will have this duration on routine creation (can be edited later)
            - If null or ETO is enabled, all exercises added to this routine will have their own duration