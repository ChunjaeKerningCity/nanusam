<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Admin Login</title>
  <link rel="stylesheet" type="text/css" href="/resources/styles/admin/adminLogin.css">
</head>
<body>
<div id="container" class="container">
    <!-- FORM SECTION -->
    <div class="row">
      <!-- SIGN UP -->
      <div class="col align-items-center flex-col sign-up">
        <div class="form-wrapper align-items-center">
          <div class="form sign-up">
            <div class="input-group">
              <i class='bx bxs-user'></i>
              <input type="text" placeholder="Username">
            </div>
            <div class="input-group">
              <i class='bx bx-mail-send'></i>
              <input type="email" placeholder="Email">
            </div>
            <div class="input-group">
              <i class='bx bxs-lock-alt'></i>
              <input type="password" placeholder="Password">
            </div>
            <div class="input-group">
              <i class='bx bxs-lock-alt'></i>
              <input type="password" placeholder="Confirm password">
            </div>
            <button>
              Sign up
            </button>
            <p>
                <span>
                  Already have an account?
                </span>
              <b onclick="toggle()" class="pointer">
                Sign in here
              </b>
            </p>
          </div>
        </div>

      </div>
      <!-- END SIGN UP -->
      <!-- SIGN IN -->
      <form class="col align-items-center flex-col sign-in" action="/admin/login.do" method="post">
        <div class="form-wrapper align-items-center">
          <div class="form sign-in">
            <div class="input-group">
              <i class='bx bxs-user'></i>
              <input type="text" placeholder="Username" id="memberId" name="memberId">
            </div>
            <div class="input-group">
              <i class='bx bxs-lock-alt'></i>
              <input type="password" placeholder="Password" id="pwd" name="pwd">
            </div>
            <button style="color: black">
              Sign in
            </button>
          </div>
        </div>
        <div class="form-wrapper">

        </div>
      </form>
      <!-- END SIGN IN -->
    </div>
    <!-- END FORM SECTION -->
  <!-- CONTENT SECTION -->
  <div class="row content-row">
    <!-- SIGN IN CONTENT -->
    <div class="col align-items-center flex-col">
      <div class="text sign-in">
        <h2>
          AdminLogin
        </h2>

      </div>
      <div class="img sign-in">

      </div>
    </div>
    <!-- END SIGN IN CONTENT -->
    <!-- SIGN UP CONTENT -->
    <div class="col align-items-center flex-col">
      <div class="img sign-up">

      </div>
      <div class="text sign-up">
        <h2>
          Join with us
        </h2>

      </div>
    </div>
    <!-- END SIGN UP CONTENT -->
  </div>
  <script src="/resources/scripts/admin/adminLogin.js"></script>
</div>
</body>
</html>
