package com.stareatm.dao;

import com.stareatm.model.Training;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by 刘 on 2018/5/1.
 */
@Repository
public interface TrainingMapper {
    List<Training>  getTrainingByD_id(Training training);
    boolean addTraining(Training training);
    Training getTrainingByT_id(Training training);
    List<Training> getAllTraining();
    boolean updateTraining(Training training);
    boolean deleteTraining(Training training);
}
