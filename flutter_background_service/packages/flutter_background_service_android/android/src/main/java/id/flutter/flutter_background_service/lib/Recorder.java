package id.flutter.flutter_background_service.lib;

import android.content.Context;
import android.util.Log;

import org.json.JSONException;
import org.json.JSONObject;

import id.flutter.flutter_background_service.lib.detection.NoiseModel;
import id.flutter.flutter_background_service.lib.recorders.AudioRecorder;
import id.flutter.flutter_background_service.lib.recorders.LightRecorder;
import io.flutter.plugin.common.MethodChannel;

/**
 * This class is the interface for starting and stopping the tracker.
 * Just call start to start tracking and stop when you want to stop tracking.
 *
 */
public class Recorder {

    public static final String TAG = "SleepMinderRecorder";

    private LightRecorder lightRecorder = null;
    private AudioRecorder audioRecorder = null;
    private StringBuilder data = new StringBuilder();
    private String startTime = "";
    private boolean running = false;
    private OutputHandler outputHandler;
    private NoiseModel noiseModel = new NoiseModel();
    private MethodChannel methodChannel;

    public Recorder(MethodChannel methodChannel) {
        this.methodChannel = methodChannel;
    }

    /**
     * Start tracking
     */
    public void start(Context context, OutputHandler outputHandler) {
        Log.d(TAG, "Start tracking");
        this.outputHandler = outputHandler;
        this.running = true;

        // Set the current timestamp to the data string and set start time
        this.startTime = String.valueOf(System.currentTimeMillis() / 1000L);
        this.data.append(this.startTime);
        this.data.append(";");

        // Get the current data every 5 seconds
        final android.os.Handler customHandler = new android.os.Handler();

        // Start the light recorder
        lightRecorder = new LightRecorder();
        lightRecorder.start(context);

        // Start the audio recorder
        audioRecorder = new AudioRecorder(noiseModel,null, methodChannel, customHandler);
        audioRecorder.start();

        Runnable updateTimerThread = new Runnable()
        {
            public void run() {
                synchronized (Recorder.this) {

                    if(lightRecorder == null || audioRecorder == null) {
                        // Recording already stopped. Do nothing here.
                        return;
                    }
                    // We have to check if we already have a "current" lux. In the first call we might not have gotten a sensor change event.
                    if (lightRecorder.getCurrentLux() != null) {
                        data.append(String.valueOf(lightRecorder.getCurrentLux().intValue()));
                    } else {
                        data.append("-1");
                        Log.d(TAG, "current lux null");
                    }

                    data.append(" ");
                    /*data.append(String.valueOf(noiseModel.getNormalizedRMS()));
                    data.append(" ");
                    data.append(String.valueOf(noiseModel.getNormalizedRLH()));
                    data.append(" ");
                    data.append(String.valueOf(noiseModel.getNormalizedVAR()));*/
                    data.append(noiseModel.getEvent());
                    data.append(" ");
                    data.append(noiseModel.getIntensity());

                    data.append(";");
                    try {
                        JSONObject call = new JSONObject()
                                .put("method", "onReceiveData")
                                .put("args", new JSONObject()
                                        .put("event", noiseModel.getEvent())
                                        .put("intensity", noiseModel.getIntensity())
                                        .put("light", lightRecorder.getCurrentLux())
                                        .put("decibel", noiseModel.getDecibel())
                                );
                        methodChannel.invokeMethod("onReceiveData", call);
                    } catch (JSONException e) {
                        e.printStackTrace();
                    }
                    // Dump the data to the text file if we accumulated "enough" Approximately every 15 minutes
                    if (data.length() > 1000) {
                        dumpData();
                    }

                    noiseModel.resetEvents();

                    // Restart in 5 seconds
                    customHandler.postDelayed(this, 5000);
                }
            }
        };

        customHandler.postDelayed(updateTimerThread, 0);
    }

    /**
     * Stop tracking
     */
    public void stop(Context context) {
        synchronized (this) {
            if (lightRecorder != null) {
                // Stop the light recorder
                lightRecorder.stop(context);
                // Cleanup
                lightRecorder = null;
            }

            if(audioRecorder != null) {
                // Stop the audio recorder
                audioRecorder.close();
                // Cleanup
                audioRecorder = null;
            }

            // Write the data to a file
            dumpData();

            // Cleanup
            startTime = "";
            running = false;
        }
    }

    public boolean isRunning() {
        return running;
    }

    /**
     * Outputs the accumulated data
     */
    private void dumpData() {

        // Save the data
        outputHandler.saveData(data.toString(), startTime);

        // Clear the data
        data.setLength(0);
    }
}