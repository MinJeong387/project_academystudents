<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

    <h1 class="mb-4">학생리스트</h1>

    <p class="mb-4">등록된 학생들 리스트입니다.</p>

    <c:forEach items="${list}" var="vo">
        <table class="table table-bordered table-striped table-hover mb-4">
            <thead>
                <tr>
                    <th>이름</th>
                    <th>학교명</th>
                    <th>학년</th>
                    <th>생년월일</th>
                    <th>성별</th>
                    <th>학생연락처</th>
                    <th>부모님연락처</th>
                    <th>특이사항</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td>${vo.name}</td>
                    <td>${vo.schoolName}</td>
                    <td>${vo.schoolGrade}</td>
                    <td>${vo.birthdate}</td>
                    <td>${vo.gender}</td>
                    <td>${vo.studentCellphone}</td>
                    <td>${vo.parentCellphone}</td>
                    <td>${vo.comments}</td>
                </tr>
                <tr>
                    <td><a href="<c:url value="/students/modify/${vo.no}" />" class="btn btn-primary btn-sm">[수정]</a></td>
                    <td><a href="<c:url value="/students/delete/${vo.no}" />" class="btn btn-danger btn-sm">[삭제]</a></td>
                </tr>
            </tbody>
        </table>
    </c:forEach>
    <br>

    <a href="<c:url value="/students/write" />" class="btn btn-success">추가학생 등록</a>