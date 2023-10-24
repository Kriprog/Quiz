package com.valiit.quiz.utility;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

public class Shuffler {
        public static List<String> shuffleOptions(List<String> options) {
            // Create a copy of the original list
            List<String> shuffled = new ArrayList<>(options);

            // Shuffle the options using Collections.shuffle
            Collections.shuffle(shuffled);

            return shuffled;
        }
    }

