<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입 성공</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<script>
    window.onload = function() {
        var successMessage = "${successMessage}";
        if (successMessage && successMessage !== "") {
            var myModal = new bootstrap.Modal(document.getElementById('successModal'));
            myModal.show();
        } else {
            location.href = "<%= request.getContextPath() %>/users/login";
        }
    };
</script>
<style>
    .modal-footer .btn-primary {
        border-radius: 20px;
        background-color: #1D809F;

    }
</style>
</head>
<body>

    <div class="modal fade" id="successModal" tabindex="-1" aria-labelledby="successModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="successModalLabel">회원가입 성공</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    회원가입이 완료되었습니다.
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-primary" onclick="location.href='<%= request.getContextPath() %>/users/login'">로그인 페이지로 이동</button>
                </div>
            </div>
        </div>
    </div>

</body>
</html>