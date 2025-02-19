<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
        crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
        crossorigin="anonymous"></script>
    <style>
        .custom-navbar {
            background-color: #1D809F;
            width: 250px;
        }

        .nav-link {
            color: white;
            font-weight: bold;
        }

        .nav-link:hover {
            background-color: #E6B41B;
            color: black;
            font-weight: bold;
        }

        .nav-link.active-custom {
            background-color: #E6B41B;
            color: black !important;
        }

        .user-info {
            color: white;
            font-weight: bold;
            display: block;
            padding: 1rem;
            text-decoration: none;
        }
    </style>
</head>

<body class="d-flex">
    <nav class="nav flex-column custom-navbar fixed-start vh-100 p-3">
        <a class="user-info">${sessionScope.authUser.name }님, 안녕하세요^^</a>
        <br />
        <li class="nav-item">
            <a class="nav-link rounded mb-2" href="<c:url value="/users/logout" />" id="logout">로그아웃</a>
        </li>
        <br /><br />
        <li class="nav-item">
            <a class="nav-link rounded mb-2" href="#" id="studentListLink">학생 리스트</a>
        </li>
        <li class="nav-item">
            <a class="nav-link rounded mb-2" href="#" id="attendance">출석부</a>
        </li>
        <li class="nav-item">
            <a class="nav-link rounded mb-2" href="#" id="counselingLog">상담일지</a>
        </li>
        <li class="nav-item">
            <a class="nav-link rounded mb-2" href="#" id="classLog">수업일지</a>
        </li>
        <li class="nav-item">
            <a class="nav-link rounded mb-2" href="#" id="sendMessage">문자발송</a>
        </li>
    </nav>

    <div class="flex-grow-1 p-3" id="contentArea">
       

        <div id="studentListContent" style="display: none;">
            <%@ include file="list.jsp" %>
        </div>
    </div>

    <script>
        document.getElementById('studentListLink').addEventListener('click', function (event) {
            event.preventDefault();

            document.querySelectorAll('.nav-link').forEach(link => {
                link.classList.remove('active-custom');
            });

            this.classList.add('active-custom');

            document.getElementById('studentListContent').style.display = 'block';
        });

        document.querySelectorAll('.nav-link:not(#studentListLink)').forEach(link => {
            link.addEventListener('click', function (event) {
                document.querySelectorAll('.nav-link').forEach(link => {
                    link.classList.remove('active-custom');
                });

                this.classList.add('active-custom');

                document.getElementById('studentListContent').style.display = 'none';
            });
        });
    </script>
</body>

</html>