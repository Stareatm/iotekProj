package com.stareatm.service.impl;

import com.stareatm.dao.TrainingMapper;
import com.stareatm.model.Training;
import com.stareatm.service.TrainingService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by 刘 on 2018/5/1.
 */
@Service
public class TrainingServiceImpl implements TrainingService {
    @Resource
    private TrainingMapper trainingMapper;
    @Override
    public List<Training> getTrainingByD_id(Training training) {
        return trainingMapper.getTrainingByD_id(training);
    }

    @Override
    public boolean addTraining(Training training) {
        return trainingMapper.addTraining(training);
    }

    @Override
    public Training getTrainingByT_id(Training training) {
        return trainingMapper.getTrainingByT_id(training);
    }

    @Override
    public List<Training> getAllTraining() {
        return trainingMapper.getAllTraining();
    }

    @Override
    public boolean updateTraining(Training training) {
        return trainingMapper.updateTraining(training);
    }

    @Override
    public boolean deleteTraining(Training training) {
        return trainingMapper.deleteTraining(training);
    }
}
