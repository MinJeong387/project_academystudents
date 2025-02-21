package com.thirdproject.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.thirdproject.repository.CounselingLogDao;
import com.thirdproject.repository.vo.CounselingLogVo;

@Service
public class CounselingLogServiceImpl implements CounselingLogService {

    @Autowired
    private CounselingLogDao counselingLogDaoImpl;

    @Override
    public boolean insertCounselingLog(CounselingLogVo counselingLogVo) {
        return 1 == counselingLogDaoImpl.insert(counselingLogVo);
    }

    @Override
    public boolean updateCounselingLog(CounselingLogVo counselingLogVo) {
        return 1 == counselingLogDaoImpl.update(counselingLogVo);
    }

    @Override
    public boolean deleteCounselingLog(Integer no) {
        return 1 == counselingLogDaoImpl.delete(no);
    }

    @Override
    public CounselingLogVo selectCounselingLog(Integer no) {
        return counselingLogDaoImpl.selectOne(no);
    }

    @Override
    public List<CounselingLogVo> selectCounselingLogList() {
        return counselingLogDaoImpl.selectAll();
    }

}