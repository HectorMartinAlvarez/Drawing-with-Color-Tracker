<h2>IMPORTANT!</h2>
<h3>This project is only compatible with the 32-bit version of processing.</h3>

[More information](#dependencies)

---

Application that identifies the color of an object and allows you to draw on the screen with that object.

This project was develop with Processing 3.5.4 32-bits

## Features

  - User entered colour (RGB) identification.
  - Information and controls located in its own window, visible when clicking on the icon <img src="https://github.com/HectorMartinAlvarez/CIU_6/blob/main/CIU_6/data/help.jpg" alt="Help_Icon" width="25"/>  
  - Drawing pointer display when the searched colour is recognised.
  - Display of the searched color at any time in the lower right corner.
  - Display of the RGB values of the searched color at any time in the upper left corner.
  - It is possible to visualise the outline of the identified colour.
  - Access the camera settings by clicking anywhere in the window except the help icon.

## Controls

|Keys|Action|
|:---:|:----------:|
|Q|Increase colour tolerance|
|A|Decrease colour tolerance|
|W|Increase value of Red colour|
|S|Decrease value of Red colour|
|E|Increase value of Green colour|
|D|Decrease value of Green colour|
|R|Increase value of Blue colour|
|F|Decrease value of Blue colour|
|Y|Start/Finish drawing|
|C|Clean screen|
|H|Show/Hide camera image|
|B|Show/Hide contour of identified colour|
|ESC|Close the application|

## Dependencies

For the correct execution of the project it is necessary to have:
  - JMyron library for processing. [link](http://webcamxtra.sourceforge.net/download.shtml)
    - Once downloaded and unzipped the .ZIP file in the resulting folder you will find a HowToInstall.txt with all the information needed to install the library.
  - DLL file msvcr71.dll
  - DLL file msvcp71.dll

Once you have all the files described above installed, you must run the project with the **32 bit** version of processing. [link](https://processing.org/download)

If you have both versions of processing (32-bit and 64-bit), it is recommended that you first run 32-bit version and open the project from processing.

## References
  - [Creating User Interfaces subject material](https://github.com/otsedom/otsedom.github.io)
  - [Processing Documentation](https://processing.org/reference)
  - [JMyron](http://webcamxtra.sourceforge.net/index.shtml)

<p float="left">
  <img src="https://github.com/HectorMartinAlvarez/CIU_6/blob/main/samples/red.png" alt="Red_Pen" width="250"/>
  <img src="https://github.com/HectorMartinAlvarez/CIU_6/blob/main/samples/green.png" alt="Green_Pen" width="250"/>
  <img src="https://github.com/HectorMartinAlvarez/CIU_6/blob/main/samples/blue.png" alt="Blue_Pen" width="250"/>
</p>

![Pen Gif](https://github.com/HectorMartinAlvarez/CIU_6/blob/main/samples/animation.gif)
![Hand Gif](https://github.com/HectorMartinAlvarez/CIU_6/blob/main/samples/animationHand.gif)
