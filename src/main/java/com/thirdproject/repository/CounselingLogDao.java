package com.thirdproject.repository;

import java.util.List;

import com.thirdproject.repository.vo.CounselingLogVo;

public interface CounselingLogDao {
    public int insert(CounselingLogVo counselingLogVo);
    public int update(CounselingLogVo counselingLogVo);
    public int delete(Integer no);
    public CounselingLogVo selectOne(Integer no);
    public List<CounselingLogVo> selectAll();
    
    
}