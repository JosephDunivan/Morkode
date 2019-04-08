# Morkode
    Contents: 
        - Description
        - Special Instuctions
        - More Information and Code Notes
        - Plugin Copyright Licenses 

# Description
This app called Morkode(more code get it, because of the file size) takes in a message and transcribes it into morse code through the camera flash in iPhone and Android phones. 

## Special instructions

    This app is designed to be run on an iPhone X. 
    It has been tested on both iPhone X and iPhone 7. 

    It uses the camera flash. Therefore a real device is needed to experience the purpose of the app, but it will run on an emulator, just without flash.  

    This must be run in portrait mode for proper spacing of the elements and animations. For iOS, portrait mode needs to be selected manually in xCode. I'd prefer if this ran on a real physical iPhone X. 

    Special Characters cannot be used, only alphanumerics. Letters a-z and digits 0-9 can be used. Special characters such as "&", ".", "&", "$", etc cannot be used as they have not been included in the Map object. 

    You will need to use your own xCode signing certificate. 


## More Information and Code Notes

You can enter in any message, but be wary of the length, as the Morse code version of the message is much longer than the original. 

Since dart does not have dictionaries like python, I have mapped characters to a list of numbers indicating the units time each flash or pause should play for. The units can be a 1, 3, or 7. The units are multiplied by the appropriate milliseconds in the `submit()` function. The speed can be edited in the code within the `submit()` function. 

Most of the complicated code controls the Morse code transcription logic. First, the text message is trimmed of trailing and leading spaces and split into a list object of the letters. Then those characters used to add their morse code counterpart from the Mapped morse object to a new list called message. Counters are used to iterate over this message and play flashes and pauses in an async way. This function also controls the animation state to indicate proper feedback to the user. 

The available animations states for the Flare animations are Play, Idle, and Done. 

Additionally, the LinearPercentIndicator shows the status and percentage of completion for a Morse code sequence. This feedback lets the user know roughly when their morse code message will be done playing. A special function is used to keep the percent within the bounds of 0 and 1, as not to become out of bounds(  `(percent * 100).truncateToDouble()/100 )`.

Overall I would have loved to add many more features given a larger limit on the file size. 

#Plugins Copyright Information 

## Flutter_percent_indicator
    https://github.com/diegoveloper/flutter_percent_indicator/blob/master/LICENSE

        BSD 2-Clause License

        Copyright (c) 2018, diegoveloper@gmail.com
        All rights reserved.

        Redistribution and use in source and binary forms, with or without
        modification, are permitted provided that the following conditions are met:

        * Redistributions of source code must retain the above copyright notice, this
        list of conditions and the following disclaimer.

        * Redistributions in binary form must reproduce the above copyright notice,
        this list of conditions and the following disclaimer in the documentation
        and/or other materials provided with the distribution.

        THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
        AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
        IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
        DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE
        FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
        DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
        SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
        CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY,
        OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
        OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

## Flare-Flutter
    https://github.com/2d-inc/Flare-Flutter/blob/master/LICENSE

        MIT License

        Copyright (c) 2018 2D, Inc

        Permission is hereby granted, free of charge, to any person obtaining a copy
        of this software and associated documentation files (the "Software"), to deal
        in the Software without restriction, including without limitation the rights
        to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
        copies of the Software, and to permit persons to whom the Software is
        furnished to do so, subject to the following conditions:

        The above copyright notice and this permission notice shall be included in all
        copies or substantial portions of the Software.

        THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
        IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
        FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
        AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
        LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
        OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
        SOFTWARE.

## flutter_lamp
    https://github.com/clovisnicolas/flutter_lamp/blob/master/LICENSE

        MIT License

        Copyright (c) 2018 Clovis NICOLAS

        Permission is hereby granted, free of charge, to any person obtaining a copy
        of this software and associated documentation files (the "Software"), to deal
        in the Software without restriction, including without limitation the rights
        to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
        copies of the Software, and to permit persons to whom the Software is
        furnished to do so, subject to the following conditions:

        The above copyright notice and this permission notice shall be included in all
        copies or substantial portions of the Software.

        THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
        IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
        FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
        AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
        LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
        OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
        SOFTWARE.