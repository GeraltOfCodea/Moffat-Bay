
<html>
<head>
    <title>Title</title>
    <link href="https://fonts.googleapis.com/css?family=Ubuntu&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Cairo+Play&display=swap" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/attractions.css" rel="stylesheet">
</head>
<body>
<div id="top">
    <!-- Header in its own div; can redirect to "top" on 'Dining' click when lower in the page -->
    <%@ include file="/view/components/header.jsp" %>
</div>


<section class="hero">
    <div class="hero-text">
        <h1>Attractions</h1>
    </div>
</section>

<section class="attractions">
        <!-- Navbar above attractions - to be sticky -->
        <nav class="top-nav">
            <ul>
                <li><a href="#top">Dining</a></li>
                <li><a href="#whale-watching">Whale Watching</a></li>
                <li><a href="#kayaking">Kayaking</a></li>
                <li><a href="#fishing">Fishing</a></li>
                <li><a href="#entertainment">Entertainment</a></li>
            </ul>
        </nav>

        <!-- Card System to hold each attraction type -->
        <!-- Dining -->
        <div class="card" id="dining">
            <img src="${pageContext.request.contextPath}/images/dining.png" alt="Dining image." style="width: 1000px; height: 250px">
            <h1 class="card-title">Dining</h1>
            <!-- Inner card system to hold business cards -->
                <div class="business-card">
                    <img src="${pageContext.request.contextPath}/images/brownbearbaking.jpg" alt="Image of Brown Bear Baking pastries." style="width: 800px; height: auto">
                    <h1>Brown Bear Baking</h1>
                    <p>Friendly bakery, handmade pastries, soups, and sandwiches.</p>
                    <h3>Address: </h3><p>29 N Beach Rd & Main Street #1966, Eastsound, <br> WA 98245</p>
                    <h3>Email: </h3><p>info@brownbearbaking.com</p>
                    <h3>Phone: </h3><p>360-855-7456</p>
                    <a href="https://www.brownbearbaking.com/" target="blank" class="btn">Visit Site</a>
                </div>
                <div class="business-card">
                    <img src="${pageContext.request.contextPath}/images/orcasislandwinery.jpg" alt="Image of Orcas Island Winery wine display." style="width: 800px; height: auto">
                    <h1>Orcas Island Winery</h1>
                    <p>Family vineyard and winery, provides picnic blankets for outdoor seating.</p>
                    <h3>Address: </h3><p>2371 Crow Valley Road, Eastsound,<br> WA 98245</p>
                    <h3>Email: </h3><p>orcasislandwinery@gmail.com</p>
                    <h3>Phone: </h3><p>520-991-9291</p>
                    <a href="https://www.orcasislandwinery.com/" target="blank" class="btn">Visit Site</a>
                </div>
                <div class="business-card">
                    <img src="${pageContext.request.contextPath}/images/fridayscrabhouse.jpg" alt="Image of crab from Friday's Crabhouse." style="width: 800px; height: auto">
                    <h1>Friday's Crabhouse</h1>
                    <p>Serving fresh seafood with the option of open-air decks overlooking the harbor!</p>
                    <h3>Address: </h3><p>65 Front St., Friday Harbor, <br> WA 98250</p>
                    <h3>Email: </h3><p>crabhouse@centurytel.net</p>
                    <h3>Phone: </h3><p>360-378-8801</p>
                    <a href="https://www.fridayscrabhouse.com/" target="blank" class="btn">Visit Site</a>
                </div>
            <a href="https://visitsanjuans.com/dining" target="blank" class="more-btn">See More</a>
        </div>

        <!-- Whale Watching -->
        <div class="card" id="whale-watching">
            <img src="${pageContext.request.contextPath}/images/whale-watching.png" alt="Image of whales swimming." style="width: 1000px; height: 250px">
            <h1 class="card-title">Whale Watching</h1>
            <div class="business-card">
                <img src="${pageContext.request.contextPath}/images/orcasislandeclipsecharters.png" alt="Image of Orcas Island Eclipse Charters' boat." style="width: 800px; height: auto">
                <h1>Orcas Island Eclipse Charters</h1>
                <p>Professional and historic whale and wildlife tours! Top and bottom decks with a heated cabin as a plus!</p>
                <h3>Address: </h3><p>8368 Orcas Rd., Eastsound, <br> WA 98245</p>
                <h3>Email: </h3><p>outerislandx@hotmail.com</p>
                <h3>Phone: </h3><p>360-376-6566</p>
                <a href="https://www.outerislandx.com/" target="blank" class="btn">Visit Site</a>
            </div>
            <div class="business-card">
                <img src="${pageContext.request.contextPath}/images/mayaslegacyww.jpg" alt="Image of Maya's Legacy Whale Watching boat." style="width: 800px; height: auto">
                <h1>Maya's Legacy Whale Watching</h1>
                <p>Family owned, top of the line vessel, with over 25 years of experience with whale watching touring.</p>
                <h3>Address: </h3><p>1997 Mitchell Bay Rd. & #14 Cannery Landing, Friday Harbor, <br> WA 98250</p>
                <h3>Email: </h3><p>inquire@orcawhalewatch.com</p>
                <h3>Phone: </h3><p>360-378-5315</p>
                <a href="https://www.sanjuanislandwhalewatch.com/" target="blank" class="btn">Visit Site</a>
            </div>
            <div class="business-card">
                <img src="${pageContext.request.contextPath}/images/wpwwadventures.jpg" alt="Image of Western Prince Whale Watching Adventures." style="width: 800px; height: auto">
                <h1>Western Prince Whale Watching Adventures</h1>
                <p>Longest-operating tour company in the islands! Quality, limited tours for personal interaction.</p>
                <h3>Address: </h3><p>1 Spring Street Suite A, Friday Harbor, <br> WA 98250</p>
                <h3>Email: </h3><p>info@sjiwhalewatch.com</p>
                <h3>Phone: </h3><p>360-378-7996</p>
                <a href="https://www.orcawhalewatch.com/" target="blank" class="btn">Visit Site</a>
            </div>
            <a href="https://visitsanjuans.com/whale-watching" target="blank" class="more-btn">See More</a>
        </div>

        <!-- Kayaking -->
        <div class="card" id="kayaking">
            <img src="${pageContext.request.contextPath}/images/kayaking.png" alt="Image of iced coffee held up against backdrop of a lake." style="width: 1000px; height: 250px">
            <h1 class="card-title">Kayaking</h1>
            <div class="business-card">
                <img src="${pageContext.request.contextPath}/images/crystalseaskayaking.jpg" alt="Image of person in kayak holding up paddle." style="width: 800px; height: auto">
                <h1>Crystal Seas Kayaking</h1>
                <p>Routes designed for maximum wildlife opportunities, delicious breakfast, lunch, and dinner, top-rated gear.</p>
                <h3>Address: </h3><p>40 Spring St., Friday Harbor, <br> WA 98250</p>
                <h3>Email: </h3><p>mail@crystalseas.com</p>
                <h3>Phone: </h3><p>877-732-7877</p>
                <a href="https://www.crystalseas.com/" target="blank" class="btn">Visit Site</a>
            </div>
            <div class="business-card">
                <img src="${pageContext.request.contextPath}/images/shearwaterkayaktours.jpg" alt="Image of two people in a single kayak." style="width: 800px; height: auto">
                <h1>Shearwater Kayak Tours</h1>
                <p>Three-hour trips, two-seated kayaks, commons sightings include bald eagles, river otters, and great blue herons.</p>
                <h3>Address: </h3><p>138 North Beach Rd, Eastsound, <br> WA 98245</p>
                <h3>Email: </h3><p>info@shearwaterkayaks.com</p>
                <h3>Phone: </h3><p>360-376-4699</p>
                <a href="https://shearwaterkayaks.com/" target="blank" class="btn">Visit Site</a>
            </div>
            <div class="business-card">
                <img src="${pageContext.request.contextPath}/images/sanjuanoutfitters.jpg" alt="Image of two people side by side in kayaks." style="width: 800px; height: auto">
                <h1>San Juan Outfitters</h1>
                <p>Exclusive, private kayak launches, three to five hour tours, 2-5 day overnight camping tour available!</p>
                <h3>Address: </h3><p>248 Reuben Memorial Drive, Roche Harbor, <br> WA 98250</p>
                <h3>Email: </h3><p>info@sanjuanislandoutfitters.com</p>
                <h3>Phone: </h3><p>866-810-1483</p>
                <a href="https://sanjuanislandoutfitters.com/" target="blank" class="btn">Visit Site</a>
            </div>
            <a href="https://visitsanjuans.com/kayaking" target="blank" class="more-btn">See More</a>
        </div>

        <!-- Fishing -->
        <div class="card" id="fishing">
            <img src="${pageContext.request.contextPath}/images/fishing.png" alt="Open lake." style="width: 1000px; height: 250px">
            <h1 class="card-title">Fishing</h1>
            <div class="business-card">
                <img src="${pageContext.request.contextPath}/images/outerislandfishing.png" alt="Image of two people holding up fish." style="width: 800px; height: auto">
                <h1>Outer Island Excursions Fishing</h1>
                <p>Salmon and bottom fishing, half-day and full-day charters, groups of 2-200!</p>
                <h3>Address: </h3><p>1608 Rosario Rd, Eastsound, <br> WA 98245</p>
                <h3>Email: </h3><p>outerislandx@hotmail.com</p>
                <h3>Phone: </h3><p>360-376-3711</p>
                <a href="https://www.outerislandx.com/" target="blank" class="btn">Visit Site</a>
            </div>
            <div class="business-card">
                <img src="${pageContext.request.contextPath}/images/orcasadventuresfishing.jpg" alt="Image of three people on a boat." style="width: 800px; height: auto">
                <h1>Orcas Adventures - Fishing</h1>
                <p>Cascade Lake and Mountain Lake fishing, boats rented by the hour, canoes with fishing pole holders!</p>
                <h3>Address: </h3><p>3786 Olga Road, Olga, <br> WA 98279</p>
                <h3>Email: </h3><p>orcasadventures@gmail.com</p>
                <h3>Phone: </h3><p>360-375-1460</p>
                <a href="https://orcasadventures.com/" target="blank" class="btn">Visit Site</a>
            </div>
            <div class="business-card">
                <img src="${pageContext.request.contextPath}/images/northshorechartersfishing.png" alt="Image of North Shore Charters' fishing boat." style="width: 800px; height: auto">
                <h1>North Shore Charters Fishing</h1>
                <p>Highest quality fishing experiences, from pro to first-timer,  North Shore guarantees a safe experience.</p>
                <h3>Address: </h3><p>Deer Harbor Marina, Eastsound, <br> WA 98245</p>
                <h3>Email: </h3><p>jenny@orcasisladadventures.com</p>
                <h3>Phone: </h3><p>360-376-4855</p>
                <a href="https://orcasislandadventures.com/" target="blank" class="btn">Visit Site</a>
            </div>
            <a href="https://visitsanjuans.com/fishing" target="blank" class="more-btn">See More</a>
        </div>

        <!-- Entertainment -->
        <div class="card" id="entertainment">
            <img src="${pageContext.request.contextPath}/images/freetheater.jpg" alt="Theater with smoke on stage" style="width: 1000px; height: 250px">
            <h1 class="card-title">Entertainment, Arts, and History</h1>
            <div class="business-card">
                <img src="${pageContext.request.contextPath}/images/sanjuantheater.jpg" alt="Image of actors on stage." style="width: 800px; height: auto">
                <h1>San Juan Community Theater</h1>
                <p>Variety of locally-produced events and performances, music, theater, and dance.</p>
                <h3>Address: </h3><p>100 Second St., Friday Harbor, <br> WA 98250</p>
                <h3>Email: </h3><p>office@sjctheatre.org</p>
                <h3>Phone: </h3><p>360-378-3210</p>
                <a href="https://sjctheatre.org/" target="blank" class="btn">Visit Site</a>
            </div>
            <div class="business-card">
                <img src="${pageContext.request.contextPath}/images/sanjuanmuseum.jpg" alt="Image of San Juan Historical Museum." style="width: 800px; height: auto">
                <h1>San Juan Historical Society & Museum</h1>
                <p>The entire lore of the island, dating back to the 1880s. Self-guided and guided tours available!</p>
                <h3>Address: </h3><p>405 Price St., Friday Harbor, <br> WA 98250</p>
                <h3>Email: </h3><p>museum_admin@sjmuseum.org</p>
                <h3>Phone: </h3><p>360-378-3949</p>
                <a href="https://sjmuseum.org/" target="blank" class="btn">Visit Site</a>
            </div>
            <div class="business-card">
                <img src="${pageContext.request.contextPath}/images/islandstageleft.jpg" alt="Image of actors on stage." style="width: 800px; height: auto">
                <h1>Island Stage Left</h1>
                <p>Admission-free performances, outdoor Shakespearean plays during the summer!</p>
                <h3>Address: </h3><p>1062 Wold Rd, Friday Harbor, <br> WA 98250</p>
                <h3>Phone: </h3><p>islandstageleft@gmail.com</p>
                <h3>Phone: </h3><p>360-378-5649</p>
                <a href="https://islandstageleft.org/" target="blank" class="btn">Visit Site</a>
            </div>
            <a href="https://visitsanjuans.com/the-arts" target="blank" class="more-btn">See More</a>
        </div>

</section>


<!-- Footer -->
<%@ include file="/view/components/footer.jsp" %>

</body>
</html>
