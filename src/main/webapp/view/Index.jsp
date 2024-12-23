<%--
  Created by IntelliJ IDEA.
  User: Ryan, Eric, & Celine
  Team: Blue Team
  For: CSD460
  Date: 11/16/24
  Time: 3:01 PM
  To change this template use File | Settings | File Templates.
--%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Moffat Bay Lodge</title>
    <link href="https://fonts.googleapis.com/css?family=Ubuntu&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Cairo+Play&display=swap" rel="stylesheet">
    <!-- Include Font Awesome for Icons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <link href="${pageContext.request.contextPath}/css/main.css" rel="stylesheet">
</head>
<body>
    <!-- Header -->
 	<%@ include file="/view/components/header.jsp" %>

    <!-- Hero Section -->
    <section class="hero">
        <div class="hero-text">
            <h1>Welcome to Moffat Bay Lodge</h1>
            <p>Where Nature Meets Tranquility. Discover Your Escape at Moffat Bay Lodge</p>
            <a href="${pageContext.request.contextPath}/view/Reservationpg.jsp" class="btn">Book Now</a>
        </div>
    </section>

    <!-- Facilities Section -->
    <section class="facilities">
        <h2>Facilities</h2>
        <div class="facility-list">
            <div class="facility">
                <div class="facility-icon">
                    <i class="fas fa-utensils"></i>
                </div>
                <h3>Kitchen</h3>
            </div>
            <div class="facility">
                <div class="facility-icon">
                    <i class="fas fa-swimmer"></i>
                </div>
                <h3>Pool</h3>
            </div>
            <div class="facility">
                <div class="facility-icon">
                    <i class="fas fa-wifi"></i>
                </div>
                <h3>Wifi</h3>
            </div>
            <div class="facility">
                <div class="facility-icon">
                    <i class="fas fa-dumbbell"></i>
                </div>
                <h3>Gym</h3>
            </div>
            <div class="facility">
                <div class="facility-icon">
                    <i class="fas fa-taxi"></i>
                </div>
                <h3>Taxi</h3>
            </div>
        </div>
    </section>

    <!-- Attractions Section -->
    <section class="attractions">
        <h2>Attractions & Information</h2>
        <div class="attraction-list">
            <!-- First Attraction -->
            <div class="attraction">
                <div class="attraction-image" style="background-image: url('${pageContext.request.contextPath}/images/visitor-info.png');">
                    <div class="attraction-overlay">
                        <h3>Visiting the Island</h3>
                        <a href="https://www.visitsanjuans.com/" target="blank" class="btn">Learn More</a>
                    </div>
                </div>
            </div>
            <!-- Second Attraction -->
            <div class="attraction">
                <div class="attraction-image" style="background-image: url('${pageContext.request.contextPath}/images/dining.png');">
                    <div class="attraction-overlay">
                        <h3>Dining</h3>
                        <a href="${pageContext.request.contextPath}/view/attractions.jsp#top" class="btn">Learn More</a>
                    </div>
                </div>
            </div>
            <!-- Third Attraction -->
            <div class="attraction">
                <div class="attraction-image" style="background-image: url('${pageContext.request.contextPath}/images/whale-watching.png');">
                    <div class="attraction-overlay">
                        <h3>Whale Watching</h3>
                        <a href="${pageContext.request.contextPath}/view/attractions.jsp#whale-watching" class="btn">Learn More</a>
                    </div>
                </div>
            </div>
            <!-- Fourth Attraction -->
            <div class="attraction">
                <div class="attraction-image" style="background-image: url('${pageContext.request.contextPath}/images/kayaking.png');">
                    <div class="attraction-overlay">
                        <h3>Kayaking</h3>
                        <a href="${pageContext.request.contextPath}/view/attractions.jsp#kayaking" class="btn">Learn More</a>
                    </div>
                </div>
            </div>
            <!-- Fifth Attraction -->
            <div class="attraction">
                <div class="attraction-image" style="background-image: url('${pageContext.request.contextPath}/images/fishing.png');">
                    <div class="attraction-overlay">
                        <h3>Fishing</h3>
                        <a href="${pageContext.request.contextPath}/view/attractions.jsp#fishing" class="btn">Learn More</a>
                    </div>
                </div>
            </div>
            <!-- Sixth Attraction -->
            <div class="attraction">
                <div class="attraction-image" style="background-image: url('${pageContext.request.contextPath}/images/freetheater.jpg');">
                    <div class="attraction-overlay">
                        <h3>Entertainment, Art, and History</h3>
                        <a href="${pageContext.request.contextPath}/view/attractions.jsp#entertainment" class="btn">Learn More</a>
                    </div>
                </div>
            </div>
            <div class="attraction">
                <div class="attraction-image" style="background-image: url('${pageContext.request.contextPath}/images/freescuba.png');">
                    <div class="attraction-overlay">
                        <h3>Scuba Diving</h3>
                        <p><b>Interested in Scuba Diving? <br> Check in with a local diving operator for a safe and memorable time! </b></p>
                    </div>
                </div>
            </div>
            <div class="attraction">
                <div class="attraction-image" style="background-image: url('${pageContext.request.contextPath}/images/freehiker.jpg');">
                    <div class="attraction-overlay">
                        <h3>Hiking</h3>
                        <p><b>Love for the outdoors? <br> San Juan Islands has a variety of hiking experiences to choose from!</b></p>
                        <a href="https://www.visitsanjuans.com/hiking" class="btn" style="margin-top: 20px">Learn More</a>

                    </div>
                </div>
            </div>
        </div>
    </section>
    

    <!-- Footer -->
    <%@ include file="/view/components/footer.jsp" %>
    
</body>
</html>