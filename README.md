# sbv2srt
Bash script to convert close captioning .sbv files to the .srt format.

Update: two days after I created this script, YouTube added the possibility to save the automatically generated captions in .srt form.

YouTube captions can be saved as .sbv files, but LinkedIn requires .srt files. Unfortunately ffmpeg doesn't do the conversion correctly so I wrote this little script to do simple inline replacement and add zero padding to the .sbv file. 

## Usage

    ./sbv2srt.sh filename.sbv
    
Output is written to `filename.srt`
