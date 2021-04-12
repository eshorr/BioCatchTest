# BioCatchTest

I. Mission of this application

-To be able to detect "abnormal" tapping behaviour and be able to configure the thresholds within it.

II. Organization

A. Model
    1. TouchEvent 
        a. Timestamp
        b. Maximum swipe speed
        c. Duration of total event
    2. TouchEventManager
        a. Array of TouchEvents
        b. Max swipe speed 
        c. Maximum frequency of taps
        d. Minimum number of taps before worrying about frequency of taps
        e. Maximum time for tap
        f. Function of adding TouchEvent and detecting error
            -Detecting the max swipe speed, long press time are O(1)
            -Detecting the too many taps at once is O(N)

B. Widgets/View
    1. TouchEventView
        a. A new TouchEvent is created at the beginTouchEvent and sent it's controller/delegate when endTouchEvent occurs. 
        b. The velocity is recorded in the moveTouchEvent
    2. UITouch+Extension
        a. The velocity is determined here 
    3. LinkedTextField 
        a. Used for going straight between fields (legacy issue from me copying some old sample code of mine)

C. Viewcontrollers
    1. ViewController
        a. Used for holding the TouchEventView and then sending the TouchEvent to the TouchEventManager then checking for any errors.
    2. FormEmojiViewController
        a. Old legacy controller for managing LinkedTextFields
    3.  TouchSettingsViewController
        a. Populates fields based on the singleton, TouchEventManager
        b. Saves information back into the TouchEventManager
