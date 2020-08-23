import os
import subprocess
import sys
import time


TEST_VIDEO_LOCATION = '/home/pi/lasthouse.mp4'
TEST_VIDEO_LENGTH_MS = 211502

USBDRIVE_DIR = '/mnt/usbdrive'
PROD_VIDEO_LENGTH_MS = 991320
PROD_VIDEO_EXTENSION = '.mov'


def choose_video():

    if os.path.isdir(USBDRIVE_DIR):
        available_videos = [n for n in os.listdir(USBDRIVE_DIR) if n.lower().endswith(PROD_VIDEO_EXTENSION)]
        if available_videos:
            return os.path.join(USBDRIVE_DIR, available_videos[0]), PROD_VIDEO_LENGTH_MS

    return TEST_VIDEO_LOCATION, TEST_VIDEO_LENGTH_MS


def main():

    video_location, video_length_ms = choose_video()

    current_time_ms = round(time.time() * 1000)
    complete_loops, current_position = divmod(current_time_ms, video_length_ms)

    # race condition possible if current_position is close to the beginning or end
    # for now, we'll avoid cleverness and pretend everything is fine
    start_time = complete_loops * video_length_ms
    # if VIDEO_LENGTH_MS - current_position - 5000:
    #    start_time += VIDEO_LENGTH_MS

    return subprocess.call(['omxplayer', '--enablesync', '--sloop', '--playliststarttime', str(int(start_time)), '--vlength', str(video_length_ms), video_location])


if __name__ == '__main__':

    subprocess.call('sudo /home/pi/sync.sh'.split())
    sys.exit(main())
