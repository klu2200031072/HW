<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Substance Use Support | Fit&Well</title>
    <link rel="stylesheet" type="text/css" href="css/style.css">
    <script src="js/script.js" defer></script>
    <style>
        /* General styling for the header and user info */
        body {
            margin: 0;
            font-family: Arial, sans-serif;
        }
        header {
            display: flex;
            flex-direction: column;
            position: relative;
        }
        .header-container {
            background: #; /* Light grey background for header */
            padding: 10px 0;
            border-bottom: 1px solid #ddd;
        }
        .header-flex {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 0 20px;
        }
        .logo-container {
            display: flex;
            align-items: center;
        }
        .logo {
            margin-right: 10px;
        }
        
        .user-info {
            float: right;
            margin: 20px;
            font-size: 16px;
            color: green; /* Change text color to green */
        }
        
         .sub-header {
            text-align: center;
            padding: 10px;
            background-color:#4CAF50;
            
        }
        
        .sub-header h1 {
            font-size: 36px; /* Adjust the font size as needed */
            color: white; /* Change text color to green */
            margin: 0; /* Remove default margin if needed */
        }
        .centered-container {
        max-width: 800px; /* Set a max width for the container */
        margin: 0 auto;   /* Center the container horizontally */
        padding: 40px;    /* Add some padding */
        background-color: #4CAF50; /* Optional: background color for the container */
        border: 1px solid #ddd; /* Optional: border for visual separation */
        border-radius: 8px; /* Optional: rounded corners */
    }
        
        .dashboard-nav {
            display: flex;
            justify-content: flex-end;
            padding: 10px 20px;
            background-color: #ddd; /* Light grey background for dashboard nav */
            border-bottom: 1px solid #ccc;
        }
        .dashboard-nav ul {
            display: flex;
            margin: 0;
            padding: 0;
            list-style: none;
        }
        .dashboard-nav ul li {
            margin: 0 10px;
        }
        .dashboard-nav ul li a {
            text-decoration: none;
            color: #333;
            padding: 10px;
        }
        .dashboard-nav ul li a:hover {
            background-color: #bbb;
            border-radius: 4px;
        }
        .sub-nav {
            background-color: #eee; /* Light grey background for sub-nav */
        }
        .sub-nav ul {
            display: flex;
            justify-content: center;
            padding: 0;
            margin: 0;
            list-style: none;
        }
        .sub-nav ul li {
            margin: 0 10px;
        }
        .sub-nav ul li a {
            text-decoration: none;
            color: #333;
            padding: 10px;
        }
        .sub-nav ul li a:hover {
            background-color: #ddd;
            border-radius: 4px;
        }
        .dropdown-content {
            display: none;
            position: absolute;
            background-color: #fff;
            box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
            z-index: 1;
        }
        .dropdown-content a {
            color: black;
            padding: 12px 16px;
            text-decoration: none;
            display: block;
        }
        .dropdown-content a:hover {
            background-color: #ddd;
        }
        .dropdown:hover .dropdown-content {
            display: block;
        }
        footer {
            display: flex;
            justify-content: space-between;
            padding: 20px;
            background-color: #4CAF50; /* Green background color */
            color: white; /* White text color for contrast */
            border-top: 1px solid #ddd;
        }
        .footer-intro,
        .footer-contact {
            flex: 1;
            padding: 0 20px;
        }
        .footer-intro {
            max-width: 50%;
        }
        .footer-contact {
            max-width: 50%;
        }
        .footer-intro p {
            font-size: 16px; /* Adjust font size as needed */
            line-height: 1.5; /* Improve readability */
        }
        .footer-contact p {
            margin: 10px 0;
        }
        .footer-contact a {
            color: #fff; /* White links for better contrast */
            text-decoration: none;
        }
        .footer-contact a:hover {
            text-decoration: underline;
        }
        @media (max-width: 768px) {
            footer {
                flex-direction: column;
                align-items: flex-start;
            }
            .footer-intro,
            .footer-contact {
                max-width: 100%;
                padding: 10px 0;
            }
        }

        /* Image styling */
        .header-image {
            width: 100%;
            height: auto;
            margin-top: 20px;
        }
        /* Main content styling */
/* General styling for the form */
form {
    max-width: 600px; /* Limit the width of the form */
    margin: 0 auto; /* Center the form horizontally */
    padding: 20px; /* Add some padding around the form */
    background-color: #f9f9f9; /* Light grey background for the form */
    border-radius: 8px; /* Rounded corners for the form */
    box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.1); /* Subtle shadow for form */
}

label {
    display: block; /* Stack labels and inputs vertically */
    margin-bottom: 8px; /* Add space between label and input */
    font-weight: bold; /* Make labels bold for better readability */
}

input, select, textarea {
    width: 100%; /* Make inputs, selects, and textareas full width */
    padding: 10px; /* Add padding inside inputs and textareas */
    margin-bottom: 12px; /* Add space between fields */
    border: 1px solid #ccc; /* Light border for inputs and textareas */
    border-radius: 4px; /* Rounded corners for inputs and textareas */
}

textarea {
    resize: vertical; /* Allow vertical resizing only for textareas */
}

button[type="submit"] {
    background-color: #4CAF50; /* Green background color for button */
    color: white; /* White text color for contrast */
    border: none; /* Remove default border */
    padding: 15px 20px; /* Add padding inside the button */
    font-size: 16px; /* Adjust font size */
    border-radius: 4px; /* Rounded corners for button */
    cursor: pointer; /* Pointer cursor on hover */
    margin-top: 10px; /* Add space above the button */
}

button[type="submit"]:hover {
    background-color: #45a049; /* Darker green on hover */
}

        
    </style>
</head>
<body>
    <header>
        <div class="header-container">
            <div class="header-flex">
                <div class="logo-container">
                    <img src="images/university-logo.png" alt="University Logo" class="logo" style="height: 60px;" />
                    <h2>Fit&Well</h2>
                </div>
                <div class="user-info">
                    <%
                        // Retrieve the username from the session
                        String username = (String) session.getAttribute("username");
                        if (username != null) {
                            out.print("Logged in as: <span style='color: green;'>" + username + "</span>");
                        } else {
                            out.print("Not logged in");
                        }
                    %>
                </div>
            </div>
        </div>

        <!-- Dashboard Navigation -->
        <div class="dashboard-nav">
            <ul>
                <li><a href="#">Unit Directory</a></li>
                <li><a href="#">Event Calendar</a></li>
                <li><a href="#">Eligibility</a></li>
                <li><a href="#">Policies & Forms</a></li>
                <li><a href="#">Rec Portal</a></li>
                <li><a href="#" class="cyclone-support">Cyclone Support</a></li>
            </ul>
        </div>

        <div class="sub-header">
            <h1>Student Health and Wellness</h1>
        </div>

        <nav class="sub-nav">
            <ul>
                <li><a href="#">About</a></li>
                <li id="recreation" class="dropdown">
                    <a href="#">Recreation</a>
                    <div id="dropdown-content" class="dropdown-content">
                        <a href="facilities.jsp">Facilities</a>
                        <a href="#">Fitness</a>
                        <a href="intramural.jsp">Intramural Sports</a>
                        <a href="sportclub.jsp">Sport Clubs</a>
                        <a href="#">Youth Camps</a>
                        
                    </div>
                </li>
                <li id="medical-services" class="dropdown">
                    <a href="#">Medical Services</a>
                    <div id="medical-dropdown-content" class="dropdown-content">
                        <a href="#">Illness and Injury Care</a>
                        <a href="#">Preventative Care</a>
                        <a href="#">Physical Therapy</a>
                        <a href="#">Fees, Insurance, and Billing</a>
                        <a href="#">Sexual & Reproductive Health</a>
                        <a href="#">Pharmacy</a>
                        <a href="#">Policies & Forms</a>
                        <a href="#">Request My Health Records</a>
                        <a href="#">Make an Appointment</a>
                    </div>
                </li>
                <li id="mental-health" class="dropdown">
                    <a href="#">Mental Health</a>
                    <div id="mental-health-dropdown-content" class="dropdown-content">
                        <a href="#">Urgent Needs (In Crisis)</a>
                        <a href="#">Counseling</a>
                        <a href="#">Mental Health Medication</a>
                        <a href="#">Meditation, Breathing, and Sleep</a>
                        <a href="#">Wellbeing and Lifestyle</a>
                    </div>
                </li>
                <li id="support-programs" class="dropdown">
                    <a href="#">Support Programs</a>
                    <div id="support-programs-dropdown-content" class="dropdown-content">
                        <a href="substance-use-support.jsp">Substance Use Support</a>
                        <a href="nutrition.jsp">Nutrition & Body Image</a>
                        <a href="food.jsp">Food Security Support</a>
                        <a href="training.jsp">Training Opportunities</a>
                        <a href="suicide.jsp">Suicide Prevention</a>
                        <a href="violence.jsp">Violence Prevention</a>
                </li>
            </ul>
        </nav>
    </header>
 <main>
    <div class="centered-container">
        <jsp:include page="addFitnessUser.jsp" />
    </div>
</main>


<footer>
        <div class="footer-intro">
            <h2>Fit&Well</h2>
            <p>Elevate your well-being with every step you take,<br>
            Commit to a journey of health and fitness,<br>
            Where every workout is a stride toward a stronger you.<br>
            Nourish your body with balanced nutrition and mindful habits,<br>
            And empower your mind with resilience and positivity.<br>
            Celebrate the small victories and embrace the challenges,<br>
            Knowing each one brings you closer to your goals.<br>
            Stay motivated and inspired,<br>
            Surround yourself with a supportive community,<br>
            And let every day be an opportunity for growth.<br>
            Together, we build a foundation of lasting wellness,<br>
            Balancing strength, flexibility, and mental clarity.<br>
            Invest in yourself, and watch your potential unfold,<br>
            As we guide you through every phase of your fitness journey.<br>
            Your path to a healthier, happier life starts here.</p>
        </div>

        <div class="footer-contact">
            <h3>Tell us about your wellness goals:</h3>
            <p><strong>Email:</strong> <a href="mailto:hello@fitandwellapp.com">hello@fitandwellapp.com</a></p>
            <p><strong>Phone:</strong> <a href="tel:+6598735984">(+65) 98735984</a></p>
            <p><strong>Address:</strong><br>
            1 Paya Lebar Link<br>
            #04-01, Paya Lebar Quarter<br>
            Singapore, 408533</p>
        </div>
    </footer>

    <footer class="footer-bottom">
        <p>&copy; Fit&Well, 2024</p>
    </footer>
</body>
</html>
