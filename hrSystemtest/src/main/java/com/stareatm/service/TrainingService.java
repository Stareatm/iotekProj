package com.stareatm.service;

import com.stareatm.model.Training;

import java.util.List;

/**
 * Created by 刘 on 2018/5/1.
 */
public interface TrainingService {
    List<Training> getTrainingByD_id(Training training);
    boolean addTraining(Training training);
    Training getTrainingByT_id(Training training);
    List<Training> getAllTraining();
    boolean updateTraining(Training training);
    boolean deleteTraining(Training training);
}
