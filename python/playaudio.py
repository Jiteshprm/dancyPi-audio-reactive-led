import time
import numpy as np
from pydub import AudioSegment
import config


def start_stream(callback):
    # Load MP3
    audio = AudioSegment.from_mp3("test.mp3")

    # Match your pipeline expectations
    audio = audio.set_channels(1).set_frame_rate(config.MIC_RATE)

    # Convert to NumPy int16
    samples = np.array(audio.get_array_of_samples(), dtype=np.int16)

    frames_per_buffer = int(config.MIC_RATE / config.FPS)
    frame_duration = frames_per_buffer / config.MIC_RATE

    idx = 0
    n_samples = len(samples)

    print("Starting MP3 audio stream")

    while True:
        if idx + frames_per_buffer >= n_samples:
            idx = 0  # loop the file (or break if you prefer)

        # Extract chunk
        y = samples[idx:idx + frames_per_buffer].astype(np.float32)

        # Feed into existing pipeline
        callback(y)

        idx += frames_per_buffer
        time.sleep(frame_duration)
