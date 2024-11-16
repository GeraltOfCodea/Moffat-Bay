<!DOCTYPE html>
<html lang="en">
<head>
    <title>Moffat Bay Lodge</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/registrationpg.css">
    <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
</head>
<body>
    <!-- NAVBAR CREATION -->
   <header class="header">
    <nav class="navbar">
        <a href="${pageContext.request.contextPath}/view/Index.jsp">Home</a>
        <a href="#">Attractions</a>
          <a href="#">About Us</a>
    </nav>
    <form action="" class="search-bar">
       <input type="text" placeholder="Search...">
       <button><i class='bx bx-search'></i></button>
    </form>
   </header>
    <!-- REGISTRATION FORM CREATION -->
    <div class="background"></div>
    <div class="container">
        <div class="item">
            <h2 class="logo"><i class='bx bx-hotel'></i> Moffat Bay</h2>
            <div class="text-item">
                <h2>Welcome <br><span>
                    To Moffat Bay Lodge!
                </span></h2>
                <p>Tell Us About Yourself</p>
            </div>
        </div>
        <div class="login-section">
            <div class="form-box login">
                <form action="">

                    <h2>Sign Up</h2>
                    <div class="input-box">
                        <span class="icon"><i class='bx bxs-user'></i></span>
                        <input type="text" required>
                        <label >First Name</label>
                    </div>
                    <div class="input-box">
                        <span class="icon"><i class='bx bxs-user'></i></span>
                        <input type="text" required>
                        <label >Last Name</label>
                    </div>

                    <div class="input-box">
                        <span class="icon"><i class='bx bx-rename'></i></span>
                        <input type="text" required>
                        <label >Username</label>
                    </div>
                    <div class="input-box">
                        <span class="icon"><i class='bx bxs-envelope'></i></span>
                        <input type="email" required>
                        <label >Email</label>
                    </div>
                    <div class="input-box">
                        <span class="icon"><i class='bx bxs-lock-alt' ></i></span>
                        <input type="password" required>
                        <label>Password</label>
                    </div>
                    <div class="remember-password">
                        <label for=""><input type="checkbox"> I agree with the terms and conditions</label>
                    </div>
                    <button class="btn">Create Account</button>
                    <div class="create-account">
                        <p>Already Have An Account? <a href="#" class="login-link">Sign In</a></p>
                    </div>
                </form>
            </div>
            
        </div>
    </div>
    </script>
</body>

</html>