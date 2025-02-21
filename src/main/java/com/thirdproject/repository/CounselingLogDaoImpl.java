package com.thirdproject.repository;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.thirdproject.exceptions.CounselingLogDaoException;
import com.thirdproject.mappers.CounselingLogMapper;
import com.thirdproject.repository.vo.CounselingLogVo;

@Repository
public class CounselingLogDaoImpl implements CounselingLogDao {
    @Autowired
    private CounselingLogMapper counselingLogMapper;

    @Override
    public int insert(CounselingLogVo counselingLogVo) {
        try {
            return counselingLogMapper.insert(counselingLogVo);
        } catch (Exception e) {
            throw new CounselingLogDaoException("상담일지 입력 중 예외 발생", e, counselingLogVo);
        }
    }

    @Override
    public int update(CounselingLogVo counselingLogVo) {
        try {
            return counselingLogMapper.update(counselingLogVo);
        } catch (Exception e) {
            throw new CounselingLogDaoException("상담일지 수정 중 예외 발생", e, counselingLogVo);
        }
    }

    @Override
    public int delete(Integer no) {
        try {
            return counselingLogMapper.delete(no);
        } catch (Exception e) {
            throw new CounselingLogDaoException("상담일지 삭제 중 오류 발생: " + no, e);
        }
    }

    @Override
    public CounselingLogVo selectOne(Integer no) {
        CounselingLogVo counselingLogVo = counselingLogMapper.selectOne(no);
        return counselingLogVo;
    }

    @Override
    public List<CounselingLogVo> selectAll() {
        List<CounselingLogVo> list = counselingLogMapper.selectAll();
        return list;
    }
}