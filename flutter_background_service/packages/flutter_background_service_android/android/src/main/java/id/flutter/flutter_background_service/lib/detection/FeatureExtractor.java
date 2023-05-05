package id.flutter.flutter_background_service.lib.detection;

import android.util.Log;

import id.flutter.flutter_background_service.lib.Recorder;

/**
 * Created by paulmohr on 19.06.15.
 */
public class FeatureExtractor {

    private NoiseModel noiseModel;
    private float[] lowFreq;
    private float[] highFreq;

    public FeatureExtractor(NoiseModel noiseModel) {

        this.noiseModel = noiseModel;
    }

    public void update(short[] buffer) {
        lowFreq = new float[buffer.length];
        highFreq = new float[buffer.length];
        noiseModel.addRLH(calculateRLH(buffer));
        noiseModel.addRMS(calculateRMS(buffer));
        noiseModel.addVAR(calculateVar(buffer));
        noiseModel.addDecibel(calculateDecibel(buffer));

        noiseModel.calculateFrame();
    }


    public static double REFERENCE = 0.00002;

    private double calculateDecibel(short[] buffer) {
        int bufferSize = buffer.length;
        double average = 0.0;
        for (short s : buffer) {
            if (s > 0) {
                average += Math.abs(s);
            } else {
                bufferSize--;
            }
        }
        double x = average / bufferSize;
        if (x == 0) {
            return 0;
        }
        // calculating the pascal pressure based on the idea that the max amplitude (between 0 and 32767) is
        // relative to the pressure
        double pressure = x / 51805.5336; //the value 51805.5336 can be derived from asuming that x=32767=0.6325 Pa and x=1 = 0.00002 Pa (the reference value)
        return 20.0 * Math.log10(pressure / REFERENCE);
    }


    private double calculateRMS(short[] buffer) {
        long sum = 0;
        for (int i = 0; i < buffer.length; i++) {
            sum += Math.pow(buffer[i], 2);
        }
        return Math.sqrt(sum / buffer.length);
    }

    private double calculateRMS(float[] buffer) {
        long sum = 0;
        for (int i = 0; i < buffer.length; i++) {
            sum += Math.pow(buffer[i], 2);
        }
        return Math.sqrt(sum / buffer.length);
    }

    private double calculateLowFreqRMS(short[] buffer) {
        lowFreq[0] = 0;

        float a = 0.25f;

        for (int i = 1; i < buffer.length; i++) {
            lowFreq[i] = lowFreq[i - 1] + a * (buffer[i] - lowFreq[i - 1]);
        }

        return calculateRMS(lowFreq);
    }

    private double calculateHighFreqRMS(short[] buffer) {
        highFreq[0] = 0;

        float a = 0.25f;

        for (int i = 1; i < buffer.length; i++) {
            highFreq[i] = a * (highFreq[i - 1] + buffer[i] - buffer[i - 1]);
        }

        return calculateRMS(highFreq);
    }

    private double calculateRLH(short[] buffer) {
        double rmsh = calculateHighFreqRMS(buffer);
        double rmsl = calculateLowFreqRMS(buffer);
        if (rmsh == 0) return 0;
        if (rmsl == 0) return 0;
        return rmsl / rmsh;
    }

    /**
     * Calculates the var of one frame
     *
     * @param buffer
     * @return
     */
    private double calculateVar(short[] buffer) {

        double mean = calculateMean(buffer);
        double var = 0;
        for (short s : buffer) {
            var += Math.pow(s - mean, 2);
        }
        return var / buffer.length;
    }

    /**
     * Calculate the mean of one fram
     *
     * @param buffer
     * @return
     */
    private double calculateMean(short[] buffer) {
        double mean = 0;
        for (short s : buffer) {
            mean += s;
        }
        return mean / buffer.length;
    }
}
